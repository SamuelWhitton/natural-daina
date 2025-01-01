//
//  TIdentifier.hpp
//  DainaCompiler
//
//  Created by SamWit on 22/12/2016.
//  Copyright © 2016 Samuel Whitton. All rights reserved.
//

#ifndef TIdentifier_hpp
#define TIdentifier_hpp

#include "Token.hpp"

namespace Daina {
    
    class TIdentifier : public Token {
    public:
        TIdentifier(SourceChar start, std::string strIdentifier) : Token(tIdentifier, start), strIdentifier(strIdentifier) {
        };
        virtual std::string getInCodeIdentificationString() {
            return strIdentifier + Token::getInCodeIdentificationString();
        }
        
        std::string strIdentifier;
    };
    
}

#endif /* TIdentifier_hpp */


