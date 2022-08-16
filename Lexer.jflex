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
letra = [a-zA-Z] | "_"
digito = [0-9]
espacio = [" ",\t,\r,\n]+

/*Atributos*/
int = {digit}+

/*Identificador*/
identificador = {letra}({digito}|{letra})*
apuntadorVariable = "&"{identificador}

/*Operadores Aritmeticos*/
op_sum = "+"|"-"
op_mult = "*"|"/"

/*Expresiones booleanas && (and), ! (not), || (or)*/
op_rel = "=="|"!="|">"|"<"|">="|"<="|"&&"|"!"|"||"

/*Caracteres con uso especial*/
punto_coma = ";"
izq_par = "("
der_par = ")"
coma = ","
izq_llave = "{"
der_llave = "}"
doble_puntos = ":"
signo_interrogacion = "?"

/*Token de Asignación*/
asignacion = "="

caracteres_especiales = "."|"-"|"@"|"#"|"$"|"%"|"^"|"&"| "'" |{punto_coma}|{izq_par}|{der_par}|{coma}|{izq_llave}|{der_llave}|{doble_puntos}|{signo_interrogacion}|{op_sum}|{op_mult}|{op_rel}
constchar = '({letra}|{digito}|{caracteres_especiales} | " ")'
conststr = ({letra}|{digito}|{caracteres_especiales} | " ")+


/*Autoincrementos*/
autoIncrementos = "++" | "--"

/*Comentarios*/
initialComnt = "/*"
sl_Comnt = "//"
finalComnt = "*/"
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
    
    /*Tipo de Dato*/
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

    /*Comentario /* */
    {initialComnt}      {yybegin(comment);}
    /*Comentario de una linea*/
    {sl_Comnt}          {yybegin(sl_Comment);}
    .                   {/*Imprimir donde encontro un error lexico*/}
}

<comment>{
    {finalComnt}        {yybegin(YYINITIAL);}
    .                   {/*Ignora todo*/}
}

<sl_Comment>{
    \n                  {yybegin(YYINITIAL);}
    .                   {/*Ignora todo*/}
}