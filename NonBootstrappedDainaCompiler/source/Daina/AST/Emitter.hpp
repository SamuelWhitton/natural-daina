//
//  Emitter.hpp
//  DainaCompiler
//
//  Created by SamWit on 26/02/2017.
//  Copyright © 2017 Samuel Whitton. All rights reserved.
//

#ifndef Emitter_hpp
#define Emitter_hpp

#include <vector>
#include <stdio.h>

#include "Tokens.hpp"

namespace Daina {
    
    class Emitter {
    private:
        std::vector<Token *> *_tokenVector;
        long next;
        
    public:
        Emitter(std::vector<Token *> *tokenVector) {
            this->_tokenVector = tokenVector;
            this->next = 0;
        }
        Token *peek() {
            if (this->next >= this->_tokenVector->size())
                return nullptr;
            return _tokenVector->at(next);
        }
        Token *take() {
            Token *t = this->peek();
            if (t != nullptr)
                next++;
            //std::cout << t->getTokenInfo() << "\n";
            return t;
        }
        Token *expect(TokenType type) {
            Token *t = this->take();
            guard(t != nullptr);
            guard(type == t->type());
            return t;
        }
        Token *previous() {
            guard(this->next <= this->_tokenVector->size() && this->next > 0);
            return _tokenVector->at(next-1);
        }
    };
}

#endif /* Emitter_hpp */







