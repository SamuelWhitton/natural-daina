//
//  ASTAttribute.hpp
//  DainaCompiler
//
//  Created by SamWit on 19/03/2017.
//  Copyright © 2017 Samuel Whitton. All rights reserved.
//

#ifndef ASTAttribute_hpp
#define ASTAttribute_hpp

namespace Daina {

    class ASTAttribute;
}


#include "AST.hpp"
#include "Parser.hpp"
#include "ASTIdentifier.hpp"
#include "ParseAST.hpp"
#include "ASTType.hpp"
#include "Analyser.hpp"
#include "StaticAnalysisScope.hpp"

namespace Daina {
    
    class ASTAttribute : public AST {
    
    private:
    	bool pollutedWithSelfReference = false;
        
    protected:
        virtual std::string buildDescriptionPart() {
            return "ASTAttribute";
        }

    public:
        ASTType *type = nullptr;
        ASTIdentifier *identifier = nullptr;
	ASTClass *classOwner = nullptr;
        
        ASTAttribute(Parser *parser);
        
        void markAsPollutedWithSelfReference();
        bool isPollutedWithSelfReference();

        void analyseAndCompleteAST(Analyser *analyser, StaticAnalysisScope *scope);
    };
    
}


#endif /* ASTAttribute_hpp */
