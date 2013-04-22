<%-- 
    Document   : editFest
    Created on : 21-mrt-2013, 15:22:54
    Author     : Groep 15
--%>
<%@page import="java.sql.*" %>
<%@page import="java.io.*" %>


<jsp:include page="includes/header.jsp" >
   <jsp:param name="siteNaam" value="Edit" />  
</jsp:include> 



<div class="row inhoud"><!-- Content -->

	 <div class="col col_16" > <h1>Admin Panel</h1></div> 
        <div class="col col_12 tabs" ><div class="col-inhoud">
          
                <h2> Edit a Festival</h2>
                
                <form action="editFestival.jsp" method="post">
                    
                   
                        
                        <%
    try{
                String connectionURL = "jdbc:mysql://localhost:3306/groep15_festivals?zeroDateTimeBehavior=convertToNull";
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                Connection connection = DriverManager.getConnection(connectionURL, "root", "");
                Statement statement = connection.createStatement();
                
                String fest_id = request.getParameter("festival");
                
                ResultSet rs = statement.executeQuery("SELECT * FROM festivals where fest_id = " + fest_id );
                 
%>

<%
while(rs.next())
{
String festId = rs.getString("fest_id");
String festName = rs.getString("fest_naam");
String festLocatie = rs.getString("fest_locatie");
String festDatum = rs.getString("fest_datum");
String festDuur = rs.getString("fest_duur");




out.println("<table class='edit'><tr><td>ID:</td><td> "+
        "<input type='text' class='readonly' name='id' value='"+festId+"'  readonly /></td></tr>"+
       "<tr><td>Name:</td><td> <input type='text' name='naam' value='"+festName+"' /></td></tr>"+
        "<tr><td>Location:</td><td> <input type='text' name='locatie' value='"+festLocatie+"' /></td></tr>"+
        "<tr><td>Date:</td><td> <input type='text' name='datum' value='"+festDatum+"' /></td></tr>"+
        "<tr><td>Length:</td><td> <input type='text' name='duur' value='"+festDuur+"' /></td></tr></table>");
}
    

        connection.close();
    }catch(Exception e){
        
        out.println("Connectie Fout");
    }
%>
                  

 </br>
                  
                    <input type="submit" value="Save" name="saven" class="red edit-knop"/>
                </form>
            
            </div></div>
    
        
    
</div><!-- row -->



<jsp:include page="includes/log.jsp" />
<jsp:include page="includes/footer.jsp" />
