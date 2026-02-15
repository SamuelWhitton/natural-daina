//
//  ASTInvocation.hpp
//  DainaCompiler
//
//  Created by SamWit on 7/05/2017.
//  Copyright © 2017 Samuel Whitton. All rights reserved.
//

#ifndef ASTInvocation_hpp
#define ASTInvocation_hpp

namespace Daina {
    class ASTInvocation;
}


#include "AST.hpp"
#include "Parser.hpp"
#include "ASTIdentifier.hpp"
#include "ASTExpr.hpp"
#include "ParseAST.hpp"
#include "ASTType.hpp"
#include <vector>

namespace Daina {
 
    class ASTInvocation : public AST {


        
    protected:
        virtual std::string buildDescriptionPart() {
            return "ASTInvocation";
        }
        
    private:
        // \root (applications...)
        

        bool pollutedWithSelfReference = true;
        bool calculateIfInvocationIsPollutedWithSelfReference();

        
    public:
	ASTExpr *root;
        std::vector<ASTExpr *> applications;



        ASTInvocation(Parser *parser);

        void analyseAndCompleteAST(Analyser *analyser, StaticAnalysisScope *scope);

        ASTType *getInferredType();
        bool isPollutedWithSelfReference();
        
    };
    
    
    
}


#endif /* ASTInvocation_hpp */


