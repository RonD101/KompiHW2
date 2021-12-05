%{
#include <stdio.h>
#include "output.hpp"
#include "parser.tab.hpp"
%}

%option yylineno
%option noyywrap
digit  ([0-9])
letter ([a-zA-Z])
ws     ([\t\n ])
%%

void     return VOID;
int      return INT;
byte     return BYTE;
b        return B;
bool     return BOOL;
and      return AND;
or       return OR;
not      return NOT;
true     return TRUE;
false    return FALSE;
return   return RETURN;
if       return IF;
else     return ELSE;
while    return WHILE;
break    return BREAK;
continue return CONTINUE;
;        return SC;
,        return COMMA;
\(       return LPAREN;
\)       return RPAREN;
\{       return LBRACE;
\}       return RBRACE;
=        return ASSIGN;
==|!=    return EQUALITY;
\<|>|<=|>= return RELATION;
\+|- return BINADD;
\*|\/ return BINMUL;
{letter}+({letter}|{digit})* return ID;
([1-9]{digit}*)|0  return NUM;
\"([\x23-\x5B\x5D-\x7E]|\\[\x20-\x21\x23-\x5B\x5D-\x7E]|\x20|\x21|(\\\\)*\\\"|\\\\)*\" return STRING;
{ws} {};
\/\/[^\r\n]*[ \r|\n|\r\n]? {};
%%
