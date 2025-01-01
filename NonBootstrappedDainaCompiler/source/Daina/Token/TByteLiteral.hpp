//
//  TByteLiteral.hpp
//  DainaCompiler
//
//  Created by SamWit on 21/12/2016.
//  Copyright © 2016 Samuel Whitton. All rights reserved.
//

#ifndef TByteLiteral_hpp
#define TByteLiteral_hpp

#include "Token.hpp"

namespace Daina {
    
    class TByteLiteral : public Token {
    public:
        TByteLiteral(SourceChar start, char bh, char bl) : Token(tByteLiteral, start), bh(bh), bl(bl) {};
        virtual std::string getInCodeIdentificationString() {
            return "0b" + std::string(1, bh) + std::string(1, bl) + Token::getInCodeIdentificationString();
        }

	std::string zitherLiteralRepresentation() {
	    return "0x" + std::string(1, bh) + std::string(1, bl);
	}
        
        char bl, bh;
    };
    
}

#endif /* TByteLiteral_hpp */
