package checker;

import java.io.*;
import java.net.*;
import java.util.ArrayList;
import java.util.List;

public class Header implements Runnable{
    private List<String> checkedUrls = new ArrayList();
    private List<String> brokenUrls = new ArrayList();
    private String theUrl;
    
    public void run(){
        getWebpage(theUrl);
    }
    
    /**
     * valideert of de url een lokale url is.
     * @param url
     * @return 
     */
    public static boolean validateUrl(String url) {
        return url.matches("((https?://)?localhost){1}([a-zA-Z0-9]*)?/?([a-zA-Z0-9\\:\\-\\._\\?\\,\\'/\\\\\\+&amp;%\\$#\\=~])*");
    }
    
    /**
     * Poging om de header(HEAD) van een website te krijgen.
     * Krijgen we een header, wilt dit zeggen dat de link werkt, anders werkt de link niet.
     * @param targetUrl
     * @return 
     * http://singztechmusings.wordpress.com/2011/05/26/java-how-to-check-if-a-web-page-exists-and-is-available/
     */
    public static boolean urlExists(String targetUrl) {
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
     * In de huidige lijn wordt gekeken of er "<a href=" gevonden wordt want dit wil zeggen dat daarachter een link staat.
     * @param line
     * @return 
     **/
    public static boolean checkForUrl(String line){
        return line.matches("(.)*(<a href=){1}(.)*");
    }
    
    /**
     * controleert of de url nog nagekeken is.
     * @param url 
     * @return 
     **/
    public boolean notYetChecked(String url){
        for(String s:checkedUrls){
            if(url.equals(s)) return false;
        }
        return true;
    }
    
    /**
     * Heel de webpagina wordt ingeladen en er wordt naar links gezocht.
     * @param url 
     * @return 
     **/
    public List[] getWebpage(String url){
            List[] alleUrls = new List[2];
            String address = "127.0.0.1";
            int port = 80;
            String header = "GET "+url.split("http://localhost")[1]+" HTTP/1.1\n"
                    + "Host: localhost\n"
                    + "User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.9.2.8) Gecko/20100723 Ubuntu/10.04 (lucid) Firefox/3.6.8\n"
                    + "Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\n"
                    + "Accept-Language: en-us,en;q=0.5\n"
                    + "Accept-Encoding: gzip,deflate\n"
                    + "Accept-Charset: ISO-8859-1,utf-8;q=0.7,*;q=0.7\n"
                    + "Keep-Alive: 115\n"
                    + "Connection: keep-alive\n"
                    + "\r\n";
            String link;
            
            //url toevoegen aan de lijst met reeds gecontroleerde url's.
            checkedUrls.add(url);
            
            try {
                //nieuwe socket aanmaken
                Socket sck = new Socket(address, port);
                //website inlezen
                BufferedReader rd = new BufferedReader(new InputStreamReader(sck.getInputStream()));
                BufferedWriter wr = new BufferedWriter(
                        new OutputStreamWriter(sck.getOutputStream(), "ISO-8859-1"));
                wr.write(header);
                wr.flush();

                System.out.println("REQUEST HEADER");
                System.out.println(header);
                System.out.println("RESPONSE HEADER");
                String line;
                //1 voor 1 elke lijn afgaan.
                while ((line = rd.readLine()) != null) {
                    //System.out.println(line);
                    if(checkForUrl(line)){
                    //Er staat een url op deze lijn.
                        //tekst splitsen waar 'a href="' staat.
                        String[] parts = line.split("a href=\"");
                        
                        for(int i=0; i<parts.length; i++){
                            if(parts[i].matches("http.*")){
                            //Dit gesplitste deel bevat een url met mss nog wat overbodige tekst achter.
                                //verwijderen van tekst die nog achter de link staat.
                                link = parts[i].substring(0, parts[i].indexOf("\""));
                                
                                if(urlExists(link)){
                                //De url is een werkende url
                                    if(validateUrl(link) && notYetChecked(link) && !link.matches("(.)*.(pdf|jpg|png)")){
                                    //link is een lokale url die nog niet gecontroleerd is.
                                        theUrl = link;
                                        Thread t = new Thread();
                                        t.start();
                                    } else {}
                                }else{
                                //deze url is "broken"    
                                    brokenUrls.add("Broken link:\t" + link + "\n On page:\t" + url + "\n\n");     
                                }
                            }
                        }
                    }
                }

                wr.close();
                rd.close();
                sck.close();

            } catch (Exception e) {
                e.printStackTrace();
            }
            
            //alle pagina's die gecontroleerd zijn.
            alleUrls[0] = checkedUrls;
            //alle url's die een foutmelding gaven.
            alleUrls[1] = brokenUrls;
            
            return alleUrls;

    }
}

