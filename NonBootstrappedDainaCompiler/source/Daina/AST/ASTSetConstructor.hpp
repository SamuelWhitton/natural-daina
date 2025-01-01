//
//  ASTSetConstructor.hpp
//  DainaCompiler
//
//  Created by SamWit on 2/03/2017.
//  Copyright © 2017 Samuel Whitton. All rights reserved.
//

#ifndef ASTSetConstructor_hpp
#define ASTSetConstructor_hpp

#include "AST.hpp"
#include "ASTIdentifier.hpp"
#include "Parser.hpp"
#include "ParseAST.hpp"


namespace Daina {
    
    class ASTSetConstructor : public AST {

        
    protected:
        virtual std::string buildDescriptionPart() {
            return "ASTSetConstructor";
        }
        
    public:
        std::vector<ASTIdentifier *> components = std::vector<ASTIdentifier *>();
        
        ASTSetConstructor(Parser *parser) : AST(ASTTypeSetConstructor) {
            //set_constructor = id+
            
            guard(tIS(TokenType::tIdentifier));
            do {
                components.push_back(this->dependant(new ASTIdentifier(parser)));
            } while (tIS(TokenType::tIdentifier));
        }
    };
    
    
    
    class ParseASTSetConstructor : public ParseAST<ASTSetConstructor> {
        
        
    private:
        ParseASTSetConstructor() : ParseAST<ASTSetConstructor>() {}
        
    public:
        static ParseASTSetConstructor *instance() {
            static ParseASTSetConstructor *_instance = nullptr;
            if (_instance == nullptr)
                _instance = new ParseASTSetConstructor();
            return _instance;
        }
        
        //should return NULL on no valid next AST parse
        virtual ASTSetConstructor *parse(Parser *parser) {
            if (tIS(TokenType::tIdentifier))
                return new ASTSetConstructor(parser);
            return nullptr;
        }
    };
    
}

#endif /* ASTSetConstructor_hpp */




