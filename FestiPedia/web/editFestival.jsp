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
          
         
           
          
          if(request.getParameter("submit_add") != null){ // checkt of add of edit word gedaan
              // add
              // database connectie + klaar maken voor een query uit te voeren
              String connectionURL = "jdbc:mysql://localhost:3306/groep15_festivals?zeroDateTimeBehavior=convertToNull";
               Class.forName("com.mysql.jdbc.Driver").newInstance();
               Connection connection = DriverManager.getConnection(connectionURL, "root", "");
               Statement statement = connection.createStatement();
              // haalt naam uit request
                String fest_name_add = request.getParameter("festival_name");
              // checkt of naam al in gebruik is
              ResultSet rs1 = statement.executeQuery("SELECT * FROM festivals where fest_naam = '"+fest_name_add+"'");
              
              
              if(rs1.next()){
                  // geeft foutmelding als de naam al voorkomt
                 out.println("<p class='rood-error'>Deze naam is al in gebruik.</p>");
              }
              else{
                  
              
             // kijkt naar het hoogste id om een uniek id te kunnen maken.
              
               
              ResultSet rs = statement.executeQuery("SELECT max(fest_id) as res FROM festivals");
              int id = rs.getInt("res");
               //toont die lijst alleen de naam invult en geeft die laatste id+1 mee
              out.println("<table class='edit'><tr><td>ID:</td><td> "+
        "<input type='text' class='readonly' name='festival' value='"+ id +"'  readonly /></td></tr>"+
       "<tr><td>Name:</td><td> <input type='text' name='naam' value='"+fest_name_add+"' /></td></tr>"+
        "<tr><td>Location:</td><td> <input type='text' name='locatie'  /></td></tr>"+
        "<tr><td>Date:</td><td> <input type='text' name='datum'  /></td></tr>"+
        "<tr><td>Length:</td><td> <input type='text' name='duur'  /></td></tr></table>");
              }
              
          }else{
          //edit
                            
           String fest_id = request.getParameter("festival");   
           String fest_naam = request.getParameter("naam");
           String fest_locatie = request.getParameter("locatie");
           String fest_duur = request.getParameter("duur");
           String fest_datum = request.getParameter("datum");
                            
                            
    try{
                String connectionURL = "jdbc:mysql://localhost:3306/groep15_festivals?zeroDateTimeBehavior=convertToNull";
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                Connection connection = DriverManager.getConnection(connectionURL, "root", "");
                Statement statement = connection.createStatement();
                
                
                
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
        "<input type='text' class='readonly' name='festival' value='"+festId+"'  readonly /></td></tr>"+
       "<tr><td>Name:</td><td> <input type='text' name='naam' value='"+festName+"' /></td></tr>"+
        "<tr><td>Location:</td><td> <input type='text' name='locatie' value='"+festLocatie+"' /></td></tr>"+
        "<tr><td>Date:</td><td> <input type='text' name='datum' value='"+festDatum+"' /></td></tr>"+
        "<tr><td>Length:</td><td> <input type='text' name='duur' value='"+festDuur+"' /></td></tr></table>");
}
    

        connection.close();
    }catch(Exception e){
        
        out.println("Connectie Fout");
    }
    
    
          }
%>
                  

 </br>
                  
                    <input type="submit" value="Save" name="saven" class="red edit-knop"/>
                </form>
            
            </div></div>
    
        
    
</div><!-- row -->



<jsp:include page="includes/log.jsp" />
<jsp:include page="includes/footer.jsp" />
