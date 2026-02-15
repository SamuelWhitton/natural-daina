//
//  ASTInvarient.hpp
//  DainaCompiler
//
//  Created by SamWit on 19/03/2017.
//  Copyright © 2017 Samuel Whitton. All rights reserved.
//

#ifndef ASTInvarient_hpp
#define ASTInvarient_hpp

namespace Daina {

    class ASTInvarient;
}

#include "AST.hpp"
#include "Parser.hpp"
#include "ASTIdentifier.hpp"
#include "ParseAST.hpp"
#include "ASTExpr.hpp"

namespace Daina {
    
    class ASTInvarient : public AST {
        
        
    protected:
        virtual std::string buildDescriptionPart() {
            return "ASTInvarient";
        }

    private:
        TStringLiteral *label;
        
    public:
        ASTExpr *expr;
        
        ASTInvarient(Parser *parser);
    };
    
}

#endif /* ASTInvarient_hpp */
