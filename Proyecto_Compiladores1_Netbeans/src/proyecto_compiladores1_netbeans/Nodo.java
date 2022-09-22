package proyecto_compiladores1_netbeans;

import java.util.ArrayList;

public class Nodo {

    public String etiqueta;
    public ArrayList<Nodo> hijos = new ArrayList<>();
    public String valor;
    public int id;

    public void addHijos(Nodo hijo){
        hijos.add(hijo);
    }

    public void setEtiqueta(String etiqueta){
        this.etiqueta = etiqueta;
    }

    public String getEtiqueta(){
        return etiqueta;
    }

    public ArrayList<Nodo> getHijos(){
        return hijos;
    }

    public void setValor(String v){
        this.valor = v;
    }

    public String getValor(){
        return valor;
    }

    public void setID(int i){
        this.id = i;
    }

    public int getID(){
        return id; 
    }


}
