//
//  ASTIdentifier.hpp
//  DainaCompiler
//
//  Created by SamWit on 2/03/2017.
//  Copyright © 2017 Samuel Whitton. All rights reserved.
//

#ifndef ASTIdentifier_hpp
#define ASTIdentifier_hpp

namespace Daina {
    class ASTIdentifier;
}


#include "AST.hpp"
#include "Parser.hpp"
#include "ParseAST.hpp"
#include "ASTClass.hpp"

namespace Daina {
    
    class ASTIdentifier : public AST {
        
        
    protected:
        virtual std::string buildDescriptionPart() {
            return "ASTIdentifier";
        }

    private:
        //TIdentifier *id;
        
        
    public:
        std::string identifierString;
        ASTClass *link = nullptr;

        bool isLinkedToClass() {
            return link != nullptr;
        }

        bool isIdentityEqualToIdentifier(ASTIdentifier *anotherIdentifier) {
	    return this->identifierString == anotherIdentifier->identifierString;
        }
        
        void linkToClass(ASTClass *classAST) {
            assert(this->link == nullptr);
            this->link = classAST;
        }
        
        ASTIdentifier(std::string identifierString) : AST(ASTTypeIdentifier) {
            this->identifierString = identifierString;
        }
        
        ASTIdentifier(Parser *parser) : AST(ASTTypeIdentifier) {
            TIdentifier *id = (TIdentifier *)tEXPECT(TokenType::tIdentifier);
            identifierString = id->strIdentifier;
        }
    };
    
    
    class ParseASTIdentifier : public ParseAST<ASTIdentifier> {
        
    private:
        ParseASTIdentifier() : ParseAST<ASTIdentifier>() {}
        
    public:
        static ParseASTIdentifier *instance() {
            static ParseASTIdentifier *_instance = nullptr;
            if (_instance == nullptr)
                _instance = new ParseASTIdentifier();
            return _instance;
        }
        
        //should return NULL on no valid next AST parse
        virtual ASTIdentifier *parse(Parser *parser) {
            if (tIS(TokenType::tIdentifier))
                return new ASTIdentifier(parser);
            return nullptr;
        }
    };

}

#endif /* ASTIdentifier_hpp */
