//
//  Parser.hpp
//  DainaCompiler
//
//  Created by SamWit on 26/02/2017.
//  Copyright © 2017 Samuel Whitton. All rights reserved.
//

#ifndef Parser_hpp
#define Parser_hpp

namespace Daina {
    class Parser;
}



#define tGUARD_NEXT(_type, _error) tGUARD(tPEEK, _type, _error)

#define tGUARD(token, _type, _error) \
if (!(token != nullptr && token->type() == _type)) {\
    if (token == nullptr) {\
        parser->error({tPREVIOUS}, _error);\
    } else {\
        parser->error({token}, _error);\
    }\
}

#define tERROR(_error) \
if (tPEEK == nullptr) {\
    parser->error({tPREVIOUS}, _error);\
} else {\
    parser->error({tPEEK}, _error);\
}\

#define tGUARD_TAKE_NEXT(_type, _error) tPEEK; tGUARD_NEXT(_type, _error); tTAKE;

#define tGUARD_TAKE_NEXT_STATIC(_type, _error) tPEEK; tGUARD_NEXT(_type, _error); tTAKE_STATIC;

#define tIS(_type) (tPEEK != nullptr && tPEEK->type() == _type)

#define tPEEK (parser->emitter()->peek())
#define tTAKE (this->tokenTake(parser))
#define tEXPECT(_type) (this->tokenExpect(parser, _type))
#define tPREVIOUS (parser->emitter()->previous())

#define tTAKE_STATIC (parser->emitter()->take())
#define tEXPECT_STATIC(_type) (parser->emitter()->expect(_type))



/*
#define tIS_ATOMIC_TYPE (tPEEK != nullptr && (tPEEK->type() == TokenType::tKWInt || tPEEK->type() == TokenType::tKWFloat || tPEEK->type() == TokenType::tKWBool))

#define tIS_ATOMIC_TYPE_OR_LSTRING (tPEEK != nullptr && (tPEEK->type() == TokenType::tKWInt || tPEEK->type() == TokenType::tKWFloat || tPEEK->type() == TokenType::tKWBool || tPEEK->type() == TokenType::tKWLString))

*/


#include "AST.hpp"
#include "Emitter.hpp"
#include "OutputDelegate.hpp"


namespace Daina {
    
    class Parser {
    private:
        AST *_root;
        Emitter _emitter;
        OutputDelegate *out;
        Parser(Emitter emitter, OutputDelegate *out) : _emitter(emitter) {
            this->out = out;
        }
        
    public:
        Emitter *emitter() {
            return &_emitter;
        }

        void logMessage(std::string message) {
            out->message("PARSER LOG: " + message + "\n");
        }
        
        AST *root() {
            return _root;
        }
        
        void error(std::initializer_list<Token *> tokens, std::string errorMessage) {
            out->error(errSyntax, tokens, errorMessage);
        }
        
        static Parser *parse(Emitter emitter, OutputDelegate *out);
        static void destroyAST(Parser *parser);
    };
    
}


#endif /* Parser_hpp */





