//
//  OutputDelegate.cpp
//  DainaCompiler
//
//  Created by SamWit on 18/12/2016.
//  Copyright © 2016 Samuel Whitton. All rights reserved.
//

#include "OutputDelegate.hpp"

namespace Daina {
    
    OutputDelegate::OutputDelegate(std::function<void(std::string)> messageFPtr, std::function<void(std::string)> outputFPtr) {
        this->messageFPtr = messageFPtr;
        this->outputFPtr = outputFPtr;
    }
    
    void OutputDelegate::_messageLit(std::string msg) {
        _message(msg);
    }
    
    void OutputDelegate::_outputLit(std::string data) {
        _output(data);
    }
    
    void OutputDelegate::_message(std::string &msg) {
        this->messageFPtr(msg);
    }
    
    void OutputDelegate::_output(std::string &data) {
        this->outputFPtr(data);
    }
    
    void OutputDelegate::message(std::string msg) {
        _message(msg);
    }
    
    void OutputDelegate::error(ErrorType type, std::initializer_list<Daina::Token *> tokens, std::string err) {
        switch (type) {
            case errLexical:
                _messageLit("Lexical Error: ");
                break;
            case errSyntax:
                _messageLit("Syntax Error: ");
                break;
            case errAnalysis:
                _messageLit("Analysis Error: ");
                break;
            default:
                break;
        }
        
        _messageLit(err + "\n");
        
        if (tokens.size() > 0)
            _messageLit("Relevant Code:\n");
            
        for (auto token : tokens) {
            _messageLit("\t" + token->getInCodeIdentificationString() + "\n");
        }
        
        std::terminate();
    }
    
    void OutputDelegate::compileOut(std::string str) {
        _output(str);
    }
    
}








