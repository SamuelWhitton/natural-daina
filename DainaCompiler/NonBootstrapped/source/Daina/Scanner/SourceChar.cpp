//
//  SourceChar.cpp
//  DainaCompiler
//
//  Created by SamWit on 18/12/2016.
//  Copyright © 2016 Samuel Whitton. All rights reserved.
//

#include "SourceChar.hpp"

#include "Guard.hpp"

namespace Daina {
    
    SourceChar::SourceChar() {
        isEnd = false;
        valid = false;
    }
    
    SourceChar::SourceChar(char charater, std::string *fileName, long lineNum, long linePos) {
	isEnd = false;
        valid = true;
        this->charater = charater;
        this->fileName = fileName;
        this->lineNum = lineNum;
        this->linePos = linePos;
    }
    
    SourceChar SourceChar::endOfInput() {
        SourceChar c = SourceChar();
        c.isEnd = true;
        c.valid = true;
        return c;
    }
    
    bool SourceChar::isEndOfInput() {
        guard(valid);
        return isEnd;
    }
    
    char SourceChar::raw() {
        guard(valid);
        return charater;
    }
    
    std::string SourceChar::positionDescription() {
        guard(valid);
        return "(" + *fileName + ":" + std::to_string(lineNum+1) + " pos " + std::to_string(linePos+1) + ")";
    }

    bool SourceChar::isValid() {
        return valid;
    }

    
    
}






