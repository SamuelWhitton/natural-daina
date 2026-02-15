//
//  ASTInvarient.cpp
//  DainaCompiler
//
//  Created by SamWit on 19/03/2017.
//  Copyright © 2017 Samuel Whitton. All rights reserved.
//

#include "ASTInvarient.hpp"


namespace Daina {

        ASTInvarient::ASTInvarient(Parser *parser) : AST(ASTTypeInvarient) {
            //invarient -> '#' (string_literal)? expr
            
            tEXPECT(TokenType::tAHash);
            
            if (tIS(TokenType::tStringLiteral)) {
                label = (TStringLiteral *)tEXPECT(TokenType::tStringLiteral);
            }
            
            if (!(tFOLLOWS_EXPR)) {
                tERROR("expecting invarient expression");
            }
            
            expr = this->dependant(ASTExpr::parse(parser));
        }

}





