//
//  Analyser.cpp
//  DainaCompiler
//
//  Created by SamWit on 24/03/2018.
//  Copyright © 2017 Samuel Whitton. All rights reserved.
//

#include "Analyser.hpp"

#include "ASTRoot.hpp"



namespace Daina {

    void Analyser::analyseAndCompleteAST(AST *astRoot) {
	Analyser *analyser = this;

	assert(astRoot->getType() == ASTTypeRoot);

        ASTRoot *root = (ASTRoot *)astRoot;

	std::vector<ASTClass *> classes = root->classes;

        ASTClass *entryPointClass = this->linkClassesTogetherReturningEntryPointSeperately(classes);

        std::vector<ASTClass *> classOrderBeforePruning = this->findClassOrder(classes); 

	ANALYSIS_INFO("class order found...");
	
	ANALYSIS_INFO("pruning classes not in main dependancy tree...");
	std::map<std::string, char *> mapOfDependanciesLinkedToRootEntryPointClass = std::map<std::string, char *>();
	this->completeMappingWithClassDependanciesBranchingFromRootOfTree(&mapOfDependanciesLinkedToRootEntryPointClass, entryPointClass);
	std::vector<ASTClass *> classOrderAfterPruning = std::vector<ASTClass *>();
	for (ASTClass *classASTInClassOrderBeforePruning : classOrderBeforePruning) {
		bool linkedToMainDependancyTree = (mapOfDependanciesLinkedToRootEntryPointClass.find(classASTInClassOrderBeforePruning->identifier->identifierString) != mapOfDependanciesLinkedToRootEntryPointClass.end());
		if (linkedToMainDependancyTree) {
			classOrderAfterPruning.push_back(classASTInClassOrderBeforePruning);
		} else {
			ANALYSIS_INFO("pruning class - " + classASTInClassOrderBeforePruning->identifier->identifierString);
		}
	}
	
	
	std::vector<ASTClass *> classOrder = classOrderAfterPruning;
	
	
	for (ASTClass *classAST : classOrder) {	
	    classAST->analyseAndCompleteAST(analyser);
	}

	entryPointClass->analyseAndCompleteAST(analyser);

	for (ASTClass *classAST : classOrder) {	
	    if (classAST->dependants != nullptr) {
		for (ASTIdentifier *classDependant : classAST->dependants->list) {
		    if (classDependant->link == nullptr) {
			SYNTAX_ERROR(classDependant, "dependancy to match class dependant not found");
		    }
		}
	    }
	}

	if (entryPointClass->dependants != nullptr) {
		SYNTAX_ERROR(entryPointClass->dependants, "entry point class cannot have dependants");
	}

        root->entryPointClass = entryPointClass;
	root->classOrder = classOrder;
        

        //SYNTAX_ERROR(astRoot, "a noob syntax error");
        //ANALYSIS_ERROR("analyser is not fully implemented");
    }
    
    void Analyser::completeMappingWithClassDependanciesBranchingFromRootOfTree(std::map<std::string, char *> *classDependancyMappingToComplete, ASTClass *rootClass) {
    	if (rootClass->dependancies != nullptr) {
    		 for (ASTIdentifier *dependancy : rootClass->dependancies->list) {
    		 	(*classDependancyMappingToComplete)[dependancy->identifierString] = (char*)1;
    		 	this->completeMappingWithClassDependanciesBranchingFromRootOfTree(classDependancyMappingToComplete, dependancy->link);
    		 }
    	}
    }



    std::vector<ASTClass *> Analyser::findClassOrder(std::vector<ASTClass *> &classes) {
        Analyser *analyser = this;

        std::vector<ASTClass *> classOrder = std::vector<ASTClass *>();

        int tagValueFoundPlaceInClassOrder = 1;

        while (classOrder.size() < classes.size()) {
            ASTClass *nextClassInOrder = nullptr;

            for (ASTClass *classAST : classes) {
                if (classAST->tag != tagValueFoundPlaceInClassOrder) {
                    bool candidateForNextClassOrder = true;
                     
                    if (classAST->dependancies != nullptr) {
                        for (ASTIdentifier *dependancy : classAST->dependancies->list) {
                            if (((ASTClass *)dependancy->link)->tag != tagValueFoundPlaceInClassOrder) {
                                      
				//ANALYSIS_INFO("outof order dependancy for class " + classAST->identifier->identifierString + " found - " + ((ASTClass *)dependancy->link)->identifier->identifierString);
				candidateForNextClassOrder = false;
                                break;
                            }
                        }
                    }

                    if (candidateForNextClassOrder) {
                        nextClassInOrder = classAST;
                        break;
                    }
                }
            }

            if (nextClassInOrder == nullptr) {
                ANALYSIS_ERROR("could not find class order, could not reconcile looped dependancy");
            } else {
                classOrder.push_back(nextClassInOrder);
                nextClassInOrder->tag = tagValueFoundPlaceInClassOrder;
                //ANALYSIS_INFO("Class in order - " + nextClassInOrder->identifier->identifierString);
            }
        }
        
        return classOrder;
    }  


    ASTClass *Analyser::linkClassesTogetherReturningEntryPointSeperately(std::vector<ASTClass *> &classes) {
        Analyser *analyser = this;

        std::map<std::string, ASTClass *> classMap = std::map<std::string, ASTClass *>();
        
	ASTClass *entryPoint = nullptr;
        int index = -1;
        int entryPointIndex = -1;
	for (ASTClass *classAST : classes) {
            index++;
            if (classAST->isEntryPoint()) {
                if (entryPoint == nullptr) {
                    entryPoint = classAST;
                    entryPointIndex = index;
                } else {
                    SYNTAX_ERROR(classAST, "duplicate entry point class");
                }
	    } else {
                if (classMap.find(classAST->identifier->identifierString) == classMap.end())
                    classMap[classAST->identifier->identifierString] = classAST;
                else {
                    SYNTAX_ERROR(classAST->identifier, "duplicate class name");
                }
            }
	}

        for (ASTClass *classAST : classes) {
            std::vector<ASTIdentifier *> dependancies = (classAST->dependancies == nullptr)?
                                   (std::vector<ASTIdentifier *>()):(classAST->dependancies->list);
            for (ASTIdentifier *identifier : dependancies) {
                if (classMap.find(identifier->identifierString) == classMap.end()) {
                    SYNTAX_ERROR(identifier, "cannot find reference to dependancy");
                } else {
                    ASTClass *linkedClass = classMap[identifier->identifierString];

		    if (!linkedClass->requestPermissionForClassToBecomeDependantWithClass(classAST)) {
			SYNTAX_ERROR(identifier, "dependancy was restricted by dependancy class");
		    }

                    identifier->linkToClass(linkedClass);
                }
            }
        }

	if (entryPoint == nullptr) {
            ANALYSIS_ERROR("no entry point class found");
        } else {
            classes.erase(classes.begin() + entryPointIndex);
        }
        return entryPoint;
    }

    

    //ASTClass *pullOutEntryPointVector
    
}



