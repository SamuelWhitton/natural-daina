//
//  TStringLiteral.hpp
//  DainaCompiler
//
//  Created by SamWit on 21/12/2016.
//  Copyright © 2016 Samuel Whitton. All rights reserved.
//

#ifndef TStringLiteral_hpp
#define TStringLiteral_hpp

#include "Token.hpp"

namespace Daina {
    
    class TStringLiteral : public Token {
    private:
        bool isEscape;
        std::string str;
        TStringLiteral *child = nullptr;
    public:
        TStringLiteral(SourceChar start, std::string str, bool isEscape) : Token(tStringLiteral, start), str(str), isEscape(isEscape) {
        };
        ~TStringLiteral() {
            if (child != nullptr)
                delete child;
        }
        
        void addChild(TStringLiteral *tsl) {
            if (child == nullptr)
                child = tsl;
            else
                child->addChild(tsl);
        }
        
        std::string getString() {
            std::string s = str;
            if (isEscape) s = "\\" + s;
            if (child == nullptr)
                return s;
            return s + child->getString();
        }

	std::string zitherLiteralRepresentation() {
	    return this->getString();
	}
        
        virtual std::string getInCodeIdentificationString() {
            return "\"" + getString() + "\"" + Token::getInCodeIdentificationString();
        }
    };
    
}

#endif /* TStringLiteral_hpp */
