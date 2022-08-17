%%
//Opciones de clase y declaraciones
%class Lexer
%int
%standalone
%unicode
%line
%column
%state COMMENT
%state sl_Comment

//Definiciones Regulares
letra = [a-zA-Z] | "_"
digito = [0-9]
espacio = [" ",\t,\n]+

/*Atributos*/
int = {digito}+

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
comma = ","
izq_par = "("
der_par = ")"
izq_llave = "{"
der_llave = "}"
doble_puntos = ":"
signo_interrogacion = "?"

/*Token de Asignación*/
asignacion = "="

caracteres_especiales = "."|"-"|"@"|"#"|"$"|"%"|"^"|"&"| "'" |{punto_coma}|{izq_par}|{der_par}|{comma}|{izq_llave}|{der_llave}|{doble_puntos}|{signo_interrogacion}|{op_sum}|{op_mult}|{op_rel}
constchar = '({letra}|{digito}|{caracteres_especiales}| " ")'
conststr = \"({letra}|{digito}|{caracteres_especiales}| " ")+ \"


/*Autoincrementos*/
autoIncrementos = "++" | "--"

/*Comentarios*/
initialComnt = "/*"
sl_Comnt = "//"
finalComnt = "*/"
%%
//Reglas Lexicas
<YYINITIAL> {

    "if"                    {System.out.println("<IF>");}
    "else"                  {System.out.println("<ELSE>");}
    "else if"                  {System.out.println("<ELSE IF>");}
    "while"                 {System.out.println("<WHILE>");}
    "for"                   {System.out.println("<FOR");}
    "main"                  {System.out.println("<main>");}
    "break"                 {System.out.println("<BREAK>");}
    "return"                {System.out.println("<RETURN>");}
    "void"                  {System.out.println("<VOID>");}
    "static"                {System.out.println("<static>");}
    "printf"                {System.out.println("<printf>");}
    "scanf"                 {System.out.println("<scanf>");}
    
    /*Tipo de Dato*/
    "int"                   {System.out.println("<INT>");}
    "int*"                  {System.out.println("<INT*>");}
    "char"                  {System.out.println("<CHAR>");}
    "char*"                 {System.out.println("<CHAR*>");}

    {int}                   {System.out.println("<INT, \"" + yytext() + "\">");}
    {op_sum}                {System.out.println("<OPSUM, \"" + yytext() + "\">");}
    {op_mult}               {System.out.println("<OPMULT, \"" + yytext() + "\">");}
    {op_rel}                {System.out.println("<OPREL, \"" + yytext() + "\">");}

    
    {punto_coma}            {System.out.println("<PUNTOCOMA, \"" + yytext() + "\">");}
    {comma}                 {System.out.println("<COMMA>, \""+ yytext() + "\">");}

    {izq_par}               {System.out.println("<LPAR, \""+ yytext() + "\">");}
    {der_par}               {System.out.println("<RPAR, \""+ yytext() + "\">");}
    {izq_llave}             {System.out.println("<IZQ_LLAVE, \"" + yytext() + "\">");}
    {der_llave}             {System.out.println("<DER_LLAVE, \"" + yytext() + "\">");}
    {doble_puntos}          {System.out.println("<DOBLEPUNTOS, \"" + yytext() + "\">");}
    {signo_interrogacion}   {System.out.println("<SIGNO INTERROGACION, \"" + yytext() + "\">");}

    {autoIncrementos}       {System.out.println("<AUTOINCREMENTOS, \"" + yytext() + "\">");}
    {asignacion}            {System.out.println("<ASIGNACION, \"" + yytext() + "\">" );}
    {apuntadorVariable}     {System.out.println("<APUNTADORVARIABLE, \"" + yytext() + "\">" );}
    
    {constchar}             {System.out.println("<CONSTCHAR, " + yytext() + ">");}
    {conststr}              {System.out.println("<CONSTSTR, " + yytext() + ">");}

    /*Identificador*/
    {identificador}         {System.out.println("<ID, \"" + yytext() + "\">");}

    /*Comentario */
    {initialComnt}          {yybegin(COMMENT);}
    /*Comentario de una linea*/
    {sl_Comnt}              {yybegin(sl_Comment);}
    {espacio}               {/*Do nothing*/}
    .                       {/*Imprimir donde encontro un error lexico*/}
   
}

<COMMENT>{
    {finalComnt}        {yybegin(YYINITIAL);}
    .                   {/*Do nothing*/}
}

<sl_Comment>{
    \n                  {yybegin(YYINITIAL);}
    .                   {/*Esta en comentario*/}
}
