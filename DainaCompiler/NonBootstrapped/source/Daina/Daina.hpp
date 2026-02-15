//
//  Daina.hpp
//  DainaCompiler
//
//  Created by SamWit on 18/12/2016.
//  Copyright © 2016 Samuel Whitton. All rights reserved.
//

#ifndef Daina_hpp
#define Daina_hpp

#include <stdio.h>
#include <vector>


namespace Daina {
    class Daina;
}


#include "OutputDelegate.hpp"
#include "Scanner.hpp"
#include "SourceChar.hpp"

namespace Daina {
    
    //only call on one thread
    class Daina {
        
    private:
        Daina(OutputDelegate outputDelegate);
        ~Daina();
        
        OutputDelegate output;
        Scanner scanner;
        std::vector<std::string *> fileNames;
        std::vector<Token *> tokens;
        
        long currLineNum;
        long currLinePos;
        
    public:
        static Daina* newDaina(OutputDelegate outputDelegate);
        static void deleteDaina(Daina *daina);
        
        void nextFile(std::string fileName);
        void nextChar(char c);
        void compile();
        
        OutputDelegate *out();
        
    };
    
}

#endif /* Daina_hpp */





