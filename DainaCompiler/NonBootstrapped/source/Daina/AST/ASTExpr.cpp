//
//  ASTExpr.cpp
//  DainaCompiler
//
//  Created by SamWit on 7/05/2017.
//  Copyright © 2017 Samuel Whitton. All rights reserved.
//

#include "ASTExpr.hpp"



namespace Daina {

    ASTExpr::ASTExpr(Parser *parser, bool statementBlockAllowed, bool expectingPrologueBinding) : AST(ASTTypeExpr) {
        //expr -> expr_a = expr_a

        this->body.raw = nullptr;
        this->link.raw = nullptr;
        this->referencedElement = nullptr;
        this->declaredElement = nullptr;
        this->type = Empty;
	this->prologueBinding = nullptr;

        /*
           group expr| (...)
           statement block| {...} 
           constructor invoc| \::con a b c
           self instance invoc| \:qwe
           instance invoc| \obj:foo a b c
           static invocation| \[Class]:foo a b c
           lambda| *(...    
           */

	if (expectingPrologueBinding) {
            tEXPECT(TokenType::tAExclaim);
	    if (!tIS(TokenType::tACurlBraceOpen)) {
		tERROR("expecting prologue binding");
	    }
	    statementBlockAllowed = true;
	}


        if (tIS(TokenType::tACurlBraceOpen) && statementBlockAllowed) {
            tEXPECT(TokenType::tACurlBraceOpen);
            if (tFOLLOWS_STATEMENT) {
                this->body.statementBlock = this->dependant(new ASTList<ASTStatement>(parser, ParseASTStatement::instance(), TokenType::tEmpty));
            }
            tGUARD_TAKE_NEXT(TokenType::tACurlBraceClosed, "expecting matching closing bracket");
            this->type = StatementBlock;

        } else if (tIS(TokenType::tALeThan)) {
            tEXPECT(TokenType::tALeThan);
            tGUARD_NEXT(TokenType::tIdentifier, "expecting identifier for compiler directive");
            this->declaredElement = this->dependant(new ASTIdentifier(parser));
            this->type = CompilerDirective;
            this->body.injection = (TCompilerInjection *)tGUARD_TAKE_NEXT(TokenType::tCompilerInjection, "expecting compiler injection for compiler directive");

        } else if (tFOLLOWS_TYPE) {
            this->body.staticTypeReference = ASTType::parseTypeAttachingAsDependantToAST(parser, this);
            this->type = StaticReference;

            tGUARD_TAKE_NEXT(TokenType::tAColon, "expecting colon for static element reference");
            tGUARD_NEXT(TokenType::tIdentifier, "expecting identifier to reference static element");
            this->referencedElement = this->dependant(new ASTIdentifier(parser));
	    
        } else if (tIS(TokenType::tABkSlash)) {
            this->body.invocation = this->dependant(new ASTInvocation(parser));
            this->type = Invocation;


        } else if (tIS(TokenType::tAAsterix)) {
            this->body.lambda = this->dependant(new ASTLambda(parser));
            this->type = Lambda;

        } else if (tIS(TokenType::tAPeriod)) {
            tEXPECT(TokenType::tAPeriod);

            tGUARD_NEXT(TokenType::tIdentifier, "expecting identifier to reference attribute");

            this->body.identifier = this->dependant(new ASTIdentifier(parser));
            this->type = AttributeReference;

            if (tIS(TokenType::tAColon)) {
                tEXPECT(TokenType::tAColon);
                tGUARD_NEXT(TokenType::tIdentifier, "expecting identifier to reference attribute element");
                this->referencedElement = this->dependant(new ASTIdentifier(parser));
            }

        } else if (tIS(TokenType::tAColon)) {
	    tEXPECT(TokenType::tAColon);
            this->type = SelfMethodReference;
            tGUARD_NEXT(TokenType::tIdentifier, "expecting identifier to reference self instance method");
            this->referencedElement = this->dependant(new ASTIdentifier(parser));

        } else if (tIS(TokenType::tAColonColon)) {
	    tEXPECT(TokenType::tAColonColon);
            this->type = ConstructorReference;
            tGUARD_NEXT(TokenType::tIdentifier, "expecting identifier to reference parent constructor");
            this->referencedElement = this->dependant(new ASTIdentifier(parser));

        } else if (tIS(TokenType::tIdentifier)) {
            this->body.identifier = this->dependant(new ASTIdentifier(parser));
            this->type = LocalReference;

            if (tIS(TokenType::tAColon)) {
                tEXPECT(TokenType::tAColon);
                tGUARD_NEXT(TokenType::tIdentifier, "expecting identifier to reference local object element");
                this->referencedElement = this->dependant(new ASTIdentifier(parser));
            }

        } else if (tIS(TokenType::tStringLiteral) || tIS(TokenType::tNaturalLiteral) || tIS(TokenType::tByteLiteral)) {
            this->type = Literal;
            this->body.literalToken = tTAKE;
        }
    }

    ASTExpr::ASTExpr(std::vector<ASTExpr *> rawList) : AST(ASTTypeExpr) {
        this->body.tuple = this->dependant(new ASTList<ASTExpr>(rawList));
        this->link.raw = nullptr;
        this->type = Tuple;
    }


    ASTExpr *ASTExpr::parseBraces(Parser *parser, bool statementBlockAllowed, bool expectingPrologueBinding) {
        
        if (tIS(TokenType::tABraceOpen)) {
            tEXPECT_STATIC(TokenType::tABraceOpen);            
            ASTExpr *expr = statementBlockAllowed?(ASTExpr::parseAllowingStatementBlock(parser)):(ASTExpr::parse(parser));
            tGUARD_TAKE_NEXT_STATIC(TokenType::tABraceClosed, "expecting matching closing brace");
            return expr;

        }
        return new ASTExpr(parser, statementBlockAllowed, expectingPrologueBinding);
    }

    ASTExpr *ASTExpr::parseSingle(Parser *parser, bool statementBlockAllowed, bool expectingPrologueBinding) {
	ASTExpr *singleExpr = ASTExpr::parseBraces(parser, statementBlockAllowed, expectingPrologueBinding);
        
	if (tIS(TokenType::tAExclaim)) {
	    singleExpr->prologueBinding = singleExpr->dependant(ASTExpr::parseExpectingPrologueBinding(parser));
	}

	return singleExpr;
    }

    ASTExpr *ASTExpr::parseAllowingStatementBlock(Parser *parser) {
        return ASTExpr::parseSingle(parser, true, false);
    }

    ASTExpr *ASTExpr::parseExpectingPrologueBinding(Parser *parser) {
        return ASTExpr::parseBraces(parser, false, true);
    }
    

    ASTExpr *ASTExpr::parse(Parser *parser) {
        return ASTExpr::parseSingle(parser, false, false);
        /*ASTExpr *expr = ASTExpr::parseSingle(parser);
        if (!(tIS(TokenType::tAComma))) {
            return expr; 
        }

        std::vector<ASTExpr *> exprList = std::vector<ASTExpr *>();
        exprList.push_back(expr);
        while (tIS(TokenType::tAComma)) {
            tEXPECT_STATIC(TokenType::tAComma);
            exprList.push_back(ASTExpr::parseSingle(parser));
        }

        return new ASTExpr(exprList);*/
    }

    bool ASTExpr::isPollutedWithSelfReference() {
        
        if (this->type == ExprType::Invocation) {
            return this->body.invocation->isPollutedWithSelfReference();
        } else

        if (this->type == ExprType::Lambda) {
            return this->body.lambda->isPollutedWithSelfReference();
        } else

        if (this->type == ExprType::SelfMethodReference) {
            return true;
        } else

        if (this->type == ExprType::LocalReference) {
            return this->link.localDeclaration->isPollutedWithSelfReference();
        } else
        
        if (this->type == ExprType::AttributeReference) {
            return this->link.attribute->isPollutedWithSelfReference();
        }

        return false;
    }

    void ASTExpr::polluteWithSelfReference(Analyser *analyser) {
        assert(this->expressionCanBeAssignedAValue());
        if (this->type == ExprType::LocalReference) {
            this->link.localDeclaration->markAsPollutedWithSelfReference();
        } else {
        	this->link.attribute->markAsPollutedWithSelfReference();
            //SYNTAX_ERROR(this, "polluting attributes with references to self is not allowed");
        }
    }

    bool ASTExpr::expressionCanBeAssignedAValue() {
	return !this->expressionIsRestrictedFromBeingAssignedAValue && this->referencedElement == nullptr && ((this->type == ExprType::LocalReference) || (this->type == ExprType::AttributeReference));
    }

    bool ASTExpr::expressionCanBeAssignedToAVariable() {
        return (this->_inferredType != nullptr && !(this->type == ExprType::ConstructorReference));
    }

    void ASTExpr::analyseAndCompleteAST(Analyser *analyser, StaticAnalysisScope *scope) {

	if (this->prologueBinding != nullptr) {
	    if (scope->isInAssignmentContext()) {
		SYNTAX_ERROR(this->prologueBinding, "prologue binding not allowed in assignment context");
	    }
	    this->prologueBinding->analyseAndCompleteAST(analyser, scope);
	}


	if (this->type == ExprType::StatementBlock) {
            if (this->body.statementBlock != nullptr) {
                for (ASTStatement *statement : this->body.statementBlock->list)
                    statement->analyseAndCompleteAST(analyser, scope);
            }
        } else 

        if (this->type == ExprType::Invocation) {
            this->body.invocation->analyseAndCompleteAST(analyser, scope);
            this->_inferredType = this->body.invocation->getInferredType();
        } else

        if (this->type == ExprType::Lambda) {
            this->body.lambda->analyseAndCompleteASTForAnonymousLambda(analyser, scope);
	    this->_inferredType = this->body.lambda->getInferredTypeWhenInvokingWithAClassTypeAttached(analyser, ASTType::emptyType());
        } else

        if (this->type == ExprType::Literal) {
            TokenType literalTokenType = this->body.literalToken->type();
	    LiteralType literalTypeType;
            if (literalTokenType == TokenType::tStringLiteral)
                literalTypeType = literalString;
            else if (literalTokenType == TokenType::tNaturalLiteral)
                literalTypeType = literalNatural;
            else if (literalTokenType == TokenType::tByteLiteral)
                literalTypeType = literalByte;
            else assert(0==1);
            this->_inferredType = this->dependant(ASTType::createNewTypeFromLiteralTypeType(literalTypeType));
        } else

        if (this->type == ExprType::AttributeReference) {
            this->link.attribute = scope->findAndUseAttributeInScope(this->body.identifier);
            if (this->referencedElement == nullptr) {
                this->_inferredType = this->link.attribute->type;
            } else {
                if (!this->link.attribute->type->isAValidClassType()) {
                    SYNTAX_ERROR(this->body.identifier, "referenced attribute cannot refer to instance methods, a class cannot be derived from its type");
                }
                this->methodLink = this->link.attribute->type->baseClass()->instanceMethodWithIdentifierAndAccessLevel(this->referencedElement, MethodVisibility::methodOpen);
		if (this->methodLink == nullptr) {
                    SYNTAX_ERROR(this->referencedElement, "cannot find instance method for referenced attribute");
		}
	        assert(this->methodLink != nullptr);
	        this->_inferredType = this->methodLink->getInferredTypeWhenInvokingWithAClassTypeAttached(analyser, this->link.attribute->type);
            }
        } else

        if (this->type == ExprType::SelfMethodReference) {
            this->methodLink = scope->findAndUseSelfInstanceMethodInScope(this->referencedElement);
	    assert(this->methodLink != nullptr);
	    this->_inferredType = this->methodLink->getInferredTypeWhenInvokingWithAClassTypeAttached(analyser, ASTType::emptyType());
        } else

        if (this->type == ExprType::LocalReference) {
            this->link.localDeclaration = scope->findAndUseLocalDeclarationInScopeWithOutputVariableAssignmentIsRestricted(this->body.identifier, &(this->expressionIsRestrictedFromBeingAssignedAValue));
            if (this->referencedElement == nullptr) {
                this->_inferredType = this->link.localDeclaration->type;
            } else {
                if (!this->link.localDeclaration->type->isAValidClassType()) {
                    SYNTAX_ERROR(this->body.identifier, "referenced local object cannot refer to instance methods, a class cannot be derived from its type");
                }
                this->methodLink = this->link.localDeclaration->type->baseClass()->instanceMethodWithIdentifierAndAccessLevel(this->referencedElement, MethodVisibility::methodOpen);
		if (this->methodLink == nullptr) {
                    SYNTAX_ERROR(this->referencedElement, "cannot find instance method for local reference");
		}
		assert(this->methodLink != nullptr);
		this->_inferredType = this->methodLink->getInferredTypeWhenInvokingWithAClassTypeAttached(analyser, this->link.localDeclaration->type);
            }
        } else

        if (this->type == ExprType::StaticReference) {
            this->body.staticTypeReference->analyseAndCompleteAST(analyser, scope);

            if (!this->body.staticTypeReference->isAValidClassType()) {
                SYNTAX_ERROR(this->body.staticTypeReference, "referenced type is not a class type, it cannot be used to reference static methods");
            }
            this->methodLink = this->body.staticTypeReference->baseClass()->staticMethodWithIdentifier(this->referencedElement);
	    if (this->methodLink == nullptr) {
                SYNTAX_ERROR(this->referencedElement, "cannot find static method for type");
	    }
	    assert(this->methodLink != nullptr);
	    this->_inferredType = this->methodLink->getInferredTypeWhenInvokingWithAClassTypeAttached(analyser, this->body.staticTypeReference);
        } else

        if (this->type == ExprType::ConstructorReference) {
            this->methodLink = scope->findAndUseConstructorMethodInScope(this->referencedElement);
	    assert(this->methodLink != nullptr);
	    this->_inferredType = this->methodLink->getInferredTypeWhenInvokingAsConstructorWithinScopeOfClass(analyser, scope->classInScope());
        } else

        if (this->type == ExprType::Empty) {
            this->_inferredType = ASTType::emptyType();
        } else

        if (this->type == ExprType::CompilerDirective) {
            this->_inferredType = ASTType::emptyType();
        } else

        {
            assert(0==1);
        }

	bool literalTypeWasInferredButNotFromALiteralExpression = ((this->type != ExprType::Literal) && this->_inferredType != nullptr && this->_inferredType->literalTypeType() != literalNone);
    	if (literalTypeWasInferredButNotFromALiteralExpression) {
            SYNTAX_ERROR(this->body.identifier, "a literal type cannot be inferred, it is literal you see :)");
        }
    }

    ASTType *ASTExpr::inferredType() {
        return this->_inferredType;
    }


}

