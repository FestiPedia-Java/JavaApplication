<%-- 
    Document   : bands
    Created on : 21-mrt-2013, 15:22:54
    Author     : Groep 15
--%>
<jsp:include page="includes/header.jsp" >
   <jsp:param name="siteNaam" value="Bands" />  
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
                ResultSet rs = statement.executeQuery("SELECT * FROM Bands");
                 
%>
<div class="row inhoud"><!-- Content -->
    <div class="col col_16" > 
        <h1>Bands</h1>
    </div>
    <div class="col col_7 tabs" >
        <div class="col-inhoud">
            <h3>Upcoming Bands</h3>
<%
    Bands b;
        
          /**
           * Zolang er items aanwezig in in de resultset doorlopen we deze en tonen we deze op het scherm
           * We zetten alle info dan in Bands, Bands is een klasse
           */
    
    while(rs.next())
        {
            /**
             * We creeren bands b en vullen deze met alle waarden die we uit de database halen
             * Hierna printen we deze uit met out.println
             */
        b = new Bands();
        b.setId(rs.getInt("band_id"));
        b.setName(rs.getString("band_naam"));
        b.setMusicStyle(rs.getString("band_soortMuziek"));
        b.setUrl(rs.getString("band_url"));
        out.println("<a href=bandDetail.html>" + b.getName()  + "</a> </br>");
        }
    

    /**
     * We sluiten de connectie met de database af
     */
        connection.close();
        /*
         * Vangen mogelijke foutmeldingen op in de catch en printen deze uit
         */
    }catch(Exception e){
        
        out.println("fout shit");
    }
%>
        </div>        
    </div>
        
    
</div>
<jsp:include page="includes/log.jsp" />
<jsp:include page="includes/footer.jsp" />