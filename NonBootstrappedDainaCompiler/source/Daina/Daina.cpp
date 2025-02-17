//
//  Daina.cpp
//  DainaCompiler
//
//  Created by SamWit on 18/12/2016.
//  Copyright © 2016 Samuel Whitton. All rights reserved.
//

#include "Daina.hpp"

#include "Guard.hpp"
#include "Parser.hpp"
#include "Analyser.hpp"
#include "ZitherCompiler.hpp"
#include "DainaASTCompiler.hpp"

namespace Daina {
    
    Daina::Daina(OutputDelegate outputDelegate) : output(outputDelegate),
        scanner(&output, [this] (Token *t) {
            this->tokens.push_back(t);
        }) {
        
    }
    
    Daina::~Daina() {
        for (auto fileName : fileNames) delete fileName;
        for (auto token : tokens) Token::tdelete(token);
    }
    
    Daina* Daina::newDaina(OutputDelegate outputDelegate) {
        return new Daina(outputDelegate);
    }
    
    void Daina::deleteDaina(Daina *daina) {
        delete daina;
    }
    
    OutputDelegate *Daina::out() {
        return &output;
    }
    
    void Daina::nextFile(std::string fileName) {
	if (fileNames.size() > 0)
	    this->nextChar('\n');
        fileNames.push_back(new std::string(fileName));
        currLineNum = 0;
        currLinePos = 0;
    }
    
    void Daina::nextChar(char c) {
        guard(fileNames.size() > 0);
       
       	SourceChar sourceChar = SourceChar(c, fileNames.back(), currLineNum, currLinePos); 	
        scanner.nextChar(sourceChar);
        
        if (c == '\n') {
            currLineNum++;
            currLinePos = 0;
        } else currLinePos++;
    }
    
    void Daina::compile() {

	this->nextChar('\n');
       
        scanner.finish();
        
        
        /*for (Token *t : tokens) {
            std::cout << t->getTokenInfo() << "\n";
        }*/


	out()->compileOut("/*\n"
                          "  * Compilation Output Generated by Daina Compiler\n"
                          "  */\n\n");
        



	out()->compileOut("//The following output was generated by the parser:\n"
                          "/*\n");
	OutputDelegate outputDelegateForParser = OutputDelegate([this](std::string msg) {
            this->out()->message(msg);
            this->out()->compileOut(msg);
        }, [](std::string data) {
            bool someRougeCompilationOutputWasProducedByTheParserForSomeReason = true;
            guard(!someRougeCompilationOutputWasProducedByTheParserForSomeReason);
        });
        Parser *parser = Parser::parse(Emitter(&tokens), &outputDelegateForParser);
	out()->compileOut("*/\n\n");
        AST *root = parser->root();
        


        //std::cout << root->buildDescription();

	out()->compileOut("//The following output was generated by the analyser:\n"
                          "/*\n");
	OutputDelegate outputDelegateForAnalyser = OutputDelegate([this](std::string msg) {
            this->out()->message(msg);
            this->out()->compileOut(msg);
        }, [](std::string data) {
            bool someRougeCompilationOutputWasProducedByTheAnalyserForSomeReason = true;
            guard(!someRougeCompilationOutputWasProducedByTheAnalyserForSomeReason);
        });
	Analyser analyser = Analyser(&outputDelegateForAnalyser);
	analyser.analyseAndCompleteAST(root);
        out()->compileOut("*/\n\n");



	out()->compileOut("//The following describes the interface of the compiled class constructs:\n"
                          "/*\n");
	out()->compileOut(((ASTRoot *)root)->describeInterfaceOfClassConstructs());
        out()->compileOut("*/\n\n");


	
        out()->message("starting Zither to C source compiler\n");
	ZitherCompiler *zitherToCCompiler = ZitherCompiler::startCompilingZitherInputIntoCSource([this](std::string compilationOutput) {
            this->out()->compileOut(compilationOutput);
     	});

	ZitherReceiver *zitherReceiver = zitherToCCompiler->getZitherReceiver();
        out()->message("compiling from Daina AST, sending result to Zither compiler...\n");
        DainaASTCompiler::compileDainaASTIntoZither(root, zitherReceiver);
        out()->message("AST to Zither finished.\n");

	ZitherCompiler::finishAndDestroyZitherCompiler(zitherToCCompiler);
	out()->message("Zither to C source compiler finished.\n");
        
        Parser::destroyAST(parser);
        delete parser;

        out()->message("Daina is now having tea~\n");
    }
    
}





