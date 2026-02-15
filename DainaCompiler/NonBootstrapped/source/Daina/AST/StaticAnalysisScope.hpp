//
//  StaticAnalysisScope.hpp
//  DainaCompiler
//
//  Created by SamWit on 17/04/2018.
//  Copyright © 2017 Samuel Whitton. All rights reserved.
//

#ifndef StaticAnalysisScope_hpp
#define StaticAnalysisScope_hpp

namespace Daina {
    class StaticAnalysisScope;
}

#include "StaticAnalysisScopeLayer.hpp"
#include "ASTIdentifier.hpp"
#include "ASTClass.hpp"
#include "Analyser.hpp"
#include "ASTAttribute.hpp"
#include "ASTLambda.hpp"
#include "ASTClassElement.hpp"
#include "ASTLocalDeclaration.hpp"


namespace Daina {

    
    class StaticAnalysisScope {
    private:
        Analyser *analyser = nullptr;
        ASTType *parentType = nullptr;
        ASTClass *classScope = nullptr;
        std::map<std::string, ASTClass *> dependancyMapping = std::map<std::string, ASTClass *>();
        std::map<std::string, ASTType *> genericSuperTypeMapping = std::map<std::string, ASTType *>();
        std::map<std::string, int> genericIndexBindingMapping = std::map<std::string, int>();
        std::map<std::string, ASTAttribute *> attributeMapping = std::map<std::string, ASTAttribute *>();

        StaticAnalysisScopeLayer *baseScopeLayer;

	ASTStatement *statementInScope = nullptr;

        bool inAssignmentContext = false;

        ScopeClassification currentScopeClassification();

	void addLinkedDependancy(ASTIdentifier *linkedDependancyIdentifier);

        void ensureReferenceToSelfIsValidInScopeWithASTSource(AST *source);

    public:
	~StaticAnalysisScope();

        StaticAnalysisScope(Analyser *analyser, ASTClass *scopeWithinClass);

        void addGenericTypeWithIdentifierSuperTypeAndIndexBinding(ASTIdentifier *genericTypeIdentifier, ASTType *superTypeOfGeneric, int indexBinding);
	void linkIdentifierToClassWithinScope(ASTIdentifier *identifierToLink);
	ASTType *findGenericSuperTypeLinkForIdentifierWithinScope(ASTIdentifier *identifierToFindLink);
	int findGenericIndexBindingLinkForIdentifierWithinScope(ASTIdentifier *identifierToFindLink);
    	void addAttributeToScopeWithAttributeAndIdentifier(ASTAttribute *attribute, ASTIdentifier *attributeIdentifier);
    
        ASTClass *classInScope();
        void insertCompilerInjectionIntoClassScopeWithIdentifier(TCompilerInjection *compilerInjection, ASTIdentifier *injectionIdentifier);
        void insertBooleanIntoClassScope(ASTLambda *booleanLambda);
        void insertEntryPointIntoClassScope(ASTLambda *entryPointLambda);
        void attemptToInsertLambdaMethodIntoClassScope(ASTLambda *methodLambda, ASTIdentifier *methodIdentifier, bool isStaticMethod, bool isOverridingMethod, MethodVisibility methodVisibility);
    
        

        void beginLambdaBodyScopeWithLambdaAndClassification(ASTLambda *lambdaInScope, ScopeClassification scopeClassification);
        void endScope(Analyser *analyser);
        ASTLocalDeclaration *findAndUseLocalDeclarationInScopeWithOutputVariableAssignmentIsRestricted(ASTIdentifier *identifier, bool *assignmentIsRestricted);
        ASTAttribute *findAndUseAttributeInScope(ASTIdentifier *identifier);
        ASTLambda *findAndUseSelfInstanceMethodInScope(ASTIdentifier *identifier);
        ASTLambda *findAndUseConstructorMethodInScope(ASTIdentifier *identifier);

	void insertLocalDeclarationIntoScope(ASTLocalDeclaration *localDeclarationToInsert);

        void enterAssignmentContext();
        void exitAssignmentContext();

        void enterInvocationContext();
        void exitInvocationContext();

	bool isInAssignmentContext();

	void enterSubscopeLayer();
	void exitSubscopeLayer();	

	void beginStatementScope(ASTStatement *statement);
        void exitStatementScope();


        void notifyScopeOfSelfReferencePollutionDueToPollutedInvocationWithASTSource(AST *source);

        
    };





    
}


#endif /* StaticAnalysisScope_hpp */





