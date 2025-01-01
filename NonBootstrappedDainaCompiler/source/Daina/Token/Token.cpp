//
//  Token.cpp
//  DainaCompiler
//
//  Created by SamWit on 18/12/2016.
//  Copyright © 2016 Samuel Whitton. All rights reserved.
//

#include "Token.hpp"



namespace Daina {
    
    Token::Token(TokenType _type) {
        this->_type = _type;
    }
    
    Token::Token(TokenType _type, SourceChar start) : Token(_type) {
        this->start = start;
    }
    
    TokenType Token::type() {
        return _type;
    }
    
    void Token::tdelete(Token *token) {
        delete token;
    }
    
    std::string Token::getInCodeIdentificationString() {
        guard(start.isValid());
        return " - " + start.positionDescription();
    }

    std::string Token::getTokenShortInfo() {
        guard(start.isValid());
        std::string raw = this->getInCodeIdentificationString();
        return raw.substr(0, raw.find(" ", 0));
    }
    
    std::string Token::getTokenInfo() {
        guard(start.isValid());
        auto found = tokenTypeDescriptorMapping.find(this->type());
        guard(found != tokenTypeDescriptorMapping.end());
        return "[" + found->second + "] " + this->getInCodeIdentificationString();
    }
    
}



