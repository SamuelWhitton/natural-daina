//
//  ASTLambda.hpp
//  DainaCompiler
//
//  Created by SamWit on 16/07/2017.
//  Copyright © 2017 Samuel Whitton. All rights reserved.
//

#ifndef ASTLambda_hpp
#define ASTLambda_hpp

namespace Daina {
    class ASTLambda;
}

#include <map>
#include <vector>
#include "AST.hpp"
#include "Parser.hpp"
#include "ASTIdentifier.hpp"
#include "ParseAST.hpp"
#include "ASTExpr.hpp"
#include "ASTList.hpp"
#include "ASTType.hpp"
#include "ASTLocalDeclaration.hpp"
#include "StaticAnalysisScope.hpp"
#include "ASTClassElement.hpp"

namespace Daina {
    
    class ASTLambda : public AST {

    private:
        void analyseAndCompleteASTInnerBodyWithScopeClassification(Analyser *analyser, StaticAnalysisScope *scope, ScopeClassification scopeClassification);
	void analyseAndCompleteASTHeaderTypeInferenceWithScopeClassification(Analyser *analyser, StaticAnalysisScope *scope, ScopeClassification scopeClassification);

        bool didInferProductType = false;
      

        ASTType *getInferredTypeWhenInvokingWithAClassTypeAttachedAddingReturnType(Analyser *analyser, ASTType *attachedClassType, ASTType *returnType);

    protected:
        virtual std::string buildDescriptionPart() {
            return "ASTLambda";
        }
        
    public:
        ASTList<ASTLocalDeclaration> *reactants = nullptr;
        ASTType *product = nullptr;
        ASTExpr *body = nullptr;
	ASTExpr *result = nullptr;

        bool methodIsOverriden = false;
        bool methodOverridesAnotherMethod = false;

	ASTIdentifier *identifier = nullptr;
	ASTClass *classOwner = nullptr;

	void declareExternalObjectToPullIntoLambdaScopeWithLocalDeclaration(ASTLocalDeclaration *localDeclaration);
        
        ASTLambda(Parser *parser);

	std::vector<ASTLambda *> childLambdas = std::vector<ASTLambda *>();

	bool isAConstructor = false;

        std::map<std::string, ASTLocalDeclaration *> externalObjectPulledIntoLambdaScopeMapping = std::map<std::string, ASTLocalDeclaration *>();
        bool selfReferenceIsPulledIntoLambdaScope = false;
        bool externallyMarkedAsPollutedWithSelfReference = false;


        bool lambdaTypeIsValidEntryPointType();
	bool lambdaTypeIsValidBooleanType(); 
	bool lambdaTypeIsValidConstructorTypeForClass(ASTClass *classAST);

        //bool lambdaTypeSubsumesLambdaType(ASTLambda *anotherLambda);
	void analyseAndCompleteASTHeader(Analyser *analyser, StaticAnalysisScope *scope);


	void analyseAndCompleteASTHeaderTypeInferenceInInstanceContext(Analyser *analyser, StaticAnalysisScope *scope);
	void analyseAndCompleteASTHeaderTypeInferenceInStaticContext(Analyser *analyser, StaticAnalysisScope *scope);	
	void analyseAndCompleteASTHeaderTypeInferenceInConstructorContext(Analyser *analyser, StaticAnalysisScope *scope);

	void analyseAndCompleteASTBodyInInstanceContext(Analyser *analyser, StaticAnalysisScope *scope);
	void analyseAndCompleteASTBodyInStaticContext(Analyser *analyser, StaticAnalysisScope *scope);	
	void analyseAndCompleteASTBodyInConstructorContext(Analyser *analyser, StaticAnalysisScope *scope);
                

	void analyseAndCompleteASTForAnonymousLambda(Analyser *analyser, StaticAnalysisScope *scope);
    
        
        ASTType *getInferredTypeWhenInvokingWithAClassTypeAttached(Analyser *analyser, ASTType *attachedClassType);
        ASTType *getInferredTypeWhenInvokingAsConstructorWithinScopeOfClass(Analyser *analyser, ASTClass *classScope);

	ASTType *getDeclaredType();

        void linkToClassElementOwner(ASTClassElement *classElementOwner);
        bool isAPotentialParentOrSelfConstructorForConstructorInClass(ASTClass *classOfOriginalConstructor);
 
        void markAsPollutedWithSelfReference();
        bool isPollutedWithSelfReference(); 
        void declareSelfReferenceIsPulledIntoScope();

    };
    
}

#endif /* ASTLambda_hpp */
