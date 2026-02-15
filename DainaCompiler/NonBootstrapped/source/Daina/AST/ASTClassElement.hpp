//
//  ASTClassElement.hpp
//  DainaCompiler
//
//  Created by SamWit on 11/03/2017.
//  Copyright © 2017 Samuel Whitton. All rights reserved.
//

#ifndef ClassElement_hpp
#define ClassElement_hpp

namespace Daina {
    class ASTClassElement;



    enum ClassElementType {
        compilerDirective,
        boolean,
        constructor,
        entryPoint,
        staticMethod,
        //property,
        instanceMethod
    };
    
    enum MethodVisibility {
        methodIsolated,
        methodInternal,
        methodOpen
    };
}


#include "AST.hpp"
#include "Parser.hpp"
#include "ASTIdentifier.hpp"
#include "ParseAST.hpp"
#include "ASTType.hpp"
#include "ASTLambda.hpp"
#include "ASTClass.hpp"

namespace Daina {
    

    class ASTClassElement : public AST {
        
        
    protected:
        virtual std::string buildDescriptionPart() {
            return "ASTClassElement";
        }

    public:
        ClassElementType type;
        MethodVisibility visibility;
        bool overriding = false;
        ASTIdentifier *identifier = nullptr;
        ASTLambda *lambda = nullptr;
        TCompilerInjection *injection = nullptr;
        ASTClass *classOwner = nullptr;
        
        ASTType *propertyType = nullptr;
        ASTIdentifier *propertyIdentifier = nullptr;
        ASTIdentifier *propertyGetterIdentifier = nullptr;
        ASTIdentifier *propertySetterIdentifier = nullptr;

	void analyseAndCompleteASTHeader(Analyser *analyser, StaticAnalysisScope *scope);
	void analyseAndCompleteASTHeaderTypeInference(Analyser *analyser, StaticAnalysisScope *scope);
	void analyseAndCompleteASTBody(Analyser *analyser, StaticAnalysisScope *scope);

        ASTClassElement(Parser *parser);
    };
    
    
    class ParseASTClassElement : public ParseAST<ASTClassElement> {
        
    private:
        ParseASTClassElement() : ParseAST<ASTClassElement>() {}
        
    public:
        static ParseASTClassElement *instance() {
            static ParseASTClassElement *_instance = nullptr;
            if (_instance == nullptr)
                _instance = new ParseASTClassElement();
            return _instance;
        }
        
        //should return NULL on no valid next AST parse
        virtual ASTClassElement *parse(Parser *parser) {
            if (tIS(TokenType::tIdentifier))
                return new ASTClassElement(parser);
            return nullptr;
        }
    };
}

#endif /* ClassElement_hpp */
