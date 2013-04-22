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
         
             <h1>Login</h1>
         
             
         </div> 
       
        
    
</div><!-- row -->

<div id="login-panel">
    
    
    <a href="#" class="bClose" id="subwindow_close">Close</a>
    
    <h1>Login</h1>
    
     <%
        String myname =  (String)session.getAttribute("username");
        
        if(myname!=null)
            {
             out.println("<p>U ben ingelogd als  " + myname + "  , <a href=\"logout.jsp\" >Logout?!</a></p>");
            out.println("<p>Ga door naar het <a href=\"admin.jsp\" >Admin Panel</a></p>");
          
            }
        else 
            {
            
            String username = request.getParameter("name");
            String password = request.getParameter("pass");
            
           out.println("<p>Checking login...</p>");
           
 
            
            if (username.toLowerCase().trim().equals("admin") && password.toLowerCase().trim().equals("phl")) {
                  out.println("<p>Welkom " + username + " <a href=\"index.jsp\">Back to main</a></p>");
                session.setAttribute("username", username);
            }
           else 
               {
                out.println( "<p style='color:red;'>Foute naam en wachtwoord combinatie.</p>");
                
                %>
                
                 <form action="login.jsp" method="post" id="login-form">
    <input type="text" name="name" size="50" class="required"><img class="icon" src="images/user.png" />
    <input type="password" name="pass" size="50" class="required"><img class="icon" src="images/pass.png" />

    <input type="submit" value="Login" class="red login-knop">
    </form>
                
                <%
                
           }
        
         
            }
            
            %>
            
            
            
         <script type="text/javascript">
$( document ).ready(function() {
    $("#admin-knop").click();
    
});
</script>    

        
   
    
    
    
</div>
<jsp:include page="includes/footer.jsp" />
