//
//  ASTRoot.hpp
//  DainaCompiler
//
//  Created by SamWit on 26/02/2017.
//  Copyright © 2017 Samuel Whitton. All rights reserved.
//

#ifndef ASTRoot_hpp
#define ASTRoot_hpp

namespace Daina {
    class ASTRoot;
}

#include "AST.hpp"
#include "Parser.hpp"
#include "ASTSet.hpp"
#include "ASTClass.hpp"

namespace Daina {
    
    class ASTRoot : public AST {

        
    protected:
        virtual std::string buildDescriptionPart() {
            return "ASTRoot";
        }
        
    public:
        std::vector<ASTSet *> sets = std::vector<ASTSet *>();
        std::vector<ASTClass *> classes = std::vector<ASTClass *>();

        std::vector<ASTClass *> classOrder;
        ASTClass *entryPointClass;
        
        ASTRoot(Parser *parser) : AST(ASTTypeRoot) {
            //S = class | set
            parser->logMessage("started parsing root tree");
           
            Token *t = nullptr;
            while ( (t = tPEEK) ) {
                /*if (t->type() == TokenType::tAAt) {
                    //set
                    sets.push_back(this->dependant(new ASTSet(parser)));
                    
                } else */if (t->type() == TokenType::tASqBraceOpen) {
                    //class
                    classes.push_back(this->dependant(new ASTClass(parser)));
                    
                } else {
                    parser->error({t}, "top level construct must be class");
                }
            }
            parser->logMessage("finished parsing root tree");
        }

	std::string describeInterfaceOfClassConstructs() {
	    std::string description = "";
	    for (ASTClass *classAST : this->classOrder) {
		description += "\n\n" + this->describeInterfaceOfClassConstruct(classAST);
	    }
	    return description + "\n\n";
	}

        std::string describeInterfaceOfClassConstruct(ASTClass *classAST) {
	    std::string description = classAST->identifier->identifierString + (classAST->generics!=nullptr?("<"+this->describeGenericsList(classAST->generics->list)+">"):("")) + " : " + this->describeType(classAST->parentType);
	    std::string descriptionOFInternalMethods = "";
	    std::string descriptionOFOpenMethods = "";
	    std::string descriptionOFStaticMethods = "";
	    for (ASTClassElement *component : classAST->components) {
		bool isStaticMethod = (component->type == constructor || component->type == staticMethod);
		bool isInternalMethod = (component->type == instanceMethod && component->visibility == methodInternal);
		bool isOpenMethod = (component->type == instanceMethod && component->visibility == methodOpen);
	        if (isStaticMethod || isInternalMethod || isOpenMethod) {
		    std::string desciptionOfMethodClassification = "++";
		    if (isStaticMethod) desciptionOfMethodClassification = "::";
		    if (isInternalMethod) desciptionOfMethodClassification = "+";
		    if (component->overriding) {
			desciptionOfMethodClassification = "|" + desciptionOfMethodClassification;
		    }
		    std::string descriptionOfElement = "\t" + desciptionOfMethodClassification + " " +  (component->identifier->identifierString) + " " + this->describeType(component->lambda->getDeclaredType());
		    if (isStaticMethod)
			descriptionOFStaticMethods += "\n" + descriptionOfElement;
		    if (isInternalMethod)
			descriptionOFInternalMethods += "\n" + descriptionOfElement;
		    if (isOpenMethod)
			descriptionOFOpenMethods += "\n" + descriptionOfElement;
		}
	    }
	    description += descriptionOFStaticMethods + descriptionOFOpenMethods + descriptionOFInternalMethods;
	    return description;
	}
	
	std::string describeGenericsList(std::vector<ASTGeneric *> generics) {
		std::string descriptionOfGenericsList = "";
		std::string seperator = "";
		for (ASTGeneric * generic : generics) {
			descriptionOfGenericsList += seperator + generic->identifier->identifierString + ":" + this->describeType(generic->superType);
			seperator = ",";
		}
		return descriptionOfGenericsList;
	}

	std::string describeType(ASTType *type) {
	    if (type->isEmptyType()) return "[]";

	    std::string description = "[";
	    if (type->isLiteralType()) description += "%";
	    if (type->isGenericType) description += "&";
	    if (type->typeIdentifier != nullptr) {
		description += type->typeIdentifier->identifierString;
	    }
	    if (type->genericSpecifications.size() > 0) {
		description += "<" + this->descriptionOfypeListSeperatedByComma(type->genericSpecifications) + ">";
	    }
	    if (type->reactants.size() > 0) {
		description += this->descriptionOfypeListSeperatedByComma(type->reactants);
	    }
	    if (type->isLambdaType()) {
		description += " -> ";
	    }
	    if (type->products.size() > 0) {
		description += this->descriptionOfypeListSeperatedByComma(type->products);
	    }
	    description += "]";

	    return description;
	}

	std::string descriptionOfypeListSeperatedByComma(std::vector<ASTType *> typeList) {
	    std::string description = "";
	    std::string seperator = "";
	    for (ASTType *type : typeList) {
		description += seperator + this->describeType(type);
	   	seperator = ",";
	    }
	    return description;
	}
    };
}

#endif /* ASTRoot_hpp */
