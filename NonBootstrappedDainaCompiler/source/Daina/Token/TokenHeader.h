//
//  TokenHeader.h
//  DainaCompiler
//
//  Created by SamWit on 23/12/2016.
//  Copyright © 2016 Samuel Whitton. All rights reserved.
//

#ifndef TokenHeader_h
#define TokenHeader_h


#include <string>
#include <map>

#define T__IS_HEX(c) (T__IS_NUMBER(c) || (c >= 'A' && c <= 'F'))
#define T__IS_LETTER(c) ((c >= 65 && c <= 90) || (c >= 97 && c <= 122))
#define T__IS_NUMBER(c) (c >= 48 && c <= 57)

#define T__IS_NEWLINE(c) (c == '\n')
#define T__IS_WHITESPACE(c) ((c == ' ') || (c == '\t') || (c == '\r') || (c == '\n') || (c == '\v') || (c == '\f'))
#define T__IS_IDENTIFIER_START(c) (T__IS_LETTER(c) || c == '_')
#define T__IS_IDENTIFIER_MID(c) (T__IS_IDENTIFIER_START(c) || T__IS_NUMBER(c))

#define COMPARE_IS_EQUAL_TO_CSTRING(cppstring, cstring) (cppstring.compare(cstring) == 0)
#define CMP_KEYWORD(str, key) COMPARE_IS_EQUAL_TO_CSTRING(str, key)



//#define T__KEYW_BYTE "Byte"
//#define T__KEYW_INT "Int"
//#define T__KEYW_FLOAT "Float"
//#define T__KEYW_BOOL "Bool"
//#define T__KEYW_LSTRING "lstring"
//#define T__KEYW_INIT "init"
//#define T__KEYW_GET "get"
//#define T__KEYW_SET "set"
//#define T__KEYW_LBOOL_TRUE "True"
//#define T__KEYW_LBOOL_FALSE "False"



namespace Daina {
    enum TokenType {
        tEmpty,
        tError,
        tStringLiteral,
        tByteLiteral,
	tNaturalLiteral,
        //tFloatLiteral,
        //tIntegerLiteral,
        //tBoolLiteral,
        tCompilerInjection,
        /*tKWByte,
        tKWInt,
        tKWFloat,
        tKWBool,
        tKWLString,
        tKWInit,
        tKWGet,
        tKWSet,*/
        tIdentifier,
        //atom single
        tAQMark,
        tALeThan,
        tAGrThan,
        tAEq,
        tABraceOpen,
        tABraceClosed,
        tASqBraceOpen,
        tASqBraceClosed,
        tACurlBraceOpen,
        tACurlBraceClosed,
        tAExclaim,
        tASlash,
        tAPlus,
        tASubt,
        tAPipe,
        tAPeriod,
        tAColon,
        tAPercent,
        tAAsterix,
        tATilde,
        tAAmp,
        tAComma,
        tAHat,
        tAAt,
        tASemiColon,
        tAHash,
        tABkSlash,
        //atom double
        tALeEq,
        tAGrEq,
        tAEqEq,
        tAPlusPlus,
        tAColonColon,
        tALeLe,
        tAGrGr,
        tAAmpAmp,
        tAPipePipe,
        tAArrow,
        tAQPlus,
        tAQQ
    };
    
    
    const static std::map<std::string, TokenType> keywordTokenMapping =
    {
        /*{T__KEYW_BYTE, tKWByte},
        {T__KEYW_INT, tKWInt},
        {T__KEYW_FLOAT, tKWFloat},
        {T__KEYW_BOOL, tKWBool},
        {T__KEYW_LSTRING, tKWLString},
        {T__KEYW_INIT, tKWInit},
        {T__KEYW_GET, tKWGet},
        {T__KEYW_SET, tKWSet}*/
    };
    
    const static std::map<std::string, TokenType> atomTokenMapping =
    {
        //atom single
        {"?", tAQMark},
        {"<", tALeThan},
        {">", tAGrThan},
        {"=", tAEq},
        {"(", tABraceOpen},
        {")", tABraceClosed},
        {"[", tASqBraceOpen},
        {"]", tASqBraceClosed},
        {"{", tACurlBraceOpen},
        {"}", tACurlBraceClosed},
        {"!", tAExclaim},
        {"/", tASlash},
        {"+", tAPlus},
        {"-", tASubt},
        {"|", tAPipe},
        {".", tAPeriod},
        {":", tAColon},
        {"%", tAPercent},
        {"*", tAAsterix},
        {"~", tATilde},
        {"&", tAAmp},
        {",", tAComma},
        {"^", tAHat},
        {"@", tAAt},
        {";", tASemiColon},
        {"#", tAHash},
        {"\\", tABkSlash},
        //atom double
        {"<=", tALeEq},
        {">=", tAGrEq},
        {"==", tAEqEq},
        {"++", tAPlusPlus},
        {"::", tAColonColon},
        {"<<", tALeLe},
        {">>", tAGrGr},
        {"&&", tAAmpAmp},
        {"||", tAPipePipe},
        {"->", tAArrow},
        {"?+", tAQPlus},
        {"??", tAQQ}

    };
    

    
    
    const static std::map<TokenType, std::string> tokenTypeDescriptorMapping =
    {
        {tError, "ERR"},
        {tStringLiteral, "STRING"},
        {tByteLiteral, "BYTE"},
	{tNaturalLiteral, "NATURAL"},
        //{tFloatLiteral, "FLOAT"},
        //{tIntegerLiteral, "INTEGER"},
        //{tBoolLiteral, "BOOL"},
        /*{tKWByte, "KEY"},
        {tKWInt, "KEY"},
        {tKWFloat, "KEY"},
        {tKWBool, "KEY"},
        {tKWLString, "KEY"},
        {tKWInit, "KEY"},
        {tKWGet, "KEY"},
        {tKWSet, "KEY"},*/
        {tIdentifier, "ID"},
        //atom single
        {tAQMark, "SATOM"},
        {tALeThan, "SATOM"},
        {tAGrThan, "SATOM"},
        {tAEq, "SATOM"},
        {tABraceOpen, "SATOM"},
        {tABraceClosed, "SATOM"},
        {tASqBraceOpen, "SATOM"},
        {tASqBraceClosed, "SATOM"},
        {tACurlBraceOpen, "SATOM"},
        {tACurlBraceClosed, "SATOM"},
        {tAExclaim, "SATOM"},
        {tASlash, "SATOM"},
        {tAPlus, "SATOM"},
        {tASubt, "SATOM"},
        {tAPipe, "SATOM"},
        {tAPeriod, "SATOM"},
        {tAColon, "SATOM"},
        {tAPercent, "SATOM"},
        {tAAsterix, "SATOM"},
        {tATilde, "SATOM"},
        {tAAmp, "SATOM"},
        {tAComma, "SATOM"},
        {tAHat, "SATOM"},
        {tAAt, "SATOM"},
        {tASemiColon, "SATOM"},
        {tAHash, "SATOM"},
        {tABkSlash, "SATOM"},
        //atom double
        {tALeEq, "DATOM"},
        {tAGrEq, "DATOM"},
        {tAEqEq, "DATOM"},
        {tAPlusPlus, "DATOM"},
        {tAColonColon, "DATOM"},
        {tALeLe, "DATOM"},
        {tAGrGr, "DATOM"},
        {tAAmpAmp, "DATOM"},
        {tAPipePipe, "DATOM"},
        {tAArrow, "DATOM"},
        {tAQPlus, "DATOM"},
        {tAQQ, "DATOM"}
    };
    
    
    
}


#endif /* TokenHeader_h */



