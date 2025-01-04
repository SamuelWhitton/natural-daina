//
//  StaticAnalysisScopeLayer.cpp
//  DainaCompiler
//
//  Created by SamWit on 07/05/2018.
//  Copyright © 2018 Samuel Whitton. All rights reserved.
//

#include "StaticAnalysisScopeLayer.hpp"



#define MAP_HAS_KEY(__map, __key) (__map.find(__key) != __map.end())
#define MAP_KEY_SET_VALUE(__map, __key, __value) __map[__key] = __value
#define MAP_KEY_GET_VALUE(__map, __key) (__map[__key])

namespace Daina {


	StaticAnalysisScopeLayer::StaticAnalysisScopeLayer(ASTLambda *lambdaScopeOwner) {
            this->lambdaScopeOwner = lambdaScopeOwner;
            this->isBaseScope = false;
        }


        StaticAnalysisScopeLayer *StaticAnalysisScopeLayer::createNewBaseScopeLayer() {
            StaticAnalysisScopeLayer *newBaseScopeLayer = new StaticAnalysisScopeLayer(nullptr);
	    newBaseScopeLayer->isBaseScope = true;
            return newBaseScopeLayer;
	}

        void StaticAnalysisScopeLayer::destroyBaseScopeLayer(StaticAnalysisScopeLayer *baseScopeLayer) {
            assert(baseScopeLayer->isBaseScope);
            StaticAnalysisScopeLayer::recursivelyDestroyScopeLayerAndParents(baseScopeLayer);
        }

	/*void StaticAnalysisScopeLayer::enterStaticScopeLayer() {
            assert(0==1);
            assert(this->isBaseScope);
            this->enterLambdaScopeLayer(nullptr, nullptr, nullptr);
	}*/

        void StaticAnalysisScopeLayer::enterLambdaScopeLayer(ASTLambda *lambda, ScopeClassification scopeClassification, Analyser *analyser, ASTClass *classInScope) {
            assert(this->isBaseScope);

            StaticAnalysisScopeLayer *newScopeLayer = new StaticAnalysisScopeLayer(lambda);

	    if (this->parentScopeLayer != nullptr) {
                this->parentScopeLayer->lambdaScopeOwner->childLambdas.push_back(lambda);
            }

	    if (classInScope->parentType->isEmptyType())
		newScopeLayer->constructorMethodHasBeenInvoked = true;

            newScopeLayer->scopeClassification = scopeClassification;
            newScopeLayer->parentScopeLayer = this->parentScopeLayer;
            newScopeLayer->classInScope = classInScope;
	    newScopeLayer->enterSubscopeLayer();
            this->parentScopeLayer = newScopeLayer;

            if (lambda != nullptr && lambda->reactants != nullptr) {
                assert(analyser != nullptr);
                
                for (ASTLocalDeclaration *parameterDeclaration : lambda->reactants->list) {
		    parameterDeclaration->markAsAMethodParameter();
                    this->insertLocalDeclarationIntoScope(parameterDeclaration, analyser);
                }
            }
	}

        void StaticAnalysisScopeLayer::exitScopeLayer(Analyser *analyser) {
            assert(this->isBaseScope);
            assert(this->parentScopeLayer != nullptr);
	    assert(this->parentScopeLayer->subscopeLayers.size() == 1);
	    this->parentScopeLayer->exitSubscopeLayer();
	    bool inConstructorContext = this->parentScopeLayer->scopeClassification == ScopeClassification::CONSTRUCTOR_CONTEXT;
            if (inConstructorContext) {
                this->parentScopeLayer->ensureInstanceWasFullyConstructedInScope(analyser);
            }
            StaticAnalysisScopeLayer *scopeLayerToRemove = this->parentScopeLayer;
	    this->parentScopeLayer = this->parentScopeLayer->parentScopeLayer;
	    delete scopeLayerToRemove;
	}


        
        void StaticAnalysisScopeLayer::recursivelyDestroyScopeLayerAndParents(StaticAnalysisScopeLayer *scopeLayer) {
            if (scopeLayer->parentScopeLayer != nullptr) {
                StaticAnalysisScopeLayer::recursivelyDestroyScopeLayerAndParents(scopeLayer->parentScopeLayer);
            }
	    while(scopeLayer->subscopeLayers.size() > 0) scopeLayer->exitSubscopeLayer();
            delete scopeLayer;
        }

        /*ScopeClassification StaticAnalysisScopeLayer::getThisScopeClassification() {
            if (this->isBaseScope) {
            	assert(this->parentScopeLayer != nullptr);
                return this->parentScopeLayer->scopeClassification;
	    }
            return this->scopeClassification;
  	}*/


        void StaticAnalysisScopeLayer::propagateSelfReferenceThroughScopeWithASTSource(AST *source, Analyser *analyser) {
            assert(!this->isBaseScope);
            if (this->scopeClassification == STATIC_CONTEXT) {
                SYNTAX_ERROR(source, "self reference impossible in static context");
            }
            if (this->lambdaScopeOwner != nullptr && this->scopeClassification == ANONYMOUS_CONTEXT) {
                this->lambdaScopeOwner->declareSelfReferenceIsPulledIntoScope();
            }
            if (this->parentScopeLayer != nullptr) {
                this->parentScopeLayer->propagateSelfReferenceThroughScopeWithASTSource(source, analyser);
            }
        }

        void StaticAnalysisScopeLayer::markCurrentScopeAsHavingAssignedAnAttributeWithAttributeAndASTSource(ASTAttribute *attribute, AST *source, Analyser *analyser) {
            assert(this->isBaseScope);
            this->parentScopeLayer->propagateSelfReferenceThroughScopeWithASTSource(source, analyser);
            bool inConstructorContext = this->parentScopeLayer->scopeClassification == ScopeClassification::CONSTRUCTOR_CONTEXT;
	    if (inConstructorContext && !this->parentScopeLayer->allAttributesShouldBeConsideredToBeAssigned && !MAP_HAS_KEY(this->parentScopeLayer->attributesThatHaveBeenAssigned, attribute->identifier->identifierString)) {
		this->statementInScope()->markedAsTheFirstAssignmentOfAnAttribute = true;
	    }
            MAP_KEY_SET_VALUE(this->parentScopeLayer->attributesThatHaveBeenAssigned, attribute->identifier->identifierString, attribute);
        } 


 	void StaticAnalysisScopeLayer::markCurrentScopeAsHavingCalledAConstructorMethodWithLambdaAndASTSource(ASTLambda *constructorMethodLambda, AST *source, Analyser *analyser) {
            assert(this->isBaseScope);
            bool inConstructorContext = this->parentScopeLayer->scopeClassification == ScopeClassification::CONSTRUCTOR_CONTEXT;
            if (!inConstructorContext) {
                SYNTAX_ERROR(source, "constructor method can only be called within the scope of a constructor");
            }
            this->parentScopeLayer->constructorMethodHasBeenInvoked = true;
	    if (constructorMethodLambda->classOwner == this->parentScopeLayer->classInScope) {
                bool someAttributesHaveBeenAssignedExplicitly = ((this->parentScopeLayer->attributesThatHaveBeenAssigned.size()) > 0);
		if (someAttributesHaveBeenAssignedExplicitly) {
                    SYNTAX_ERROR(source, "constructor method of self must be called before assigning attributes");
		} else {
		    this->parentScopeLayer->allAttributesShouldBeConsideredToBeAssigned = true;
		}
	    }
        }

        void StaticAnalysisScopeLayer::markCurrentScopeAsHavingReferencedAnAttributeWithAttributeAndASTSource(ASTAttribute *attribute, AST *source, Analyser *analyser) {
            if (this->isBaseScope) {
            	this->parentScopeLayer->propagateSelfReferenceThroughScopeWithASTSource(source, analyser);
	    }
            bool inConstructorContext = this->scopeClassification == ScopeClassification::CONSTRUCTOR_CONTEXT;
            if (!this->isBaseScope && inConstructorContext) {
                if (MAP_KEY_GET_VALUE(this->attributesThatHaveBeenAssigned, attribute->identifier->identifierString) == nullptr) {
                    SYNTAX_ERROR(source, "cannot reference attribute that has not been assigned in the constructor scope");
                }
            }
            if (this->parentScopeLayer != nullptr) {
                this->parentScopeLayer->markCurrentScopeAsHavingReferencedAnAttributeWithAttributeAndASTSource(attribute, source, analyser);
            }
        }

 	void StaticAnalysisScopeLayer::markCurrentScopeAsHavingCalledAnInstanceMethodWithASTSource(AST *source, Analyser *analyser) {
            assert(this->isBaseScope);
            this->parentScopeLayer->propagateSelfReferenceThroughScopeWithASTSource(source, analyser);
	    
            bool inConstructorContext = this->parentScopeLayer->scopeClassification == ScopeClassification::CONSTRUCTOR_CONTEXT;
            if (inConstructorContext) {
                //asdf SYNTAX_ERROR(source, "cannot invoke self instance method in constructor scope");
            }
        }

        void StaticAnalysisScopeLayer::ensureInstanceWasFullyConstructedInScope(Analyser *analyser) {
            assert(!this->isBaseScope);
            if (!constructorMethodHasBeenInvoked) {
                SYNTAX_ERROR(this->lambdaScopeOwner, "constructor must invoke some parent or other self constructor method");
            }

            bool allAttributesHaveBeenAssigned = this->allAttributesShouldBeConsideredToBeAssigned || ((this->attributesThatHaveBeenAssigned.size()) == this->classInScope->attributes.size());
            if (!allAttributesHaveBeenAssigned) {
                SYNTAX_ERROR(this->lambdaScopeOwner, "constructor must assign all attributes");
            }
        }

        void StaticAnalysisScopeLayer::notifyScopeOfSelfReferencePollutionDueToPollutedInvocationWithASTSource(AST *source, Analyser *analyser) {
            assert(this->isBaseScope);
            bool inConstructorContext = this->parentScopeLayer->scopeClassification == ScopeClassification::CONSTRUCTOR_CONTEXT;
            //if (inConstructorContext) {
              //  SYNTAX_ERROR(source, "invocation is restricted in constructor since it is polluted with self reference");
            //} else {
                assert(this->parentScopeLayer->lambdaScopeOwner != nullptr);
                this->parentScopeLayer->lambdaScopeOwner->markAsPollutedWithSelfReference();
            //}
        }

	bool StaticAnalysisScopeLayer::isOnTopLevelLambdaScopeLayer() {
            assert(this->isBaseScope);
	    return (this->parentScopeLayer->parentScopeLayer == nullptr);
	}

	void StaticAnalysisScopeLayer::enterSubscopeLayer() {
	    if (this->isBaseScope)
	        this->parentScopeLayer->enterSubscopeLayer();
	    else this->subscopeLayers.push_front(new StaticAnalysisScopeLayer(nullptr));
	}
	void StaticAnalysisScopeLayer::exitSubscopeLayer() {
	    if (this->isBaseScope) {
	    	this->parentScopeLayer->exitSubscopeLayer();
	    } else {
		assert(this->subscopeLayers.front()->statementInThisScope == nullptr);
	    	assert(this->subscopeLayers.size() > 0);
	    	delete this->subscopeLayers.front();
	    	this->subscopeLayers.pop_front();
	    }
	}




        void StaticAnalysisScopeLayer::insertLocalDeclarationIntoScope(ASTLocalDeclaration *localDeclaration, Analyser *analyser) {
            assert(this->isBaseScope);
            assert(this->parentScopeLayer != nullptr);
            StaticAnalysisScopeLayer *scopeLayerToInsertLocalDeclaration = this->parentScopeLayer->subscopeLayers.front();
	    assert(scopeLayerToInsertLocalDeclaration != nullptr);

            if (MAP_HAS_KEY(scopeLayerToInsertLocalDeclaration->localDeclarationMapping, localDeclaration->identifier->identifierString)
		|| MAP_HAS_KEY(this->parentScopeLayer->lambdaScopeOwner->externalObjectPulledIntoLambdaScopeMapping, localDeclaration->identifier->identifierString)) {
                SYNTAX_ERROR(localDeclaration->identifier, "declaration has a duplicate identifier within the same scope");
            }
            MAP_KEY_SET_VALUE(scopeLayerToInsertLocalDeclaration->localDeclarationMapping, localDeclaration->identifier->identifierString, localDeclaration);
	}

        ASTLocalDeclaration *StaticAnalysisScopeLayer::linkLocalDeclarationThroughScopeWithIdentifierWithOutputVariableAssignmentIsRestricted(ASTIdentifier *identifier, bool *assignmentIsRestricted) {
            //assert(this->isBaseScope);
            if (this->isBaseScope) {
		if (this->parentScopeLayer == nullptr) return nullptr;
                return this->parentScopeLayer->linkLocalDeclarationThroughScopeWithIdentifierWithOutputVariableAssignmentIsRestricted(identifier, assignmentIsRestricted);
            }

            
            ASTLocalDeclaration *localDeclarationToLink = nullptr;
	    for (StaticAnalysisScopeLayer *subscopeLayer : this->subscopeLayers) {
		if (MAP_HAS_KEY(subscopeLayer->localDeclarationMapping, identifier->identifierString)) {
                    localDeclarationToLink = MAP_KEY_GET_VALUE(subscopeLayer->localDeclarationMapping, identifier->identifierString);
		    break;
                }
	    }
	    bool foundLocalDeclarationInThisScope = (localDeclarationToLink != nullptr);

	    if (foundLocalDeclarationInThisScope) {
		*assignmentIsRestricted = localDeclarationToLink->isAMethodParameter;
            } else {
                if (this->parentScopeLayer != nullptr) {
                    localDeclarationToLink = this->parentScopeLayer->linkLocalDeclarationThroughScopeWithIdentifierWithOutputVariableAssignmentIsRestricted(identifier, assignmentIsRestricted);
		    if (this->lambdaScopeOwner != nullptr && localDeclarationToLink != nullptr) {
			this->lambdaScopeOwner->declareExternalObjectToPullIntoLambdaScopeWithLocalDeclaration(localDeclarationToLink);
		    }
		}
		*assignmentIsRestricted = true;
            }
            return localDeclarationToLink;
        }

    ASTStatement *StaticAnalysisScopeLayer::statementInScope() {
	assert(this->isBaseScope);
	return this->parentScopeLayer->subscopeLayers.front()->statementInThisScope;
    }

    void StaticAnalysisScopeLayer::beginStatementScope(ASTStatement *statement) {
	assert(this->isBaseScope);
	//if (this->isOnTopLevelLambdaScopeLayer()) {
	    assert(this->parentScopeLayer->subscopeLayers.front()->statementInThisScope == nullptr);
            this->parentScopeLayer->subscopeLayers.front()->statementInThisScope = statement;
	//}
    }
    void StaticAnalysisScopeLayer::exitStatementScope() {
	assert(this->isBaseScope);
        //if (this->isOnTopLevelLambdaScopeLayer()) {
	    assert(this->parentScopeLayer->subscopeLayers.front()->statementInThisScope != nullptr);
            this->parentScopeLayer->subscopeLayers.front()->statementInThisScope = nullptr;

	//}
    }

    void StaticAnalysisScopeLayer::enterInvocationContext() {
	assert(this->isBaseScope);
	assert(!this->parentScopeLayer->subscopeLayers.front()->inInvocationContext);
        this->parentScopeLayer->subscopeLayers.front()->inInvocationContext = true;
    }
    void StaticAnalysisScopeLayer::exitInvocationContext() {
	assert(this->isBaseScope);
	assert(this->parentScopeLayer->subscopeLayers.front()->inInvocationContext);
        this->parentScopeLayer->subscopeLayers.front()->inInvocationContext = false;
    }
    bool StaticAnalysisScopeLayer::isInInvocationContext() {
	assert(this->isBaseScope);
        return this->parentScopeLayer->subscopeLayers.front()->inInvocationContext;
    }
    
}











