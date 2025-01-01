//
//  TKeyword.hpp
//  DainaCompiler
//
//  Created by SamWit on 22/12/2016.
//  Copyright © 2016 Samuel Whitton. All rights reserved.
//

#ifndef TKeyword_hpp
#define TKeyword_hpp

#include "Tokens.hpp"

namespace Daina {
    
    
    class TKeyword : public Token {
    private:
        std::string strKeyword;
        
        TokenType typeFromKeyword(std::string keyword) {
            auto found = keywordTokenMapping.find(keyword);
            if (found != keywordTokenMapping.end()) {
                return found->second;
            }
            return tError;
        }
    public:
        TKeyword(SourceChar start, std::string strKeyword) : strKeyword(strKeyword), Token(typeFromKeyword(strKeyword), start) {
        };
        virtual std::string getInCodeIdentificationString() {
            guard(this->isValidKeyword());
            return strKeyword + Token::getInCodeIdentificationString();
        }
        bool isValidKeyword() {
            return this->type() != tError;
        }
    };
    
}

#endif /* TKeyword_hpp */
