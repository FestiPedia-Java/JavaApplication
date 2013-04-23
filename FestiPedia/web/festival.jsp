<%-- 
    Document   : festival
    Created on : 18-apr-2013, 13:20:37
    Author     : Bram
--%>

<jsp:include page="includes/header.jsp" >
   <jsp:param name="siteNaam" value="Festivals" />  
</jsp:include> 

    <%@page import="java.sql.*" %>
    <%@page import="java.io.*" %>
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
                ResultSet rs = statement.executeQuery("SELECT * FROM Festivals");
                 
%>
<div class="row inhoud"><!-- Content -->

	 <div class="col col_16" > 
             <h1>Upcoming Festivals</h1>
         </div> 
         <div class="col col_7 tabs" ><div class="col-inhoud">
                
<%
                /**
                 * Zolang er items aanwezig in in de resultset doorlopen we deze en tonen we deze op het scherm
                 */
                while(rs.next())
                {
                    String festName = rs.getString("fest_naam");
                    String festLocation = rs.getString("fest_locatie");
                    String festDate = rs.getString("fest_datum");
                    out.println(  festName  + " "+ festLocation + " "+ festDate +" </br>");
                }
                /**
                 * We sluiten de connectie met de database
                 */
                connection.close();
                /**
                 * We vangen mogelijke errors op in de catch en printen deze dan uit op het scherm
                 */
    }catch(Exception e){
        
        out.println("Geen Database connectie");
    }
%>

            </div>
         </div>       
    
</div>
<jsp:include page="includes/log.jsp" />
<jsp:include page="includes/footer.jsp" />
