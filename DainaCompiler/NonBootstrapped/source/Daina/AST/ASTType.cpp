//
//  ASTType.cpp
//  DainaCompiler
//
//  Created by SamWit on 7/03/2017.
//  Copyright © 2017 Samuel Whitton. All rights reserved.
//

#include "ASTType.hpp"


namespace Daina {
    
    ASTType::ASTType(Parser *parser, bool prime) : ASTType() {
        //type -> '[' (type')* ('->' (type')*)? ']'
        //type' -> type | type_atom
        //type_atom -> type_atom_classtype | type_atom_literaltype 
	//type_atom_classtype = identifier ('<' generic_list '>')?
	//type_atom_literaltype = '%' identifier
	//type_atom_generictype = '#' identifier
        
        if (tIS(TokenType::tASqBraceOpen)) {
            tGUARD_TAKE_NEXT(TokenType::tASqBraceOpen, "expecting type");
            
#define tIS_TYPE_ATOM (tIS(TokenType::tASqBraceOpen) || tIS(TokenType::tIdentifier) || tIS(TokenType::tAPercent) || tIS(TokenType::tAAmp))
            while (tIS_TYPE_ATOM) {
		reactants.push_back(ASTType::parseTypeAttachingAsDependantToAST(parser, this));
                //reactants.push_back(this->dependant(new ASTType(parser, true)));
            }
            
            if (tIS(TokenType::tAArrow)) {
                tEXPECT(TokenType::tAArrow);

                isLambda = true;
                
                while (tIS_TYPE_ATOM) {
		    products.push_back(ASTType::parseTypeAttachingAsDependantToAST(parser, this));
                    //products.push_back(this->dependant(new ASTType(parser, true)));
                }
            }
            
            tGUARD_TAKE_NEXT(TokenType::tASqBraceClosed, "expecting closing square bracket for type");
            
        } else {

            std::string identifierExpectedError = "expecting class type identifier";
	    bool allowGenericSpecificationList = true;

	    if (tIS(TokenType::tAPercent)) {
                tEXPECT(TokenType::tAPercent);
                this->isALiteralType = true;
                allowGenericSpecificationList = false;

		identifierExpectedError = "expecting literal type identifier";
            }
    
	    if (tIS(TokenType::tAAmp)) {
                tEXPECT(TokenType::tAAmp);
                this->isGenericType = true;
                allowGenericSpecificationList = false;

		identifierExpectedError = "expecting generic type identifier";
            }
		

	    if (!tIS(TokenType::tIdentifier)) {
                tERROR(identifierExpectedError);
            }
            typeIdentifier = this->dependant(new ASTIdentifier(parser));

            if (allowGenericSpecificationList && tIS(TokenType::tALeThan)) {
                tEXPECT(TokenType::tALeThan);
                
                if (!tFOLLOWS_TYPE) {
                    tERROR("expecting generic specification list");
                }

                while (tFOLLOWS_TYPE) {
		    this->genericSpecifications.push_back(ASTType::parseTypeAttachingAsDependantToAST(parser, this));
                    //this->genericSpecifications.push_back(this->dependant(new ASTType(parser, true)));
                }
                tGUARD_TAKE_NEXT(TokenType::tAGrThan, "expecting greater-then symbol to end generic specification list");
            }
        }
    }

    ASTType *ASTType::parseTypeAttachingAsDependantToAST(Parser *parser, AST *ASTToBecomeDependantUpon) {
	ASTType *newType = ASTToBecomeDependantUpon->adoptSomeDependantAST(new ASTType(parser, false));
	if (newType->products.size() == 0 && newType->reactants.size() == 1 && !newType->isLambda) {
	    return newType->reactants[0];
	}
	return newType;
    }

    
    ASTType::ASTType() : AST(ASTTypeType) {

    }

    ASTType *ASTType::createNewTypeFromLiteralTypeType(LiteralType literalTypeType) {
        ASTType *literalType = new ASTType();
        literalType->isALiteralType = true;
        literalType->literalType = literalTypeType;
        return literalType;
    }

    ASTType *______theemptytype = nullptr;
    ASTType *ASTType::emptyType() {
        if (______theemptytype == nullptr) {
            ______theemptytype = new ASTType();
        }
        return ______theemptytype;
    }

    bool ASTType::isLiteralType() {
        return isALiteralType;
    }
 
    bool ASTType::isEmptyType() {
        return !isALiteralType && typeIdentifier==nullptr && genericSpecifications.size()==0 && reactants.size()==0 && products.size()==0 && !isLambda;
    }

    bool ASTType::isAValidParentType() {
        return !isLambda && !isALiteralType && !isGenericType;
    }

    ASTType *ASTType::getLambdaProduct() {
        assert(isLambda);
        if (this->products.size() > 0)
            return this->products[0];
        else return nullptr;
    }

    bool ASTType::isLambdaType() {
        return isLambda;
    }
    
    std::vector<ASTType *> ASTType::getLambdaReactants() {
        return this->reactants;
    }


    const static std::map<std::string, LiteralType> literalTypeMapping =
    {
        {"NATURAL", literalNatural},
        {"BYTE", literalByte},
        {"STRING", literalString}
    };  
 
    void ASTType::analyseAndCompleteAST(Analyser *analyser, StaticAnalysisScope *scope) {

        bool validTypeConstruction = (products.size() <= 1 && (isLambda || reactants.size() <= 1));
	if (!validTypeConstruction) {
            SYNTAX_ERROR(this, "invalid construction of type");
        }     

	for (ASTType *componentType : this->reactants) {
            componentType->analyseAndCompleteAST(analyser, scope);
        }

        for (ASTType *componentType : this->products) {
            componentType->analyseAndCompleteAST(analyser, scope);
        }

        if (this->isALiteralType) {
            if (literalTypeMapping.find(this->typeIdentifier->identifierString) == literalTypeMapping.end()) {
                SYNTAX_ERROR(this->typeIdentifier, "unknown literal type");
            }
            this->literalType = literalTypeMapping.at(this->typeIdentifier->identifierString);
        } else 

	if (this->isGenericType) {
	    this->genericSuperTypeLink = scope->findGenericSuperTypeLinkForIdentifierWithinScope(this->typeIdentifier);
            this->genericTypeIndexBinding = scope->findGenericIndexBindingLinkForIdentifierWithinScope(this->typeIdentifier);

	} else

        if (this->typeIdentifier != nullptr) {
	    scope->linkIdentifierToClassWithinScope(this->typeIdentifier);
	    ASTClass *baseClassForType = this->typeIdentifier->link;

	    if (genericSpecifications.size() > 0) {
                int numberOfGenericTypesInClass = (baseClassForType->generics==nullptr)?0:(baseClassForType->generics->list.size());
                if (genericSpecifications.size() > numberOfGenericTypesInClass) {
                    SYNTAX_ERROR(this->typeIdentifier, "generic specification sequence should not be greater than the number of generic types for the class");
                }

		int indexOfGenericList = -1;
                for (ASTType *genericSpecification : this->genericSpecifications) {
                    indexOfGenericList++;
                    genericSpecification->analyseAndCompleteAST(analyser, scope);
                    ASTGeneric *generic = baseClassForType->generics->list[indexOfGenericList];
                    if (generic->superType != nullptr && !generic->superType->typeSubsumesType(genericSpecification)) {
			bool genericSupertypesMatch = (genericSpecification->isGenericType) && generic->superType->typeSubsumesType(genericSpecification->genericSuperTypeLink); 
			if (!genericSupertypesMatch) {
                            SYNTAX_ERROR(genericSpecification, "generic specification must be a subtype of the corresponding generic super type");
                    	}
		    }
                }
            }

	} else {
            assert(genericSpecifications.size()==0);
	    if (!(this->isLambda || this->isEmptyType())) {
                SYNTAX_ERROR(this, "invalid type construction");
	    }
        }
    }



    bool ASTType::typeSubsumesType(ASTType *anotherType) {
	if (this->isEmptyType()) {
	    return true;
	}

	if (anotherType->isEmptyType()) {
	    return false;
	}

        if (this->isGenericType != anotherType->isGenericType) {
	    if (!anotherType->isGenericType)
		return false;

	    return (this->typeSubsumesType(anotherType->genericSuperTypeLink));
	}

        if (this->isALiteralType != anotherType->isALiteralType) {
            return false;
	}

        if (anotherType->isLambda != this->isLambda) {
            return false;
	}

        if (anotherType->reactants.size() != this->reactants.size() 
		|| !ASTType::typeListSubsumesTypeList(anotherType->reactants, this->reactants))
            return false;

        if (anotherType->products.size() != this->products.size() 
		|| !ASTType::typeListSubsumesTypeList(this->products, anotherType->products))
            return false;

        if (this->isALiteralType) {
	    if (this->literalType != anotherType->literalType)
		return false;

            
        } else 

        if (this->isGenericType) {
            if (!this->typeIdentifier->isIdentityEqualToIdentifier(anotherType->typeIdentifier)) {
		return false;
	    }
            
        } else 

        if (!this->isEmptyType() && this->isAValidClassType()) {
            if (anotherType->isEmptyType())
                return false;

	    ASTClass *thisBaseClass = this->baseClass();
	    ASTClass *anotherTypeBaseClass = anotherType->baseClass();
	    assert(anotherTypeBaseClass != nullptr);
	    assert(thisBaseClass != nullptr);

	    if (thisBaseClass == anotherTypeBaseClass) {
                if (!ASTType::typeListSubsumesTypeList(this->genericSpecifications, anotherType->genericSpecifications))
                    return false;
	    } else { 
		if (!this->typeSubsumesType(anotherTypeBaseClass->parentType->seedCompositeTypesWithGenericSpecificationsFromGivenClassType(nullptr, anotherType))) {
		    return false;
	        }
	    }

            //if (!thisBaseClass->classSubsumesClass(anotherTypeBaseClass))
 		//return false;
	}

        return true;
    }

    bool ASTType::typeListSubsumesTypeList(std::vector<ASTType *> typelist1, std::vector<ASTType *> typelist2) {
        if (typelist1.size() > typelist2.size())
            return false;

        for (int typeIndex = 0; typeIndex < typelist1.size(); typeIndex++) {
	    if (!typelist1[typeIndex]->typeSubsumesType(typelist2[typeIndex]))
		return false;
	}

        return true;
    }

    ASTClass *ASTType::baseClass() {
	if (this->genericSuperTypeLink != nullptr) {
	    return this->genericSuperTypeLink->baseClass();
	}

	assert(this->isAValidParentType());

	if (this->typeIdentifier != nullptr)
	    return this->typeIdentifier->link;

	assert(this->reactants.size() == 1);
	return (this->reactants[0])->baseClass();
    }

    bool ASTType::isAValidClassType() {
        return (this->isAValidParentType() && !this->isEmptyType()) || (this->genericSuperTypeLink != nullptr && this->genericSuperTypeLink->isAValidClassType());
    }

    LiteralType ASTType::literalTypeType() {
        return this->literalType;
    }


    ASTType *ASTType::createNewLambdaTypeWithReactantTypesAndProductType(ASTType *product, std::vector<ASTType *> reactants) {
        ASTType *newLambdaType = new ASTType();
        newLambdaType->isLambda = true;
        if (product != nullptr)
            newLambdaType->products.push_back(product);
        newLambdaType->reactants = reactants;
        return newLambdaType;
    }

    ASTType *ASTType::seedCompositeTypesWithGenericSpecificationsFromGivenClassType(Analyser *analyser, ASTType *classTypeToSeedGenerics) {
        assert(!this->isGenericType);
	return ASTType::seedCompositeTypesOrReplaceTypeWithGenericSpecificationsForSomeType(analyser, classTypeToSeedGenerics->genericSpecifications, this);
    }

    ASTType *ASTType::seedCompositeTypesOrReplaceTypeWithGenericSpecificationsForSomeType(Analyser *analyser, std::vector<ASTType *> genericSpecifications, ASTType *theTypeInQuestion) {
        if (theTypeInQuestion->isGenericType) {
            bool hasSpecification = (genericSpecifications.size() > theTypeInQuestion->genericTypeIndexBinding);
	    if (hasSpecification) {
		return genericSpecifications[theTypeInQuestion->genericTypeIndexBinding];
	    } else {
                return (theTypeInQuestion->genericSuperTypeLink != nullptr)?(theTypeInQuestion->genericSuperTypeLink):(ASTType::emptyType());
	    }
        }

	std::vector<ASTType *> newGenericSpecifications = ASTType::seedCompositeTypesOrReplaceTypesWithGenericSpecificationsForSomeTypeList(analyser, genericSpecifications, theTypeInQuestion->genericSpecifications);
	std::vector<ASTType *> newReactants = ASTType::seedCompositeTypesOrReplaceTypesWithGenericSpecificationsForSomeTypeList(analyser, genericSpecifications, theTypeInQuestion->reactants);
	std::vector<ASTType *> newProducts = ASTType::seedCompositeTypesOrReplaceTypesWithGenericSpecificationsForSomeTypeList(analyser, genericSpecifications, theTypeInQuestion->products);

	ASTType *newType = theTypeInQuestion->dependant(createNewLambdaTypeWithReactantTypesAndProductType(nullptr, newReactants));
	newType->products = newProducts;
	newType->genericSpecifications = newGenericSpecifications;
	newType->typeIdentifier = theTypeInQuestion->typeIdentifier;
	newType->isLambda = theTypeInQuestion->isLambda;
	newType->isALiteralType = theTypeInQuestion->isALiteralType;
	newType->literalType = theTypeInQuestion->literalType;
	
        return newType;
    }

    std::vector<ASTType *> ASTType::seedCompositeTypesOrReplaceTypesWithGenericSpecificationsForSomeTypeList(Analyser *analyser, std::vector<ASTType *> genericSpecifications, std::vector<ASTType *> theTypeListInQuestion) {
	std::vector<ASTType *> theNewTypeList = std::vector<ASTType *>();
	for (ASTType *theTypeListInQuestionElement : theTypeListInQuestion) {
            theNewTypeList.push_back(ASTType::seedCompositeTypesOrReplaceTypeWithGenericSpecificationsForSomeType(analyser, genericSpecifications, theTypeListInQuestionElement));
        }
 	return theNewTypeList;
    }

    ASTType *ASTType::createNewClassTypeWithClass(ASTClass *classAST) {
        ASTType *newClassType = new ASTType();
	newClassType->typeIdentifier = classAST->identifier;
        return newClassType;
    }
}

