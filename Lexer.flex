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
letra = [a-zA-Z]
digito = [0-9]
espacio = [ ,\t,\r,\n]+
<YINITIAL> {

}