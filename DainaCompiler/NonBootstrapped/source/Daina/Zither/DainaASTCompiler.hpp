//
//  DainaASTCompiler.hpp
//  DainaCompiler
//
//  Created by SamWit on 13/05/2018.
//  Copyright © 2018 Samuel Whitton. All rights reserved.
//

#ifndef DainaASTCompiler_hpp
#define DainaASTCompiler_hpp

namespace Daina {
    class DainaASTCompiler;
}



#include "ASTs.hpp"
#include "ZitherCompiler.hpp"


namespace Daina {
    
    class DainaASTCompiler {
    private:
	ZitherReceiver *zitherReceiver;
	DainaASTCompiler(ZitherReceiver *zitherReceiver);

	int currentTemporaryID = 1;
        int currentAnonymousLambdaID = 1;

        bool isDainaTypeRepresentedWithDynamicZitherObject(ASTType *theTypeInQuestion);
        std::vector<std::string> buildObjectFrameForLambda(ASTLambda *lambda, bool searchForDynamicObjects);
        std::vector<std::string> buildStaticObjectFrameForLambda(ASTLambda *lambda);
        std::vector<std::string> buildDynamicObjectFrameForLambda(ASTLambda *lambda);
        std::vector<std::string> buildObjectFrameForLambdaWithSingleDynamicInstance(std::string theInstanceObjectID);

	void compileASTRoot(ASTRoot *rootAST);
        void compileASTEntryPoint(ASTLambda *entryPointLambda);
        void compileASTClass(ASTClass *classAST);
        void compileASTClassTemplateDeclarations(ASTClass *classAST);
        void compileASTClassAllocatorMethod(ASTClass *classAST);
        void compileASTClassAllocatorAssignments(ASTClass *classAST);
        void compileASTDeclareMethod(ASTClassElement *classElementAST);
        void compileASTDefineMethod(ASTClassElement *classElementAST);
        void compileASTLambdaDefinitionWithMethodIdentifier(ASTLambda *lambda, std::string methodIdentifier);
        void compileASTLambdaBody(ASTLambda *lambda);
	std::vector<std::string> compileASTStatementListResturningUnreleasedDynamicObjectIDs(ASTList<ASTStatement> *statements);
        void compileASTStatement(ASTStatement *statement); 
        void compileASTExprWithResultObject(ASTExpr *expr, std::string resultObjectID);
        void compileASTExprWithResultObjectPrime(ASTExpr *expr, std::string resultObjectID);
        void compileASTLambdaFromObjectOwnerWithResultObject(ASTLambda *lambda, std::string ownerObjectID, std::string resultObjectID);

    public:
        static void compileDainaASTIntoZither(AST *rootAST, ZitherReceiver *zitherReceiver);

    };
    
}


#endif /* DainaASTCompiler_hpp */





