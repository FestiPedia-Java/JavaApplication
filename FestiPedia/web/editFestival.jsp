<%-- 
    Document   : editFest
    Created on : 21-mrt-2013, 15:22:54
    Author     : Groep 15
--%>

<!-- Nodig voor SQL en input output te gebruiken -->
<%@page import="java.sql.*" %>
<%@page import="java.io.*" %>

<!-- header includen met parameter -->
<jsp:include page="includes/header.jsp" >
   <jsp:param name="siteNaam" value="Edit" />  
</jsp:include> 



<div class="row inhoud"><!-- Content -->

	 <div class="col col_16" > <h1>Admin Panel</h1></div> 
        <div class="col col_12 tabs" ><div class="col-inhoud">
          
                <h2> Edit a Festival</h2>
                
                <form action="admin.jsp" method="post">
                    
                   
                        
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
            
              int id = 0;
              if(rs.next()){
               id = rs.getInt(1);
              id++;
              }
              
               //toont die lijst alleen de naam invult en geeft die laatste id+1 mee
              out.println("<table class='edit'><tr><td>ID:</td><td> "+
        "<input type='text' class='readonly' name='id' required='required'  placeholder='id' value='"+ id +"'  readonly /></td></tr>"+
       "<tr><td>Name:</td><td> <input type='text' class='readonly' required='required' placeholder='Festival Name' name='naam' value='"+fest_name_add+"' readonly /></td></tr>"+
        "<tr><td>Location:</td><td> <input type='text' name='locatie' placeholder='Location' required='required' /></td></tr>"+
        "<tr><td>Date:</td><td> <input type='text' name='datum' placeholder='YYYY-MM-DD' required='required' /></td></tr>"+
        "<tr><td>Length:</td><td> <input type='text' name='duur' placeholder='Days' required='required' /></td></tr></table> "+
                      "<div class='submit-div'><input type='submit' value='Save' name='saven' class='red edit-knop'/></div>"+
                        "<div class='aknop-div'><a href='admin.jsp' class='red edit-knop aknop'>Cancel</a></div>");
              }
              
          }else{
          //edit
              
              if(request.getParameter("submit") == null ){
              
                  out.println("U bent rechstreeks naar deze pagina gekomen, U heeft hier niets te zoeken");
                  
              }else{
              
              
              // haalt meegegeven id mee dat verandert moet veranderen
                            
           String fest_id = request.getParameter("festival");   
           
                            
                            
    try{
                String connectionURL = "jdbc:mysql://localhost:3306/groep15_festivals?zeroDateTimeBehavior=convertToNull";
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                Connection connection = DriverManager.getConnection(connectionURL, "root", "");
                Statement statement = connection.createStatement();
                
                
                // haalt gegevens op van dat festival
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

//vult de velden al in zodat je gemakkelijk wijzigingen kan toevoegen


out.println("<table class='edit'><tr><td>ID:</td><td> "+
        "<input type='text' class='readonly' required='required' name='id' value='"+festId+"'  readonly /></td></tr>"+
       "<tr><td>Name:</td><td> <input type='text' required='required' name='naam' value='"+festName+"' /></td></tr>"+
        "<tr><td>Location:</td><td> <input type='text' required='required' placeholder='Location' name='locatie' value='"+festLocatie+"' /></td></tr>"+
        "<tr><td>Date:</td><td> <input type='text' required='required' placeholder='YYYY-MM-DD' name='datum' value='"+festDatum+"' /></td></tr>"+
        "<tr><td>Length:</td><td> <input type='text' required='required' name='duur' placeholder='Days' value='"+festDuur+"' /></td></tr></table>"+
        "<div class='submit-div'><input type='submit' value='Save' name='hersaven' class='red edit-knop'/></div>"
        
        + "<div class='aknop-div'><a href='admin.jsp' class='red edit-knop aknop'>Cancel</a></div>");
}
    

        connection.close();
    }catch(Exception e){
        
        out.println("Connectie Fout");
    }
              }
    
    
          }
              
%>
                  

 
                </form>
            
            </div></div>
    
        
    
</div><!-- row -->


<!-- include de log en footer -->
<jsp:include page="includes/log.jsp" />
<jsp:include page="includes/footer.jsp" />
