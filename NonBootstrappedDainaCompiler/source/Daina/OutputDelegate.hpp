//
//  OutputDelegate.hpp
//  DainaCompiler
//
//  Created by SamWit on 18/12/2016.
//  Copyright © 2016 Samuel Whitton. All rights reserved.
//

#ifndef OutputDelegate_hpp
#define OutputDelegate_hpp

#include <string>
#include <functional>

#include "Token.hpp"


namespace Daina {
    
    typedef enum {
        errLexical,
        errSyntax,
        errAnalysis
    } ErrorType;
    
    
    class OutputDelegate {
        
    private:
        std::function<void(std::string)> messageFPtr;
        std::function<void(std::string)> outputFPtr;
        void _message(std::string &msg);
        void _output(std::string &data);
        void _messageLit(std::string msg);
        void _outputLit(std::string data);
        
    public:
        OutputDelegate(std::function<void(std::string)> messageFPtr, std::function<void(std::string)> outputFPtr);
        
        void message(std::string msg);
        void error(ErrorType type, std::initializer_list<Token *> tokens, std::string err);
        
        void compileOut(std::string str);
    };
    
    
}


#endif /* OutputDelegate_hpp */
