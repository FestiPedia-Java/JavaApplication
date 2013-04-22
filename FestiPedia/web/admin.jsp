<%-- 
    Document   : Admin
    Created on : 21-mrt-2013, 15:22:54
    Author     : Groep 15
--%>




<jsp:include page="includes/header.jsp" >
   <jsp:param name="siteNaam" value="Admin" />  
</jsp:include> 

<div class="row inhoud"><!-- Content -->

	 <div class="col col_16" > <h1>Admin Panel</h1></div> 
        <div class="col col_7 tabs" ><div class="col-inhoud">
          
                <h2> Edit a Festival</h2>
                
                <form action="editFestival.jsp" method="post">
                    
                    <select>
                        
                        <%
    try{
                String connectionURL = "jdbc:mysql://localhost:3306/groep15_festivals?zeroDateTimeBehavior=convertToNull";
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                Connection connection = DriverManager.getConnection(connectionURL, "root", "");
                Statement statement = connection.createStatement();
                ResultSet rs = statement.executeQuery("SELECT * FROM festivals");
                 

while(rs.next())
{
String festName = rs.getString("fest_naam");
String festId = rs.getString("fest_id");

out.println(" <option value='"+festId+"'> "+festName+"</option>");
}
    

        connection.close();
    }catch(Exception e){
        
        out.println("Connectie Fout");
    }
%>
                        
                    </select>
 </br>
                  
                    <input type="submit" value="Edit" name="submit" class="red edit-knop"/>
                </form>
            
            </div></div>
    <div class="col col_7 tabs" >
        <div class="col-inhoud">
            
            <h2>Edit a band </h2>
            
            <p> Will be added in the future </p>
        
         </div></div>
        
    
</div><!-- row -->



<jsp:include page="includes/log.jsp" />
<jsp:include page="includes/footer.jsp" />
