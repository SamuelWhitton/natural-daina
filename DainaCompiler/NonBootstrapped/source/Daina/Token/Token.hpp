//
//  Token.hpp
//  DainaCompiler
//
//  Created by SamWit on 18/12/2016.
//  Copyright © 2016 Samuel Whitton. All rights reserved.
//

#ifndef Token_hpp
#define Token_hpp

#include <string>

namespace Daina {
    class Token;
}

#include "Guard.hpp"
#include "SourceChar.hpp"
#include "TokenHeader.h"


namespace Daina {
    
    class Token {
    private:
        TokenType _type;
    protected:
        Token(TokenType _type);
        Token(TokenType _type, SourceChar start);
        
        SourceChar start;
    public:
        TokenType type();
        static void tdelete(Token *token);
        
	std::string getTokenShortInfo();
        std::string getTokenInfo();
        virtual std::string getInCodeIdentificationString();
        
    };
    
}

#endif /* Token_hpp */




