//
//  ASTList.hpp
//  DainaCompiler
//
//  Created by SamWit on 27/02/2017.
//  Copyright © 2017 Samuel Whitton. All rights reserved.
//

#ifndef ASTList_hpp
#define ASTList_hpp

#include <vector>

#include "AST.hpp"
#include "Parser.hpp"
#include "ParseAST.hpp"


namespace Daina {
    
    template <typename E> class ASTList : public AST {
        static_assert(std::is_base_of<AST, E>::value, "E must inherit from AST");
        
        
    protected:
        virtual std::string buildDescriptionPart() {
            return "ASTList";
        }

    public:
        std::vector<E *> list = std::vector<E *>();

        ASTList(std::vector<E *> rawList) : AST(ASTTypeList) {
            for (E* ast : rawList)
                this->list.push_back(this->dependant(ast));
        }

        bool isEmpty() {
            return list.size() == 0;
        }
        
        ASTList(Parser *parser, ParseAST<E> *specificASTParser) : ASTList(parser, specificASTParser, TokenType::tAComma) {
            
        }
        
        ASTList(Parser *parser, ParseAST<E> *specificASTParser, TokenType seperator) : AST(ASTTypeList) {
            //_list<type> -> type (',' type)*
            
            E *ast = nullptr;
            while ( (ast = this->dependant(specificASTParser->parse(parser))) ) {
                list.push_back(ast);
                if (seperator == TokenType::tEmpty); 
                else if (tIS(seperator))
                    tEXPECT(seperator);
                else break;
            }
            guard(list.size() >= 1); //always at least one element in list
        }
    };
}

#endif /* ASTList_hpp */
