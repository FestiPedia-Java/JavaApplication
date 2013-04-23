import java.io.*;
import java.net.*;
import java.util.ArrayList;
import java.util.List;

public class Header {
    List<String> checkedUrls = new ArrayList();
    List<String> brokenUrls = new ArrayList();
    
    public static boolean validateUrl(String url) {
        return url.matches("((https?://)?localhost){1}([a-zA-Z0-9]*)?/?([a-zA-Z0-9\\:\\-\\._\\?\\,\\'/\\\\\\+&amp;%\\$#\\=~])*");
    }
    
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
    
    public static boolean checkForUrl(String line){
        return line.matches("(.)*(<a href=){1}(.)*");
    }
    
    public boolean notYetChecked(String url){
        for(String s:checkedUrls){
            if(url.equals(s)) return false;
        }
        return true;
    }

    public List[] getWebpage(String url) {
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
            
            checkedUrls.add(url);
            
            try {
                Socket sck = new Socket(address, port);
                BufferedReader rd = new BufferedReader(new InputStreamReader(sck.getInputStream()));
                BufferedWriter wr = new BufferedWriter(
                        new OutputStreamWriter(sck.getOutputStream(), "ISO-8859-1"));
                wr.write(header);
                wr.flush();

                System.out.println("REQUEST HEADER");
                System.out.println(header);
                System.out.println("RESPONSE HEADER");
                String line;
                while ((line = rd.readLine()) != null) {
                    //System.out.println(line);
                    if(checkForUrl(line)){
                    //Er staat een url op deze lijn.
                        //tekst splitsen waar 'a href="' staat.
                        String[] parts = line.split("a href=\"");
                        
                        for(int i=0; i<parts.length; i++){
                            if(parts[i].matches("http.*")){
                            //Dit gesplitste deel bevat een url met mss nog xwat overbodige tekst achter.
                                //verwijderen van tekst die nog achter de link staat.
                                link = parts[i].substring(0, parts[i].indexOf("\""));
                                
                                if(urlExists(link)){
                                //is een lokale url die nog niet gecontroleerd is
                                    if(validateUrl(link) && notYetChecked(link) && !link.matches("(.)*.pdf")){
                                        getWebpage(link);
                                    } else {}
                                }else{
                                    brokenUrls.add("Broken link:\t" + link + " \n\tOn page:\t " + url + "\n\n");     
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
            alleUrls[0] = checkedUrls;
            alleUrls[1] = brokenUrls;
            
            return alleUrls;

    }
}

