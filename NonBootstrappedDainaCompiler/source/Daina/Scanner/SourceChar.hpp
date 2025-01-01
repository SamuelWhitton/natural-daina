//
//  SourceChar.hpp
//  DainaCompiler
//
//  Created by SamWit on 18/12/2016.
//  Copyright © 2016 Samuel Whitton. All rights reserved.
//

#ifndef SourceChar_hpp
#define SourceChar_hpp

#include <string>

namespace Daina {
    
    class SourceChar {
    private:
        bool isEnd;
        bool valid;
        
        char charater;
        std::string *fileName;
        long lineNum;
        long linePos;
    public:
        SourceChar();
        SourceChar(char charater, std::string *fileName, long lineNum, long linePos);
        static SourceChar endOfInput();
        
        bool isEndOfInput();
        char raw();
        std::string positionDescription();
        bool isValid();
    };
    
}

#endif /* SourceChar_hpp */
