//
//  ASTExpr.hpp
//  DainaCompiler
//
//  Created by SamWit on 7/05/2017.
//  Copyright © 2017 Samuel Whitton. All rights reserved.
//

#ifndef ASTExpr_hpp
#define ASTExpr_hpp

#define tFOLLOWS_EXPR ((tIS(TokenType::tABraceOpen)\
|| tIS(TokenType::tStringLiteral)\
|| tIS(TokenType::tNaturalLiteral)\
|| tIS(TokenType::tByteLiteral)\
|| tIS(TokenType::tIdentifier)\
|| tIS(TokenType::tABkSlash)\
|| tIS(TokenType::tAAsterix)\
|| tIS(TokenType::tAPeriod)\
|| tIS(TokenType::tALeThan)\
|| tIS(TokenType::tAColon)\
|| tIS(TokenType::tAColonColon)\
|| tFOLLOWS_TYPE))

#define tFOLLOWS_EXPR_STATEMENT_BLOCK (tIS(TokenType::tACurlBraceOpen))

namespace Daina {
    class ASTExpr;
}

#include "AST.hpp"
#include "Parser.hpp"
#include "ASTIdentifier.hpp"
#include "ParseAST.hpp"
#include "ASTType.hpp"
#include "ASTStatement.hpp"
#include "ASTAttribute.hpp"
#include "ASTLocalDeclaration.hpp"
#include "ASTInvocation.hpp"
#include "ASTList.hpp"
#include "ASTLambda.hpp"


namespace Daina {

    enum ExprType {
        Empty,
        Tuple,
        StatementBlock,
        Invocation,
        Lambda,
        Literal,
        AttributeReference,
        SelfMethodReference,
        LocalReference,
        StaticReference,
	ConstructorReference,
        CompilerDirective
    };

    class ASTExpr : public AST {
        
        
    protected:
        virtual std::string buildDescriptionPart() {
            return "ASTExpr";
        }

    private:
        ASTExpr(Parser *parser, bool statementBlockAllowed, bool expectingPrologueBinding);
        ASTExpr(std::vector<ASTExpr *> rawList);
        static ASTExpr *parseBraces(Parser *parser, bool statementBlockAllowed, bool expectingPrologueBinding);
        static ASTExpr *parseSingle(Parser *parser, bool statementBlockAllowed, bool expectingPrologueBinding);

	bool expressionIsRestrictedFromBeingAssignedAValue = false;

       	
    public:


	ExprType type;

        union _body {
            void* raw;
            ASTList<ASTStatement> *statementBlock;
            ASTInvocation *invocation;
            ASTIdentifier *identifier;
            ASTList<ASTExpr> *tuple;
            ASTLambda *lambda;
            Token *literalToken;
            ASTType *staticTypeReference;
            TCompilerInjection *injection;
        } body;

	ASTExpr *prologueBinding = nullptr;

        ASTIdentifier *referencedElement;
        ASTIdentifier *declaredElement;
        ASTType *_inferredType = nullptr;

        union _link {
            void *raw;
            ASTAttribute *attribute;
            ASTLocalDeclaration *localDeclaration;
        } link;

        ASTLambda *methodLink = nullptr;



        static ASTExpr *parseAllowingStatementBlock(Parser *parser);
	static ASTExpr *parseExpectingPrologueBinding(Parser *parser);
        static ASTExpr *parse(Parser *parser);

        void analyseAndCompleteAST(Analyser *analyser, StaticAnalysisScope *scope);
        ASTType *inferredType();
        bool expressionCanBeAssignedAValue();
        bool expressionCanBeAssignedToAVariable();
        bool isPollutedWithSelfReference();
        void polluteWithSelfReference(Analyser *analyser);
    };
    
    
    
}


#endif /* ASTExpr_hpp */


