//
//  ASTStatement.hpp
//  DainaCompiler
//
//  Created by SamWit on 7/05/2017.
//  Copyright © 2017 Samuel Whitton. All rights reserved.
//

#ifndef ASTStatement_hpp
#define ASTStatement_hpp


#define tFOLLOWS_STATEMENT (ASTStatement::followsStatement(parser))

namespace Daina {
    class ASTStatement;
}

#include "AST.hpp"
#include "Parser.hpp"
#include "ASTIdentifier.hpp"
#include "ParseAST.hpp"
#include "ASTType.hpp"
#include "ASTExpr.hpp"
#include "ASTLocalDeclaration.hpp"
#include "Analyser.hpp"
#include "StaticAnalysisScope.hpp"


namespace Daina {
 
    class ASTStatement : public AST {

        
    protected:
        virtual std::string buildDescriptionPart() {
            return "ASTStatement";
        }
        
    private:
        

    public:
	ASTExpr *leftExpr = nullptr;
        ASTLocalDeclaration *declaration = nullptr;
        ASTExpr *rightExpr = nullptr;

   	bool isAnAssignmentOfExistingVariable();
    	bool isADeclarationAndAssignmentOfNewVariable();
	bool markedAsTheFirstAssignmentOfAnAttribute = false;

        ASTStatement(Parser *parser);
        static bool followsStatement(Parser *parser);

        void analyseAndCompleteAST(Analyser *analyser, StaticAnalysisScope *scope);
    };
    
    
    class ParseASTStatement : public ParseAST<ASTStatement> {
        
    private:
        ParseASTStatement() : ParseAST<ASTStatement>() {}
        
    public:
        static ParseASTStatement *instance() {
            static ParseASTStatement *_instance = nullptr;
            if (_instance == nullptr)
                _instance = new ParseASTStatement();
            return _instance;
        }
        
        //should return NULL on no valid next AST parse
        virtual ASTStatement *parse(Parser *parser) {
            if (tFOLLOWS_STATEMENT)
                return new ASTStatement(parser);
            return nullptr;
        }
    };
    
}


#endif /* ASTStatement_hpp */


