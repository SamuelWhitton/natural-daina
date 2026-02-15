//
//  ZitherCompiler.cpp
//  DainaCompiler
//
//  Created by SamWit on 13/05/2018.
//  Copyright © 2018 Samuel Whitton. All rights reserved.
//

#include "ZitherCompiler.hpp"

#include <assert.h>

 
namespace Daina {
    
    ZitherCompiler *ZitherCompiler::startCompilingZitherInputIntoCSource(std::function<void(std::string)> zitherCompilationOutputReceiver) {
        return new ZitherCompiler(zitherCompilationOutputReceiver);
    }

    void ZitherCompiler::finishAndDestroyZitherCompiler(ZitherCompiler *zitherCompiler) {
        delete zitherCompiler;
    }
    
    ZitherReceiver *ZitherCompiler::getZitherReceiver() {
        return this;
    }

    ZitherCompiler::ZitherCompiler(std::function<void(std::string)> zitherCompilationOutputReceiver) {
        this->zitherCompilationOutputReceiver = zitherCompilationOutputReceiver;

	this->output("//Zither Compiler Was Here\n//Time to begin my work :), love me!!!!\n");
    }

    void ZitherCompiler::output(std::string compilationOutput) {
        this->zitherCompilationOutputReceiver(compilationOutput);
    }    

    std::string ZitherCompiler::stringFromStringList(std::vector<std::string> stringList) {
	std::string theStringToReturn = "";
	std::string seperator = "";
	for (std::string oneOfTheStrings : stringList) {
	    theStringToReturn += (seperator+oneOfTheStrings); 
	    seperator = ", ";
 	}
	return "("+theStringToReturn+")";
    }   

    std::string ZitherCompiler::repeatStringANumberOfTimes(std::string subString, int numberOfTimes) {
	std::string createString = "";
	for (int i = 0; i < numberOfTimes; ++i) createString+=subString;
	return createString;
    }

#define OUTPUT_ZITHER_LOG
//#define OUTPUT_MEMORY_RETAIN_RELEASE_LOG
//#define OUTPUT_MEMORY_ALLOC_DEALLOC_LOG


#define MEMORY_LOG(_actionString, _objectPointer) std::string("printf(\"!!!"+std::string(_actionString)+"(%p) - current: %d\\n\", "+_objectPointer+", currentAllocations);")

#ifdef OUTPUT_MEMORY_RETAIN_RELEASE_LOG
#define MEMORY_LOG_RETAIN(_objectPointer) MEMORY_LOG("retain", _objectPointer)
#define MEMORY_LOG_RELEASE(_objectPointer) MEMORY_LOG("release", _objectPointer)
#else
#define MEMORY_LOG_RETAIN(_objectPointer) std::string("")
#define MEMORY_LOG_RELEASE(_objectPointer) std::string("")
#endif

#ifdef OUTPUT_MEMORY_ALLOC_DEALLOC_LOG
#define MEMORY_LOG_ALLOCATE(_objectPointer) std::string("currentAllocations++;")+MEMORY_LOG("alloc", _objectPointer)
#define MEMORY_LOG_ALLOCATE_LAMBDA(_objectPointer) std::string("currentAllocations++;")+MEMORY_LOG("alloc_lam", _objectPointer)
#define MEMORY_LOG_DEALLOCATE(_objectPointer) std::string("currentAllocations--;")+MEMORY_LOG("dealloc", _objectPointer)
#else
#define MEMORY_LOG_ALLOCATE(_objectPointer) std::string("")
#define MEMORY_LOG_ALLOCATE_LAMBDA(_objectPointer) std::string("")
#define MEMORY_LOG_DEALLOCATE(_objectPointer) std::string("")
#endif


#ifdef OUTPUT_ZITHER_LOG
#define ZITHER_LOG(__logMessage) CSOURCE_RAW(currentIndentationForPrettyness + "     //" + std::string(__logMessage) + "\n")
#else
#define ZITHER_LOG(__logMessage) /**/
#endif
#define CSOURCE_LINE(__output) CSOURCE_RAW("/*C*/" + currentIndentationForPrettyness + __output + "\n")
#define CSOURCE_RAW(__output) this->output(__output)

#define SET_INDENTATION_LEVEL(_indentLevel) currentIndentationForPrettyness=(_indentLevel==1?"   ":(_indentLevel==2?"      ":(_indentLevel==3?"         ":(_indentLevel==4?"            ":("")))))
#define INCREASE_INDENTATION_LEVEL ++currentIndentationLevel;SET_INDENTATION_LEVEL(currentIndentationLevel)
#define DECREASE_INDENTATION_LEVEL --currentIndentationLevel;SET_INDENTATION_LEVEL(currentIndentationLevel)
#define RESET_INDENTATION_LEVEL currentIndentationLevel=0;SET_INDENTATION_LEVEL(currentIndentationLevel)

#define C_IDENTIFIER(_zitherIdentifierString) ("Z_" + _zitherIdentifierString)
#define IDENTIFIER_DYNAMIC_OBJECT ("DynamicObject")
#define IDENTIFIER_DYNAMIC_LAMBDA_OBJECT (std::string("DynamicLambda"))
#define C_POINTER (std::string("void*"))
#define C_FUNCTION_POINTER(_numberOfInputs) ("(void*(*)(void*"+ZitherCompiler::repeatStringANumberOfTimes(",void*", _numberOfInputs)+"))")
#define C_FUNCTION_POINTER_CAST(_numberOfInputs, _objectToCast) ("("+C_FUNCTION_POINTER(_numberOfInputs)+"("+_objectToCast+"))")
#define IDENTIFIER_MAIN_METHOD ("MainMethod")
#define IDENTIFIER_ALLOCATOR_METHOD_FOR_TEMPLATE(_templateID) ("alloc_" + C_IDENTIFIER(_templateID))
#define DYNAMIC_OBJECT_BASE_STRUCTURE ("long references;"+C_POINTER+" deallocator;")
#define C_CAST(_structName, _pointer) ("(("+std::string(_structName)+" *)("+std::string(_pointer)+"))")
#define C_EMPTY_VALUE C_CAST("void", "0")

#define IDENTIFIER_DYNAMIC_LAMBDA_DEALLOCATOR_METHOD ("deallocateDynamicLambda")
#define IDENTIFIER_DYNAMIC_LAMBDA_ALLOCATOR_METHOD (std::string("allocateDynamicLambda"))

#define C_CAST_HACK_SOMETHING_INTO_C_POINTER(_someVariable) ("((void*)(*((void**)(&("+_someVariable+")))))")

#define GENERATE_TEMPORARY_IDENTIFIER ("tempvar_"+std::to_string(this->currentTemporaryID++))
#define RESET_TEMPORARY_IDENTIFIERS this->currentTemporaryID=1

#define C_FRAME_IDENTIFIER ("frame")



//helpers begin
    std::string ZitherCompiler::buildCParameterListFromParameterListOfZitherIDs(std::vector<std::string> zitherIDList) {
	std::string builtParamList = C_POINTER + " " + C_FRAME_IDENTIFIER;
	std::string seperator = ", ";
	for (std::string zitherID : zitherIDList) {
	    builtParamList += seperator + C_POINTER + " " + C_IDENTIFIER(zitherID);
	}
	return builtParamList;
    }
    std::string ZitherCompiler::buildCParameterInputsFromParameterListOfZitherIDs(std::vector<std::string> zitherIDList) {
	std::string builtParamInputs = "";
	std::string seperator = "";
	for (std::string zitherID : zitherIDList) {
	    builtParamInputs += seperator + C_IDENTIFIER(zitherID);
	    seperator = ", ";
	}
	return builtParamInputs;
    }
//helpers end


    void ZitherCompiler::zitherBegin() {
	this->currentDeallocatorInjections = "";
	this->currentHeaderInjections = "";

        RESET_INDENTATION_LEVEL;
        ZITHER_LOG("BEGIN ZITHER");
        INCREASE_INDENTATION_LEVEL;

	ZITHER_LOG("---------------------------------------------------------------");

	CSOURCE_LINE("#include <stdlib.h>");
	CSOURCE_LINE("#include <stdio.h>");
	CSOURCE_LINE("#include <assert.h>");
	CSOURCE_LINE("#include <string.h>");

	CSOURCE_LINE(""	
		+ "typedef struct _"+IDENTIFIER_DYNAMIC_OBJECT+" {"
		+ DYNAMIC_OBJECT_BASE_STRUCTURE
		+ "} "+IDENTIFIER_DYNAMIC_OBJECT+";"
	);

	CSOURCE_LINE(""	
		+ "typedef struct _"+IDENTIFIER_DYNAMIC_LAMBDA_OBJECT+" {"
		+ DYNAMIC_OBJECT_BASE_STRUCTURE
		+ C_POINTER+" method;long dynamicFrameLength;"
		+ "} "+IDENTIFIER_DYNAMIC_LAMBDA_OBJECT+";"
	);

	CSOURCE_LINE("void "+IDENTIFIER_MAIN_METHOD+"();");
	CSOURCE_LINE(""	
		+ "int main(int argc, const char* argv[]) {"
		+ " int is32MachineBitOrGreater = (sizeof("+C_POINTER+") >= 4);"
		+ " assert(is32MachineBitOrGreater);" //this assumption is used by the compiler
		+ " assert(sizeof(long) >= 4);" //we need this for great good >.>
		+ " assert(sizeof(double) == sizeof("+C_POINTER+"));" //they will ask questions
		+ " assert(sizeof(size_t) <= sizeof("+C_POINTER+"));"
		+ " "+IDENTIFIER_MAIN_METHOD+"();"
		+ "}"
	);


#ifdef OUTPUT_MEMORY_ALLOC_DEALLOC_LOG
	CSOURCE_LINE("int currentAllocations = 0;");
#endif
	CSOURCE_LINE("#define RetainDynamicObject(_dynamicObjectInQuestion) "+MEMORY_LOG_RETAIN("_dynamicObjectInQuestion")+C_CAST(IDENTIFIER_DYNAMIC_OBJECT, "(_dynamicObjectInQuestion)")+"->references++;");
	CSOURCE_LINE("#define ReleaseDynamicObject(_dynamicObjectInQuestion) "+MEMORY_LOG_RELEASE("_dynamicObjectInQuestion")+"if ((--"+C_CAST(IDENTIFIER_DYNAMIC_OBJECT, "(_dynamicObjectInQuestion)")+"->references) == 0) {}");

	std::string deallocatorMethodForDynamicLambdaObject = IDENTIFIER_DYNAMIC_LAMBDA_DEALLOCATOR_METHOD;
	CSOURCE_LINE(C_POINTER+" "+deallocatorMethodForDynamicLambdaObject+"("+C_POINTER+" object) {");
	CSOURCE_LINE(" long dynamicFrameLength = " + C_CAST(IDENTIFIER_DYNAMIC_LAMBDA_OBJECT, "object") + "->dynamicFrameLength;");
	CSOURCE_LINE(" int i;for (i=0;i<dynamicFrameLength;++i) {ReleaseDynamicObject(*((void**)(object+sizeof("+IDENTIFIER_DYNAMIC_LAMBDA_OBJECT+")+i*sizeof("+C_POINTER+"))));}");
	CSOURCE_LINE(" return NULL;");
	CSOURCE_LINE("}");


	std::string lambdaAllocatorMethod = IDENTIFIER_DYNAMIC_LAMBDA_ALLOCATOR_METHOD;
	CSOURCE_LINE(C_POINTER+" "+lambdaAllocatorMethod+"(long dynamicFrameLength, long totalFrameLength, "+C_POINTER+" staticMethodPointer) {");
	CSOURCE_LINE(" "+C_POINTER+" newAllocatedLambdaObject = malloc(sizeof(" + IDENTIFIER_DYNAMIC_LAMBDA_OBJECT + ")+sizeof("+C_POINTER+")*totalFrameLength);");
	CSOURCE_LINE(MEMORY_LOG_ALLOCATE_LAMBDA("newAllocatedLambdaObject"));	
	CSOURCE_LINE(" "+C_CAST(IDENTIFIER_DYNAMIC_LAMBDA_OBJECT, "newAllocatedLambdaObject")+"->references=1;");
	CSOURCE_LINE(" "+C_CAST(IDENTIFIER_DYNAMIC_LAMBDA_OBJECT, "newAllocatedLambdaObject")+"->deallocator=&"+IDENTIFIER_DYNAMIC_LAMBDA_DEALLOCATOR_METHOD+";");
	CSOURCE_LINE(" "+C_CAST(IDENTIFIER_DYNAMIC_LAMBDA_OBJECT, "newAllocatedLambdaObject")+"->method=staticMethodPointer;");
	CSOURCE_LINE(" "+C_CAST(IDENTIFIER_DYNAMIC_LAMBDA_OBJECT, "newAllocatedLambdaObject")+"->dynamicFrameLength=dynamicFrameLength;");
	CSOURCE_LINE(" return newAllocatedLambdaObject;");
	CSOURCE_LINE("}");

    }

    void ZitherCompiler::zitherEnd() {
	ZITHER_LOG("---------------------------------------------------------------");
        RESET_INDENTATION_LEVEL;
	ZITHER_LOG("END ZITHER");

	if (this->currentDeallocatorInjections != "") {
	    ZITHER_LOG("[DUMPED DEALLOCATOR INJECTIONS]");
	}
	if (this->currentHeaderInjections != "") {
	    ZITHER_LOG("[DUMPED HEADER INJECTIONS]");
	}
        
    }

    void ZitherCompiler::compilerInjection(std::string injectionIdentifier, std::string theInjectionInQuestion) {
	
	if (injectionIdentifier == "deallocator") {
	    this->currentDeallocatorInjections += theInjectionInQuestion;
	    ZITHER_LOG("[INJECTION<"+injectionIdentifier+">] INJECTED INTO NEXT DEALLOCATOR");
	} else 

	if (injectionIdentifier == "header") {
	    this->currentHeaderInjections += theInjectionInQuestion;
	    ZITHER_LOG("[INJECTION<"+injectionIdentifier+">] INJECTED INTO NEXT HEADER SPACE");
	} else 

	if (injectionIdentifier == "instant") {
	    ZITHER_LOG("[INJECTION<"+injectionIdentifier+">] INJECTED INSTANTLY");
	    CSOURCE_RAW("//INJECTION BEGIN\n");
	    CSOURCE_RAW(theInjectionInQuestion);
	    CSOURCE_RAW("\n//INJECTION END\n");
	} else 

	{
	   ZITHER_LOG("[INJECTION<"+injectionIdentifier+">] IGNORED");
	   bool someInjectionWasIgnoredSinceYouProbablyGaveItAWrongName = false;
	    std::string theWrongInjection = injectionIdentifier;
	    assert(someInjectionWasIgnoredSinceYouProbablyGaveItAWrongName);
	}
    }

    void ZitherCompiler::beginTemplate(std::string templateID) {
	ZITHER_LOG("---------------------------------------------------------------");
        ZITHER_LOG("BEGIN TEMPLATE " + templateID);

	this->currentTemplateID = templateID;
	this->dynamicTemplateObjects = std::vector<std::string>();
	CSOURCE_LINE("struct " + C_IDENTIFIER(this->currentTemplateID) + " {");
	CSOURCE_LINE(" "+DYNAMIC_OBJECT_BASE_STRUCTURE);

        INCREASE_INDENTATION_LEVEL;
    }
    void ZitherCompiler::endTemplate() {
        DECREASE_INDENTATION_LEVEL;
	ZITHER_LOG("END TEMPLATE");

	CSOURCE_LINE("};");

	std::string deallocatorMethod = ("dealloc_" + C_IDENTIFIER(this->currentTemplateID));
	CSOURCE_LINE(C_POINTER+" "+deallocatorMethod+"("+C_POINTER+" object) {");

	if (this->currentDeallocatorInjections != "") {
	    CSOURCE_RAW("//DEALLOCATOR INJECTION BEGIN\n");
	    CSOURCE_RAW(this->currentDeallocatorInjections);
	    CSOURCE_RAW("\n//DEALLOCATOR INJECTION END\n");
	    this->currentDeallocatorInjections = "";
	}

	for (std::string dynamicTemplateObject : this->dynamicTemplateObjects) {
	    CSOURCE_LINE(" ReleaseDynamicObject("+C_CAST("struct " + C_IDENTIFIER(this->currentTemplateID), "object")+"->"+C_IDENTIFIER(dynamicTemplateObject)+");");
	}
	
	CSOURCE_LINE(" return NULL;");
	CSOURCE_LINE("}");

	std::string allocatorMethod = IDENTIFIER_ALLOCATOR_METHOD_FOR_TEMPLATE(this->currentTemplateID);
	CSOURCE_LINE(C_POINTER+" "+allocatorMethod+"() {");
	CSOURCE_LINE(" "+C_POINTER+" newAllocatedObject = malloc(sizeof(struct " + C_IDENTIFIER(this->currentTemplateID) + "));");
	CSOURCE_LINE(MEMORY_LOG_ALLOCATE("newAllocatedObject"));	
	CSOURCE_LINE(" "+C_CAST(IDENTIFIER_DYNAMIC_OBJECT, "newAllocatedObject")+"->references=1;");
	CSOURCE_LINE(" "+C_CAST(IDENTIFIER_DYNAMIC_OBJECT, "newAllocatedObject")+"->deallocator=&"+deallocatorMethod+";");
	CSOURCE_LINE(" return newAllocatedObject;");
	CSOURCE_LINE("}");



	if (this->currentHeaderInjections != "") {
	    CSOURCE_RAW("//HEADER INJECTION BEGIN\n");
	    CSOURCE_RAW(this->currentHeaderInjections);
	    CSOURCE_RAW("\n//HEADER INJECTION END\n");
	    this->currentHeaderInjections = "";
	}

    }
    void ZitherCompiler::declareDynamicTemplateObject(std::string templateObjectID) {
        ZITHER_LOG("TEMPLATE DYNAMIC_OBJECT " + templateObjectID);
	
	CSOURCE_LINE(C_POINTER + " " + C_IDENTIFIER(templateObjectID)+";");

	this->dynamicTemplateObjects.push_back(templateObjectID);
    }
    void ZitherCompiler::declareStaticTemplateObject(std::string templateObjectID) {
        ZITHER_LOG("TEMPLATE STATIC_OBJECT " + templateObjectID);

	CSOURCE_LINE(C_POINTER + " " + C_IDENTIFIER(templateObjectID)+";");
    }

    void ZitherCompiler::declareMethod(std::string methodID, std::vector<std::string> expectedParamIDs) {
        ZITHER_LOG("DECLARE METHOD " + methodID + this->stringFromStringList(expectedParamIDs));

	std::string constructedCExpectedParameters = this->buildCParameterListFromParameterListOfZitherIDs(expectedParamIDs);
	CSOURCE_LINE(C_POINTER+" "+C_IDENTIFIER(methodID)+"("+constructedCExpectedParameters+");");
    }
    void ZitherCompiler::startMethodDefinition(std::string methodID, std::vector<std::string> expectedParamIDs) {
        RESET_TEMPORARY_IDENTIFIERS;

	ZITHER_LOG("START METHOD " + methodID + this->stringFromStringList(expectedParamIDs));
        INCREASE_INDENTATION_LEVEL;
	
	std::string constructedCExpectedParameters = this->buildCParameterListFromParameterListOfZitherIDs(expectedParamIDs);
 	CSOURCE_LINE(C_POINTER+" "+C_IDENTIFIER(methodID)+"("+constructedCExpectedParameters+") {{");
    }
    void ZitherCompiler::finishMethodDefinition() {
        DECREASE_INDENTATION_LEVEL;
        ZITHER_LOG("FINISH METHOD");

	CSOURCE_LINE("}return NULL;}");
    }
    void ZitherCompiler::returnObject(std::string objectID) {
        ZITHER_LOG("RETURN " + objectID);
	CSOURCE_LINE("return "+C_IDENTIFIER(objectID)+";");
    }
	
    void ZitherCompiler::createDynamicObjectWithTemplate(std::string templateID, std::string objectID) {
        ZITHER_LOG("CREATE DYNAMIC_OBJECT " + objectID + " WITH TEMPLATE " + templateID);
	CSOURCE_LINE(C_POINTER+" "+C_IDENTIFIER(objectID)+" = "+IDENTIFIER_ALLOCATOR_METHOD_FOR_TEMPLATE(templateID)+"();");
    }
    void ZitherCompiler::createStaticObjectWithMethod(std::string methodID, std::string objectID) {
        ZITHER_LOG("CREATE STATIC_OBJECT " + objectID + " WITH METHOD " + methodID);
	CSOURCE_LINE(C_POINTER+" "+C_IDENTIFIER(objectID)+" = &"+C_IDENTIFIER(methodID)+";");
    }
    void ZitherCompiler::assignToTemplateObject(std::string templateID, std::string templateObjectID, std::string assigneeObjectID, std::string assignedObjectID) {
        ZITHER_LOG("ASSIGN (" + assigneeObjectID + " AS " + templateID + ")->" + templateObjectID + " = " + assignedObjectID);
    	CSOURCE_LINE(C_CAST("struct "+C_IDENTIFIER(templateID), C_IDENTIFIER(assigneeObjectID)) + "->" + C_IDENTIFIER(templateObjectID) + " = " + C_IDENTIFIER(assignedObjectID) + ";");
    }	
    void ZitherCompiler::createObjectFromTemplateObject(std::string templateID, std::string templateObjectID, std::string newObjectID, std::string assignedObjectID) {
        ZITHER_LOG("CREATE OBJECT " + newObjectID + " = (" + assignedObjectID + " AS " + templateID + ")->" + templateObjectID);
    	CSOURCE_LINE(C_POINTER+" "+C_IDENTIFIER(newObjectID)+" = "+   C_CAST("struct "+C_IDENTIFIER(templateID), C_IDENTIFIER(assignedObjectID)) + "->" + C_IDENTIFIER(templateObjectID)  +";");
    }

    void ZitherCompiler::startMainMethod() {
	RESET_TEMPORARY_IDENTIFIERS;

	ZITHER_LOG("---------------------------------------------------------------");
	ZITHER_LOG("START MAIN");
        
	CSOURCE_LINE("void " + IDENTIFIER_MAIN_METHOD + "() {");

	INCREASE_INDENTATION_LEVEL;
    }
    void ZitherCompiler::finishMainMethod() {
        DECREASE_INDENTATION_LEVEL;

	CSOURCE_LINE("}");

        ZITHER_LOG("FINISH MAIN");
    }


    void ZitherCompiler::enterLocalScope() {
	ZITHER_LOG("ENTER LOCAL SCOPE");
	CSOURCE_LINE("{");

	INCREASE_INDENTATION_LEVEL;
    }
    void ZitherCompiler::exitLocalScope() {
        DECREASE_INDENTATION_LEVEL;

	CSOURCE_LINE("}");

        ZITHER_LOG("EXIT LOCAL SCOPE");
    }



    void ZitherCompiler::createStaticObjectWithEmptyValue(std::string newObjectID) {
        ZITHER_LOG("CREATE STATIC_OBJECT " + newObjectID + " WITH EMPTY_VALUE");
	CSOURCE_LINE(C_POINTER+" "+C_IDENTIFIER(newObjectID)+" = "+C_EMPTY_VALUE+";");
    }
    void ZitherCompiler::setObjectWithObject(std::string assigneeObjectID, std::string assignedObjectID) {
        ZITHER_LOG("ASSIGN " + assigneeObjectID + " = " + assignedObjectID);
	CSOURCE_LINE(C_IDENTIFIER(assigneeObjectID)+" = "+C_IDENTIFIER(assignedObjectID)+";");
    }

    void ZitherCompiler::releaseDynamicObject(std::string dynamicObjectID) {
        ZITHER_LOG("RELEASE " + dynamicObjectID);
	CSOURCE_LINE("ReleaseDynamicObject("+C_IDENTIFIER(dynamicObjectID)+");");
    }
    void ZitherCompiler::retainDynamicObject(std::string dynamicObjectID) {
        ZITHER_LOG("RETAIN " + dynamicObjectID);
	CSOURCE_LINE("RetainDynamicObject("+C_IDENTIFIER(dynamicObjectID)+");");
    }



    void ZitherCompiler::createStaticObjectWithLiteralStringValue(std::string newStaticObjectID, std::string literalStringRepresentation) {
        ZITHER_LOG("CREATE STATIC_OBJECT " + newStaticObjectID + " WITH LITERAL_STRING[\"" + literalStringRepresentation + "\"]");

	std::string cLiteralValue = "\""+literalStringRepresentation+"\"";
    	CSOURCE_LINE(C_POINTER+" "+C_IDENTIFIER(newStaticObjectID)+" = "+C_CAST("void", cLiteralValue)+";");
    }

    void ZitherCompiler::createStaticObjectWithLiteralByteValue(std::string newStaticObjectID, std::string literalByteRepresentation) {
        ZITHER_LOG("CREATE STATIC_OBJECT " + newStaticObjectID + " WITH LITERAL_BYTE[" + literalByteRepresentation + "]");
    
        std::string cLiteralValue = literalByteRepresentation;
    	CSOURCE_LINE(C_POINTER+" "+C_IDENTIFIER(newStaticObjectID)+" = "+C_CAST("void", cLiteralValue)+";");
    }

    void ZitherCompiler::createStaticObjectWithLiteralNaturalValue(std::string newStaticObjectID, std::string literalNaturalRepresentation) {
        ZITHER_LOG("CREATE STATIC_OBJECT " + newStaticObjectID + " WITH LITERAL_NATURAL[" + literalNaturalRepresentation + "]");
    
	assert(literalNaturalRepresentation.size() >= 0);
	std::string tempVariableIdentifier = GENERATE_TEMPORARY_IDENTIFIER;
	std::string questionableIntegerRepresentation = "{";
	int currentPositionInLiteralIntegerString = 0;
	if (literalNaturalRepresentation[currentPositionInLiteralIntegerString] == '-') {
	    questionableIntegerRepresentation += "-1";
	    currentPositionInLiteralIntegerString++;
	} else {
	    questionableIntegerRepresentation += "1";
 	}
	questionableIntegerRepresentation += ",";
	int currentIntegerSegmentSize = 0;

	int literalDigitsLeft = literalNaturalRepresentation.size() - currentPositionInLiteralIntegerString;
	int maxIntegerSegmentSizeForNotFirstSegment = 4;
	int maxIntegerSegmentSizeForFirstSegment = ((literalDigitsLeft % maxIntegerSegmentSizeForNotFirstSegment) == 0)?(maxIntegerSegmentSizeForNotFirstSegment):((literalDigitsLeft % maxIntegerSegmentSizeForNotFirstSegment));
	int maxIntegerSegmentSize = maxIntegerSegmentSizeForFirstSegment;

	std::string currentSegment = "";
	while (currentPositionInLiteralIntegerString < literalNaturalRepresentation.size()) {
	    if (currentSegment == "0") {
		if (literalNaturalRepresentation[currentPositionInLiteralIntegerString] != '0')
			currentSegment = literalNaturalRepresentation[currentPositionInLiteralIntegerString];
	    } else {
	    	currentSegment += literalNaturalRepresentation[currentPositionInLiteralIntegerString];
	    }
	    currentIntegerSegmentSize++;
	    if (currentIntegerSegmentSize == maxIntegerSegmentSize) {
	        questionableIntegerRepresentation += currentSegment + ",";
		maxIntegerSegmentSize = maxIntegerSegmentSizeForNotFirstSegment;
		currentIntegerSegmentSize = 0;
		currentSegment = "";
	    }
	    currentPositionInLiteralIntegerString++;
	}
	//questionableIntegerRepresentation += currentSegment;
	if (currentIntegerSegmentSize > 0)
	    questionableIntegerRepresentation += ",";
	questionableIntegerRepresentation += "-1}";
	CSOURCE_LINE("long "+tempVariableIdentifier+"[] = "+questionableIntegerRepresentation+";");
        std::string cLiteralValue = tempVariableIdentifier;
    	CSOURCE_LINE(C_POINTER+" "+C_IDENTIFIER(newStaticObjectID)+" = "+C_CAST("void", cLiteralValue)+";");
    }

    /*void ZitherCompiler::createStaticObjectWithLiteralFloatValue(std::string newStaticObjectID, std::string literalFloatRepresentation) {
        ZITHER_LOG("CREATE STATIC_OBJECT " + newStaticObjectID + " WITH LITERAL_FLOAT[" + literalFloatRepresentation + "]");
    	
	std::string tempVariableIdentifier = GENERATE_TEMPORARY_IDENTIFIER;
	CSOURCE_LINE("double "+tempVariableIdentifier+" = "+literalFloatRepresentation+";");
        std::string cLiteralValue = C_CAST_HACK_SOMETHING_INTO_C_POINTER(tempVariableIdentifier);
    	CSOURCE_LINE(C_POINTER+" "+C_IDENTIFIER(newStaticObjectID)+" = "+C_CAST("void", cLiteralValue)+";");
    }*/


 

#define ZITHER_FRAME(_staticFrame, _dynamicFrame) ("FRAME{STATIC"+this->stringFromStringList(_staticFrame)+",DYNAMIC"+this->stringFromStringList(_dynamicFrame)+"}")

    void ZitherCompiler::invokeDynamicObjectAsLambda(std::string resultObjectID, std::string lambdaObjectID, std::vector<std::string> inputParameterIDs) {
        ZITHER_LOG("CREATE OBJECT " + resultObjectID + " = INVOKE " + lambdaObjectID + this->stringFromStringList(inputParameterIDs));

	std::string staticMethodPointer = (C_CAST(IDENTIFIER_DYNAMIC_LAMBDA_OBJECT, C_IDENTIFIER(lambdaObjectID)))+"->method";
	
	std::string inputParameters = C_IDENTIFIER(lambdaObjectID)+"+sizeof("+IDENTIFIER_DYNAMIC_LAMBDA_OBJECT+")";
	if (inputParameterIDs.size() > 0) {
	    inputParameters += ", " + this->buildCParameterInputsFromParameterListOfZitherIDs(inputParameterIDs);
	}

	CSOURCE_LINE(C_POINTER + " " + C_IDENTIFIER(resultObjectID) + " = " + C_FUNCTION_POINTER_CAST(inputParameterIDs.size(), staticMethodPointer) + "("+inputParameters+");");
    }

    void ZitherCompiler::createDynamicObjectWithMethodFromStaticObject(std::string staticMethodObjectID, std::string dynamicObjectID, std::vector<std::string> staticObjectsInsertedIntoFrame, std::vector<std::string> dynamicObjectsInsertedIntoFrame) {
        ZITHER_LOG("CREATE DYNAMIC_OBJECT " + dynamicObjectID + " WITH METHOD[STATIC_OBJECT] " + staticMethodObjectID + " " + ZITHER_FRAME(staticObjectsInsertedIntoFrame, dynamicObjectsInsertedIntoFrame));

	CSOURCE_LINE(C_POINTER + " " + C_IDENTIFIER(dynamicObjectID) + " = " + IDENTIFIER_DYNAMIC_LAMBDA_ALLOCATOR_METHOD + "("+std::to_string(dynamicObjectsInsertedIntoFrame.size())+","+std::to_string(staticObjectsInsertedIntoFrame.size()+dynamicObjectsInsertedIntoFrame.size())+","+C_IDENTIFIER(staticMethodObjectID)+");");
	
	int objectFrameIndex = 0;
#define FRAME_INSERTION CSOURCE_LINE("*("+C_CAST(C_POINTER, C_IDENTIFIER(dynamicObjectID)+"+sizeof("+IDENTIFIER_DYNAMIC_LAMBDA_OBJECT+")+sizeof("+C_POINTER+")*"+std::to_string(objectFrameIndex))+") = "+C_IDENTIFIER(objectToInsertInFrame)+";")
	for (std::string objectToInsertInFrame : dynamicObjectsInsertedIntoFrame) {
	    CSOURCE_LINE("RetainDynamicObject(" + C_IDENTIFIER(objectToInsertInFrame)+");");
	    FRAME_INSERTION;
	    objectFrameIndex++;
	}
	for (std::string objectToInsertInFrame : staticObjectsInsertedIntoFrame) {
	    FRAME_INSERTION;
	    objectFrameIndex++;
	}
    }
    void ZitherCompiler::pullObjectsFromFrame(std::vector<std::string> staticObjectsToPullFromFrame, std::vector<std::string> dynamicObjectsToPullFromFrame) {
        ZITHER_LOG("PULL OBJECTS " + ZITHER_FRAME(staticObjectsToPullFromFrame, dynamicObjectsToPullFromFrame));
    
	int objectFrameIndex = 0;
#define FRAME_PULL CSOURCE_LINE(C_POINTER + " " + C_IDENTIFIER(objectToPullFromFrame) + " = *(" + C_CAST(C_POINTER, std::string(C_FRAME_IDENTIFIER)+"+sizeof("+C_POINTER+")*"+std::to_string(objectFrameIndex))+");")
	for (std::string objectToPullFromFrame : dynamicObjectsToPullFromFrame) {
	    FRAME_PULL;
	    objectFrameIndex++;
	}
	for (std::string objectToPullFromFrame : staticObjectsToPullFromFrame) {
	    FRAME_PULL;
	    objectFrameIndex++;
	}
    }



}





