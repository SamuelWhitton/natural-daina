//
//  AsymScanner.hpp
//  DainaCompiler
//
//  Created by SamWit on 18/12/2016.
//  Copyright © 2016 Samuel Whitton. All rights reserved.
//

#ifndef AsymScanner_hpp
#define AsymScanner_hpp

#include <functional>

#include "AsymSync.hpp"
#include "SourceChar.hpp"
#include "Tokens.hpp"


namespace Daina {
    
    class AsycScanner {
    private:
        bool pullUpCompilerInjections();
        bool ignoreComments();
        bool stringLiterals();
        bool numberLiterals();
        //bool booleanLiterals();
        void error(std::string errorMsg);
        void error(std::string errorMsg, SourceChar c);
        
        AsymSync<SourceChar> *sync;
        std::function<void(Token*)> tokenListener;
        SourceChar currChar;
        SourceChar forwardChar;
        
        bool nextChar();
        bool hasNextChar();
        bool isAtEnd;
        
        //string buffer
        void clearBuf();
        void storeBuf();
        
        std::string buf;
    public:
        AsycScanner(AsymSync<SourceChar> *sync, std::function<void(Token*)> tokenListener); //scanner is sync receiver
        void run(); //call on its own thread, will block always
    };
    
}



#endif /* AsymScanner_hpp */





