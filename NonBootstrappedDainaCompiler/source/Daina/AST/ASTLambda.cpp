//
//  ASTLambda.cpp
//  DainaCompiler
//
//  Created by SamWit on 16/07/2017.
//  Copyright © 2017 Samuel Whitton. All rights reserved.
//

#include "ASTLambda.hpp"

namespace Daina {

    ASTLambda::ASTLambda(Parser *parser) : AST(ASTTypeExpr) {
        //lambda -> * ('('...')')? (lambda_return | lambda_noreturn)
        //lambda_return -> '->' (Type {...} '->')? Expr
        //lambda_noreturn -> {...}

        tEXPECT(TokenType::tAAsterix);

        if (tIS(TokenType::tABraceOpen)) {
            tEXPECT(TokenType::tABraceOpen);

            //tGUARD_TAKE_NEXT(TokenType::tABraceOpen, "expecting opening brace for lambda parameters");
       
            if (tFOLLOWS_TYPE) {
                reactants = this->dependant(new ASTList<ASTLocalDeclaration>(parser, ParseASTLocalDeclaration::instance()));
            }

            tGUARD_TAKE_NEXT(TokenType::tABraceClosed, "expecting declarations or closing brace for lambda expression");

        }

        bool requiresBody;
        bool requiresResult;

        if (tIS(TokenType::tAArrow)) {
            tEXPECT(TokenType::tAArrow);
            requiresResult = true;
            if (tFOLLOWS_TYPE) {
                requiresBody = true;
                product = ASTType::parseTypeAttachingAsDependantToAST(parser, this);
            }
        } else {
	    requiresResult = false;
            requiresBody = true;
        }


        if (requiresBody) {
            if (!tFOLLOWS_EXPR_STATEMENT_BLOCK) {
                tERROR("expecting body of lambda expression");
            }
            body = this->dependant(ASTExpr::parseAllowingStatementBlock(parser));
        }
        if (requiresResult) {
            if (requiresResult && requiresBody) {
                if (!tIS(TokenType::tAArrow)) {
                    tERROR("expecting lambda result declaration");
                }
                tEXPECT(TokenType::tAArrow);
            }
      
            if (!tFOLLOWS_EXPR) {
                tERROR("expecting lambda result");
            }
            result = this->dependant(ASTExpr::parse(parser));
        }
        
    }



    bool ASTLambda::lambdaTypeIsValidEntryPointType() {
        return this->reactants == nullptr && this->product == nullptr;
    }

    bool ASTLambda::lambdaTypeIsValidBooleanType() {
        //if (this->reactants != nullptr) return false;
	//if (this->product == nullptr || this->product->literalTypeType() != LiteralType::literalBoolean)
            return false;
        //return true;
    }

    bool ASTLambda::lambdaTypeIsValidConstructorTypeForClass(ASTClass *classAST) {
        return (this->product == nullptr);
    }

    /*bool ASTLambda::lambdaTypeSubsumesLambdaType(ASTLambda *anotherLambda) {
        if (this->product != nullptr && anotherLambda->product == nullptr)
            return false;

        if (this->product != nullptr && anotherLambda->product != nullptr) {
            if (!this->product->typeSubsumesType(anotherLambda->product))
                return false;
        } else if (this->product != nullptr || anotherLambda->product != nullptr) {
            return false;
        }

        if (this->reactants != nullptr || anotherLambda->reactants != nullptr) {
            if (this->reactants == nullptr || anotherLambda->reactants == nullptr) {
                return false;
            }
        }

	if (this->reactants != nullptr) {
	    if (this->reactants->list.size() != anotherLambda->reactants->list.size())
                return false;

	    for (int reactantsIndex = 0; reactantsIndex < this->reactants->list.size(); reactantsIndex++) {
                if (!anotherLambda->reactants->list[reactantsIndex]->type->typeSubsumesType(this->reactants->list[reactantsIndex]->type))
                    return false;
            }
        }
	return true;
    }*/
	
    void ASTLambda::analyseAndCompleteASTHeader(Analyser *analyser, StaticAnalysisScope *scope) {
        if (this->reactants != nullptr) {
	    for (ASTLocalDeclaration *localDeclaration : this->reactants->list) {
                localDeclaration->analyseAndCompleteAST(analyser, scope);
            }
	}

        if (this->product != nullptr) {
            this->product->analyseAndCompleteAST(analyser, scope);
        }

        
    }


    void ASTLambda::analyseAndCompleteASTHeaderTypeInferenceWithScopeClassification(Analyser *analyser, StaticAnalysisScope *scope, ScopeClassification scopeClassification) {
        bool shouldInferProductType = (this->product == nullptr && this->result != nullptr);
	if (shouldInferProductType) {
            scope->beginLambdaBodyScopeWithLambdaAndClassification(this, scopeClassification);
            this->result->analyseAndCompleteAST(analyser, scope);
            scope->endScope(analyser);

	    this->didInferProductType = true;
            this->product = this->result->inferredType();
        }
    }

    void ASTLambda::analyseAndCompleteASTHeaderTypeInferenceInInstanceContext(Analyser *analyser, StaticAnalysisScope *scope) {
        this->analyseAndCompleteASTHeaderTypeInferenceWithScopeClassification(analyser, scope, ScopeClassification::INSTANCE_CONTEXT);
    }

    void ASTLambda::analyseAndCompleteASTHeaderTypeInferenceInStaticContext(Analyser *analyser, StaticAnalysisScope *scope) {
        this->analyseAndCompleteASTHeaderTypeInferenceWithScopeClassification(analyser, scope, ScopeClassification::STATIC_CONTEXT);
    }

    void ASTLambda::analyseAndCompleteASTHeaderTypeInferenceInConstructorContext(Analyser *analyser, StaticAnalysisScope *scope) {
        this->analyseAndCompleteASTHeaderTypeInferenceWithScopeClassification(analyser, scope, ScopeClassification::CONSTRUCTOR_CONTEXT);
    }

    void ASTLambda::analyseAndCompleteASTInnerBodyWithScopeClassification(Analyser *analyser, StaticAnalysisScope *scope, ScopeClassification scopeClassification) {
        scope->beginLambdaBodyScopeWithLambdaAndClassification(this, scopeClassification);
        if (this->body != nullptr)
            this->body->analyseAndCompleteAST(analyser, scope);
        bool hasInferredProductTypeFromResult = this->didInferProductType;
        if (!hasInferredProductTypeFromResult && this->result != nullptr) {
            this->result->analyseAndCompleteAST(analyser, scope);
        }
        if (this->result != nullptr) {
            if (this->result->inferredType() == nullptr) {
                SYNTAX_ERROR(this->result, "lambda result expression must have a type");
            }
            if (!this->product->typeSubsumesType(this->result->inferredType())) {
                SYNTAX_ERROR(this->result, "lambda result expression type cannot be reconciled with declared result type");
            }
        }
        scope->endScope(analyser);
    }


    void ASTLambda::analyseAndCompleteASTForAnonymousLambda(Analyser *analyser, StaticAnalysisScope *scope) {
        this->analyseAndCompleteASTHeader(analyser, scope);
        this->analyseAndCompleteASTHeaderTypeInferenceWithScopeClassification(analyser, scope, ScopeClassification::ANONYMOUS_CONTEXT);
        this->analyseAndCompleteASTInnerBodyWithScopeClassification(analyser, scope, ScopeClassification::ANONYMOUS_CONTEXT);
    }

    void ASTLambda::declareExternalObjectToPullIntoLambdaScopeWithLocalDeclaration(ASTLocalDeclaration *localDeclaration) {
        this->externalObjectPulledIntoLambdaScopeMapping[localDeclaration->identifier->identifierString] = localDeclaration;
    }
        




    void ASTLambda::analyseAndCompleteASTBodyInInstanceContext(Analyser *analyser, StaticAnalysisScope *scope) {
        this->analyseAndCompleteASTInnerBodyWithScopeClassification(analyser, scope, ScopeClassification::INSTANCE_CONTEXT);
    }

    void ASTLambda::analyseAndCompleteASTBodyInStaticContext(Analyser *analyser, StaticAnalysisScope *scope) {
        this->analyseAndCompleteASTInnerBodyWithScopeClassification(analyser, scope, ScopeClassification::STATIC_CONTEXT);
    }

    void ASTLambda::analyseAndCompleteASTBodyInConstructorContext(Analyser *analyser, StaticAnalysisScope *scope) {
        this->analyseAndCompleteASTInnerBodyWithScopeClassification(analyser, scope, ScopeClassification::CONSTRUCTOR_CONTEXT);
    }



    


    void ASTLambda::linkToClassElementOwner(ASTClassElement *classElementOwner) {
        this->classOwner = classElementOwner->classOwner;
	this->identifier = classElementOwner->identifier;
	if (classElementOwner->type == instanceMethod) {
	    this->declareSelfReferenceIsPulledIntoScope();
	}
        this->isAConstructor = (classElementOwner->type == constructor);
    }

    void ASTLambda::markAsPollutedWithSelfReference() {
        this->externallyMarkedAsPollutedWithSelfReference = true;
    }

    void ASTLambda::declareSelfReferenceIsPulledIntoScope() {
        this->selfReferenceIsPulledIntoLambdaScope = true;
    }
 
    bool ASTLambda::isPollutedWithSelfReference() {
        return this->selfReferenceIsPulledIntoLambdaScope || this->externallyMarkedAsPollutedWithSelfReference;
    } 

    bool ASTLambda::isAPotentialParentOrSelfConstructorForConstructorInClass(ASTClass *classOfOriginalConstructor) {
        if (!this->isAConstructor)
            return false;

        if (classOfOriginalConstructor == this->classOwner)
            return true;

        if (classOfOriginalConstructor->parentType->baseClass() == this->classOwner)
            return true;

        return false;
    }


    ASTType *ASTLambda::getInferredTypeWhenInvokingWithAClassTypeAttached(Analyser *analyser, ASTType *attachedClassType) {
	ASTType *addedReturnType = nullptr;
        if (this->isAConstructor) {
            assert(this->product == nullptr);
            addedReturnType = attachedClassType;
        }
        return this->getInferredTypeWhenInvokingWithAClassTypeAttachedAddingReturnType(analyser, attachedClassType, addedReturnType);
    }       

    ASTType *ASTLambda::getInferredTypeWhenInvokingAsConstructorWithinScopeOfClass(Analyser *analyser, ASTClass *classScope) {
        assert(this->isAConstructor);
        assert(this->classOwner == classScope || this->classOwner == classScope->parentType->baseClass());
        
        ASTType *classTypeAttached = ASTType::emptyType();
	bool ownedByParentClass = this->classOwner == classScope->parentType->baseClass();
	if (ownedByParentClass)
  	    classTypeAttached = classScope->parentType;
        return this->getInferredTypeWhenInvokingWithAClassTypeAttachedAddingReturnType(analyser, classTypeAttached, nullptr);
    }

    ASTType *ASTLambda::getInferredTypeWhenInvokingWithAClassTypeAttachedAddingReturnType(Analyser *analyser, ASTType *attachedClassType, ASTType *returnTypeToAdd) {
        bool typeInferenceForThisLambdaIsIncomplete = (this->product == nullptr && this->result != nullptr);
	if (typeInferenceForThisLambdaIsIncomplete) {
	    SYNTAX_ERROR(this, "type checker could not infer lambda type, plz dont judge this type checker, it has a frail ego :)");
	}

	ASTType *inferredTypeProduct = this->product;

	std::vector<ASTType *> inferredTypeReactants = std::vector<ASTType *>();
	if (this->reactants != nullptr) {
            for (ASTLocalDeclaration *localDelcaration : this->reactants->list) {
	        inferredTypeReactants.push_back(localDelcaration->type);
 	    }
  	}

        ASTType *inferredType = this->dependant(ASTType::createNewLambdaTypeWithReactantTypesAndProductType(inferredTypeProduct, inferredTypeReactants));
        ASTType *classTypeToSeedGenerics = attachedClassType;
	while (!classTypeToSeedGenerics->isEmptyType()) {
	    //assert(attachedClassType->baseClass() == this->classOwner || attachedClassType->baseClass()->parentType->baseClass() == this->classOwner);
	    if (classTypeToSeedGenerics->baseClass() == this->classOwner) {
	        inferredType = inferredType->seedCompositeTypesWithGenericSpecificationsFromGivenClassType(analyser, classTypeToSeedGenerics);
            	break;
	    } else {
		classTypeToSeedGenerics = classTypeToSeedGenerics->baseClass()->parentType->seedCompositeTypesWithGenericSpecificationsFromGivenClassType(analyser, classTypeToSeedGenerics);
	    }
	}
	if (returnTypeToAdd != nullptr) {
		inferredType->products.push_back(returnTypeToAdd);
	}
        return inferredType;
    }

    ASTType *ASTLambda::getDeclaredType() {
        ASTType *inferredTypeProduct = this->product;
	if (this->isAConstructor) {
	    inferredTypeProduct = this->dependant(ASTType::createNewClassTypeWithClass(this->classOwner));
	}
	std::vector<ASTType *> inferredTypeReactants = std::vector<ASTType *>();
	if (this->reactants != nullptr) {
                for (ASTLocalDeclaration *localDelcaration : this->reactants->list) {
	        inferredTypeReactants.push_back(localDelcaration->type);
 	    }
  	}

        ASTType *inferredType = this->dependant(ASTType::createNewLambdaTypeWithReactantTypesAndProductType(inferredTypeProduct, inferredTypeReactants));
	return inferredType;

    }
}


