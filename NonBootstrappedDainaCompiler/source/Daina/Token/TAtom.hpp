//
//  TAtom.hpp
//  DainaCompiler
//
//  Created by SamWit on 23/12/2016.
//  Copyright © 2016 Samuel Whitton. All rights reserved.
//

#ifndef TAtom_hpp
#define TAtom_hpp

#include "Tokens.hpp"

#include "Tokens.hpp"

namespace Daina {
    
    
    class TAtom : public Token {
    private:
        TokenType typeFromString(std::string str) {
            auto found = atomTokenMapping.find(str);
            if (found != atomTokenMapping.end()) {
                return found->second;
            }
            return tError;
        }
        TokenType typeFromChars(char c1, char c2) {
            return typeFromString(std::string(1, c1) + std::string(1, c2));
        }
        TokenType typeFromChar(char c) {
            return typeFromString(std::string(1, c));
        }
        std::string descr;
    public:
        TAtom(SourceChar start, char c) : Token(typeFromChar(c), start) {
            descr = std::string(1, c);
        };
        TAtom(SourceChar start, char c1, char c2) : Token(typeFromChars(c1, c2), start) {
            descr = std::string(1, c1) + std::string(1, c2);
        };
        virtual std::string getInCodeIdentificationString() {
            guard(this->isValidAtom());
            return descr + Token::getInCodeIdentificationString();
        }
        bool isValidAtom() {
            return this->type() != tError;
        }
    };
    
}


#endif /* TAtom_hpp */
