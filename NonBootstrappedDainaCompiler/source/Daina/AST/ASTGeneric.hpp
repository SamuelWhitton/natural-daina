//
//  ASTGeneric.hpp
//  DainaCompiler
//
//  Created by SamWit on 5/03/2017.
//  Copyright © 2017 Samuel Whitton. All rights reserved.
//

#ifndef ASTGeneric_hpp
#define ASTGeneric_hpp

namespace Daina {
    
    class ASTGeneric;
    class ParseASTGeneric;
        
}

#include "AST.hpp"
#include "Parser.hpp"
#include "ASTIdentifier.hpp"
#include "ParseAST.hpp"
#include "ASTType.hpp"
#include "Analyser.hpp"
#include "StaticAnalysisScope.hpp"


namespace Daina {
    
    class ASTGeneric : public AST {
        
    public:
        ASTIdentifier *identifier = nullptr;
        ASTType *superType = nullptr;
        
        ASTGeneric(Parser *parser);

        void analyseAndCompleteASTWithIndexBinding(Analyser *analyser, StaticAnalysisScope *scope, int indexBinding);
    };
    
    class ParseASTGeneric : public ParseAST<ASTGeneric> {
        
        
    protected:
        virtual std::string buildDescriptionPart() {
            return "ASTGeneric";
        }

    private:
        ParseASTGeneric() : ParseAST<ASTGeneric>() {}
        
    public:
        
        static ParseASTGeneric *instance() {
            static ParseASTGeneric *_instance = nullptr;
            if (_instance == nullptr)
                _instance = new ParseASTGeneric();
            return _instance;
        }
        
        //should return NULL on no valid next AST parse
        virtual ASTGeneric *parse(Parser *parser) {
            if (tIS(TokenType::tIdentifier))
                return new ASTGeneric(parser);
            return nullptr;
        }
    };
}


#endif /* ASTGeneric_hpp */
