%%
//Opciones de clase y declaraciones
%class Lexer
%int
%standalone
%unicode
%line
%column
%state comment
%state sl_Comment

//Definiciones Regulares
initialComnt = "/*"
sl_Comnt = "//"
finalComnt = "*/"
letra = [a-zA-Z] = "_"
digito = [0-9]
espacio = [" ",\t,\r,\n]+

/*Atributos*/
int = {digit}+
char ="'"."'"

/*Identificador*/
identificador = {letra}({digito}|{letra})*

/*Operadores Aritmeticos*/
op_sum = "+"|"-"
op_mult = "*"|"/"|"%"

/*Expresiones booleanas && (and), ! (not), || (or)*/
op_rel = "=="|"!="|">"|"<"|">="|"<="|"&&"|"!"|"||"

/*Caracteres con uso especial*/
punto_coma = ";"
izq_par = "("
der_par = ")"
coma = ","
izq_llave = "{"
der_llave = "}"
//Revisar si se necesitan estos brackets []

/*Token de Asignación*/
asignacion = "="

/*Incrementos*/
autoIncrementos = "++" | "--"
/*Operador condicional */
//Crear constchar y conststr
//Buscar expresion regular para caracteres especiales
//Comentarios Multilinea y 2 de una linea ( /* */ , //)

/*
Dudas de palabras reservadas
auto	
switch		
case	
const		
continue		
sizeof	
default			
do			
*/
%%
//Reglas Lexicas
<YYINITIAL> {
    
    "if"                {}
    "else"              {}
    "while"             {}
    "for"               {}
    "main"              {}
    "break"             {}
    "return"            {}
    "void"              {}
    "static"            {}
    "printf"            {}
    "scanf"             {}
    
    /*Atributos*/
    "int"               {}
    "int*"              {}
    "char"              {}
    "char*"             {}

    {int}               {}
    {char}              {}
    {op_sum}            {}
    {op_mult}           {}
    {op_rel}            {}
    {punto_coma}        {}
    {izq_par}           {}
    {der_par}           {}
    {coma}              {}
    {izq_llave}         {}
    {der_llave}         {}
    {autoIncrementos}   {}
    {asignacion}        {}
    {espacio}           {/*Do nothing*/}
    /*Identificador*/
    {identificador}     {}
    {initialComnt}      {yybegin(comment);}
    {sl_Comnt}          {yybegin(sl_Comment);}
}

<comment>{
    {finalComnt}        {yybegin(YYINITIAL);}
    .                   {/*Ignora todo*/}
}

<sl_Comment>{
    \n                  {yybegin(YYINITIAL);}
    .                   {/*Ignora todo*/}
}

