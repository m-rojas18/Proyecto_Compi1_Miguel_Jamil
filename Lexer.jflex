%%
//Opciones de clase y declaraciones
%class Lexer
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

/*Operadores Aritmeticos*/
op_sum = "+"|"-"
op_mult = "*"|"/"

op_rel = "=="|"!="|">"|"<"|">="|"<="

/*Expresiones booleanas && (and), ! (not), || (or)*/
op_bool = "&&"|"!"|"||"

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

caracteres_especiales = "."|"-"|"@"|"#"|"$"|"%"|"^"|"&"| "'" |"¿" |"¡"|"/"|\\.|{coma}|{punto_coma}|{izq_par}|{der_par}|{izq_llave}|{der_llave}|{doble_puntos}|{signo_interrogacion}|{op_sum}|{op_mult}|{op_rel} | {op_bool}
constchar = '({letra}|{digito}|{caracteres_especiales}| " ")'
constString = \"({letra}|{digito}|{caracteres_especiales}| " ")* \"

/*Autoincrementos*/
autoIncrementos = "++" | "--"

/*Comentarios*/
initialComnt = "/*"
sl_Comnt = "//"
finalComnt = "*/"

apuntador = ("int" | "char") " "* "*" 

%%
//Reglas Lexicas
<YYINITIAL> {
    /*Palabras Reservadas*/
    "if"                    {System.out.println("<IF>");}
    "else"                  {System.out.println("<ELSE>");}
    "while"                 {System.out.println("<WHILE>");}
    "for"                   {System.out.println("<FOR");}
    "main"                  {System.out.println("<MAIN>");}
    "break"                 {System.out.println("<BREAK>");}
    "return"                {System.out.println("<RETURN>");}
    "void"                  {System.out.println("<VOID>");}
    "printf"                {System.out.println("<printf>");}
    "scanf"                 {System.out.println("<scanf>");}
    
    /*Tipo de Dato*/
    "int"                   {System.out.println("<INT>");}
    "char"                  {System.out.println("<CHAR>");}

    {apuntador}             {System.out.println(yytext());}

    //Integer
    {int}                   {System.out.println("<INT, \"" + yytext() + "\">");}

    //Operaciones Aritmeticas
    {op_sum}                {System.out.println("<OPSUM, \"" + yytext() + "\">");}
    {op_mult}               {System.out.println("<OPMULT, \"" + yytext() + "\">");}

    //Operadores Relacionales
    {op_rel}                {System.out.println("<OPREL, \"" + yytext() + "\">");}

    //Operador Booleano
    {op_bool}               {System.out.println("<OPBOOL, \"" + yytext() + "\">");}

    //Caracteres importantes
    {coma}                  {System.out.println("<COMMA>, \""+ yytext() + "\">");}
    {punto_coma}            {System.out.println("<PUNTOCOMA, \"" + yytext() + "\">");}
    {izq_par}               {System.out.println("<LPAR, \""+ yytext() + "\">");}
    {der_par}               {System.out.println("<RPAR, \""+ yytext() + "\">");}
    {izq_llave}             {System.out.println("<IZQ_LLAVE, \"" + yytext() + "\">");}
    {der_llave}             {System.out.println("<DER_LLAVE, \"" + yytext() + "\">");}
    {doble_puntos}          {System.out.println("<DOBLEPUNTOS, \"" + yytext() + "\">");}
    {signo_interrogacion}   {System.out.println("<SIGNO INTERROGACION, \"" + yytext() + "\">");}

    {autoIncrementos}       {System.out.println("<AUTOINCREMENTOS, \"" + yytext() + "\">");}
    {asignacion}            {System.out.println("<ASIGNACION, \"" + yytext() + "\">" );}

    {constString}           {System.out.println("<STRING, " + yytext() + " >");}
    {constchar}             {System.out.println("<CHAR, " + yytext() + ">");}
    {identificador}         {System.out.println("<ID, \"" + yytext() + "\">");}
    {apuntadorVariable}     {System.out.println("<APUNTADORVARIABLE, \"" + yytext() + "\">" );}

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


