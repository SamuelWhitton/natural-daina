//
//  Scanner.cpp
//  DainaCompiler
//
//  Created by SamWit on 19/12/2016.
//  Copyright © 2016 Samuel Whitton. All rights reserved.
//

#include "Scanner.hpp"

#include <thread>

namespace Daina {
    
    Scanner::Scanner(OutputDelegate *o, std::function<void(Token*)> tokenListener) {
	
        scannerSync = AsymSync<SourceChar>::newAsymSync();
        asyncScanner = new AsycScanner(scannerSync, [tokenListener, o](Token *t) {
            guard(t != nullptr);
            if (t->type() == tError) {
                o->error(errLexical, {}, ((TError*)t)->errorMessage);
            } else {
                tokenListener(t);
            }
        });
        scannerThread = std::thread([this]() {
            asyncScanner->run();
        });
        scannerSync->syncSender();
    }
    
    Scanner::~Scanner() {
        AsymSync<SourceChar>::deleteAsymSync(scannerSync);
        delete asyncScanner;
    }

    
    void Scanner::nextChar(SourceChar c) {
	    if (c.isEndOfInput()) {
		//std::cout << "ENDDD\n";
	    }
        scannerSync->send(c);
    }
    
    void Scanner::finish() {
        scannerSync->send(SourceChar::endOfInput());
        scannerThread.join();
    }
    
    
}





