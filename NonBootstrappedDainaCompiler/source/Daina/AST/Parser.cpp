//
//  Parser.cpp
//  DainaCompiler
//
//  Created by SamWit on 26/02/2017.
//  Copyright © 2017 Samuel Whitton. All rights reserved.
//

#include "Parser.hpp"

#include "ASTRoot.hpp"

namespace Daina {
    
    Parser *Parser::parse(Emitter emitter, OutputDelegate *out) {
        Parser *p = new Parser(emitter, out); 
        p->logMessage("created parser");
        p->_root = new ASTRoot(p);
        return p;
    }
    
    void Parser::destroyAST(Parser *parser) {
        guard(parser->_root != nullptr);
        AST::destroyAST(parser->_root);
    }
    
}

