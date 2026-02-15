//
//  ASTGeneric.cpp
//  DainaCompiler
//
//  Created by SamWit on 5/03/2017.
//  Copyright © 2017 Samuel Whitton. All rights reserved.
//

#include "ASTGeneric.hpp"


namespace Daina {
    
    
    ASTGeneric::ASTGeneric(Parser *parser) : AST(ASTTypeGeneric) {
        //generic -> id (':' type)?
        
        identifier = this->dependant(new ASTIdentifier(parser));
        
        //if (!tIS(TokenType::tAColon)) {
            //tEXPECT(TokenType::tAColon);
            if ( !(tFOLLOWS_TYPE) ) {
                tERROR("expecting generic parent type");
            }
            superType = ASTType::parseTypeAttachingAsDependantToAST(parser, this);
        //}
    }

    void ASTGeneric::analyseAndCompleteASTWithIndexBinding(Analyser *analyser, StaticAnalysisScope *scope, int indexBinding) {
	assert (this->superType != nullptr);
        this->superType->analyseAndCompleteAST(analyser, scope);
	if (!this->superType->isAValidClassType()) {
	    SYNTAX_ERROR(this->superType, "generic parent type must be a class type");
	}
        scope->addGenericTypeWithIdentifierSuperTypeAndIndexBinding(this->identifier, this->superType, indexBinding);
    }
    
    
    
}





