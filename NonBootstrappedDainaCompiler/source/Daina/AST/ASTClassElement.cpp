//
//  ASTClassElement.cpp
//  DainaCompiler
//
//  Created by SamWit on 11/03/2017.
//  Copyright © 2017 Samuel Whitton. All rights reserved.
//

#include "ASTClassElement.hpp"



namespace Daina {

    void ASTClassElement::analyseAndCompleteASTHeaderTypeInference(Analyser *analyser, StaticAnalysisScope *scope) {
        bool hasLambdaComponent = !(this->type == ClassElementType::compilerDirective);

	if (hasLambdaComponent) {
            if (this->type == ClassElementType::staticMethod)
                this->lambda->analyseAndCompleteASTHeaderTypeInferenceInStaticContext(analyser, scope);
	    else if (this->type == ClassElementType::constructor)
                this->lambda->analyseAndCompleteASTHeaderTypeInferenceInConstructorContext(analyser, scope);
            else 
                this->lambda->analyseAndCompleteASTHeaderTypeInferenceInInstanceContext(analyser, scope);
        }
    }

    void ASTClassElement::analyseAndCompleteASTHeader(Analyser *analyser, StaticAnalysisScope *scope) {
        

	if (this->type == ClassElementType::compilerDirective) {
	    scope->insertCompilerInjectionIntoClassScopeWithIdentifier(this->injection, this->identifier);
	} else {
            this->lambda->linkToClassElementOwner(this);
            this->lambda->analyseAndCompleteASTHeader(analyser, scope);

            if (this->type == ClassElementType::entryPoint) {
                if (!this->lambda->lambdaTypeIsValidEntryPointType()) {
		    SYNTAX_ERROR(this->lambda, "lambda type is not a valid entry point type");
		}
                scope->insertEntryPointIntoClassScope(this->lambda);
            } else 

            if (this->type == ClassElementType::boolean) {
                assert(0==1);
                if (!this->lambda->lambdaTypeIsValidBooleanType()) {
		    SYNTAX_ERROR(this->lambda, "lambda type is not a valid boolean type");
		}
                scope->insertBooleanIntoClassScope(this->lambda);
            } else 

            {

                if (this->type == ClassElementType::constructor) {
                    if (!this->lambda->lambdaTypeIsValidConstructorTypeForClass(scope->classInScope())) {
		        SYNTAX_ERROR(this->lambda, "lambda type is not a valid constructor type for class");
		    }
                }

                bool isStaticMethod = (this->type == ClassElementType::constructor) || (this->type == ClassElementType::staticMethod);
                scope->attemptToInsertLambdaMethodIntoClassScope(this->lambda, this->identifier, isStaticMethod, this->overriding, this->visibility);
            }
	}
	
    }


    void ASTClassElement::analyseAndCompleteASTBody(Analyser *analyser, StaticAnalysisScope *scope) {

        bool hasLambdaComponent = !(this->type == ClassElementType::compilerDirective);

	if (hasLambdaComponent) {
            if (this->type == ClassElementType::staticMethod)
                this->lambda->analyseAndCompleteASTBodyInStaticContext(analyser, scope);
	    else if (this->type == ClassElementType::constructor)
                this->lambda->analyseAndCompleteASTBodyInConstructorContext(analyser, scope);
            else 
                this->lambda->analyseAndCompleteASTBodyInInstanceContext(analyser, scope);
	}
    }



    
        ASTClassElement::ASTClassElement(Parser *parser) : AST(ASTTypeClassElement) {
            //class_element -> compiler_directive | ('?' boolean) | ('~'|'~+'|'~++' constructor) | ('^' entry_point) | ('::' method) | ('-' property) | ('|'? (('+'|'++')? method) ))
            
            //compiler_directive -> '<' id ######
            //? lambda
            //~ id lambda
            //- type id (get (id?))? (set (id?))?;
            
            visibility = MethodVisibility::methodIsolated;
            
            bool parseId = false;
            bool parseLambda = false;
            
            if (tIS(TokenType::tALeThan)) {
                tEXPECT(TokenType::tALeThan);
                type = ClassElementType::compilerDirective;
                
                tGUARD_NEXT(TokenType::tIdentifier, "expecting identifier for compiler directive");
                identifier = this->dependant(new ASTIdentifier(parser));
                injection = (TCompilerInjection *)tGUARD_TAKE_NEXT(TokenType::tCompilerInjection, "expecting compiler injection for compiler directive");
                
            } else if (tIS(TokenType::tAQMark)) {
                tEXPECT(TokenType::tAQMark);
                type = ClassElementType::boolean;
                
                parseLambda = true;
                
            } else if (tIS(TokenType::tATilde)) {
                tEXPECT(TokenType::tATilde);
                type = ClassElementType::constructor;
		visibility = MethodVisibility::methodOpen;

		/*
                if (tIS(TokenType::tAPlusPlus)) {
                    tEXPECT(TokenType::tAPlusPlus);
                    visibility = MethodVisibility::methodOpen;
                    
                } else if (tIS(TokenType::tAPlus)) {
                    tEXPECT(TokenType::tAPlus);
                    visibility = MethodVisibility::methodInternal;
                }
		*/
                
                parseId = true;
                parseLambda = true;
                
            } else if (tIS(TokenType::tAHat)) {
                tEXPECT(TokenType::tAHat);
                type = ClassElementType::entryPoint;
                
                parseLambda = true;
                
            } else if (tIS(TokenType::tAColonColon)) {
                tEXPECT(TokenType::tAColonColon);
                type = ClassElementType::staticMethod;
                visibility = MethodVisibility::methodOpen;
                
                parseId = true;
                parseLambda = true;
                
            } else if (tIS(TokenType::tAPlus) || tIS(TokenType::tAPlusPlus) || tIS(TokenType::tAPipe) || tIS(TokenType::tASubt)) {
                type = ClassElementType::instanceMethod;

		if (tIS(TokenType::tASubt)) {
                    tEXPECT(TokenType::tASubt);
		} else {
                
                    if (tIS(TokenType::tAPipe)) {
                        tEXPECT(TokenType::tAPipe);
                        overriding = true;
                    }
                
                    if (tIS(TokenType::tAPlusPlus)) {
                        tEXPECT(TokenType::tAPlusPlus);
                        visibility = MethodVisibility::methodOpen;
                    
                    } else if (tIS(TokenType::tAPlus)) {
                        tEXPECT(TokenType::tAPlus);
                        visibility = MethodVisibility::methodInternal;
                    }
		}
                
                parseId = true;
                parseLambda = true;
            /*
            } else if (tIS(TokenType::tASubt)) {
                tEXPECT(TokenType::tASubt);
                type = ClassElementType::property;
                
                propertyType = ASTType::parseTypeAttachingAsDependantToAST(parser, this);
                
                tGUARD_NEXT(TokenType::tIdentifier, "attribute identifier expected")
                propertyIdentifier = this->dependant(new ASTIdentifier(parser));
                
                while (!tIS(TokenType::tASemiColon)) {
                    
                    if (tIS(TokenType::tKWSet)) {
                        tEXPECT(TokenType::tKWSet);
                        
                        if (propertySetterIdentifier != nullptr) {
                            tERROR("duplicate setter declaration");
                        }
                        
                        if (tIS(TokenType::tIdentifier)) {
                            propertySetterIdentifier = this->dependant(new ASTIdentifier(parser));
                        } else {
                            propertySetterIdentifier = this->dependant(new ASTIdentifier("set_"+propertyIdentifier->identifierString));
                        }
                        
                    } else if (tIS(TokenType::tKWGet)) {
                        tEXPECT(TokenType::tKWGet);
                        
                        if (propertyGetterIdentifier != nullptr) {
                            tERROR("duplicate getter declaration");
                        }
                        
                        if (tIS(TokenType::tIdentifier)) {
                            propertyGetterIdentifier = this->dependant(new ASTIdentifier(parser));
                        } else {
                            propertyGetterIdentifier = this->dependant(new ASTIdentifier("get_"+propertyIdentifier->identifierString));
                        }
                    } else {
                        tERROR("unexpected token, expecting getter or setter declaration");
                    }
                }
                
                tEXPECT(TokenType::tASemiColon);
                */
            } else {
                tERROR("unexpected token, expecting class element");
            }
            
            if (parseId) {
                tGUARD_NEXT(TokenType::tIdentifier, "expecting identifier for method");
                identifier = this->dependant(new ASTIdentifier(parser));
            }
    
            if (parseLambda) {
                tGUARD_NEXT(TokenType::tAAsterix, "expecting lambda expression");
                lambda = this->dependant(new ASTLambda(parser));
            }
        }

}





