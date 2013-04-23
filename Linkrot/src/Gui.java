
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.omg.PortableInterceptor.SYSTEM_EXCEPTION;

/**
 * @author Kevin
 */
public class Gui extends javax.swing.JFrame {

    List<String> checkedUrls = new ArrayList();
    
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
        jScrollPane2 = new javax.swing.JScrollPane();
        brokenLinks = new javax.swing.JTextArea();
        jLabel1 = new javax.swing.JLabel();
        jLabel2 = new javax.swing.JLabel();
        jLabel3 = new javax.swing.JLabel();

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

        brokenLinks.setColumns(20);
        brokenLinks.setRows(5);
        jScrollPane2.setViewportView(brokenLinks);

        jLabel1.setFont(new java.awt.Font("Tahoma", 0, 18)); // NOI18N
        jLabel1.setText("Broken links:");

        jLabel2.setFont(new java.awt.Font("Tahoma", 0, 18)); // NOI18N
        jLabel2.setText("Checked URL's");

        jLabel3.setFont(new java.awt.Font("Tahoma", 0, 18)); // NOI18N
        jLabel3.setText("Enter URL");

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(error)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jScrollPane2)
                    .addComponent(jScrollPane1, javax.swing.GroupLayout.DEFAULT_SIZE, 777, Short.MAX_VALUE)
                    .addComponent(urlField)
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                        .addGap(0, 0, Short.MAX_VALUE)
                        .addComponent(search))
                    .addGroup(layout.createSequentialGroup()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jLabel3)
                            .addComponent(jLabel1)
                            .addComponent(jLabel2))
                        .addGap(0, 0, Short.MAX_VALUE)))
                .addContainerGap())
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(17, 17, 17)
                .addComponent(jLabel3)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(urlField, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(search)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jLabel2)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 113, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(error)
                .addGap(16, 16, 16)
                .addComponent(jLabel1)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jScrollPane2, javax.swing.GroupLayout.DEFAULT_SIZE, 216, Short.MAX_VALUE)
                .addContainerGap())
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void searchActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_searchActionPerformed
        String urlText = urlField.getText();
        if(!validateUrl(urlText) || !checkIfURLExists(urlText)){
            error.setText("This url is not located on the localhost.");
        }else{
            iterateLinks(urlText);
            error.setText("");
        }
    }//GEN-LAST:event_searchActionPerformed
    
    /**
     * Controleren of het een lokale url is.
     * @param url
     * @return 
     */
    public static boolean validateUrl(String url) {
        return url.matches("((https?://)?localhost){1}([a-zA-Z0-9]*)?/?([a-zA-Z0-9\\:\\-\\._\\?\\,\\'/\\\\\\+&amp;%\\$#\\=~])*");
    }
    
    /**
     * Zoekt of er urls op die regel staan.
     * @param line
     * @return 
     */
    public static boolean checkLine(String line){
        return line.matches("(.)*(<a href=){1}(.)*");
    }
    
    public boolean notYetChecked(String url){
        for(String s:checkedUrls){
            if(url.equals(s)) return false;
        }
        return true;
    }
    
    public static boolean checkIfURLExists(String targetUrl) {
        HttpURLConnection httpUrlConn;
        try {
            httpUrlConn = (HttpURLConnection) new URL(targetUrl)
                    .openConnection();

            httpUrlConn.setRequestMethod("HEAD");
 
            // Set timeouts in milliseconds
            httpUrlConn.setConnectTimeout(30000);
            httpUrlConn.setReadTimeout(30000);
 
            // Print HTTP status code/message for your information.
            System.out.println("Response Code: "
                    + httpUrlConn.getResponseCode());
            System.out.println("Response Message: "
                    + httpUrlConn.getResponseMessage() +" - " + targetUrl);
 
            return (httpUrlConn.getResponseCode() == HttpURLConnection.HTTP_OK);
        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
            return false;
        }
    }
    
    /**
     * Zoekt alle urls op een webpagina.
     * @param urlText 
     */
    public void iterateLinks(String urlText){
        
        String line, link;
        List<String> links = new ArrayList();
        
        try {
            URL url = new URL(urlText);
            //webpagina inlezen
            BufferedReader br = new BufferedReader(new InputStreamReader(url.openStream()));
            
            //url toevoegen aan de lijst met reeds gecontroleerde url's
            checkedUrls.add(urlText);
            
            //over de lijnen van de webpagina itereren
            while ((line = br.readLine()) != null) { 
                //System.out.println(line);
                if(checkLine(line)){
                    //Er staat een url op deze lijn
                    String[] parts = line.split("a href=\"");
                    for(int i=0; i<parts.length; i++){
                        if(parts[i].matches("http.*")){
                            
                            //verwijderen van tekst die nog achter de link staat.
                            link = parts[i].substring(0, parts[i].indexOf("\""));
                            
                            if(validateUrl(link) && notYetChecked(link) && !link.matches("(.)*.pdf")){
                                //is een lokale url die nog niet gecontroleerd is
                                if(checkIfURLExists(link)){
                                    webText.append(link + "\n");
                                    iterateLinks(link);    
                                } else {
                                    brokenLinks.append(link + " \n\tFROM " + urlText + "\n");
                                } 
                            }
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
    
    public static void main(String args[]) {
        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new Gui().setVisible(true);
            }
        });
    }
    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JTextArea brokenLinks;
    private javax.swing.JLabel error;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JScrollPane jScrollPane2;
    private javax.swing.JButton search;
    private javax.swing.JTextField urlField;
    private javax.swing.JTextArea webText;
    // End of variables declaration//GEN-END:variables
}
