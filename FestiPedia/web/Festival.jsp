<%-- 
    Document   : Festival
    Created on : 18-apr-2013, 13:20:37
    Author     : Bram
--%>


<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%! String siteNaam = "Home"; %> 


<jsp:include page="includes/header.jsp" >
   <jsp:param name="siteNaam" value="Home" />  
</jsp:include> 


<div class="row inhoud"><!-- Content -->

	 <div class="col col_16" > <h1>Home</h1></div> 
        <div class="col col_7 tabs" ><div class="col-inhoud">
          
        <table border="1">
<tr><th>Festival naam<th> ..... <th> ......</tr>
<%
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
Connection con = DriverManager.getConnection("jdbc 	 dbc:mydatabase;UID=raymond;PWD=123456");
Statement stmt = con.createStatement();
ResultSet rs = stmt.executeQuery("SELECT * FROM Employees");
while(rs.next())
{
String employeeId = rs.getString("EmployeeID");
String employeeName = rs.getString("FirstName");
String employeeExt = rs.getString("Title");

out.print("<tr>");
out.print("<td>" + employeeId + "</td>");
out.print("<td>" + employeeName + "</td>");
out.print("<td>" + employeeExt + "</td>");
out.print("</tr>");
} 
con.close();
%>
</table>
            
            </div></div>
    <div class="col col_7 tabs" >
        <div class="col-inhoud">
            
       test2
        
         </div></div>
        
    
</div><!-- row -->
<jsp:include page="includes/footer.jsp" />
