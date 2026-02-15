//
//  StaticAnalysisScopeLayer.hpp
//  DainaCompiler
//
//  Created by SamWit on 06/05/2018.
//  Copyright © 2017 Samuel Whitton. All rights reserved.
//

#ifndef StaticAnalysisScopeLayer_hpp
#define StaticAnalysisScopeLayer_hpp

namespace Daina {
    class StaticAnalysisScopeLayer;

    enum ScopeClassification {
        STATIC_CONTEXT, CONSTRUCTOR_CONTEXT, ANONYMOUS_CONTEXT, INSTANCE_CONTEXT
    };
}


#include "Analyser.hpp"
#include "ASTLocalDeclaration.hpp"
#include <map>
#include <deque>
#include "ASTLambda.hpp"
#include "ASTAttribute.hpp"
#include "ASTStatement.hpp"


namespace Daina {
    
    class StaticAnalysisScopeLayer {
    private:
        std::map<std::string, ASTLocalDeclaration *> localDeclarationMapping = std::map<std::string, ASTLocalDeclaration *>();
        std::map<std::string, ASTAttribute *> attributesThatHaveBeenAssigned = std::map<std::string, ASTAttribute *>();
        bool constructorMethodHasBeenInvoked = false;
	bool allAttributesShouldBeConsideredToBeAssigned = false;

	ASTLambda *lambdaScopeOwner = nullptr;
	bool isBaseScope = false;
        StaticAnalysisScopeLayer *parentScopeLayer = nullptr;
        ScopeClassification scopeClassification;
        ASTClass *classInScope;
	std::deque<StaticAnalysisScopeLayer *> subscopeLayers = std::deque<StaticAnalysisScopeLayer *>();
	ASTStatement *statementInThisScope = nullptr;
	bool inInvocationContext = false;

	ASTStatement *statementInScope();
	
	///ScopeClassification getThisScopeClassification();

        void propagateSelfReferenceThroughScopeWithASTSource(AST *source, Analyser *analyser);

        static void recursivelyDestroyScopeLayerAndParents(StaticAnalysisScopeLayer *scopeLayer);

        StaticAnalysisScopeLayer(ASTLambda *lambdaScopeOwner);

        //ASTLocalDeclaration *linkLocalDeclarationThroughScopeWithIdentifierAndInnerLambdaWhereThisLinkRequestWasPulledFrom(ASTIdentifier *identifier, ASTLambda *lambdaWhereThisLinkRequestWasPulledFrom);

        void ensureInstanceWasFullyConstructedInScope(Analyser *analyser);

    public:


        static StaticAnalysisScopeLayer *createNewBaseScopeLayer();
        static void destroyBaseScopeLayer(StaticAnalysisScopeLayer *baseScopeLayer);

	//void enterStaticScopeLayer();
        void enterLambdaScopeLayer(ASTLambda *lambda, ScopeClassification scopeClassification, Analyser *analyser, ASTClass *classInScope);
        void exitScopeLayer(Analyser *analyser);

	void enterSubscopeLayer();
	void exitSubscopeLayer();

        void insertLocalDeclarationIntoScope(ASTLocalDeclaration *localDeclaration, Analyser *analyser);
        ASTLocalDeclaration *linkLocalDeclarationThroughScopeWithIdentifierWithOutputVariableAssignmentIsRestricted(ASTIdentifier *identifier, bool *assignmentIsRestricted);

	bool isOnTopLevelLambdaScopeLayer();

 	void markCurrentScopeAsHavingCalledAConstructorMethodWithLambdaAndASTSource(ASTLambda *constructorMethodLambda, AST *source, Analyser *analyser);
        void markCurrentScopeAsHavingAssignedAnAttributeWithAttributeAndASTSource(ASTAttribute *attribute, AST *source, Analyser *analyser);
        void markCurrentScopeAsHavingReferencedAnAttributeWithAttributeAndASTSource(ASTAttribute *attribute, AST *source, Analyser *analyser);
 	void markCurrentScopeAsHavingCalledAnInstanceMethodWithASTSource(AST *source, Analyser *analyser);
	
    	void beginStatementScope(ASTStatement *statement);
    	void exitStatementScope();

    	void enterInvocationContext();
    	void exitInvocationContext();
	bool isInInvocationContext();

        void notifyScopeOfSelfReferencePollutionDueToPollutedInvocationWithASTSource(AST *source, Analyser *analyser);
    };





    
}


#endif /* StaticAnalysisScopeLayer_hpp */





