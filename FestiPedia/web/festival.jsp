<%-- 
    Document   : Festival
    Created on : 18-apr-2013, 13:20:37
    Author     : Bram
--%>


<jsp:include page="includes/header.jsp" />
<%@page import="java.sql.*" %>
<%@page import="java.io.*" %>

<%
    try{
                String connectionURL = "jdbc:mysql://localhost:3306/groep15_festivals?zeroDateTimeBehavior=convertToNull";
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                Connection connection = DriverManager.getConnection(connectionURL, "root", "");
                Statement statement = connection.createStatement();
                ResultSet rs = statement.executeQuery("SELECT * FROM Festivals");
                 
%>
<div class="row inhoud"><!-- Content -->

	 <div class="col col_16" > <h1>Upcoming Festivals</h1></div> 
        <div class="col col_7 tabs" ><div class="col-inhoud">
                
<%
while(rs.next())
{
String FestivalName = rs.getString("fest_naam");
String FestivalLocation = rs.getString("fest_locatie");
String FestivalDate = rs.getString("fest_datum");
out.println(  FestivalName  + " "+ FestivalLocation + " "+ FestivalDate +" </br>");
}
    

        connection.close();
    }catch(Exception e){
        
        out.println("fout shit");
    }
%>

            </div></div>
    <div class="col col_7 tabs" >
        <div class="col-inhoud">
            
       test2
        
         </div></div>
        
    
</div><!-- row -->
<jsp:include page="includes/footer.jsp" />
