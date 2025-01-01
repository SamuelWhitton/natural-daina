//
//  ASTClass.hpp
//  DainaCompiler
//
//  Created by SamWit on 4/03/2017.
//  Copyright © 2017 Samuel Whitton. All rights reserved.
//

#ifndef ASTClass_hpp
#define ASTClass_hpp

namespace Daina {
    class ASTClass;
}

#include "AST.hpp"
#include "Parser.hpp"
#include "ASTIdentifier.hpp"
#include "ASTGeneric.hpp"
#include "ASTList.hpp"
#include "ASTClassElement.hpp"
#include "ASTType.hpp"
#include "ASTAttribute.hpp"
#include "ASTInvarient.hpp"
#include "Analyser.hpp"

namespace Daina {
    
    class ASTClass : public AST {
        
        
    protected:
        virtual std::string buildDescriptionPart() {
            return "ASTClass";
        }

    public:
        ASTIdentifier *identifier = nullptr;
        ASTList<ASTGeneric> *generics = nullptr;
        ASTType *parentType = nullptr;
	ASTIdentifier *aliasTypeIdentifier = nullptr;
        ASTList<ASTIdentifier> *dependancies = nullptr;
	ASTList<ASTIdentifier> *dependants = nullptr;
	bool allDependantsArePermitted = true;
        std::vector<ASTAttribute *> attributes = std::vector<ASTAttribute *>();
        std::vector<ASTInvarient *> classInvarients = std::vector<ASTInvarient *>();
        std::vector<ASTClassElement *> components = std::vector<ASTClassElement *>();
        
        int tag = 0;

        void analyseAndCompleteAST(Analyser *analyser);

	bool requestPermissionForClassToBecomeDependantWithClass(ASTClass *classAST);


	bool isEntryPoint();

	bool isAliasType();
        
        ASTClass(Parser *parser);
	bool classSubsumesClass(ASTClass *anotherClass);


	ASTLambda *scopeEntryPointLambda = nullptr;
	ASTLambda *scopeBooleanLambda = nullptr;
	std::vector<TCompilerInjection *> scopeCompilerInjections = std::vector<TCompilerInjection *>();

        void overrideInstanceMethodInScope(Analyser *analyser, ASTIdentifier *methodIdentifier, ASTLambda *methodLambda, bool isOpenMethod);
	void insertStaticMethodInScope(Analyser *analyser, ASTIdentifier *methodIdentifier, ASTLambda *methodLambda);
	void insertInstanceMethodInScope(Analyser *analyser, ASTIdentifier *methodIdentifier, ASTLambda *methodLambda, MethodVisibility methodVisibility);
        ASTLambda *staticMethodWithIdentifier(ASTIdentifier *methodIdentifier);
	ASTLambda *instanceMethodWithIdentifierAndAccessLevel(ASTIdentifier *methodIdentifier, MethodVisibility accessLevel);

    private:
        std::map<std::string, ASTLambda *> isolatedInstanceMethodMapping = std::map<std::string, ASTLambda *>();
	std::map<std::string, ASTLambda *> internalInstanceMethodMapping = std::map<std::string, ASTLambda *>();
	std::map<std::string, ASTLambda *> openInstanceMethodMapping = std::map<std::string, ASTLambda *>();
	std::map<std::string, ASTLambda *> staticMethodMapping = std::map<std::string, ASTLambda *>();
        //std::map<std::string, char *> overridenInstanceMethodMapping = std::map<std::string, char *>();
        std::map<std::string, char *> overridingInstanceMethodMapping = std::map<std::string, char *>();

 
    };
}


#endif /* ASTClass_hpp */
