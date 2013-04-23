<%-- 
    Document   : footer
    Created on : Apr 18, 2013, 9:29:38 AM
    Author     : groep 16
--%>

<footer class="row">

	<div>All rights reserved &copy; FestiPedia | 52framework! the framework from the future</div>
        <a href="" id="admin-knop">
            <%
                 String myname =  (String)session.getAttribute("username");
           if(myname!=null)
            {
         
            out.println("Admin-tool");
          
            }
        else 
            {
             out.println("Admin");
            }
           %>
        </a>

</footer>

    <%@page import="java.sql.*" %>
    <%@page import="java.io.*" %>
    <%
     try{
         /**
          * Opvangen van errors via try catch methode, als eerst maken we de connectie met de database opnieuw
          * We maken ook onmiddelijk een statement aan
          */
                String connectionURL = "jdbc:mysql://localhost:3306/groep15_festivals?zeroDateTimeBehavior=convertToNull";
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                Connection connection = DriverManager.getConnection(connectionURL, "root", "");
                Statement statement = connection.createStatement();
           /**
            * Vragen het IP adres op dat de site heeft aangevraagd via de methode request.getRemoteAddr();
            * Maken een resultset aan voor alle data die al aanwezig is in de resultset te zetten dit voor te controleren
            * of de persoon die connectie legt met site al eens op de site is geweest.
            */     
                String ip = request.getRemoteAddr();
                ResultSet rs1 = statement.executeQuery("SELECT * from ips where ip='" + ip + "'");
             /**
              * We doorlopen de resultset met methode next()
              * Als de persoon al op de site is geweest dan voegen we 1 klik erbij
              * en updaten we de database zodat we weten hoeveel keer deze persoon op de site is geweest
              */  
                if(rs1.next()){
                    
                    int kliks = rs1.getInt("site_kliks");
                    kliks++;
                    statement.executeUpdate("Update ips SET site_kliks=" + kliks +" where ip='"+ ip +"'" );
                  }
                /**
                 * Anders als de persoon nog nooit erop is geweest gaan we het IP adres toevoegen aan de database
                 * we geven dan als parameter naar database het IP en 1 klik mee.
                 */
                else{           
                 int klik = 1;                             
                 statement.executeUpdate("INSERT INTO ips (ip, site_kliks) VALUES ('" + ip + "'," + klik + ")");
                }
                
                /**
                 * Sluiten de connectie met database af via connection.close()
                 */        

        connection.close();
        
        /**
         * We vangen mogelijke fouten op
         */
    }catch(Exception e){
        
         out.println("Connectie Fout");
    }
%>


</body>
</html>