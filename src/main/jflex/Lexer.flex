package com.uach.proyecto_2_analizadorlexico;
import static com.uach.proyecto_2_analizadorlexico.Token.*;

%%

%class Lexer
%type Token
/**
     * El comando "%line" permite que podamos acceder al nuemro de linea cuando
     * el lexer encuentra una coincidencia con las reglas lexicas
     */
%line

/**
     * Los simbolos usados frecuentemente en diferentes expresiones regulares
     * se declaran aqui abajo.
     */

L1 = [A-Z]
L2 = [a-z]
L = [a-zA-Z]
D = [0-9]
S = [!&+=><-?]
ESPACIOS=[ \n\t\r]
%{
public String lexeme;
public int linea;
%}

%%

{ESPACIOS} {/*Ignore*/}


"(" {lexeme=yytext(); linea=yyline; return PAR_DER;}
")" {lexeme=yytext(); linea=yyline; return PAR_IZQ;}
":-" {lexeme=yytext(); linea=yyline; return IMPLICA;}
";" {lexeme=yytext(); linea=yyline; return PUNTO_COMA;}
"." {lexeme=yytext(); linea=yyline; return PUNTO;}

/*Atomo*/
{L2}({L}|{D}|_)+ {lexeme=yytext(); linea=yyline; return ATOMO;}

{S}+ {lexeme=yytext(); linea=yyline; return ATOMO;}

/*Variable*/
{L1}({L}|{D}|_)+ {lexeme=yytext(); linea=yyline; return VARIABLE;}

/*Punto fijo*/


/*Punto flotante*/

{D}+([eE]?{D})+ {lexeme=yytext(); linea=yyline;  return PTO_FLOT;}

/*Cadena*/


/*Entero*/
[-+]?{D}+ {lexeme=yytext(); linea=yyline; return ENTERO;}

/*Lista*/

/*Predicado*/

. {return ERROR;}

