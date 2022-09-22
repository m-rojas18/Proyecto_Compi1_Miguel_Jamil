package proyecto_compiladores1_netbeans;
import java_cup.runtime.*;


%%
//Opciones de clase y declaraciones
%class Lexer
%cup
%int
%standalone
%unicode
%line
%column


%state COMMENT
%state SL_COMMENT

//Definiciones Regulares
letra = [a-zA-Z] | "_"
digito = [0-9]
espacios =  " "|\t|\n

// Integer
int = {digito}+

// Identificador
identificador = {letra}({digito}|{letra})*
apuntadorVariable = "&"{identificador}

/* Simbolos */
/*Operadores Aritmeticos*/
op_sum = "+"|"-"
op_mult = "*"|"/"

op_rel = "=="|"!="|">"|"<"|">="|"<="

/*Expresiones booleanas && (and), ! (not), || (or)*/
//op_bool = "&&"|"!"|"||"
op_logic = "&&" | "||"

/*Caracteres con uso especial*/
punto_coma = ";"
coma = ","
izq_par = "("
der_par = ")"
izq_llave = "{"
der_llave = "}"
doble_puntos = ":"
signo_interrogacion = "?"

/*Token de Asignación*/
asignacion = "="

/*Autoincrementos*/
autoIncrementos = "++" | "--"

caracteres_especiales = "."|"-"|"@"|"#"|"$"|"%"|"^"|"&"| "'" |"¿" |"¡"|"/"|\\.|{coma}|{punto_coma}|{izq_par}|{der_par}|{izq_llave}|{der_llave}|{doble_puntos}|{signo_interrogacion}|{op_sum}|{op_mult}|{op_rel} | {op_logic}
constchar = '({letra}|{digito}|{caracteres_especiales}| " ")'
constString = \"({letra}|{digito}|{caracteres_especiales}| " ")* \"


//param1_scanf = \""%"d | c \" 
/*Comentarios*/
initialComnt = "/*"
sl_Comnt = "//"
finalComnt = "*/"

apuntador = ("int" | "char") " "* "*" 

%%
//Reglas Lexicas
<YYINITIAL> {
    /*Palabras Reservadas*/
    "if"                    {return new Symbol(sym.IF, yycolumn, yyline);}
    "else"                  {return new Symbol(sym.ELSE, yycolumn, yyline);}
    "while"                 {return new Symbol(sym.WHILE, yycolumn, yyline);}
    "for"                   {return new Symbol(sym.FOR, yycolumn, yyline);}
    "main"                  {return new Symbol(sym.MAIN, yycolumn, yyline);}
    "break"                 {return new Symbol(sym.BREAK, yycolumn, yyline);}
    "return"                {return new Symbol(sym.RETURN, yycolumn, yyline);}
    "void"                  {return new Symbol(sym.VOID, yycolumn, yyline);}
    "printf"                {return new Symbol(sym.PRINTF, yycolumn, yyline);}
    "scanf"                 {return new Symbol(sym.SCANF, yycolumn, yyline);}
    
    /*Tipo de Dato*/
    "int"                   {return new Symbol(sym.INT, yycolumn, yyline);}
    "char"                  {return new Symbol(sym.CHAR, yycolumn, yyline);}

    {apuntador}             {return new Symbol(sym.APUNTADOR, yycolumn, yyline);}

    //Integer
    {int}                   {return new Symbol(sym.INTEGER, yycolumn, yyline, yytext());}

    //Operaciones Aritmeticas
    {op_sum}                {return new Symbol(sym.OPSUM, yycolumn, yyline, yytext());}
    {op_mult}               {return new Symbol(sym.OPMULT, yycolumn, yyline, yytext());}

    //Operadores Relacionales
    {op_rel}                {return new Symbol(sym.OPREL, yycolumn, yyline, yytext());}

    //Operador Logico
    {op_logic}                {return new Symbol(sym.OPLOGIC, yycolumn, yyline, yytext());}
    //Caracteres importantes
    {coma}                  {return new Symbol(sym.COMMA, yycolumn, yyline);}
    {punto_coma}            {return new Symbol(sym.PUNTOCOMA, yycolumn, yyline);}
    {izq_par}               {return new Symbol(sym.LPAR, yycolumn, yyline);}
    {der_par}               {return new Symbol(sym.RPAR, yycolumn, yyline);}
    {izq_llave}             {return new Symbol(sym.IZQLLAVE, yycolumn, yyline);}
    {der_llave}             {return new Symbol(sym.DERLLAVE, yycolumn, yyline);}
    {doble_puntos}          {return new Symbol(sym.DOBLEPUNTOS, yycolumn, yyline);}
    {signo_interrogacion}   {return new Symbol(sym.SINTERROGACION, yycolumn, yyline);}

    {autoIncrementos}       {return new Symbol(sym.AUTOINCREMENTOS, yycolumn, yyline, yytext());}
    {asignacion}            {return new Symbol(sym.ASIGNACION, yycolumn, yyline, yytext());}

    {constString}           {return new Symbol(sym.CONSTSTRING, yycolumn, yyline, yytext());}
    {constchar}             {return new Symbol(sym.CONSTCHAR, yycolumn, yyline, yytext());}
    {identificador}         {return new Symbol(sym.ID, yycolumn, yyline, yytext());}
    {apuntadorVariable}     {return new Symbol(sym.APUNTADORVAR, yycolumn, yyline, yytext());}


    /*Comentario  Multilinea*/
    {initialComnt}          {yybegin(COMMENT);}

    /*Comentario de una linea*/
    {sl_Comnt}              {yybegin(SL_COMMENT);}

    {espacios}              {/*Se los salta*/}
    .                       {/*Imprimir donde encontro un error lexico*/
                                System.out.println("Error Lexico. Token invalido: <" + yytext() + "> en linea: " + (yyline + 1) + ", columna: " + (yycolumn + 1) );
                            } 
}

<COMMENT>{
    {finalComnt}        {yybegin(YYINITIAL);}
    \n                  {}/*Por alguna razon con . agarra el salto de linea e imprime*/
    .                   {/*Do nothing*/}
}

<SL_COMMENT>{
    \n                  {yybegin(YYINITIAL);}
    .                   {/*Do nothing*/}
}



