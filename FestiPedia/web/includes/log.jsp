<div id="login-panel">
    
    
    <a href="#" class="bClose" id="subwindow_close">Close</a>
    
    <h1>Login</h1>
    
    
    <%
        String myname =  (String)session.getAttribute("username");
        
        if(myname!=null)
            {
             out.println("<p>U ben ingelogd als  " + myname + "  , <a href=\"logout.jsp\" >Logout?!</a></p>");
            out.println("<p>Ga door naar het <a href=\"admin.jsp\" >Admin Panel</a></p>");
            out.println("<p>Ga door naar het <a href=\"ip.jsp\" >IP pagina</a></p>");
          
            }
        else 
            {
            
         %>
         
          <script>
		$(function(){
			$("#login-form").validator()
		})
	</script>
                
                 <form action="login.jsp" method="post" id="login-form">
    <input type="text" name="name" size="50" required="required" /><img class="icon" src="images/user.png" />
    <input type="password" name="pass" size="50" required="required" /><img class="icon" src="images/pass.png" />

    <input type="submit" value="Login" class="red login-knop">
    </form>
                
                <%
                
           }
        
         
            
            
            %>
</div>
