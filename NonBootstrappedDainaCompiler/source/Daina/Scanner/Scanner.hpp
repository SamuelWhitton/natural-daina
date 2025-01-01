//
//  Scanner.hpp
//  DainaCompiler
//
//  Created by SamWit on 19/12/2016.
//  Copyright © 2016 Samuel Whitton. All rights reserved.
//

#ifndef Scanner_hpp
#define Scanner_hpp

#include "Tokens.hpp"
#include "SourceChar.hpp"
#include "OutputDelegate.hpp"
#include "AsymSync.hpp"
#include "AsycScanner.hpp"

namespace Daina {
    
    //only call on one thread
    class Scanner {
    private:
        AsymSync<SourceChar> *scannerSync; //to syncronise with scanner requests
        AsycScanner *asyncScanner;
        std::thread scannerThread;
    public:
        Scanner(OutputDelegate *o, std::function<void(Token*)> tokenListener);
        ~Scanner();
        void nextChar(SourceChar c);
        void finish();
    };
    
}

#endif /* Scanner_hpp */



