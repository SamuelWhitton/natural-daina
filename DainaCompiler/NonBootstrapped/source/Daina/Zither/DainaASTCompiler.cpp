//
//  DainaASTCompiler.cpp
//  DainaCompiler
//
//  Created by SamWit on 13/05/2017.
//  Copyright © 2018 Samuel Whitton. All rights reserved.
//

#include "DainaASTCompiler.hpp"


namespace Daina {

    DainaASTCompiler::DainaASTCompiler(ZitherReceiver *zitherReceiver) {
        this->zitherReceiver = zitherReceiver;
    }
    
    void DainaASTCompiler::compileDainaASTIntoZither(AST *rootAST, ZitherReceiver *zitherReceiver) {
	assert(rootAST->getType() == ASTTypeRoot);
	DainaASTCompiler *dainaASTCompiler = new DainaASTCompiler(zitherReceiver);
        dainaASTCompiler->compileASTRoot((ASTRoot *)rootAST);
	delete dainaASTCompiler;
    }


#define ZITHER (this->zitherReceiver)


#define CONSTRUCT_ZITHER_IDENTIFIER(_prependedString, _identifierAST) (_prependedString + std::string("_") + _identifierAST->identifierString)

#define ZITHER_IDENTIFIER_TEMPLATE_FOR_CLASS(_classAST) (CONSTRUCT_ZITHER_IDENTIFIER("template", _classAST->identifier))
#define ZITHER_IDENTIFIER_ALLOCATOR_METHOD_FOR_CLASS(_classAST) (CONSTRUCT_ZITHER_IDENTIFIER("allocator", _classAST->identifier))
#define ZITHER_IDENTIFIER_ATTRIBUTE(_attributeAST) (CONSTRUCT_ZITHER_IDENTIFIER("attribute_"+_attributeAST->classOwner->identifier->identifierString, _attributeAST->identifier))
#define ZITHER_IDENTIFIER_CLASS_METHOD(_lambdaAST) (CONSTRUCT_ZITHER_IDENTIFIER("classmethod_" + _lambdaAST->classOwner->identifier->identifierString, _lambdaAST->identifier))
#define ZITHER_IDENTIFIER_INSTANCE_METHOD(_lambdaAST) (CONSTRUCT_ZITHER_IDENTIFIER("instancemethod", _lambdaAST->identifier))

#define ASSIGN_IDENTIFIER_ANONYMOUS_LAMBDA(_lambdaAST) _lambdaAST->compilationTag = this->currentAnonymousLambdaID++ 
#define ZITHER_IDENTIFIER_ANONYMOUS_LAMBDA(_lambdaAST) ("anonymousmethod_"+std::to_string(_lambdaAST->compilationTag))

#define ZITHER_IDENTIFIER_LOCAL_DECLARATION(_localDeclarationAST) (CONSTRUCT_ZITHER_IDENTIFIER("local", _localDeclarationAST->identifier))

#define ZITHER_GENERATE_TEMPORARY_IDENTIFIER ("temporary_"+std::to_string(this->currentTemporaryID++))
#define ZITHER_RESET_TEMPORARY_IDENTIFIERS this->currentTemporaryID=1

#define ZITHER_IDENTIFIER_SELF_REFERENCE ("self")
#define ZITHER_IDENTIFIER_RETURN_VALUE_REFERENCE ("retval")

#define ZITHER_LAMBDA_IS_STORED_WITHIN_TEMPLATE(_lambdaAST) (_lambdaAST->methodIsOverriden || _lambdaAST->methodOverridesAnotherMethod)


//int currentTemporaryVariableID = 1;
  //      int currentAnonymousLambdaID = 1;


    void DainaASTCompiler::compileASTRoot(ASTRoot *rootAST) {
        ZITHER->zitherBegin();
        for (ASTClass *classAST : rootAST->classOrder) {
            this->compileASTClass(classAST);
        }
	this->compileASTEntryPoint(rootAST->entryPointClass->components[0]->lambda);
        ZITHER->zitherEnd();
    }

#define COMPILE_CHILD_LAMBDAS_FOR_LAMBDA(_lambda) \
	for (ASTLambda *childLambda : _lambda->childLambdas) { \
	    ASSIGN_IDENTIFIER_ANONYMOUS_LAMBDA(childLambda); \
	    this->compileASTLambdaDefinitionWithMethodIdentifier(childLambda, ZITHER_IDENTIFIER_ANONYMOUS_LAMBDA(childLambda)); \
	}

    void DainaASTCompiler::compileASTEntryPoint(ASTLambda *entryPointLambda) {

	COMPILE_CHILD_LAMBDAS_FOR_LAMBDA(entryPointLambda);

        ZITHER->startMainMethod();
	this->compileASTLambdaBody(entryPointLambda);
        ZITHER->finishMainMethod();
    }

    void DainaASTCompiler::compileASTClass(ASTClass *classAST) {

        ZITHER->beginTemplate(ZITHER_IDENTIFIER_TEMPLATE_FOR_CLASS(classAST));

        std::vector<ASTClassElement *> classMethods = std::vector<ASTClassElement *>();
        for (ASTClassElement *component : classAST->components) {
	    if (component->type == compilerDirective) {
                ZITHER->compilerInjection(component->identifier->identifierString, component->injection->injection);
            } else {
  		classMethods.push_back(component);
            }
        } 

        this->compileASTClassTemplateDeclarations(classAST);
	ZITHER->endTemplate();

        for (ASTClassElement *classMethod : classMethods) {
 	    this->compileASTDeclareMethod(classMethod);
        }

	this->compileASTClassAllocatorMethod(classAST);

        for (ASTClassElement *classMethod : classMethods) {
 	    this->compileASTDefineMethod(classMethod);
        }
    }

    void DainaASTCompiler::compileASTClassTemplateDeclarations(ASTClass *classAST) {
	if (!classAST->parentType->isEmptyType())
	    this->compileASTClassTemplateDeclarations(classAST->parentType->baseClass()); 	

	for (ASTAttribute *attribute : classAST->attributes) {
	    if (this->isDainaTypeRepresentedWithDynamicZitherObject(attribute->type)) {
	        ZITHER->declareDynamicTemplateObject(ZITHER_IDENTIFIER_ATTRIBUTE(attribute));
            } else {
	        ZITHER->declareStaticTemplateObject(ZITHER_IDENTIFIER_ATTRIBUTE(attribute));
	    }
	}
        for (ASTClassElement *component : classAST->components) {
            if (component->lambda != nullptr) {
                bool storeMethodObjectInInstance = (component->lambda->methodIsOverriden && !component->lambda->methodOverridesAnotherMethod);
                if (storeMethodObjectInInstance)
                    ZITHER->declareStaticTemplateObject(ZITHER_IDENTIFIER_INSTANCE_METHOD(component->lambda));
            }
        }
    }

#define newObjectIdentifierString "newObject"
    void DainaASTCompiler::compileASTClassAllocatorMethod(ASTClass *classAST) {
        //ZITHER->declareMethod(ZITHER_IDENTIFIER_ALLOCATOR_METHOD_FOR_CLASS(classAST), std::vector<std::string>());
        ZITHER_RESET_TEMPORARY_IDENTIFIERS;
        ZITHER->startMethodDefinition(ZITHER_IDENTIFIER_ALLOCATOR_METHOD_FOR_CLASS(classAST), std::vector<std::string>());
        ZITHER->createDynamicObjectWithTemplate(ZITHER_IDENTIFIER_TEMPLATE_FOR_CLASS(classAST), newObjectIdentifierString);

        this->compileASTClassAllocatorAssignments(classAST);

        ZITHER->returnObject(newObjectIdentifierString);
	ZITHER->finishMethodDefinition();
    }

    void DainaASTCompiler::compileASTClassAllocatorAssignments(ASTClass *classAST) {
        if (!classAST->parentType->isEmptyType())
	    this->compileASTClassAllocatorAssignments(classAST->parentType->baseClass()); 	

        for (ASTClassElement *component : classAST->components) {
            if (component->lambda != nullptr) {
                bool assignMethodObjectInInstance = ZITHER_LAMBDA_IS_STORED_WITHIN_TEMPLATE(component->lambda);
                if (assignMethodObjectInInstance) {
		    std::string tempMethodObjectName = ZITHER_GENERATE_TEMPORARY_IDENTIFIER;//"_" + ZITHER_IDENTIFIER_INSTANCE_METHOD(component->lambda);
                    ZITHER->createStaticObjectWithMethod(ZITHER_IDENTIFIER_CLASS_METHOD(component->lambda), tempMethodObjectName);
		    ZITHER->assignToTemplateObject(ZITHER_IDENTIFIER_TEMPLATE_FOR_CLASS(classAST), ZITHER_IDENTIFIER_INSTANCE_METHOD(component->lambda), newObjectIdentifierString, tempMethodObjectName);
                }
            }
        }
    }

#define FILL_ARRAY_WITH_METHOD_PARAMETERS_FROM_LAMBDA(__someArray, __lambda)\
	if (__lambda->reactants != nullptr) {\
        for (ASTLocalDeclaration *localDeclaration : __lambda->reactants->list) {\
            __someArray.push_back(ZITHER_IDENTIFIER_LOCAL_DECLARATION(localDeclaration));\
        }}

    void DainaASTCompiler::compileASTDeclareMethod(ASTClassElement *classElementAST) {
	std::vector<std::string> inputMethodParameters = std::vector<std::string>();
	FILL_ARRAY_WITH_METHOD_PARAMETERS_FROM_LAMBDA(inputMethodParameters, classElementAST->lambda);
	std::string methodIdentifier = ZITHER_IDENTIFIER_CLASS_METHOD(classElementAST->lambda);
        ZITHER->declareMethod(methodIdentifier, inputMethodParameters);
    }

    void DainaASTCompiler::compileASTDefineMethod(ASTClassElement *classElementAST) {
	std::string methodIdentifier = ZITHER_IDENTIFIER_CLASS_METHOD(classElementAST->lambda);
        this->compileASTLambdaDefinitionWithMethodIdentifier(classElementAST->lambda, methodIdentifier);
    }

    void DainaASTCompiler::compileASTLambdaDefinitionWithMethodIdentifier(ASTLambda *lambda, std::string methodIdentifier) {

	COMPILE_CHILD_LAMBDAS_FOR_LAMBDA(lambda);

	std::vector<std::string> inputMethodParameters = std::vector<std::string>();
	FILL_ARRAY_WITH_METHOD_PARAMETERS_FROM_LAMBDA(inputMethodParameters, lambda);
        ZITHER->startMethodDefinition(methodIdentifier, inputMethodParameters);
	ZITHER_RESET_TEMPORARY_IDENTIFIERS;
	this->compileASTLambdaBody(lambda);
        ZITHER->finishMethodDefinition();
    }

    void DainaASTCompiler::compileASTLambdaBody(ASTLambda *lambda) {
	if (lambda->isAConstructor) {
	    ZITHER->pullObjectsFromFrame(std::vector<std::string>(), this->buildObjectFrameForLambdaWithSingleDynamicInstance(ZITHER_IDENTIFIER_SELF_REFERENCE));
	    ZITHER->retainDynamicObject(ZITHER_IDENTIFIER_SELF_REFERENCE);	
        } else {
	    ZITHER->pullObjectsFromFrame(this->buildStaticObjectFrameForLambda(lambda), this->buildDynamicObjectFrameForLambda(lambda));
	}



	std::string objectIDToReceiveResult = ZITHER_IDENTIFIER_RETURN_VALUE_REFERENCE;

	std::vector<std::string> dynamicLocalObjectsThatNeedToBeReleasedFromPrologueBinding = std::vector<std::string>();
	bool lambdaBodyHasPrologueBinding = (lambda->body != nullptr && lambda->body->prologueBinding != nullptr);
	if (lambdaBodyHasPrologueBinding) {
	    objectIDToReceiveResult = ZITHER_GENERATE_TEMPORARY_IDENTIFIER;
	    ZITHER->createStaticObjectWithEmptyValue(ZITHER_IDENTIFIER_RETURN_VALUE_REFERENCE);
	    ZITHER->enterLocalScope();
	    dynamicLocalObjectsThatNeedToBeReleasedFromPrologueBinding = this->compileASTStatementListResturningUnreleasedDynamicObjectIDs(lambda->body->prologueBinding->body.statementBlock);
	}
	    

	std::vector<std::string> dynamicLocalObjectsThatNeedToBeReleased = std::vector<std::string>();
        if (lambda->body != nullptr && lambda->body->body.raw != nullptr) {
	    dynamicLocalObjectsThatNeedToBeReleased = this->compileASTStatementListResturningUnreleasedDynamicObjectIDs(lambda->body->body.statementBlock);
        }

	if (lambda->result != nullptr) {
            this->compileASTExprWithResultObject(lambda->result, objectIDToReceiveResult);
	    if (lambdaBodyHasPrologueBinding) {
	        ZITHER->setObjectWithObject(ZITHER_IDENTIFIER_RETURN_VALUE_REFERENCE, objectIDToReceiveResult);
	    }
        }

	for (std::string dynamicObjectToRelease : dynamicLocalObjectsThatNeedToBeReleased) {
		ZITHER->releaseDynamicObject(dynamicObjectToRelease);
	}
	for (std::string dynamicObjectToRelease : dynamicLocalObjectsThatNeedToBeReleasedFromPrologueBinding) {
		ZITHER->releaseDynamicObject(dynamicObjectToRelease);
	}

	if (lambdaBodyHasPrologueBinding) {
	    ZITHER->exitLocalScope();
	}



        if (lambda->result != nullptr) {
            ZITHER->returnObject(ZITHER_IDENTIFIER_RETURN_VALUE_REFERENCE);
        }

        if (lambda->isAConstructor) {
	    ZITHER->returnObject(ZITHER_IDENTIFIER_SELF_REFERENCE);
        }

	
    }

    void DainaASTCompiler::compileASTStatement(ASTStatement *statement) {
        ASTExpr *evaluatedExpression = (statement->rightExpr == nullptr)?(statement->leftExpr):(statement->rightExpr);
	std::string temporaryObjectID = ZITHER_GENERATE_TEMPORARY_IDENTIFIER;
	this->compileASTExprWithResultObject(evaluatedExpression, temporaryObjectID);

	bool objectShouldBeRetainedWithinThisScope = false;
        if (statement->isADeclarationAndAssignmentOfNewVariable()) {
	    ZITHER->createStaticObjectWithEmptyValue(ZITHER_IDENTIFIER_LOCAL_DECLARATION(statement->declaration));
	    ZITHER->setObjectWithObject(ZITHER_IDENTIFIER_LOCAL_DECLARATION(statement->declaration), temporaryObjectID);
            objectShouldBeRetainedWithinThisScope = this->isDainaTypeRepresentedWithDynamicZitherObject(statement->declaration->type);

 	} else if (statement->isAnAssignmentOfExistingVariable()) {
            
	    if (statement->leftExpr->type == ExprType::LocalReference) {
		ASTLocalDeclaration *localVariableToAssignTo = statement->leftExpr->link.localDeclaration;
		if (this->isDainaTypeRepresentedWithDynamicZitherObject(localVariableToAssignTo->type)) {
		    ZITHER->releaseDynamicObject(ZITHER_IDENTIFIER_LOCAL_DECLARATION(localVariableToAssignTo));
                    objectShouldBeRetainedWithinThisScope = this->isDainaTypeRepresentedWithDynamicZitherObject(localVariableToAssignTo->type);
                }
		ZITHER->setObjectWithObject(ZITHER_IDENTIFIER_LOCAL_DECLARATION(localVariableToAssignTo), temporaryObjectID);
		
	    } else 

 	    if (statement->leftExpr->type == ExprType::AttributeReference) {
		ASTAttribute *attributeToAssignTo = statement->leftExpr->link.attribute;
		if (this->isDainaTypeRepresentedWithDynamicZitherObject(attributeToAssignTo->type)) {
		    if (!statement->markedAsTheFirstAssignmentOfAnAttribute) {
		        std::string temporaryObjectToReleaseTemplateObject = ZITHER_GENERATE_TEMPORARY_IDENTIFIER;
		        ZITHER->createObjectFromTemplateObject(ZITHER_IDENTIFIER_TEMPLATE_FOR_CLASS(attributeToAssignTo->classOwner), ZITHER_IDENTIFIER_ATTRIBUTE(attributeToAssignTo), temporaryObjectToReleaseTemplateObject, ZITHER_IDENTIFIER_SELF_REFERENCE);
	                ZITHER->releaseDynamicObject(temporaryObjectToReleaseTemplateObject);
		    }
                    objectShouldBeRetainedWithinThisScope = this->isDainaTypeRepresentedWithDynamicZitherObject(attributeToAssignTo->type);
                }
		ZITHER->assignToTemplateObject(ZITHER_IDENTIFIER_TEMPLATE_FOR_CLASS(attributeToAssignTo->classOwner), ZITHER_IDENTIFIER_ATTRIBUTE(attributeToAssignTo),  ZITHER_IDENTIFIER_SELF_REFERENCE, temporaryObjectID);

   	    } else assert(0==1);
        }

        if (this->isDainaTypeRepresentedWithDynamicZitherObject(evaluatedExpression->inferredType()) && !objectShouldBeRetainedWithinThisScope) {
            ZITHER->releaseDynamicObject(temporaryObjectID);
        }
    }

#define ZITHER_MACRO_createDynamicObjectWithMethod(_methodID, _resultObjectID, _staticObjectFrame, _dynamicObjectFrame) \
	std::string tempStaticMethodObjectID = ZITHER_GENERATE_TEMPORARY_IDENTIFIER; \
        ZITHER->createStaticObjectWithMethod(_methodID, tempStaticMethodObjectID); \
	ZITHER->createDynamicObjectWithMethodFromStaticObject(tempStaticMethodObjectID, _resultObjectID, _staticObjectFrame, _dynamicObjectFrame)

    std::vector<std::string> DainaASTCompiler::compileASTStatementListResturningUnreleasedDynamicObjectIDs(ASTList<ASTStatement> *statements) {
	    std::vector<std::string> dynamicLocalObjectsThatNeedToBeReleased = std::vector<std::string>();
	    if (statements != nullptr) {
	    	for (ASTStatement *statement : statements->list) {
              	 	this->compileASTStatement(statement);
			if (statement->isADeclarationAndAssignmentOfNewVariable() && this->isDainaTypeRepresentedWithDynamicZitherObject(statement->declaration->type))
                 	   dynamicLocalObjectsThatNeedToBeReleased.push_back(ZITHER_IDENTIFIER_LOCAL_DECLARATION(statement->declaration));
           	}    
	    }
	    return dynamicLocalObjectsThatNeedToBeReleased;
    }

    void DainaASTCompiler::compileASTExprWithResultObject(ASTExpr *expr, std::string resultObjectID) {
	if (expr->prologueBinding == nullptr) {
	    this->compileASTExprWithResultObjectPrime(expr, resultObjectID);

	} else {
	    ZITHER->createStaticObjectWithEmptyValue(resultObjectID);
	    ZITHER->enterLocalScope();
	    std::vector<std::string> dynamicLocalObjectsThatNeedToBeReleased = this->compileASTStatementListResturningUnreleasedDynamicObjectIDs(expr->prologueBinding->body.statementBlock); 
	    std::string temporaryObjectID = ZITHER_GENERATE_TEMPORARY_IDENTIFIER;
	    this->compileASTExprWithResultObjectPrime(expr, temporaryObjectID);	
	    ZITHER->setObjectWithObject(resultObjectID, temporaryObjectID);
	    for (std::string dynamicObjectToRelease : dynamicLocalObjectsThatNeedToBeReleased) {
                ZITHER->releaseDynamicObject(dynamicObjectToRelease);
	    }
	    ZITHER->exitLocalScope();
	}
    }



    void DainaASTCompiler::compileASTExprWithResultObjectPrime(ASTExpr *expr, std::string resultObjectID) {
	if (expr->type == Empty) {
	    ZITHER->createStaticObjectWithEmptyValue(resultObjectID);
        } else

      	if (expr->type == Invocation) {
	    ASTInvocation *invocation = expr->body.invocation;
	    std::vector<std::string> inputParameterObjects = std::vector<std::string>();
 	    std::vector<std::string> inputParameterObjectsThatNeedToBeReleased = std::vector<std::string>();
	    for (ASTExpr *application : invocation->applications) {
		std::string temporaryObjectID = ZITHER_GENERATE_TEMPORARY_IDENTIFIER;
                this->compileASTExprWithResultObject(application, temporaryObjectID);
		if (this->isDainaTypeRepresentedWithDynamicZitherObject(application->inferredType()))
                    inputParameterObjectsThatNeedToBeReleased.push_back(temporaryObjectID);
		inputParameterObjects.push_back(temporaryObjectID);
            }
	    std::string dynamicLambdaObjectID = ZITHER_GENERATE_TEMPORARY_IDENTIFIER;
	    this->compileASTExprWithResultObject(invocation->root, dynamicLambdaObjectID);
	    std::string lambdaResultObjectID = resultObjectID;
	    ZITHER->invokeDynamicObjectAsLambda(lambdaResultObjectID, dynamicLambdaObjectID, inputParameterObjects);
            ZITHER->releaseDynamicObject(dynamicLambdaObjectID);
	    if (invocation->root->type == ConstructorReference) {
		ZITHER->releaseDynamicObject(lambdaResultObjectID);
	    }
	    for (std::string dynamicObjectToRelease : inputParameterObjectsThatNeedToBeReleased) {
		ZITHER->releaseDynamicObject(dynamicObjectToRelease);
	    } 

        } else

      	if (expr->type == Lambda) {
	    ASTLambda *lambda = expr->body.lambda;
	    ZITHER_MACRO_createDynamicObjectWithMethod(ZITHER_IDENTIFIER_ANONYMOUS_LAMBDA(lambda), resultObjectID, this->buildStaticObjectFrameForLambda(lambda), this->buildDynamicObjectFrameForLambda(lambda));

        } else

      	if (expr->type == AttributeReference) {
	    ASTAttribute *attribute = expr->link.attribute;
 	    ASTLambda *linkedMethod = expr->methodLink;
            if (linkedMethod != nullptr) {
		std::string temporaryAttributeHolderObjectID = ZITHER_GENERATE_TEMPORARY_IDENTIFIER;
		ZITHER->createObjectFromTemplateObject(ZITHER_IDENTIFIER_TEMPLATE_FOR_CLASS(attribute->classOwner), ZITHER_IDENTIFIER_ATTRIBUTE(attribute), temporaryAttributeHolderObjectID, ZITHER_IDENTIFIER_SELF_REFERENCE);
		this->compileASTLambdaFromObjectOwnerWithResultObject(linkedMethod, temporaryAttributeHolderObjectID, resultObjectID);
	    } else {
		ZITHER->createObjectFromTemplateObject(ZITHER_IDENTIFIER_TEMPLATE_FOR_CLASS(attribute->classOwner), ZITHER_IDENTIFIER_ATTRIBUTE(attribute), resultObjectID, ZITHER_IDENTIFIER_SELF_REFERENCE);
		if (this->isDainaTypeRepresentedWithDynamicZitherObject(attribute->type))
		    ZITHER->retainDynamicObject(resultObjectID);
            }

        } else

      	if (expr->type == SelfMethodReference) {
	    ASTLambda *linkedMethod = expr->methodLink;
	    this->compileASTLambdaFromObjectOwnerWithResultObject(linkedMethod, ZITHER_IDENTIFIER_SELF_REFERENCE, resultObjectID);

        } else

      	if (expr->type == LocalReference) {
	    ASTLocalDeclaration *localDeclaration = expr->link.localDeclaration;
 	    ASTLambda *linkedMethod = expr->methodLink;
            if (linkedMethod != nullptr) {
		this->compileASTLambdaFromObjectOwnerWithResultObject(linkedMethod, ZITHER_IDENTIFIER_LOCAL_DECLARATION(localDeclaration), resultObjectID);
	    } else {
		ZITHER->createStaticObjectWithEmptyValue(resultObjectID);
		ZITHER->setObjectWithObject(resultObjectID, ZITHER_IDENTIFIER_LOCAL_DECLARATION(localDeclaration));
		if (this->isDainaTypeRepresentedWithDynamicZitherObject(localDeclaration->type))
	            ZITHER->retainDynamicObject(resultObjectID);
            }

        } else

      	if (expr->type == ConstructorReference || expr->type == StaticReference) {
	    ASTLambda *linkedMethod = expr->methodLink;
	    std::vector<std::string> dynamicMethodFrame = std::vector<std::string>();
	    std::string objectToReleaseAtEnd = "";
	    if (linkedMethod->isAConstructor) {
		bool isCallingFirstConstructorInConstructorChain = (expr->type == StaticReference);
	        if (isCallingFirstConstructorInConstructorChain) {
		    std::string newObject = ZITHER_GENERATE_TEMPORARY_IDENTIFIER;

		    std::string tempDynamicLambda = ZITHER_GENERATE_TEMPORARY_IDENTIFIER;
		    ZITHER_MACRO_createDynamicObjectWithMethod(ZITHER_IDENTIFIER_ALLOCATOR_METHOD_FOR_CLASS(linkedMethod->classOwner), tempDynamicLambda, std::vector<std::string>(), std::vector<std::string>());
		    ZITHER->invokeDynamicObjectAsLambda(newObject, tempDynamicLambda, std::vector<std::string>());	 
		    ZITHER->releaseDynamicObject(tempDynamicLambda);   
			//ZITHER->invokeStaticLambda(newObject, ZITHER_IDENTIFIER_ALLOCATOR_METHOD_FOR_CLASS(linkedMethod->classOwner), std::vector<std::string>(), std::vector<std::string>(), std::vector<std::string>());
		   
		    objectToReleaseAtEnd = newObject;
		    dynamicMethodFrame.push_back(newObject);
		} else {
		    dynamicMethodFrame.push_back(ZITHER_IDENTIFIER_SELF_REFERENCE);
		}
	    }
            ZITHER_MACRO_createDynamicObjectWithMethod(ZITHER_IDENTIFIER_CLASS_METHOD(linkedMethod), resultObjectID, std::vector<std::string>(), dynamicMethodFrame);
	    if (objectToReleaseAtEnd != "") {
		ZITHER->releaseDynamicObject(objectToReleaseAtEnd);
	    }

        } else

      	if (expr->type == Literal) {
	    Token *literalToken = expr->body.literalToken;
	    TokenType literalTokenType = literalToken->type();
            if (literalTokenType == TokenType::tStringLiteral)
                ZITHER->createStaticObjectWithLiteralStringValue(resultObjectID, ((TStringLiteral *)literalToken)->zitherLiteralRepresentation());
            else if (literalTokenType == TokenType::tNaturalLiteral)
                ZITHER->createStaticObjectWithLiteralNaturalValue(resultObjectID, ((TNaturalLiteral *)literalToken)->zitherLiteralRepresentation());
            else if (literalTokenType == TokenType::tByteLiteral)
                ZITHER->createStaticObjectWithLiteralByteValue(resultObjectID, ((TByteLiteral *)literalToken)->zitherLiteralRepresentation());
	    else assert(0==1);

        } else

      	if (expr->type == CompilerDirective) {
            ZITHER->compilerInjection(expr->declaredElement->identifierString, expr->body.injection->injection);
        } else

	{
	    assert(0==1);
	}
    }

    void DainaASTCompiler::compileASTLambdaFromObjectOwnerWithResultObject(ASTLambda *lambda, std::string ownerObjectID, std::string resultObjectID) {
        std::vector<std::string> methodFrame = this->buildObjectFrameForLambdaWithSingleDynamicInstance(ownerObjectID);
	if (ZITHER_LAMBDA_IS_STORED_WITHIN_TEMPLATE(lambda)) {
	    std::string temporaryStaticMethodHolderObjectID = ZITHER_GENERATE_TEMPORARY_IDENTIFIER;
	    ZITHER->createObjectFromTemplateObject(ZITHER_IDENTIFIER_TEMPLATE_FOR_CLASS(lambda->classOwner), ZITHER_IDENTIFIER_INSTANCE_METHOD(lambda), temporaryStaticMethodHolderObjectID, ownerObjectID);
	    ZITHER->createDynamicObjectWithMethodFromStaticObject(temporaryStaticMethodHolderObjectID, resultObjectID, std::vector<std::string>(), methodFrame);
	} else {
            ZITHER_MACRO_createDynamicObjectWithMethod(ZITHER_IDENTIFIER_CLASS_METHOD(lambda), resultObjectID, std::vector<std::string>(), methodFrame);
	}
    }

    bool DainaASTCompiler::isDainaTypeRepresentedWithDynamicZitherObject(ASTType *theTypeInQuestion) {
	return !(theTypeInQuestion == nullptr || theTypeInQuestion->isLiteralType() || (theTypeInQuestion->isEmptyType()));
    }

    std::vector<std::string> DainaASTCompiler::buildObjectFrameForLambda(ASTLambda *lambda, bool searchForDynamicObjects) {
	std::vector<std::string> objectsInFrameOfThisLambda = std::vector<std::string>();
	if (searchForDynamicObjects && lambda->selfReferenceIsPulledIntoLambdaScope)
            objectsInFrameOfThisLambda.push_back(ZITHER_IDENTIFIER_SELF_REFERENCE);
	for (std::map<std::string, ASTLocalDeclaration *>::iterator itr = lambda->externalObjectPulledIntoLambdaScopeMapping.begin(); itr != lambda->externalObjectPulledIntoLambdaScopeMapping.end(); ++itr) {
	    ASTLocalDeclaration *objectPulledIntoLambdaScope = itr->second;
	    if (searchForDynamicObjects == this->isDainaTypeRepresentedWithDynamicZitherObject(objectPulledIntoLambdaScope->type))
	        objectsInFrameOfThisLambda.push_back(ZITHER_IDENTIFIER_LOCAL_DECLARATION(objectPulledIntoLambdaScope));
	}
	return objectsInFrameOfThisLambda;
    }

    std::vector<std::string> DainaASTCompiler::buildStaticObjectFrameForLambda(ASTLambda *lambda) {
	return this->buildObjectFrameForLambda(lambda, false);
    }

    std::vector<std::string> DainaASTCompiler::buildDynamicObjectFrameForLambda(ASTLambda *lambda) {
	return this->buildObjectFrameForLambda(lambda, true);
    }


    std::vector<std::string> DainaASTCompiler::buildObjectFrameForLambdaWithSingleDynamicInstance(std::string theInstanceObjectID) {
	std::vector<std::string> objectsInFrameOfThisLambda = std::vector<std::string>();
	objectsInFrameOfThisLambda.push_back(theInstanceObjectID);
	return objectsInFrameOfThisLambda;
    }

}




