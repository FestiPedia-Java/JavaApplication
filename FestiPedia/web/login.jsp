<%-- 
    Document   : login
    Created on : 18-04-2013, 15:22:54
    Author     : Groep 15
--%>



<jsp:include page="includes/header.jsp" >
   <jsp:param name="siteNaam" value="Login" />  
</jsp:include> 


<div class="row inhoud"><!-- Content -->

	 <div class="col col_16" > 
         
             <%
            String username = request.getParameter("name");
            String password = request.getParameter("pass");
           out.println("Checking login<br>");
            if (username == null || password == null) {
 
                out.print("Je hebt niet beide invoervaken ingevuld"); // Dit zou door validatie overbodig moeten zijn
            }
 
            
            if (username.toLowerCase().trim().equals("admin") && password.toLowerCase().trim().equals("pxl")) {
                out.println("Welkom " + username + " <a href=\"index.jsp\">Back to main</a>");
                session.setAttribute("username", username);
            }
           else 
               {
                out.println("Foute naam en wachtwoord combinatie.");
           }
 
 
 
 
%> 
             
         </div> 
       
        
    
</div><!-- row -->
<jsp:include page="includes/footer.jsp" />