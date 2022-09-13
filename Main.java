import java.io.*;

public class Main {
    
    static public void main(String argv[]){
        
        try {
            parser p = new parser(new Lexer(new FileReader("./input.txt")));
            p.parse();
        } catch (Exception e){
            e.printStackTrace();
        }
    }
}
