package checker;


import java.util.ArrayList;
import java.util.List;


/**
 * @author Kevin
 */
public class Gui extends javax.swing.JFrame {

    List<String> checkedUrls = new ArrayList();
    Header h1 = new Header();
    
    public Gui() {
        super("Linkrot checker");
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
        jLabel4 = new javax.swing.JLabel();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        urlField.setFont(new java.awt.Font("Vrinda", 0, 13)); // NOI18N

        search.setFont(new java.awt.Font("Vrinda", 0, 11)); // NOI18N
        search.setText("Search");
        search.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                searchActionPerformed(evt);
            }
        });

        error.setFont(new java.awt.Font("Vrinda", 0, 14)); // NOI18N
        error.setForeground(new java.awt.Color(255, 0, 0));

        webText.setColumns(20);
        webText.setFont(new java.awt.Font("Vrinda", 0, 13)); // NOI18N
        webText.setRows(5);
        jScrollPane1.setViewportView(webText);

        brokenLinks.setColumns(20);
        brokenLinks.setFont(new java.awt.Font("Vrinda", 0, 13)); // NOI18N
        brokenLinks.setRows(5);
        jScrollPane2.setViewportView(brokenLinks);

        jLabel1.setFont(new java.awt.Font("Vrinda", 0, 18)); // NOI18N
        jLabel1.setText("Broken links:");

        jLabel2.setFont(new java.awt.Font("Vrinda", 0, 18)); // NOI18N
        jLabel2.setText("Checked URL's");

        jLabel3.setFont(new java.awt.Font("Vrinda", 0, 18)); // NOI18N
        jLabel3.setText("Enter URL");

        jLabel4.setFont(new java.awt.Font("Vrinda", 3, 36)); // NOI18N
        jLabel4.setForeground(new java.awt.Color(0, 102, 255));
        jLabel4.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        jLabel4.setText("Linkrot checker");

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(28, 28, 28)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(urlField)
                    .addComponent(jScrollPane1)
                    .addComponent(jScrollPane2)
                    .addGroup(layout.createSequentialGroup()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jLabel3)
                            .addComponent(jLabel1)
                            .addComponent(jLabel2))
                        .addGap(0, 0, Short.MAX_VALUE))
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(error, javax.swing.GroupLayout.PREFERRED_SIZE, 650, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addComponent(search)))
                .addContainerGap())
            .addGroup(layout.createSequentialGroup()
                .addGap(248, 248, 248)
                .addComponent(jLabel4, javax.swing.GroupLayout.PREFERRED_SIZE, 263, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jLabel4)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addComponent(jLabel3)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(urlField, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(error, javax.swing.GroupLayout.PREFERRED_SIZE, 23, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(search))
                .addGap(18, 18, 18)
                .addComponent(jLabel2)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 113, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(jLabel1)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jScrollPane2, javax.swing.GroupLayout.PREFERRED_SIZE, 250, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap())
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents
    
    /**
     * Haalt de url uit het invoerveld, valideert deze en geeft die dan mee aan getWebpage
     * Als er een fout is in de url, wordt een error label weergegeven.
     * @param evt 
     */
    private void searchActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_searchActionPerformed
        webText.setText(null);
        brokenLinks.setText(null);
        String urlText = urlField.getText();
        if(!h1.validateUrl(urlText) || !h1.urlExists(urlText)){
            //foutieve url
            error.setText("This url is not located on the localhost!");
        }else{
            error.setText("");
            List[] alleUrls = h1.getWebpage(urlText);
            
            //gecontroleerde pagina's in een textArea zetten
            for(int i =0; i<alleUrls[0].size(); i++){
                webText.append(alleUrls[0].get(i) + "\n");
            }
            
            //broken links in andere textArea zetten
            for(int i =0; i<alleUrls[1].size(); i++){
                brokenLinks.append(alleUrls[1].get(i) + "");
            }
           
        }
    }//GEN-LAST:event_searchActionPerformed
    
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
    private javax.swing.JLabel jLabel4;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JScrollPane jScrollPane2;
    private javax.swing.JButton search;
    private javax.swing.JTextField urlField;
    private javax.swing.JTextArea webText;
    // End of variables declaration//GEN-END:variables
}
