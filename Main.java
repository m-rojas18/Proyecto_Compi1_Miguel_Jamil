import java.io.*;

public class Main {
    
    static public void main(String argv[]){
        
        try {
            parser p = new parser(new Lexer(new FileReader("./input.txt")));
            p.parse();

            if(parser.num_erroresSintactico == 0){
                Nodo raiz = parser.padre;
                //
                System.out.println("Se genero el AST.");
                Graficar(recorrido(raiz));
            } else {
                System.out.println("No se genero el AST.");
            }
        } catch (Exception e){
            e.printStackTrace();
        }
    }

    private static String recorrido(Nodo raiz) {
        String cuerpo = "";
      for (Nodo child : raiz.hijos) {
          // System.out.println("hola");
            if (!(child.getEtiqueta().equals("VACIO"))) {
              cuerpo += "\"" + raiz.getID() + ". " + raiz.getEtiqueta() + " = " + raiz.getValor() +
                  "\"->\""+ child.getID() +". " + child.getEtiqueta()  + " = " + child.getValor() + "\""  + "\n";
              cuerpo += recorrido(child);
            }
      }
      return cuerpo;
  }

    public static void Graficar(String cadena) {
        FileWriter fw = null;
        PrintWriter pw = null;
        String nombreArchivo = "AST.dot";
        try {
            fw  = new FileWriter(nombreArchivo);
            pw = new PrintWriter(fw);
            pw.println("digraph G {");
            pw.println(cadena);
            pw.println("\n}");
            fw.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        try {
            String cmd = "dot -Tpng AST.dot -o imagenAST.png";
            Runtime.getRuntime().exec(cmd);
        } catch (IOException e) {
                e.printStackTrace();
        }
    }

}
