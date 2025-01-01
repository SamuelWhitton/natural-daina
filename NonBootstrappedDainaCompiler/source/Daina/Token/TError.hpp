//
//  TError.hpp
//  DainaCompiler
//
//  Created by SamWit on 19/12/2016.
//  Copyright © 2016 Samuel Whitton. All rights reserved.
//

#ifndef TError_hpp
#define TError_hpp

#include "Token.hpp"

#include <string>

namespace Daina {
    
    class TError : public Token {
    public:
        TError(std::string errorMessage) : Token(tError), errorMessage(errorMessage) {};
        TError(std::string errorMessage, SourceChar c) : Token(tError), errorMessage(errorMessage + " - " + c.positionDescription()) {};
        
        std::string errorMessage;
    };
    
}

#endif /* TError_hpp */



