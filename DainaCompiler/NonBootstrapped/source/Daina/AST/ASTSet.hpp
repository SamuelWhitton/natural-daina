//
//  ASTSet.hpp
//  DainaCompiler
//
//  Created by SamWit on 2/03/2017.
//  Copyright © 2017 Samuel Whitton. All rights reserved.
//

#ifndef ASTSet_hpp
#define ASTSet_hpp

#include "AST.hpp"
#include "Parser.hpp"
#include "ASTIdentifier.hpp"
#include "ASTList.hpp"
#include "ASTSetConstructor.hpp"

namespace Daina {
    
    class ASTSet : public AST {

        
    protected:
        virtual std::string buildDescriptionPart() {
            return "ASTSet";
        }
        
    public:
        ASTIdentifier *identifier = nullptr;
        ASTList<ASTSetConstructor> *constructorList = nullptr;
        
        ASTSet(Parser *parser) : AST(ASTTypeSet) {
            //set = '@' id '{' set_constructor_list '}'
            
            tEXPECT(TokenType::tAAt);
            tGUARD_NEXT(TokenType::tIdentifier, "expecting identifier for set");
            identifier = this->dependant(new ASTIdentifier(parser));
            tGUARD_TAKE_NEXT(TokenType::tACurlBraceOpen, "expecting set definition");
            tGUARD_NEXT(TokenType::tIdentifier, "expecting at least one set constructor");
            constructorList = this->dependant(new ASTList<ASTSetConstructor>(parser, ParseASTSetConstructor::instance()));
            tGUARD_TAKE_NEXT(TokenType::tACurlBraceClosed, "expecting closing brace to finish set");
        }
    };
}

#endif /* ASTSet_hpp */



