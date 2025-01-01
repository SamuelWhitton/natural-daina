//
//  ASTLocalDeclaration.cpp
//  DainaCompiler
//
//  Created by SamWit on 19/03/2017.
//  Copyright © 2017 Samuel Whitton. All rights reserved.
//

#include "ASTLocalDeclaration.hpp"


namespace Daina {

    ASTLocalDeclaration::ASTLocalDeclaration(Parser *parser) : AST(ASTTypeAttribute) {
        //attribute -> type id
        type = ASTType::parseTypeAttachingAsDependantToAST(parser, this);
            
        if (!tIS(TokenType::tIdentifier)) {
            tERROR("expecting declaration identifier");
        }
            
        identifier = this->dependant(new ASTIdentifier(parser));
    }

    void ASTLocalDeclaration::analyseAndCompleteAST(Analyser *analyser, StaticAnalysisScope *scope) {
        this->type->analyseAndCompleteAST(analyser, scope);
    }

    void ASTLocalDeclaration::markAsPollutedWithSelfReference() {
        this->pollutedWithSelfReference = true;
    }
        
    bool ASTLocalDeclaration::isPollutedWithSelfReference() {
        return this->pollutedWithSelfReference;
    }   


}



