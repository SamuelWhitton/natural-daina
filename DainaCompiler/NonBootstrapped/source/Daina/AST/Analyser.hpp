//
//  Analyser.hpp
//  DainaCompiler
//
//  Created by SamWit on 24/03/2018.
//  Copyright © 2017 Samuel Whitton. All rights reserved.
//

#ifndef Analyser_hpp
#define Analyser_hpp

namespace Daina {
    class Analyser;
}

#define DIE assert(33==22);

#define ANALYSIS_ERROR(_error) \
    analyser->analysisError(_error)

#define ANALYSIS_INFO(_info) \
    analyser->analysisInfo(_info)

#define SYNTAX_ERROR(_ast, _error) \
    analyser->syntaxError(_ast, _error)


#include "AST.hpp"
#include "OutputDelegate.hpp"
#include "ASTClass.hpp"

#include <vector>


namespace Daina {
    
    class Analyser {
    private:
        OutputDelegate *out;

        ASTClass *linkClassesTogetherReturningEntryPointSeperately(std::vector<ASTClass *> &classes);
	std::vector<ASTClass *> findClassOrder(std::vector<ASTClass *> &classes);  
        void completeMappingWithClassDependanciesBranchingFromRootOfTree(std::map<std::string, char *> *classDependancyMappingToComplete, ASTClass *rootClass);


    public:
	Analyser(OutputDelegate *out) {
            this->out = out;
        }

	void analyseAndCompleteAST(AST *astRoot);


        
        void syntaxError(AST *ast, std::string errorMessage) {
            Token *token = ast->getFirstToken();
            if (token == nullptr)
                out->error(errSyntax, {}, errorMessage);
            else out->error(errSyntax, {ast->getFirstToken()}, errorMessage);
        }

	void analysisError(std::string errorMessage) {
            out->error(errAnalysis, {}, errorMessage);
        }

        void analysisInfo(std::string infoMessage) {
            out->message("Analysis: " + infoMessage + "\n");
        }
    };
    
}


#endif /* Analyser_hpp */





