//
//  ASTInvocation.cpp
//  DainaCompiler
//
//  Created by SamWit on 7/05/2017.
//  Copyright © 2017 Samuel Whitton. All rights reserved.
//

#include "ASTInvocation.hpp"

namespace Daina {
    ASTInvocation::ASTInvocation(Parser *parser) : AST(ASTTypeInvocation) {
        //invocation -> \expr(:id)? expr*

        this->root = nullptr;
        //this->subId = nullptr;
        
        tEXPECT(TokenType::tABkSlash);

        if (!tFOLLOWS_EXPR) {
            tERROR("expecting lambda expression or reference");
        }
        this->root = this->dependant(ASTExpr::parse(parser));

        while (tFOLLOWS_EXPR) {
            this->applications.push_back(this->dependant(ASTExpr::parse(parser)));
        }

    }


    void ASTInvocation::analyseAndCompleteAST(Analyser *analyser, StaticAnalysisScope *scope) {
	scope->enterInvocationContext();
        this->root->analyseAndCompleteAST(analyser, scope);
	scope->exitInvocationContext();

        ASTType *lambdaType = this->root->inferredType();        

        if (!lambdaType->isLambdaType()) {
            SYNTAX_ERROR(this, "invoked expression is not a lambda expression");
        }
         
        std::vector<ASTType *> reactants = lambdaType->getLambdaReactants();

        if (reactants.size() != this->applications.size()) {
            SYNTAX_ERROR(this, "invocation does not have the correct number of applied expressions");
        }

        for (int reactantIndex = 0; reactantIndex < reactants.size(); ++reactantIndex) {
            ASTExpr *lambdaApplication = this->applications[reactantIndex];
            lambdaApplication->analyseAndCompleteAST(analyser, scope);
            if (!lambdaApplication->expressionCanBeAssignedToAVariable()) {
                SYNTAX_ERROR(this, "one or more applied expressions cannot be assigned to a variable");
            }
            ASTType *reactantType = reactants[reactantIndex];
            if (!reactantType->typeSubsumesType(lambdaApplication->inferredType())) {
                SYNTAX_ERROR(this, "one or more applied expressions cannot be reconciled with expected type");
            }
        }


        this->pollutedWithSelfReference = this->calculateIfInvocationIsPollutedWithSelfReference();
        if (this->pollutedWithSelfReference) {
            scope->notifyScopeOfSelfReferencePollutionDueToPollutedInvocationWithASTSource(this);
        }
    }

    ASTType *ASTInvocation::getInferredType() {
        return this->root->inferredType()->getLambdaProduct();
    }


    bool ASTInvocation::isPollutedWithSelfReference() {
        return this->pollutedWithSelfReference;
    }
     
    bool ASTInvocation::calculateIfInvocationIsPollutedWithSelfReference() {
        bool isPollutedWithSelfReference;

        if (this->root->isPollutedWithSelfReference())
            isPollutedWithSelfReference = true;
        else {
            bool foundPollutionInLambdaApplications = false;
            for (ASTExpr *lambdaApplication : this->applications) {
      		if (lambdaApplication->isPollutedWithSelfReference()) {
 		    foundPollutionInLambdaApplications = true;
 		    break;
                }
            }
            isPollutedWithSelfReference = foundPollutionInLambdaApplications;
        }
  
        return isPollutedWithSelfReference;
    }


}





