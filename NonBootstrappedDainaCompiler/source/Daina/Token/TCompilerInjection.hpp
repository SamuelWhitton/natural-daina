//
//  TCompilerInjection.hpp
//  DainaCompiler
//
//  Created by SamWit on 15/05/2017.
//  Copyright © 2017 Samuel Whitton. All rights reserved.
//

#ifndef TCompilerInjection_hpp
#define TCompilerInjection_hpp

#include "Token.hpp"

namespace Daina {
    
    class TCompilerInjection : public Token {
    public:
        TCompilerInjection(SourceChar start, std::string injection) : Token(tCompilerInjection, start), injection(injection) {};
        virtual std::string getInCodeIdentificationString() {
            return "##compiler-injection##" + Token::getInCodeIdentificationString();
        }
        
        std::string injection;
    };
    
}


#endif /* TCompilerInjection_hpp */
