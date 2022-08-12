%%
//Opciones de clase y declaraciones
%class Lexer
%int
%standalone
%unicode
%line
%column
%%

//Reglas Lexicas
/*Simbolos*/
letra = [a-zA-Z] | "_"
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

//Token de Asignación
igual = "="

//Buscar expresion regular para caracteres especiales
//Palabras Reservadas
/* char, if, else, else if, for, int, return static, void, */

//Comentarios Multilinea y 2 de una linea ( /* */ , //)
//Analizador ignora, comentarios y los caracteres de nuevalinea, tabulacion y espacio blanco
/*funciones
    printf y scanf
    printf(cadena %d,int) &int
*/
<YINITIAL> {

}