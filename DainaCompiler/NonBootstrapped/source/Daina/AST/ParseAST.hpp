//
//  ParseAST.hpp
//  DainaCompiler
//
//  Created by SamWit on 27/02/2017.
//  Copyright © 2017 Samuel Whitton. All rights reserved.
//

#ifndef ParseAST_hpp
#define ParseAST_hpp

namespace Daina {
    template <class E> class ParseAST;
}

#include "Parser.hpp"
#include "AST.hpp"

namespace Daina {
    
    template <class E> class ParseAST {
        
    public:
        //should return NULL on no valid next AST parse
        virtual E *parse(Parser *parser) {
            return nullptr;
        }
    };
    
}


#endif /* ParseAST_hpp */







