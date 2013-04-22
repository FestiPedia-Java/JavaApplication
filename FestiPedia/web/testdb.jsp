<%-- 
    Document   : index
    Created on : 21-mrt-2013, 15:22:54
    Author     : Groep 15
--%>



<jsp:include page="includes/header.jsp" >
   <jsp:param name="siteNaam" value="Home" />  
</jsp:include> 


<div class="row inhoud"><!-- Content -->

	 <div class="col col_16" > <h1>Home</h1></div> 
        <div class="col col_7 tabs" ><div class="col-inhoud">
          
        <%@page import="java.sql.*" %>
    <%@page import="java.io.*" %>
    <%
     try{
                String connectionURL = "jdbc:mysql://localhost:3306/groep15_festivals?zeroDateTimeBehavior=convertToNull";
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                Connection connection = DriverManager.getConnection(connectionURL, "root", "");
                Statement statement = connection.createStatement();
                
             
                 out.println("rs1 if false ");
                 String query2 = "INSERT into ips VALUES('0','halo')";
                 
              
                 
                 statement.executeQuery(query2);
               
                 out.println("rs1 if done ");
                
                
                
               
              
    

        connection.close();
    }catch(Exception e){
        
         out.println("Connectie Fout");
    }
%>
            
            </div></div>
    <div class="col col_7 tabs" >
        <div class="col-inhoud">
            
       test2
        
         </div></div>
        
    
</div><!-- row -->



<jsp:include page="includes/log.jsp" />
<jsp:include page="includes/footer.jsp" />
