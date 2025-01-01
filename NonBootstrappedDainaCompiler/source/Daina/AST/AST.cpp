//
//  AST.cpp
//  DainaCompiler
//
//  Created by SamWit on 6/01/2017.
//  Copyright © 2017 Samuel Whitton. All rights reserved.
//

#include "AST.hpp"



namespace Daina {
   // 
    Token *AST::tokenLog(Token *token) {
        if (this->firstToken == nullptr) this->firstToken = token;
        tokenSequenceDescription += token->getTokenShortInfo();
        return token;
    }

    Token *AST::tokenTake(Parser *parser) {
        return this->tokenLog(parser->emitter()->take());
    }

    Token *AST::tokenExpect(Parser *parser, TokenType type) {
        return this->tokenLog(parser->emitter()->expect(type));
    }

    Token *AST::getFirstToken() {
	if (this->firstToken == nullptr) {
	    for (AST *dependantAST : dependantASTs) return dependantAST->getFirstToken();
	}
        return this->firstToken;
    }
    
    
}

