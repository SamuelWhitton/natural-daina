//
//  ASTAttribute.cpp
//  DainaCompiler
//
//  Created by SamWit on 19/03/2017.
//  Copyright © 2017 Samuel Whitton. All rights reserved.
//

#include "ASTAttribute.hpp"



namespace Daina {

    void ASTAttribute::analyseAndCompleteAST(Analyser *analyser, StaticAnalysisScope *scope) {
	this->type->analyseAndCompleteAST(analyser, scope);
	this->classOwner = scope->classInScope();
	scope->addAttributeToScopeWithAttributeAndIdentifier(this, this->identifier);
    }


        ASTAttribute::ASTAttribute(Parser *parser) : AST(ASTTypeAttribute) {
            //attribute -> type id
            
            type = ASTType::parseTypeAttachingAsDependantToAST(parser, this);
            
            if (!tIS(TokenType::tIdentifier)) {
                tERROR("expecting attribute identifier");
            }
            
            identifier = this->dependant(new ASTIdentifier(parser));
        }
        
    void ASTAttribute::markAsPollutedWithSelfReference() {
        this->pollutedWithSelfReference = true;
    }
        
    bool ASTAttribute::isPollutedWithSelfReference() {
        return this->pollutedWithSelfReference;
    } 

}




