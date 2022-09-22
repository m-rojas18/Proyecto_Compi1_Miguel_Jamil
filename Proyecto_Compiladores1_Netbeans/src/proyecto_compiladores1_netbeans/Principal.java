
package proyecto_compiladores1_netbeans;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import javax.swing.JFileChooser;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JTextField;
import javax.swing.filechooser.FileNameExtensionFilter;


public class Principal extends javax.swing.JFrame {

    

    public Principal() {
        initComponents();
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        checkbox1 = new java.awt.Checkbox();
        jPanel1 = new javax.swing.JPanel();
        b_Buscar = new javax.swing.JButton();
        jLabel1 = new javax.swing.JLabel();
        t_RutaInput = new javax.swing.JTextField();
        b_analizar = new javax.swing.JButton();
        jScrollPane1 = new javax.swing.JScrollPane();
        ta_input = new javax.swing.JTextArea();
        jScrollPane2 = new javax.swing.JScrollPane();
        ta_output = new javax.swing.JTextArea();
        jScrollPane3 = new javax.swing.JScrollPane();
        ta_errores = new javax.swing.JTextArea();
        b_guardarArchivo = new javax.swing.JButton();
        jLabel2 = new javax.swing.JLabel();

        checkbox1.setLabel("checkbox1");

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        b_Buscar.setText("Buscar");
        b_Buscar.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                b_BuscarMouseClicked(evt);
            }
        });

        jLabel1.setFont(new java.awt.Font("Dialog", 0, 18)); // NOI18N
        jLabel1.setText("Proyecto Compiladores 1 - Miguel Rojas, Jamil Garcia");

        t_RutaInput.setText("Ruta Input");
        t_RutaInput.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                t_RutaInputActionPerformed(evt);
            }
        });

        b_analizar.setText("Analizar");
        b_analizar.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                b_analizarMouseClicked(evt);
            }
        });

        ta_input.setColumns(20);
        ta_input.setRows(5);
        ta_input.setText("Input");
        jScrollPane1.setViewportView(ta_input);

        ta_output.setColumns(20);
        ta_output.setRows(5);
        jScrollPane2.setViewportView(ta_output);

        ta_errores.setColumns(20);
        ta_errores.setRows(5);
        jScrollPane3.setViewportView(ta_errores);

        b_guardarArchivo.setText("Guardar Archivo");
        b_guardarArchivo.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                b_guardarArchivoMouseClicked(evt);
            }
        });

        jLabel2.setFont(new java.awt.Font("Lucida Grande", 0, 18)); // NOI18N
        jLabel2.setText("Salida:");

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addGap(41, 41, 41)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jLabel2)
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addComponent(b_guardarArchivo, javax.swing.GroupLayout.PREFERRED_SIZE, 145, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(27, 27, 27)
                        .addComponent(jLabel1, javax.swing.GroupLayout.PREFERRED_SIZE, 551, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                        .addComponent(jScrollPane3, javax.swing.GroupLayout.PREFERRED_SIZE, 865, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGroup(jPanel1Layout.createSequentialGroup()
                            .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 616, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addGap(26, 26, 26)
                            .addComponent(jScrollPane2, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel1Layout.createSequentialGroup()
                            .addComponent(t_RutaInput, javax.swing.GroupLayout.PREFERRED_SIZE, 433, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addGap(18, 18, 18)
                            .addComponent(b_Buscar, javax.swing.GroupLayout.PREFERRED_SIZE, 106, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                            .addComponent(b_analizar, javax.swing.GroupLayout.PREFERRED_SIZE, 178, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addGap(25, 25, 25))))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addGap(14, 14, 14)
                        .addComponent(b_guardarArchivo))
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addContainerGap()
                        .addComponent(jLabel1)))
                .addGap(44, 44, 44)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(b_analizar)
                    .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                        .addComponent(t_RutaInput, javax.swing.GroupLayout.PREFERRED_SIZE, 24, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addComponent(b_Buscar)))
                .addGap(18, 18, 18)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addComponent(jScrollPane2, javax.swing.GroupLayout.DEFAULT_SIZE, 309, Short.MAX_VALUE)
                    .addComponent(jScrollPane1))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 10, Short.MAX_VALUE)
                .addComponent(jLabel2)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jScrollPane3, javax.swing.GroupLayout.PREFERRED_SIZE, 101, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap())
        );

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addComponent(jPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(0, 46, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void t_RutaInputActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_t_RutaInputActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_t_RutaInputActionPerformed

    private void b_BuscarMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_b_BuscarMouseClicked
        JFileChooser j = new JFileChooser();
        FileNameExtensionFilter restrict = new FileNameExtensionFilter("Solo Archivos .c", "c");
        //j.addChoosableFileFilter(restrict);
        j.setFileFilter(restrict);
        //t_RutaInput.setText("no file selected");
        int r = j.showOpenDialog(null);
        if (r == JFileChooser.APPROVE_OPTION) {
            t_RutaInput.setText(j.getSelectedFile().getAbsolutePath());
            ruta = j.getSelectedFile().getAbsolutePath();
            leerArchivo();
        }
        else
            t_RutaInput.setText("Ruta Input");
        
    }//GEN-LAST:event_b_BuscarMouseClicked

    private void b_guardarArchivoMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_b_guardarArchivoMouseClicked
        // TODO add your handling code here:
        guardarArchivo();
    }//GEN-LAST:event_b_guardarArchivoMouseClicked

    private void b_analizarMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_b_analizarMouseClicked
     try {;
            parser p = new parser(new Lexer(new FileReader(ruta)));
            p.parse();

            if(parser.num_erroresSintactico == 0){
                Nodo raiz = parser.padre;
                System.out.println("Se genero el AST.");
                Graficar(recorrido(raiz));
            } else {
                System.out.println("No se genero el AST.");
            }
        } catch (Exception e){
            e.printStackTrace();
        }
    }//GEN-LAST:event_b_analizarMouseClicked

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(Principal.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(Principal.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(Principal.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(Principal.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new Principal().setVisible(true);
            }
        });
    }
    
    public void leerArchivo(){
      File archivo = null;
      FileReader fr = null;
      BufferedReader br = null;

      try {
         // Apertura del fichero y creacion de BufferedReader para poder
         // hacer una lectura comoda (disponer del metodo readLine()).
         archivo = new File (ruta);
         fr = new FileReader (archivo);
         br = new BufferedReader(fr);

         // Lectura del fichero
         String linea, texto = "";
         while((linea=br.readLine())!=null)
            texto = texto + linea + "\n";
         
          ta_input.setText(texto);
      }
      catch(Exception e){
         e.printStackTrace();
      }finally{
         // En el finally cerramos el fichero, para asegurarnos
         // que se cierra tanto si todo va bien como si salta 
         // una excepcion.
         try{                    
            if( null != fr ){   
               fr.close();     
            }                  
         }catch (Exception e2){ 
            e2.printStackTrace();
         }
      }
    }
    private static String recorrido(Nodo raiz) {
        String cuerpo = "";
      for (Nodo child : raiz.hijos) {
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
        } finally {
            JOptionPane.showMessageDialog(null, "Se creo exitosamente el AST.");
        }
    }
    
    public void guardarArchivo(){
        try {
            String contenido = ta_input.getText();
            File file = new File(ruta);
            // Si el archivo no existe es creado
            if (!file.exists()) {
                file.createNewFile();
            }
            FileWriter fw = new FileWriter(file);
            BufferedWriter bw = new BufferedWriter(fw);
            bw.write(contenido);
            JOptionPane.showMessageDialog(this, "Guardado Con Exito");
            bw.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton b_Buscar;
    private javax.swing.JButton b_analizar;
    private javax.swing.JButton b_guardarArchivo;
    private java.awt.Checkbox checkbox1;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JScrollPane jScrollPane2;
    private javax.swing.JScrollPane jScrollPane3;
    private javax.swing.JTextField t_RutaInput;
    private javax.swing.JTextArea ta_errores;
    private javax.swing.JTextArea ta_input;
    private javax.swing.JTextArea ta_output;
    // End of variables declaration//GEN-END:variables
    String ruta = "./ArchivoC.c";
}

