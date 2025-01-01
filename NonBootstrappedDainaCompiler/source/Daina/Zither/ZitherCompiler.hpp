//
//  ZitherCompiler.hpp
//  DainaCompiler
//
//  Created by SamWit on 13/05/2018.
//  Copyright © 2018 Samuel Whitton. All rights reserved.
//

#ifndef ZitherCompiler_hpp
#define ZitherCompiler_hpp

namespace Daina {
    class ZitherCompiler;
}

#include <string>
#include <functional>
#include <vector>

namespace Daina {

    class ZitherReceiver {
	public:
	virtual void zitherBegin() = 0;
        virtual void zitherEnd() = 0;

	virtual void compilerInjection(std::string injectionIdentifier, std::string theInjectionInQuestion) = 0;

	virtual void beginTemplate(std::string templateID) = 0;
	virtual void endTemplate() = 0;
	virtual void declareDynamicTemplateObject(std::string templateObjectID) = 0;
	virtual void declareStaticTemplateObject(std::string templateObjectID) = 0;

	virtual void declareMethod(std::string methodID, std::vector<std::string> expectedParamIDs) = 0;
	virtual void startMethodDefinition(std::string methodID, std::vector<std::string> expectedParamIDs) = 0;
	virtual void finishMethodDefinition() = 0;
	virtual void returnObject(std::string objectID) = 0;
	
	virtual void createDynamicObjectWithTemplate(std::string templateID, std::string objectID) = 0;
	virtual void createStaticObjectWithMethod(std::string methodID, std::string objectID) = 0;
	virtual void assignToTemplateObject(std::string templateID, std::string templateObjectID, std::string assigneeObjectID, std::string assignedObjectID) = 0;
        virtual void createObjectFromTemplateObject(std::string templateID, std::string templateObjectID, std::string newObjectID, std::string assignedObjectID) = 0;

        virtual void startMainMethod() = 0;
        virtual void finishMainMethod() = 0;

	virtual void enterLocalScope() = 0;
	virtual void exitLocalScope() = 0;


	virtual void invokeDynamicObjectAsLambda(std::string resultObjectID, std::string lambdaObjectID, std::vector<std::string> inputParameterIDs) = 0;
        virtual void createDynamicObjectWithMethodFromStaticObject(std::string staticMethodObjectID, std::string dynamicObjectID, std::vector<std::string> staticObjectsInsertedIntoFrame, std::vector<std::string> dynamicObjectsInsertedIntoFrame) = 0;
        virtual void pullObjectsFromFrame(std::vector<std::string> staticObjectsToPullFromFrame, std::vector<std::string> dynamicObjectsToPullFromFrame) = 0;

        virtual void createStaticObjectWithEmptyValue(std::string newObjectID) = 0;
        virtual void setObjectWithObject(std::string assigneeObjectID, std::string assignedObjectID) = 0;

	virtual void releaseDynamicObject(std::string dynamicObjectID) = 0;
	virtual void retainDynamicObject(std::string dynamicObjectID) = 0;

	virtual void createStaticObjectWithLiteralStringValue(std::string newStaticObjectID, std::string literalStringRepresentation) = 0;
	virtual void createStaticObjectWithLiteralByteValue(std::string newStaticObjectID, std::string literalByteRepresentation) = 0;
	virtual void createStaticObjectWithLiteralNaturalValue(std::string newStaticObjectID, std::string literalNaturalRepresentation) = 0;


    };

    
    class ZitherCompiler : public ZitherReceiver {
    private:
        std::function<void(std::string)> zitherCompilationOutputReceiver;
        ZitherCompiler(std::function<void(std::string)> zitherCompilationOutputReceiver);
	void output(std::string compilationOutput);        

        int currentIndentationLevel = 0;
        std::string currentIndentationForPrettyness = "";

	std::string stringFromStringList(std::vector<std::string> stringList);

	static std::string repeatStringANumberOfTimes(std::string subString, int numberOfTimes);

	std::string buildCParameterListFromParameterListOfZitherIDs(std::vector<std::string> zitherIDList);
	std::string buildCParameterInputsFromParameterListOfZitherIDs(std::vector<std::string> zitherIDList);

	std::string currentDeallocatorInjections;
	std::string currentHeaderInjections;
	std::vector<std::string> dynamicTemplateObjects;
	std::string currentTemplateID;


	int currentTemporaryID = 1;

    public:
	static ZitherCompiler *startCompilingZitherInputIntoCSource(std::function<void(std::string)> zitherCompilationOutputReceiver);
	static void finishAndDestroyZitherCompiler(ZitherCompiler *zitherCompiler);
        ZitherReceiver *getZitherReceiver();

	void zitherBegin();
        void zitherEnd();

	void compilerInjection(std::string injectionIdentifier, std::string theInjectionInQuestion);

	void beginTemplate(std::string templateID);
	void endTemplate();
	void declareDynamicTemplateObject(std::string templateObjectID);
	void declareStaticTemplateObject(std::string templateObjectID);

	void declareMethod(std::string methodID, std::vector<std::string> expectedParamIDs);
	void startMethodDefinition(std::string methodID, std::vector<std::string> expectedParamIDs);
	void finishMethodDefinition();
	void returnObject(std::string objectID);
	
	void createDynamicObjectWithTemplate(std::string templateID, std::string objectID);
	void createStaticObjectWithMethod(std::string methodID, std::string objectID);
	void assignToTemplateObject(std::string templateID, std::string templateObjectID, std::string assigneeObjectID, std::string assignedObjectID);
        void createObjectFromTemplateObject(std::string templateID, std::string templateObjectID, std::string newObjectID, std::string assignedObjectID);

        void startMainMethod();
        void finishMainMethod();

	void enterLocalScope();
	void exitLocalScope();


	void invokeDynamicObjectAsLambda(std::string resultObjectID, std::string lambdaObjectID, std::vector<std::string> inputParameterIDs);
        void createDynamicObjectWithMethodFromStaticObject(std::string staticMethodObjectID, std::string dynamicObjectID, std::vector<std::string> staticObjectsInsertedIntoFrame, std::vector<std::string> dynamicObjectsInsertedIntoFrame);
        void pullObjectsFromFrame(std::vector<std::string> staticObjectsToPullFromFrame, std::vector<std::string> dynamicObjectsToPullFromFrame);

        void createStaticObjectWithEmptyValue(std::string newObjectID);
        void setObjectWithObject(std::string assigneeObjectID, std::string assignedObjectID);

	void releaseDynamicObject(std::string dynamicObjectID);
	void retainDynamicObject(std::string dynamicObjectID);

	void createStaticObjectWithLiteralStringValue(std::string newStaticObjectID, std::string literalStringRepresentation);
	void createStaticObjectWithLiteralByteValue(std::string newStaticObjectID, std::string literalByteRepresentation);
	void createStaticObjectWithLiteralNaturalValue(std::string newStaticObjectID, std::string literalNaturalRepresentation);
    };
    
}


#endif /* ZitherCompiler_hpp */





