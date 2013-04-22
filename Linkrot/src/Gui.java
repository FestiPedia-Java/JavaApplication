
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * @author Kevin
 */
public class Gui extends javax.swing.JFrame {

    public Gui() {
        initComponents();
    }

    /**
     * This method is called from within the constructor to initialize the form.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        urlField = new javax.swing.JTextField();
        search = new javax.swing.JButton();
        error = new javax.swing.JLabel();
        jScrollPane1 = new javax.swing.JScrollPane();
        webText = new javax.swing.JTextArea();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        search.setText("Search");
        search.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                searchActionPerformed(evt);
            }
        });

        webText.setColumns(20);
        webText.setRows(5);
        jScrollPane1.setViewportView(webText);

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jScrollPane1, javax.swing.GroupLayout.DEFAULT_SIZE, 380, Short.MAX_VALUE)
                    .addComponent(urlField)
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                        .addComponent(error)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addComponent(search)))
                .addContainerGap())
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(urlField, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(search)
                    .addComponent(error))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jScrollPane1, javax.swing.GroupLayout.DEFAULT_SIZE, 223, Short.MAX_VALUE)
                .addContainerGap())
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void searchActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_searchActionPerformed
        String urlText = urlField.getText();
        
        if(!validateUrl(urlText)){
            error.setText("This url is not located on the localhost.");
        }else{
            error.setText("");
            String line;
            String webpage = "";
            try {
                URL url = new URL(urlText);
                BufferedReader br = new BufferedReader(new InputStreamReader(url.openStream()));
                while ((line = br.readLine()) != null) {  
                    // Do something with the line
                    if(checkLine(line)){
                        String[] parts = line.split("a href=\"");
                        for(int i=0; i<parts.length; i++){
                            if(parts[i].matches("h.*")){
                                    parts[i] = parts[i].substring(0, parts[i].indexOf("\""));
                                webText.append(parts[i].trim());
                                webText.append("\n");
                            }
                        }
                    }
                }
                br.close(); 
            } catch (MalformedURLException ex) {
                Logger.getLogger(Gui.class.getName()).log(Level.SEVERE, null, ex);
            } catch (IOException ex) {
                Logger.getLogger(Gui.class.getName()).log(Level.SEVERE, null, ex);
            }
            
        }     
    }//GEN-LAST:event_searchActionPerformed
    
    public static boolean validateUrl(String url) {
        return url.matches("((https?://)?localhost){1}([a-zA-Z0-9]*)?/?([a-zA-Z0-9\\:\\-\\._\\?\\,\\'/\\\\\\+&amp;%\\$#\\=~])*");
    }
    
    public static boolean checkLine(String line){
        return line.matches("(.)*(<a href=){1}(.)*");
    }
    
    public static void main(String args[]) {
        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new Gui().setVisible(true);
            }
        });
    }
    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JLabel error;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JButton search;
    private javax.swing.JTextField urlField;
    private javax.swing.JTextArea webText;
    // End of variables declaration//GEN-END:variables
}
