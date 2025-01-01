//
//  TBooleanLiteral.hpp
//  DainaCompiler
//
//  Created by SamWit on 22/12/2016.
//  Copyright © 2016 Samuel Whitton. All rights reserved.
//

#ifndef TBooleanLiteral_hpp
#define TBooleanLiteral_hpp

#include "Token.hpp"

namespace Daina {
    
    /*class TBooleanLiteral : public Token {
    public:
        TBooleanLiteral(SourceChar start, bool value) : Token(tBoolLiteral, start), value(value) {
        };
        virtual std::string getInCodeIdentificationString() {
            return (value?"True":"False") + Token::getInCodeIdentificationString();
        }
        
        bool value;
    };*/
    
}

#endif /* TBooleanLiteral_hpp */
