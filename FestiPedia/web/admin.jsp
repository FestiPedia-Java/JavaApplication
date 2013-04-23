<%-- 
    Document   : Admin
    Created on : 21-mrt-2013, 15:22:54
    Author     : Groep 15
--%>

<!-- maakt het mogelijk om sql te gebruiken en input output -->
<%@page import="java.sql.*" %>
<%@page import="java.io.*" %>

<!-- Include de header page met een meegegeven variabele voor de pagina title -->
<jsp:include page="includes/header.jsp" >
   <jsp:param name="siteNaam" value="Admin" />  
</jsp:include> 
    
<!-- Javascript zal de form validaten in dit jsp webpage -->
     <script>
		$(function(){
			$("form").validator()
		})
	</script>

<div class="row inhoud"><!-- Content -->

	 <div class="col col_16" > <h1>Admin Panel</h1></div>
         
         <% 
             
             if(session.getAttribute("username") == null) {
                 out.println(" <div class='col col_16' > <h1>You dont belong here, log in!</h1></div>");
             }else{
             %>
         
         
           <%
               // controleren of de persoon van een edit pagina komt, anders moet deze code niet uitgevoerd worden
    if(request.getParameter("saven") != null || request.getParameter("hersaven") != null ){
    %>

<div class="col col_16">
     <div class="col-inhoud">
         
         <h2>Saved Festival</h2>
         
         <!-- We defenieren onze bean hier om deze later te gebruiken. -->
     <jsp:useBean id="festival_edit" class="beans.Festbean" scope="request">
    <jsp:setProperty name="festival_edit" property="*"/>
    </jsp:useBean>
   
         <!-- overzicht geven wat er verandert gaat worden -->
    <table class="save-tabel">
        <tr><td>Field</td><td>Value</td></tr>
        <tr><td>ID</td><td><jsp:getProperty name="festival_edit" property="id" /></td></tr>
    <tr><td>Festival Name</td><td><jsp:getProperty name="festival_edit" property="naam" /></td></tr>
   <tr><td>Location</td><td> <jsp:getProperty name="festival_edit" property="locatie" /></td></tr>
    <tr><td>Date</td><td><jsp:getProperty name="festival_edit" property="datum" /></td></tr>
    <tr><td>Length</td><td><jsp:getProperty name="festival_edit" property="duur" /></td></tr>
    </table>
     

    
    <%
        
        
        try{
                String connectionURL = "jdbc:mysql://localhost:3306/groep15_festivals?zeroDateTimeBehavior=convertToNull";
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                Connection connection = DriverManager.getConnection(connectionURL, "root", "");
                Statement statement = connection.createStatement();
                
                // checken of die van een nieuwe festival komt of een bestaande
                if(request.getParameter("saven") != null){
                
                  // maak een nieuw festival aan
               statement.executeUpdate("INSERT INTO festivals (fest_id, fest_naam, fest_locatie, fest_datum, fest_duur)"
                       + " VALUES ('"+festival_edit.getId()+"','"+
                       festival_edit.getNaam() + "','" +
                       festival_edit.getLocatie() + "','" +
                      festival_edit.getDatum() + "','" +
                       festival_edit.getDuur() + "'" +
                       ")");}
                else{
                     // update een bestaande festival
                     statement.executeUpdate("UPDATE festivals SET fest_id = '"+festival_edit.getId()+
                             "', fest_naam = '"+
                       festival_edit.getNaam() + "', fest_locatie ='" +
                       festival_edit.getLocatie() + "', fest_datum ='" +
                      festival_edit.getDatum() + "', fest_duur ='" +
                       festival_edit.getDuur() + "'"+
                       " where fest_id = '"+festival_edit.getId()+"'");
                
                }
                 


               
    

        connection.close();
    }catch(Exception e){
        // ergens een foutje opgelopen
        out.println("Door een connectie fout is het festival NIET opgeslagen in de database!");
    }

        
   %>
   </div></div>
   <%
        
        
        
        
    }
    
    
    
    
    
    
    %>
         
         
         
        <div class="col col_7 tabs" ><div class="col-inhoud">
          
                <h2> Edit a Festival</h2>
                
                <form action="editFestival.jsp" method="post">
                    
                    <select name="festival">
                        
                        <%
    try{
                String connectionURL = "jdbc:mysql://localhost:3306/groep15_festivals?zeroDateTimeBehavior=convertToNull";
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                Connection connection = DriverManager.getConnection(connectionURL, "root", "");
                Statement statement = connection.createStatement();
                ResultSet rs = statement.executeQuery("SELECT * FROM festivals");
                 
                // alle bestaande fest in de select zetten

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
            
            <h2>Add a Festival</h2>
            <!-- Form voor het toeveogen van een festival-->
                <form action="editFestival.jsp" method="post" name="form">
                    
                    <input type="text" placeholder="Festival Name" required="required" name="festival_name" />
 </br>
                  
                    <input type="submit" value="Add" name="submit_add" class="red edit-knop"/>
                </form>
        
         </div></div>

       
   <% } %>     
    
</div><!-- row -->


<!-- log scherm en footer includen -->
<jsp:include page="includes/log.jsp" />
<jsp:include page="includes/footer.jsp" />
