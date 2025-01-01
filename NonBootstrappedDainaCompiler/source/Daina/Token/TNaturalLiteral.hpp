//
//  TNaturalLiteral.hpp
//  DainaCompiler
//
//  Created by SamWit on 21/12/2016.
//  Copyright © 2016 Samuel Whitton. All rights reserved.
//

#ifndef TNaturalLiteral_hpp
#define TNaturalLiteral_hpp

#include "Token.hpp"

namespace Daina {
    
    class TNaturalLiteral : public Token {
    public:
        TNaturalLiteral(SourceChar start, std::string strNatural) : Token(tNaturalLiteral, start), strNatural(strNatural) {};
        virtual std::string getInCodeIdentificationString() {
            return strNatural + Token::getInCodeIdentificationString();
        }


	std::string zitherLiteralRepresentation() {
	    return strNatural;
	}
        
        std::string strNatural;
    };
    
}


#endif /* TNaturalLiteral_hpp */
