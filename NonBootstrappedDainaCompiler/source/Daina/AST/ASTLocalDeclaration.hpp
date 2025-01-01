//
//  ASTLocalDeclaration.hpp
//  DainaCompiler
//
//  Created by SamWit on 19/03/2017.
//  Copyright © 2017 Samuel Whitton. All rights reserved.
//

#ifndef ASTLocalDeclaration_hpp
#define ASTLocalDeclaration_hpp

namespace Daina {
    class ASTLocalDeclaration;
}

#include "AST.hpp"
#include "Parser.hpp"
#include "ASTIdentifier.hpp"
#include "ParseAST.hpp"
#include "ASTType.hpp"
#include "StaticAnalysisScope.hpp"
#include "Analyser.hpp"

namespace Daina {
    
    class ASTLocalDeclaration : public AST {
        
        
    protected:
        virtual std::string buildDescriptionPart() {
            return "ASTLocalDeclaration";
        }
        bool pollutedWithSelfReference = false;

    public:
        ASTType *type = nullptr;
        ASTIdentifier *identifier = nullptr;
        
        ASTLocalDeclaration(Parser *parser);

        void markAsPollutedWithSelfReference();
        bool isPollutedWithSelfReference();

	bool isAMethodParameter = false;
        void markAsAMethodParameter() {
	    this->isAMethodParameter = true;
	}


        void analyseAndCompleteAST(Analyser *analyser, StaticAnalysisScope *scope);
    };


    class ParseASTLocalDeclaration : public ParseAST<ASTLocalDeclaration> {
        
    private:
        ParseASTLocalDeclaration() : ParseAST<ASTLocalDeclaration>() {}
        
    public:
        static ParseASTLocalDeclaration *instance() {
            static ParseASTLocalDeclaration *_instance = nullptr;
            if (_instance == nullptr)
                _instance = new ParseASTLocalDeclaration();
            return _instance;
        }
        
        //should return NULL on no valid next AST parse
        virtual ASTLocalDeclaration *parse(Parser *parser) {
            if (tFOLLOWS_TYPE)
                return new ASTLocalDeclaration(parser);
            return nullptr;
        }
    };
    
}


#endif /* ASTLocalDeclaration_hpp */
