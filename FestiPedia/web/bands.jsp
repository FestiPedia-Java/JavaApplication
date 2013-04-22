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
    <%@page import="/com/Bands.java" %>

<%
    try{
                String connectionURL = "jdbc:mysql://localhost:3306/groep15_festivals?zeroDateTimeBehavior=convertToNull";
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                Connection connection = DriverManager.getConnection(connectionURL, "root", "");
                Statement statement = connection.createStatement();
                ResultSet rs = statement.executeQuery("SELECT * FROM Bands");
                 
%>
<div class="row inhoud"><!-- Content -->
    <div class="col col_16" > <h1>Bands</h1></div>
    <div class="col col_7 tabs" >
        <div class="col-inhoud">
            <h3>Upcoming Bands</h3>
<%
    Bands b = new Bands();
                
while(rs.next())
{
String bandName = rs.getString("band_naam");
String bandMusic = rs.getString("band_soortMuziek");
String bandUrl = rs.getString("band_url");
out.println("<a href= bandUrl>" + bandName  + "</a> </br>");
}
    

        connection.close();
    }catch(Exception e){
        
        out.println("fout shit");
    }
%>
        </div>        
    </div>
    <div class="col col_7 tabs" >
        <div class="col-inhoud">
            <h3>Suggestions</h3>
            test2
        </div>        
    </div>
        
    
</div><!-- row -->
<jsp:include page="includes/log.jsp" />
<jsp:include page="includes/footer.jsp" />