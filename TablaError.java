public class TablaError{
    private String lexema;
    private int fila;
    private int columna; 
    private String TipoError;
    private String Descripcion; 

    public TablaError(String lexema, int fila, int columna, String TipoError, String Descripcion){
        this.lexema = lexema;
        this.fila = fila;
        this.columna = columna;
        this.TipoError = TipoError;
        this.Descripcion = Descripcion;
    }

    public String getLexema(){
        return lexema;
    }

    public void setLexema(String lexema){
        this.lexema = lexema;
    }

    public int getFila(){
        return fila;
    }

    public void setFila(int fila){
        this.fila = fila;
    }

     public Integer getColumna(){
        return columna;
    }

    public void setColumna(int columna){
        this.columna = columna;
    }

    public String getTipoError(){
        return TipoError;
    }

    public void setTipoError(String TipoError){
        this.TipoError = TipoError;
    }

    public String getDescripcion(){
        return Descripcion;
    }

    public void setDescripcion(String Descripcion){
        this.Descripcion = Descripcion;
    }
}