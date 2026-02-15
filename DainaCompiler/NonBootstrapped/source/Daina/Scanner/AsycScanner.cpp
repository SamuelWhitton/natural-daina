//
//  AsymScanner.cpp
//  DainaCompiler
//
//  Created by SamWit on 18/12/2016.
//  Copyright © 2016 Samuel Whitton. All rights reserved.
//

#include "AsycScanner.hpp"

namespace Daina {
    
    AsycScanner::AsycScanner(AsymSync<SourceChar> *sync, std::function<void(Token*)> tokenListener) {
        this->sync = sync;
        this->tokenListener = tokenListener;
        isAtEnd = false;
        clearBuf();
    }
    
    bool AsycScanner::nextChar() {

        if (isAtEnd) return false;
        currChar = forwardChar;
        if (currChar.isEndOfInput()) {
            isAtEnd = true;
            return false;
        }
        forwardChar = sync->receive();
        return true;
    }
    
    bool AsycScanner::hasNextChar() {
        return !forwardChar.isEndOfInput() && !isAtEnd;
    }
    
    void AsycScanner::clearBuf() {
        buf = "";
    }
    
    void AsycScanner::storeBuf() {
        buf += currChar.raw();
    }
    
    void AsycScanner::error(std::string errorMsg) {
        tokenListener(new TError(errorMsg));
    }
    
    void AsycScanner::error(std::string errorMsg, SourceChar c) {
        tokenListener(new TError(errorMsg, c));
    }
    
    void AsycScanner::run() {
        sync->syncReceiver();
        this->forwardChar = sync->receive();
        
        while (nextChar()) {
            
            //skip excess whitespace
            if (T__IS_WHITESPACE(currChar.raw())) continue;
            
            if (pullUpCompilerInjections()) continue;
            if (ignoreComments()) continue;
            if (stringLiterals()) continue;
            if (numberLiterals()) continue;
            //if (booleanLiterals()) continue;
            
            //find identifiers or reserved keywords
            if (T__IS_IDENTIFIER_START(currChar.raw())) {
                SourceChar start = currChar;
                clearBuf();
                storeBuf();
                while (hasNextChar() && T__IS_IDENTIFIER_MID(forwardChar.raw())) {
                    guard(nextChar());
                    storeBuf();
                }
                TKeyword *tKey = new TKeyword(start, buf);
                if (tKey->isValidKeyword()) {
                    tokenListener(tKey);
                } else {
                    Token::tdelete(tKey);
                    /*if (CMP_KEYWORD(buf, T__KEYW_LBOOL_TRUE)) {
                        tokenListener(new TBooleanLiteral(start, true));
                    } else if (CMP_KEYWORD(buf, T__KEYW_LBOOL_FALSE)) {
                        tokenListener(new TBooleanLiteral(start, false));
                    } else {*/
                        tokenListener(new TIdentifier(start, buf));
                    //}
                }
                continue;
            }
            
            //atoms
            SourceChar start = currChar;
            TAtom *tAtom = nullptr;
            if (hasNextChar())
                tAtom = new TAtom(start, currChar.raw(), forwardChar.raw());
            if (tAtom != nullptr) {
                if (tAtom->isValidAtom()) {
                    guard(nextChar());
                    tokenListener(tAtom);
                    continue;
                }
                Token::tdelete(tAtom);
            }
            tAtom = new TAtom(start, currChar.raw());
            if (tAtom->isValidAtom()) {
                tokenListener(tAtom);
                continue;
            }
            
            error("invalid token", start);
        }
    }
    
    /*
     integer_literal -> ('-')? ((num)+)
     float_literal -> ('-')? (num)+'.'(num)*
     byte_literal -> '0b'(hex)(hex)
     */
    bool AsycScanner::numberLiterals() {
        if (T__IS_NUMBER(currChar.raw()) /*|| (currChar.raw() == '-' && T__IS_NUMBER(forwardChar.raw()))*/) {
            SourceChar start = currChar;
            clearBuf();
            storeBuf();
            if (currChar.raw() == '0' && hasNextChar() && forwardChar.raw() == 'b') { //byte
                guard(nextChar());
                if (hasNextChar() && T__IS_HEX(forwardChar.raw())) {
                    guard(nextChar());
                    if (hasNextChar() && T__IS_HEX(forwardChar.raw())) {
                        tokenListener(new TByteLiteral(start, currChar.raw(), forwardChar.raw()));
                        guard(nextChar());
                        return true;
                    }
                }
                error("invalid byte literal", start);
                
            /*} else if (currChar.raw() == '0' && hasNextChar() && forwardChar.raw() == 'x') { //int hex
                guard(nextChar());
                storeBuf();
                if (hasNextChar() && T__IS_HEX(forwardChar.raw())) {
                    while (hasNextChar() && T__IS_HEX(forwardChar.raw())) {
                        guard(nextChar());
                        storeBuf();
                    }
                    tokenListener(new TIntegerLiteral(start, buf));
                    return true;
                }
                error("invalid integer literal", start);
                */
            } else { 
		//natural
		bool nextCharCanBeANumber = (currChar.raw() != '0');
                while (hasNextChar() && ((nextCharCanBeANumber && T__IS_NUMBER(forwardChar.raw())))) {
		    nextCharCanBeANumber = true;
                    guard(nextChar());
                    storeBuf();
                }
                tokenListener(new TNaturalLiteral(start, buf));
                return true;
/*
		//int or float
                bool foundDecimal = false;
		bool nextCharCanBeANumber = (currChar.raw() != '0');
                while (hasNextChar() && ((nextCharCanBeANumber && T__IS_NUMBER(forwardChar.raw())) || (forwardChar.raw() == '.' && !foundDecimal))) {
                    foundDecimal = (forwardChar.raw() == '.') || foundDecimal;
		    nextCharCanBeANumber = !((currChar.raw() == '-') && (forwardChar.raw() == '0'));
                    guard(nextChar());
                    storeBuf();
                }
                if (foundDecimal) {
                    tokenListener(new TFloatLiteral(start, buf));
                } else {
                    tokenListener(new TIntegerLiteral(start, buf));
                }
                return true;*/
            }
        }
        return false;
    }
    
    //string_literal -> '"' (.|('\'.))* '"'
    bool AsycScanner::stringLiterals() {
        if (currChar.raw() == '"') {
            SourceChar start = currChar;
            TStringLiteral *sl = new TStringLiteral(start, "", false);
            clearBuf();
            while (hasNextChar() && forwardChar.raw() != '"') {
                if (forwardChar.raw() == '\\' && nextChar() && hasNextChar()) {
                    guard(nextChar());
                    storeBuf();
		    bool validEscapeCharacter = (currChar.raw() == 'n' || currChar.raw() == 'r' || currChar.raw() == '"' || currChar.raw() == 't' || currChar.raw() == '\\');
		    if (!validEscapeCharacter) {
			error("invalid escape sequence", currChar);
		    }
                    sl->addChild(new TStringLiteral(SourceChar(), buf, true));
                    clearBuf();
                    continue;
                } else {
                    while(nextChar() && forwardChar.raw() != '"' && forwardChar.raw() != '\\') {
                        storeBuf();
                    }
		    storeBuf();
                    sl->addChild(new TStringLiteral(SourceChar(), buf, false));
                    clearBuf();
                    continue;
                }
            }
            if (nextChar()) {
                tokenListener(sl);
                return true;
            }
            error("incomplete string literal", start);
        }
        return false;
    }

    /*bool AsycScanner::booleanLiterals() {
        if (currChar.raw() == '&') {
            SourceChar start = currChar;

            clearBuf();
            storeBuf();
            while (hasNextChar() && T__IS_IDENTIFIER_MID(forwardChar.raw())) {
                guard(nextChar());
                storeBuf();
            }

            if (CMP_KEYWORD(buf, "&TRUE")) {
                tokenListener(new TBooleanLiteral(start, true));
	    } else if (CMP_KEYWORD(buf, "&FALSE")) {
                tokenListener(new TBooleanLiteral(start, false));
	    } else {
		error("invalid literal token", start);
	    }
            
	    return true;
            
        }
        return false;
    }*/
    
    bool AsycScanner::ignoreComments() {
	char theCharToBeDave = '@'; 
        // DAVEDAVE multi and DAVE single comments
        if (currChar.raw() == theCharToBeDave && hasNextChar() && forwardChar.raw() != theCharToBeDave) {
            guard(nextChar())
            while ( nextChar() && !(T__IS_NEWLINE(currChar.raw())) );
            return true;
                
        } else if (currChar.raw() == theCharToBeDave && hasNextChar() && forwardChar.raw() == theCharToBeDave) {
            //multi line comment
            SourceChar start = currChar;
            guard(nextChar())
            while ( nextChar() ) {
                while (currChar.raw() == theCharToBeDave && nextChar() ) {
                    if (currChar.raw() == theCharToBeDave)
                        return true;
                }
            }
            error("incomplete comment block", start);
        }
        return false;


        /*if (currChar.raw() == '/' && hasNextChar()) {
            SourceChar start = currChar;
            if (forwardChar.raw() == '/') {
                //single line comment
                guard(nextChar())
                while ( nextChar() && !(T__IS_NEWLINE(currChar.raw())) );
                return true;
                
            } else if (forwardChar.raw() == '*') {
                //multi line comment
                guard(nextChar())
                while ( nextChar() ) {
                    while (currChar.raw() == '*' && nextChar() ) {
                        if (currChar.raw() == '/')
                            return true;
                    }
                }
                error("incomplete comment block", start);
            }
        }
        return false;*/
    }
    
    bool AsycScanner::pullUpCompilerInjections() {
        if (currChar.raw() == '#' && hasNextChar()) {
            SourceChar start = currChar;
            if (forwardChar.raw() == '#') {
                //injection
                guard(nextChar())
                clearBuf();
                while ( nextChar() ) {
                    if (currChar.raw() == '#' && hasNextChar() && forwardChar.raw() == '#' ) {
                        tokenListener(new TCompilerInjection(start, buf));
                        guard(nextChar())
                        return true;
                    }
                    storeBuf();
                }
                error("incomplete compiler injection", start);
            }
        }
        return false;
    }
    
}






