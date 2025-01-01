//
//  ASTClass.cpp
//  DainaCompiler
//
//  Created by SamWit on 4/03/2017.
//  Copyright © 2017 Samuel Whitton. All rights reserved.
//

#include "ASTClass.hpp"

#define MAP_HAS_KEY(__map, __key) (__map.find(__key) != __map.end())
#define MAP_KEY_SET_VALUE(__map, __key, __value) __map[__key] = __value
#define MAP_KEY_GET_VALUE(__map, __key) (__map[__key])

namespace Daina {


/*
	ASTIdentifier *identifier = nullptr;
        ASTList<ASTGeneric> *generics = nullptr;
        ASTType *parentType = nullptr;
	ASTIdentifier *aliasTypeIdentifier = nullptr;
        ASTList<ASTIdentifier> *dependancies = nullptr;
        std::vector<ASTAttribute *> attributes = std::vector<ASTAttribute *>();
        std::vector<ASTInvarient *> classInvarients = std::vector<ASTInvarient *>();
        std::vector<ASTClassElement *> components = std::vector<ASTClassElement *>();
        
*/

    void ASTClass::analyseAndCompleteAST(Analyser *analyser) {

	assert(this->getType() == ASTTypeClass);
        assert(classInvarients.size() == 0);

        if (this->isAliasType() && !this->parentType->isEmptyType()) {
	    SYNTAX_ERROR(this, "alias type cannot have a parent type");
	}

	if (this->isEntryPoint()) {
            ANALYSIS_INFO("analysing entry point class...");
            if (attributes.size() != 0) {
  		SYNTAX_ERROR(this, "entry point class cannot have attributes");
	    }
	    if (components.size() != 1 || components.at(0)->type != ClassElementType::entryPoint) {
		SYNTAX_ERROR(this, "entry point class must have exactly one component which is an entry point");
	    }

	/*} else if (this->isAliasType()) {
	    ANALYSIS_INFO("analysing alias "+this->aliasTypeIdentifier->identifierString+" - " + this->identifier->identifierString + "...");
	    if (attributes.size() != 0 || components.size() != 0) {
		SYNTAX_ERROR(this, "alias type class cannot have components or attributes");
	    }

            if (generics != nullptr && !generics->isEmpty()) {
                SYNTAX_ERROR(this, "alias type class cannot have generic types");
            }
	*/
	} else {
	    ANALYSIS_INFO("analysing class - " + this->identifier->identifierString + "...");
	}
	

	if (!this->isAliasType()) {
	    StaticAnalysisScope *scope = new StaticAnalysisScope(analyser, this);

	    if (this->generics != nullptr) {
		int indexBinding = -1;
	        for (ASTGeneric *generic : this->generics->list) {
		    indexBinding++;
		    generic->analyseAndCompleteASTWithIndexBinding(analyser, scope, indexBinding);
	        }
	    }

            if (!this->parentType->isEmptyType()) {
                this->parentType->analyseAndCompleteAST(analyser, scope);
                if (!this->parentType->isAValidParentType()) {
                    SYNTAX_ERROR(this->parentType, "not a valid parent type");
                }
            }

            for (ASTAttribute *attribute : this->attributes) {
	        attribute->analyseAndCompleteAST(analyser, scope);
	    }

            for (ASTClassElement *component : this->components) {
                component->classOwner = this;
                component->analyseAndCompleteASTHeader(analyser, scope);
            }

            for (ASTClassElement *component : this->components) {
                component->analyseAndCompleteASTHeaderTypeInference(analyser, scope);
            }

	    for (ASTClassElement *component : this->components) {
                component->analyseAndCompleteASTBody(analyser, scope);
            }

	    delete scope;
		
	}
        
    }

    bool ASTClass::requestPermissionForClassToBecomeDependantWithClass(ASTClass *classAST) {
	bool classDependantWasPermitted;

	if (this->allDependantsArePermitted) {
	    classDependantWasPermitted = true;
	
	} else if (this->dependants != nullptr) {
	    bool foundClassASTInDependantList = false;
	    for (ASTIdentifier *allowedDependant : this->dependants->list) {
		if (allowedDependant->identifierString == classAST->identifier->identifierString) {
		    foundClassASTInDependantList = true;
		    allowedDependant->linkToClass(classAST);
		}
	    }

	    classDependantWasPermitted = foundClassASTInDependantList;
	}

	return classDependantWasPermitted;
    }




        bool ASTClass::isEntryPoint() {
            return this->identifier == nullptr;
	}

	bool ASTClass::isAliasType() {
            return this->aliasTypeIdentifier != nullptr;
	}
        
        ASTClass::ASTClass(Parser *parser) : AST(ASTTypeClass) {
            //class = '[' (id ('<' generic_list '>')? ((':' type) | ('@' identifier))? )? ']' ('(' id_list ')')? (invarient | attribute)* '{' class_element* '}'
            parentType = ASTType::emptyType();

            tEXPECT(TokenType::tASqBraceOpen);
            
            if (tIS(TokenType::tIdentifier)) {
                identifier = this->dependant(new ASTIdentifier(parser));
                
                if (tIS(TokenType::tALeThan)) {
                    tEXPECT(TokenType::tALeThan);
                    
                    tGUARD_NEXT(TokenType::tIdentifier, "expecting generic list");
                    generics = this->dependant(new ASTList<ASTGeneric>(parser, ParseASTGeneric::instance()));
                    tGUARD_TAKE_NEXT(TokenType::tAGrThan, "expecting greater-then symbol to end generics list");
                }
                
                if (tIS(TokenType::tAColon)) {
                    tEXPECT(TokenType::tAColon);
                    if ( !(tFOLLOWS_TYPE) ) {
                        tERROR("expecting class parent type");
                    }
                    parentType = ASTType::parseTypeAttachingAsDependantToAST(parser, this);

                }

                 /* else if (tIS(TokenType::tAAt)) {
                    tEXPECT(TokenType::tAAt);
                    tGUARD_NEXT(TokenType::tIdentifier, "expecting alias type");
                    aliasTypeIdentifier = this->dependant(new ASTIdentifier(parser));
                }*/

            }
                
            tGUARD_TAKE_NEXT(TokenType::tASqBraceClosed, "expecting closing square brace for class definition");
            
            
            if (tIS(TokenType::tABraceOpen)) {
                tEXPECT(TokenType::tABraceOpen);
                if (tIS(TokenType::tABraceClosed)) {
                    tEXPECT(TokenType::tABraceClosed);
                } else {
                    tGUARD_NEXT(TokenType::tIdentifier, "expecting dependancy list");
                    dependancies = this->dependant(new ASTList<ASTIdentifier>(parser, ParseASTIdentifier::instance()));
                    tGUARD_TAKE_NEXT(TokenType::tABraceClosed, "expecting closing brace for dependancies");
                }
            }

            if (tIS(TokenType::tAArrow)) {
                tEXPECT(TokenType::tAArrow);
		this->allDependantsArePermitted = false;
		tGUARD_TAKE_NEXT(TokenType::tABraceOpen, "expecting opening bracket for dependants list");
                if (tIS(TokenType::tABraceClosed)) {
                    tEXPECT(TokenType::tABraceClosed);
                } else {
                    tGUARD_NEXT(TokenType::tIdentifier, "expecting dependants list");
                    dependants = this->dependant(new ASTList<ASTIdentifier>(parser, ParseASTIdentifier::instance()));
                    tGUARD_TAKE_NEXT(TokenType::tABraceClosed, "expecting closing brace for dependants");
                }
            }
            
            
            //(invarient | attribute)* '{' class_element* '}'
            while ( !(tIS(TokenType::tACurlBraceOpen)) ) {
                
                /*if (tIS(TokenType::tAHash)) {
                    classInvarients.push_back(this->dependant(new ASTInvarient(parser)));
                    
                } else */if ( tFOLLOWS_TYPE ) {
                    attributes.push_back(this->dependant(new ASTAttribute(parser)));
                    
                } else {
                    tERROR("expecting class attribute");
		    //tERROR("expecting class attribute or invarient");
                }
                
            }
            tEXPECT(TokenType::tACurlBraceOpen);
            
            while ( !(tIS(TokenType::tACurlBraceClosed)) ) {
                components.push_back(this->dependant(new ASTClassElement(parser)));
            }
            tEXPECT(TokenType::tACurlBraceClosed);
        }

    bool ASTClass::classSubsumesClass(ASTClass *anotherClass) {
	assert(anotherClass != nullptr);

	if (this == anotherClass) return true;

	if (!anotherClass->parentType->isEmptyType()) {
	    return this->classSubsumesClass(anotherClass->parentType->baseClass());
	}

	return false;
    }

    
    void ASTClass::overrideInstanceMethodInScope(Analyser *analyser, ASTIdentifier *methodIdentifier, ASTLambda *methodLambda, bool isOpenMethod) {    
	if (MAP_HAS_KEY(overridingInstanceMethodMapping, methodIdentifier->identifierString)) {
            SYNTAX_ERROR(methodIdentifier, "cannot override the same method twice");
        }

        ASTLambda *methodToOverride = nullptr;
        if (!this->parentType->isEmptyType()) {
            methodToOverride = (this->parentType->baseClass()->instanceMethodWithIdentifierAndAccessLevel(methodIdentifier, MethodVisibility::methodInternal));
        }
        if (methodToOverride == nullptr) {
            SYNTAX_ERROR(methodIdentifier, "method to override was not found");
        }

        MAP_KEY_SET_VALUE(this->overridingInstanceMethodMapping, methodIdentifier->identifierString, (char *)1/*can be any non 0 value*/);
        methodToOverride->methodIsOverriden = true;
        methodLambda->methodOverridesAnotherMethod = true;

        //MAP_KEY_SET_VALUE(this->parentType->baseClass()->overridenInstanceMethodMapping, methodIdentifier->identifierString, (char *)1/*can be any non 0 value*/);


        if (!isOpenMethod) {
            bool methodToOverrideHasOpenAccess = (this->parentType->baseClass()->instanceMethodWithIdentifierAndAccessLevel(methodIdentifier, MethodVisibility::methodOpen)) != nullptr;
	    if (methodToOverrideHasOpenAccess) {
                SYNTAX_ERROR(methodIdentifier, "open method cannot be overridden to be internal");
            }
	}

	ASTType *methodToOverrideType = methodToOverride->getInferredTypeWhenInvokingWithAClassTypeAttached(analyser, methodLambda->classOwner->parentType);
	ASTType *methodLambdaType = methodLambda->getInferredTypeWhenInvokingWithAClassTypeAttached(analyser, ASTType::emptyType());
	//getInferredTypeWhenInvokingWithAClassTypeAttached
        if (!methodToOverrideType->typeSubsumesType(methodLambdaType)) {
            SYNTAX_ERROR(methodIdentifier, "overriding method with incompatible lambda type");
        }

        if (isOpenMethod) {
            MAP_KEY_SET_VALUE(openInstanceMethodMapping, methodIdentifier->identifierString, methodLambda);
	} else {
            MAP_KEY_SET_VALUE(internalInstanceMethodMapping, methodIdentifier->identifierString, methodLambda);
        }

    }

    void ASTClass::insertStaticMethodInScope(Analyser *analyser, ASTIdentifier *methodIdentifier, ASTLambda *methodLambda) {    
	if (this->staticMethodWithIdentifier(methodIdentifier) != nullptr) {
            SYNTAX_ERROR(methodIdentifier, "duplicate static method");
        } 
        MAP_KEY_SET_VALUE(staticMethodMapping, methodIdentifier->identifierString, methodLambda);
    }

    void ASTClass::insertInstanceMethodInScope(Analyser *analyser, ASTIdentifier *methodIdentifier, ASTLambda *methodLambda, MethodVisibility methodVisibility) {
	if (this->instanceMethodWithIdentifierAndAccessLevel(methodIdentifier, MethodVisibility::methodIsolated) != nullptr) {
            SYNTAX_ERROR(methodIdentifier, "duplicate instance method");
        }
	if (methodVisibility == MethodVisibility::methodOpen) {
            MAP_KEY_SET_VALUE(openInstanceMethodMapping, methodIdentifier->identifierString, methodLambda);
        } else if (methodVisibility == MethodVisibility::methodInternal) {
            MAP_KEY_SET_VALUE(internalInstanceMethodMapping, methodIdentifier->identifierString, methodLambda);
        } else {
            MAP_KEY_SET_VALUE(isolatedInstanceMethodMapping, methodIdentifier->identifierString, methodLambda);
        }
    }

        ASTLambda *ASTClass::staticMethodWithIdentifier(ASTIdentifier *methodIdentifier) {
            if (MAP_HAS_KEY(staticMethodMapping, methodIdentifier->identifierString)) {
                return MAP_KEY_GET_VALUE(staticMethodMapping, methodIdentifier->identifierString);
            } 
            return nullptr;
        }
	

        ASTLambda *ASTClass::instanceMethodWithIdentifierAndAccessLevel(ASTIdentifier *methodIdentifier, MethodVisibility accessLevel) {
            if (MAP_HAS_KEY(openInstanceMethodMapping, methodIdentifier->identifierString)) {
                return MAP_KEY_GET_VALUE(openInstanceMethodMapping, methodIdentifier->identifierString);
            } 
            if (accessLevel == MethodVisibility::methodInternal || accessLevel == MethodVisibility::methodIsolated) {
                if (MAP_HAS_KEY(internalInstanceMethodMapping, methodIdentifier->identifierString)) {
                    return MAP_KEY_GET_VALUE(internalInstanceMethodMapping, methodIdentifier->identifierString);
                } 
            }
            if (accessLevel == MethodVisibility::methodIsolated) {
                if (MAP_HAS_KEY(isolatedInstanceMethodMapping, methodIdentifier->identifierString)) {
                    return MAP_KEY_GET_VALUE(isolatedInstanceMethodMapping, methodIdentifier->identifierString);
                } 
            }
            if (this->parentType->isEmptyType())
		return nullptr;
            MethodVisibility parentMenthodAccessLevel = (accessLevel==MethodVisibility::methodIsolated)?(MethodVisibility::methodInternal):(accessLevel);
            return this->parentType->baseClass()->instanceMethodWithIdentifierAndAccessLevel(methodIdentifier, parentMenthodAccessLevel);
        }

}






