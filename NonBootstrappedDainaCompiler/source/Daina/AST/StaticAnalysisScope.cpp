//
//  StaticAnalysisScope.cpp
//  DainaCompiler
//
//  Created by SamWit on 17/04/2018.
//  Copyright © 2017 Samuel Whitton. All rights reserved.
//

#include "StaticAnalysisScope.hpp"



#define MAP_HAS_KEY(__map, __key) (__map.find(__key) != __map.end())
#define MAP_KEY_SET_VALUE(__map, __key, __value) __map[__key] = __value
#define MAP_KEY_GET_VALUE(__map, __key) (__map[__key])

namespace Daina {

        StaticAnalysisScope::~StaticAnalysisScope() {
	    StaticAnalysisScopeLayer::destroyBaseScopeLayer(this->baseScopeLayer);	
        }

	StaticAnalysisScope::StaticAnalysisScope(Analyser *analyser, ASTClass *scopeWithinClass) {
            this->analyser = analyser;
            this->classScope = scopeWithinClass;
            this->baseScopeLayer = StaticAnalysisScopeLayer::createNewBaseScopeLayer();

            if (!scopeWithinClass->isEntryPoint()) {
                MAP_KEY_SET_VALUE(dependancyMapping, scopeWithinClass->identifier->identifierString, scopeWithinClass);
	    }

	    if (scopeWithinClass->dependancies != nullptr) {
	        for (ASTIdentifier *dependancy : scopeWithinClass->dependancies->list) {
		    assert(dependancy->isLinkedToClass());
                    this->addLinkedDependancy(dependancy);
                }
	    }

            this->parentType = scopeWithinClass->parentType;
            
        }


    void StaticAnalysisScope::addLinkedDependancy(ASTIdentifier *linkedDependancyIdentifier) {
	
        if (MAP_HAS_KEY(dependancyMapping, linkedDependancyIdentifier->identifierString)) {
            SYNTAX_ERROR(linkedDependancyIdentifier, "duplicate dependancy");
        }
   
        MAP_KEY_SET_VALUE(dependancyMapping, linkedDependancyIdentifier->identifierString, linkedDependancyIdentifier->link);
    }

    void StaticAnalysisScope::addGenericTypeWithIdentifierSuperTypeAndIndexBinding(ASTIdentifier *genericTypeIdentifier, ASTType *superTypeOfGeneric, int indexBinding) {
        if (MAP_HAS_KEY(genericSuperTypeMapping, genericTypeIdentifier->identifierString)) {
            SYNTAX_ERROR(genericTypeIdentifier, "duplicate generic type");
        }
        if (superTypeOfGeneric == nullptr) {
            superTypeOfGeneric = ASTType::emptyType();
        }
        MAP_KEY_SET_VALUE(genericSuperTypeMapping, genericTypeIdentifier->identifierString, superTypeOfGeneric);
        MAP_KEY_SET_VALUE(genericIndexBindingMapping, genericTypeIdentifier->identifierString, indexBinding);
    }

    void StaticAnalysisScope::linkIdentifierToClassWithinScope(ASTIdentifier *identifierToLink) {
	if (!MAP_HAS_KEY(dependancyMapping, identifierToLink->identifierString)) {
            SYNTAX_ERROR(identifierToLink, "unknown class");
        }
	identifierToLink->linkToClass(MAP_KEY_GET_VALUE(dependancyMapping, identifierToLink->identifierString));
    }
	
    ASTType *StaticAnalysisScope::findGenericSuperTypeLinkForIdentifierWithinScope(ASTIdentifier *identifierToFindLink) {
	if (!MAP_HAS_KEY(genericSuperTypeMapping, identifierToFindLink->identifierString)) {
            SYNTAX_ERROR(identifierToFindLink, "unknown generic type");
        }
	return MAP_KEY_GET_VALUE(genericSuperTypeMapping, identifierToFindLink->identifierString);
    }

    int StaticAnalysisScope::findGenericIndexBindingLinkForIdentifierWithinScope(ASTIdentifier *identifierToFindLink) {
	assert(MAP_HAS_KEY(genericIndexBindingMapping, identifierToFindLink->identifierString));
	return MAP_KEY_GET_VALUE(genericIndexBindingMapping, identifierToFindLink->identifierString);
    }
 

    void StaticAnalysisScope::addAttributeToScopeWithAttributeAndIdentifier(ASTAttribute *attribute, ASTIdentifier *attributeIdentifier) {
	/*if (MAP_HAS_KEY(dependancyMapping, attributeIdentifier->identifierString)) {
	    SYNTAX_ERROR(attributeIdentifier, "attribute cannot have the same identifier as a class");
        }*/
	if (MAP_HAS_KEY(attributeMapping, attributeIdentifier->identifierString)) {
	    SYNTAX_ERROR(attributeIdentifier, "duplicate attribute identifier");
        }
        MAP_KEY_SET_VALUE(attributeMapping, attributeIdentifier->identifierString, attribute);
    }



    ASTClass *StaticAnalysisScope::classInScope() {
        return this->classScope;
    }

    void StaticAnalysisScope::insertCompilerInjectionIntoClassScopeWithIdentifier(TCompilerInjection *compilerInjection, ASTIdentifier *injectionIdentifier) {
        this->classInScope()->scopeCompilerInjections.push_back(compilerInjection);
    }

    void StaticAnalysisScope::insertBooleanIntoClassScope(ASTLambda *booleanLambda) {
        assert(0==1);
        if (this->classInScope()->scopeBooleanLambda != nullptr) {
            SYNTAX_ERROR(booleanLambda, "class cannot have more than one boolean method");
        }
        this->classInScope()->scopeBooleanLambda = booleanLambda;
    }

    void StaticAnalysisScope::insertEntryPointIntoClassScope(ASTLambda *entryPointLambda) {
        assert (this->classInScope()->scopeEntryPointLambda == nullptr);
        this->classInScope()->scopeEntryPointLambda = entryPointLambda;
    }

    void StaticAnalysisScope::attemptToInsertLambdaMethodIntoClassScope(ASTLambda *methodLambda, ASTIdentifier *methodIdentifier, bool isStaticMethod, bool isOverridingMethod, MethodVisibility methodVisibility) {
        assert(!(isStaticMethod && isOverridingMethod));

        ASTClass *classAST = this->classInScope();

        if (isOverridingMethod) {
            bool isOpenMethod = false;
            if (methodVisibility == MethodVisibility::methodIsolated) {
                SYNTAX_ERROR(methodIdentifier, "cannot override method in an isolated scope");
            } else {
                isOpenMethod = (methodVisibility == MethodVisibility::methodOpen);
            }
            classAST->overrideInstanceMethodInScope(analyser, methodIdentifier, methodLambda, isOpenMethod);

        } else if (isStaticMethod) {
            assert(methodVisibility == MethodVisibility::methodOpen);
            classAST->insertStaticMethodInScope(analyser, methodIdentifier, methodLambda);

        } else {
            classAST->insertInstanceMethodInScope(analyser, methodIdentifier, methodLambda, methodVisibility);
        }
        
    }

    void StaticAnalysisScope::beginLambdaBodyScopeWithLambdaAndClassification(ASTLambda *lambdaInScope, ScopeClassification scopeClassification) {
        this->baseScopeLayer->enterLambdaScopeLayer(lambdaInScope, scopeClassification, analyser, this->classInScope());
    }

    void StaticAnalysisScope::endScope(Analyser *analyser) {
        this->baseScopeLayer->exitScopeLayer(analyser);
    }

    ASTLocalDeclaration *StaticAnalysisScope::findAndUseLocalDeclarationInScopeWithOutputVariableAssignmentIsRestricted(ASTIdentifier *identifier, bool *assignmentIsRestricted) {
        ASTLocalDeclaration *localDeclarationInScope = this->baseScopeLayer->linkLocalDeclarationThroughScopeWithIdentifierWithOutputVariableAssignmentIsRestricted(identifier, assignmentIsRestricted);
        if (localDeclarationInScope == nullptr) {
            SYNTAX_ERROR(identifier, "could not find declaration with identifier");
        }
        return localDeclarationInScope;
    }
    
    ASTAttribute *StaticAnalysisScope::findAndUseAttributeInScope(ASTIdentifier *identifier) {
        if (!MAP_HAS_KEY(attributeMapping, identifier->identifierString)) {
	    SYNTAX_ERROR(identifier, "cannot find attribute with identifier");
        }
        ASTAttribute *foundAttribute = MAP_KEY_GET_VALUE(attributeMapping, identifier->identifierString);
        if (this->inAssignmentContext)
            this->baseScopeLayer->markCurrentScopeAsHavingAssignedAnAttributeWithAttributeAndASTSource(foundAttribute, identifier, analyser);
        else 
            this->baseScopeLayer->markCurrentScopeAsHavingReferencedAnAttributeWithAttributeAndASTSource(foundAttribute, identifier, analyser);
	return foundAttribute;
    }

    ASTLambda *StaticAnalysisScope::findAndUseSelfInstanceMethodInScope(ASTIdentifier *identifier) {
        ASTLambda *instanceMethod = this->classInScope()->instanceMethodWithIdentifierAndAccessLevel(identifier, MethodVisibility::methodIsolated);        
        if (instanceMethod == nullptr) {
            SYNTAX_ERROR(identifier, "could not find instance method in scope");
        }

	if (this->baseScopeLayer->isInInvocationContext())
            this->baseScopeLayer->markCurrentScopeAsHavingCalledAnInstanceMethodWithASTSource(identifier, analyser);
        return instanceMethod;
    }

    ASTLambda *StaticAnalysisScope::findAndUseConstructorMethodInScope(ASTIdentifier *identifier) {
        ASTLambda *staticMethodPotentiallyAConstructor = this->classInScope()->staticMethodWithIdentifier(identifier);
	if (staticMethodPotentiallyAConstructor == nullptr && !this->parentType->isEmptyType()) {
	    staticMethodPotentiallyAConstructor = this->parentType->baseClass()->staticMethodWithIdentifier(identifier);
	}
        bool couldNotFindConstructor = (staticMethodPotentiallyAConstructor == nullptr || !staticMethodPotentiallyAConstructor->isAPotentialParentOrSelfConstructorForConstructorInClass(this->classInScope()));
        if (couldNotFindConstructor) {
            SYNTAX_ERROR(identifier, "could not find parent constructor method with identifier");
        }

	if (this->baseScopeLayer->isInInvocationContext())
	    this->baseScopeLayer->markCurrentScopeAsHavingCalledAConstructorMethodWithLambdaAndASTSource(staticMethodPotentiallyAConstructor, identifier, analyser);
        else {
            SYNTAX_ERROR(identifier, "constructor method can only be referred to in an invocation context");
	}
	return staticMethodPotentiallyAConstructor;
    }

    void StaticAnalysisScope::insertLocalDeclarationIntoScope(ASTLocalDeclaration *localDeclarationToInsert) {
	this->baseScopeLayer->insertLocalDeclarationIntoScope(localDeclarationToInsert, analyser);
    }

    void StaticAnalysisScope::enterAssignmentContext() {
        assert(!this->inAssignmentContext);
        this->inAssignmentContext = true;
    }
      
    void StaticAnalysisScope::exitAssignmentContext() {
        assert(this->inAssignmentContext);
        this->inAssignmentContext = false;
    }

    void StaticAnalysisScope::enterInvocationContext() {
	this->baseScopeLayer->enterInvocationContext();
    }
      
    void StaticAnalysisScope::exitInvocationContext() {
	this->baseScopeLayer->exitInvocationContext();
    }

    void StaticAnalysisScope::notifyScopeOfSelfReferencePollutionDueToPollutedInvocationWithASTSource(AST *source) {
        this->baseScopeLayer->notifyScopeOfSelfReferencePollutionDueToPollutedInvocationWithASTSource(source, analyser);
    }

    void StaticAnalysisScope::beginStatementScope(ASTStatement *statement) {
	this->baseScopeLayer->beginStatementScope(statement);
    }
    void StaticAnalysisScope::exitStatementScope() {
	this->baseScopeLayer->exitStatementScope();
    }

    bool StaticAnalysisScope::isInAssignmentContext() {
	return this->inAssignmentContext;
    }

    void StaticAnalysisScope::enterSubscopeLayer() {
	this->baseScopeLayer->enterSubscopeLayer();
    }
    void StaticAnalysisScope::exitSubscopeLayer() {
	this->baseScopeLayer->exitSubscopeLayer();
    }

}



