//
//  ASTStatement.cpp
//  DainaCompiler
//
//  Created by SamWit on 7/05/2017.
//  Copyright © 2017 Samuel Whitton. All rights reserved.
//

#include "ASTStatement.hpp"

namespace Daina {
    ASTStatement::ASTStatement(Parser *parser) : AST(ASTTypeStatement) {
        //statement -> expr (= expr)?
        /*
           expr, assignment/alloc+assignment, return, branch, loop
        */

        bool canHasRightExpression = false;
        bool mustHasRightExpressionForDeclaration = false;
	if (tFOLLOWS_TYPE) {
            canHasRightExpression = true;
            mustHasRightExpressionForDeclaration = true;
            this->declaration = this->dependant(new ASTLocalDeclaration(parser));
	}
        else if (tFOLLOWS_EXPR) {
            canHasRightExpression = true;
            this->leftExpr = this->dependant(ASTExpr::parse(parser));
        }

        if (canHasRightExpression) {
            if (tIS(TokenType::tAEq)) {
                tEXPECT(TokenType::tAEq);
                if (!tFOLLOWS_EXPR) {
                    tERROR("expecting right expression");
                }
                this->rightExpr = this->dependant(ASTExpr::parse(parser));
            } else {
                if (mustHasRightExpressionForDeclaration) {
                    tERROR("expecting assignment expression for declaration");
                }
            }            
        }

        if (tIS(TokenType::tASemiColon)) {
            tEXPECT(TokenType::tASemiColon);
        } else {
            //tERROR("expecting semi-colon to end statement");
        }


    }

    bool ASTStatement::isAnAssignmentOfExistingVariable() {
	return this->leftExpr != nullptr && this->rightExpr != nullptr;
    }

    bool ASTStatement::isADeclarationAndAssignmentOfNewVariable() {
        return (this->declaration != nullptr && this->rightExpr != nullptr);
    }



    bool ASTStatement::followsStatement(Parser *parser) {
        return tFOLLOWS_EXPR || tFOLLOWS_TYPE;
    }

    void ASTStatement::analyseAndCompleteAST(Analyser *analyser, StaticAnalysisScope *scope) {
	scope->beginStatementScope(this);


        if (this->rightExpr != nullptr) {
	    scope->enterSubscopeLayer();
            this->rightExpr->analyseAndCompleteAST(analyser, scope); 
	    scope->exitSubscopeLayer();
            if (!this->rightExpr->expressionCanBeAssignedToAVariable()) {
                SYNTAX_ERROR(this, "RHS expression cannot be assigned to a variable");
            }
        }       
        if (this->isAnAssignmentOfExistingVariable()) {
            scope->enterAssignmentContext();
            this->leftExpr->analyseAndCompleteAST(analyser, scope);
            scope->exitAssignmentContext();
        } else if (this->leftExpr != nullptr) {
	    scope->enterSubscopeLayer();
            this->leftExpr->analyseAndCompleteAST(analyser, scope);
	    scope->exitSubscopeLayer();
	}

        if (this->declaration != nullptr)
            this->declaration->analyseAndCompleteAST(analyser, scope);

        bool isAnAssignment = (this->rightExpr != nullptr);
        if (isAnAssignment) {
            ASTType *assigneeType = nullptr;
            if (this->declaration != nullptr) {
                assigneeType = this->declaration->type;
            } else {
                assert(this->leftExpr != nullptr);
                if (!this->leftExpr->expressionCanBeAssignedAValue()) {
                    SYNTAX_ERROR(this, "LHS expression cannot be assigned a value");
                }
                assigneeType = this->leftExpr->inferredType();
            }

            ASTType *assigningType = this->rightExpr->inferredType();

            assert(assigningType != nullptr);
            assert(assigneeType != nullptr);
            if (!assigneeType->typeSubsumesType(assigningType)) {
                SYNTAX_ERROR(this, "unable to reconcile right expression type with type of assigned variable");
            }

            bool pollutionOfSelfReferenceOnRHS = this->rightExpr->isPollutedWithSelfReference();
            if (pollutionOfSelfReferenceOnRHS) {
                if (this->declaration != nullptr) {
                    this->declaration->markAsPollutedWithSelfReference();
                } else {
                    this->leftExpr->polluteWithSelfReference(analyser);
                }
            }
        }

	if (this->declaration != nullptr) {
	    scope->insertLocalDeclarationIntoScope(this->declaration);
        }

	scope->exitStatementScope();
    }



}



