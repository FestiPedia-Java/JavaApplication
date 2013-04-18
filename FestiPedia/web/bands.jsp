<%-- 
    Document   : bands
    Created on : 21-mrt-2013, 15:22:54
    Author     : Groep 15
--%>
<jsp:include page="includes/header.jsp" />
<%@page import="java.sql.*" %>
<%@page import="java.io.*" %>
<%
    try{
        String connectionURL = "jdbc:mysql://localhost:3306/groep15_festivals?zeroDateTimeBehavior=convertToNull";
        Connection connection = null;
        Statement statement = null;
        ResultSet rs = null;
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        connection = DriverManager.getConnection(connectionURL, "root", "");
        statement = connection.createStatement();
        String QueryString = "SELECT * from Bands";
        rs = statement.executeQuery(QueryString);
%>
<div class="row inhoud"><!-- Content -->
    <div class="col col_16" > <h1>Bands</h1></div>
    <div class="col col_7 tabs" >
        <div class="col-inhoud">
            <h3>Upcoming Bands</h3>
<%
        while(rs.next()){
            rs.getString(2);
        }
        rs.close();
        statement.close();
        connection.close();
    } catch(Exception e){
        out.println("Unable to connect to database");
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
<jsp:include page="includes/footer.jsp" />