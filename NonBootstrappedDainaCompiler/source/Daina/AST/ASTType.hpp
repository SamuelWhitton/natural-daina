//
//  ASTType.hpp
//  DainaCompiler
//
//  Created by SamWit on 7/03/2017.
//  Copyright © 2017 Samuel Whitton. All rights reserved.
//

#ifndef ASTType_hpp
#define ASTType_hpp

#define tFOLLOWS_TYPE ((tIS(TokenType::tASqBraceOpen)))

namespace Daina {
    
    class ASTType;
    
}

#include "AST.hpp"
#include "Parser.hpp"
#include "ASTIdentifier.hpp"
#include "ParseAST.hpp"
#include "ASTGeneric.hpp"
#include "ASTList.hpp"
#include "StaticAnalysisScope.hpp"
#include "Analyser.hpp"

namespace Daina {





    enum LiteralType {
        literalNatural,
        literalByte,
        literalString,
        literalNone
    };

    
    class ASTType : public AST {

        
    protected:
        virtual std::string buildDescriptionPart() {
            return "ASTType";
        }
        
    public:
	ASTIdentifier *typeIdentifier = nullptr;
        std::vector<ASTType *>genericSpecifications = std::vector<ASTType *>();
        std::vector<ASTType *>reactants = std::vector<ASTType *>();
        std::vector<ASTType *>products = std::vector<ASTType *>();

	bool isGenericType = false;

    private:

        bool isLambda = false;
	ASTType *genericSuperTypeLink = nullptr;
        int genericTypeIndexBinding = -1;
        bool isALiteralType = false;
        LiteralType literalType = literalNone;

        ASTType();
        
        ASTType(Parser *parser, bool prime);

        //ASTType(Parser *parser) : ASTType(parser, false) {}

        static bool typeListSubsumesTypeList(std::vector<ASTType *> typelist1, std::vector<ASTType *> typelist2);
        
	static ASTType *seedCompositeTypesOrReplaceTypeWithGenericSpecificationsForSomeType(Analyser *analyser, std::vector<ASTType *> genericSpecifications, ASTType *theTypeInQuestion);
	static std::vector<ASTType *> seedCompositeTypesOrReplaceTypesWithGenericSpecificationsForSomeTypeList(Analyser *analyser, std::vector<ASTType *> genericSpecifications, std::vector<ASTType *> theTypeListInQuestion);

    public:

        static ASTType *emptyType();
        bool isEmptyType();
        bool isAValidParentType();
        bool isAValidClassType();
        LiteralType literalTypeType();
        bool isLiteralType();

        bool isLambdaType();
        ASTType *getLambdaProduct();
        std::vector<ASTType *>getLambdaReactants();

	static ASTType *parseTypeAttachingAsDependantToAST(Parser *parser, AST *ASTToBecomeDependantUpon);
        

        static ASTType *createNewTypeFromLiteralTypeType(LiteralType literalTypeType);
        
        

        void analyseAndCompleteAST(Analyser *analyser, StaticAnalysisScope *scope);
        
	bool typeSubsumesType(ASTType *anotherType);

	ASTClass *baseClass();


        static ASTType *createNewLambdaTypeWithReactantTypesAndProductType(ASTType *product, std::vector<ASTType *> reactants);
	ASTType *seedCompositeTypesWithGenericSpecificationsFromGivenClassType(Analyser *analyser, ASTType *classTypeToSeedGenerics);
	static ASTType *createNewClassTypeWithClass(ASTClass *classAST);
    };
    
}


#endif /* ASTType_hpp */
