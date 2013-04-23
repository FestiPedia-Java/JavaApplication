<%-- 
    Document   : IP
    Created on : 21-mrt-2013, 15:22:54
    Author     : Groep 15
--%>
<jsp:include page="includes/header.jsp" >
   <jsp:param name="siteNaam" value="IP" />  
</jsp:include> 
   
   
    <%@page import="java.sql.*" %>
    <%@page import="java.io.*" %>
    <%@page import="com.Festipedia.Bands" %>

<%
    try{
        /**
         * In een try catch maken we connectie met database, maken ook onmiddelijk een statement en een resultset aan
         * dit voor later op het einde in de catch fouten op te vangen als deze er zich moesten voor doen.
         * De resultset vullen we met alle gegeven van de databank Festivals die aanwezig zijn
         */
                String connectionURL = "jdbc:mysql://localhost:3306/groep15_festivals?zeroDateTimeBehavior=convertToNull";
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                Connection connection = DriverManager.getConnection(connectionURL, "root", "");
                Statement statement = connection.createStatement();
                ResultSet rs = statement.executeQuery("SELECT * FROM ips");
                 
%>
<div class="row inhoud"><!-- Content -->
    <div class="col col_16" > 
        <h1>Visisitor Information</h1>
    </div>
    <div class="col col_16" >
        
          
<%
    Bands b;
        
          /**
           * Zolang er items aanwezig in in de resultset doorlopen we deze en tonen we deze op het scherm
           * We zetten alle info dan in Bands, Bands is een klasse
           */
    out.println("<table class='save-tabel'> <tr><td>IP</td><td>Link Clicks</td></tr>" );
    while(rs.next())
        {
            /**
             * We creeren bands b en vullen deze met alle waarden die we uit de database halen
             * Hierna printen we deze uit met out.println
             */
       
            
        out.println("<tr><td>" + rs.getString("ip")  + "</td><td>"+ rs.getInt("site_kliks")+"</td></tr> " );
        }
    out.println("</table> " );

    /**
     * We sluiten de connectie met de database af
     */
        connection.close();
        /*
         * Vangen mogelijke foutmeldingen op in de catch en printen deze uit
         */
    }catch(Exception e){
        
        out.println("Geen database connectie");
    }
%>
              
    </div>
        
    
</div>
<jsp:include page="includes/log.jsp" />
<jsp:include page="includes/footer.jsp" />