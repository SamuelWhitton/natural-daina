//
//  AST.hpp
//  DainaCompiler
//
//  Created by SamWit on 6/01/2017.
//  Copyright © 2017 Samuel Whitton. All rights reserved.
//

#ifndef AST_hpp
#define AST_hpp


#include <vector>
#include <string>
#include <typeinfo>

namespace Daina {
    class AST;
}


#include "Token.hpp"
#include "Parser.hpp"
#include "Emitter.hpp"


namespace Daina {
    
    enum ASTTypeID {
        ASTTypeRoot,
        ASTTypeIdentifier,
        ASTTypeSet,
        ASTTypeSetConstructor,
        ASTTypeClass,
        ASTTypeList,
        ASTTypeGeneric,
        ASTTypeType,
        ASTTypeClassElement,
        ASTTypeInvarient,
        ASTTypeAttribute,
        ASTTypeLambda,
        ASTTypeExpr,
        ASTTypeStatement,
        ASTTypeInvocation,
        ASTTypeLocalDeclaration
    };


    
    class AST {
        
    private:
        std::vector<AST *> dependantASTs = std::vector<AST *>();
        ASTTypeID _type;
	Token *firstToken = nullptr;

        std::string tokenSequenceDescription = "";

	std::string getTokenSequenceDescription() {
            return tokenSequenceDescription;
        }
        
	

        std::string buildDescriptionPrime(int scope) {
            //if (scope > 6) return "";
            std::string descr = "";
            for (int i = 0; i < scope; ++i) descr += ":";
            descr += this->buildDescriptionPart() + " " + this->getTokenSequenceDescription();
            for (AST *ast : dependantASTs) {
		if (dynamic_cast<AST *>(ast) != NULL)
                    descr += "\n" + ast->buildDescriptionPrime(scope + 1);
            }
            return descr;
        }

    protected:
        AST(ASTTypeID type) : _type(type) {}
        ~AST() {
            for (auto ast : dependantASTs) delete (AST *)ast;
        }
        
        //makes a given ast dependant on this tree
        //every created ast should be wrapped in this
        template <typename E> E *dependant(E *ast) {
            static_assert(std::is_base_of<AST, E>::value, "E must inherit from AST");
            
            dependantASTs.push_back((AST *)ast);
            return ast;
        }

        virtual std::string buildDescriptionPart() {
            return "AST";
        }

        Token *tokenLog(Token *token);
	Token *tokenTake(Parser *parser);
        Token *tokenExpect(Parser *parser, TokenType type);


    public:
	template <typename E> E *adoptSomeDependantAST(E *ast) {
            return this->dependant(ast);
        }

	int compilationTag; //to be used on the compilers whim

        static void destroyAST(AST *ast) {
            delete ast;
        }
        
        ASTTypeID getType() {
            return _type;
        }
        std::string buildDescription() {
            return this->buildDescriptionPrime(0)+"\n";
        }

	Token *getFirstToken();	

    };
    
}

#endif /* AST_hpp */
