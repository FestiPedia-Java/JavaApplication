<%-- 
    Document   : footer
    Created on : Apr 18, 2013, 9:29:38 AM
    Author     : groep 16
--%>

<footer class="row">

	<div>All rights reserved &copy; FestiPedia | 52framework! the framework from the future</div>
        <a href="contact.jsp" id="admin-knop">Admin</a>

</footer>

 <script type="text/javascript">
  ;(function($) {

         // DOM Ready
        $(function() {

           

                  $('#admin-knop').bind('click', function(e) {

                // Prevents the default action to be triggered. 
                e.preventDefault();

                // Triggering bPopup when click event is fired
                $('#login-panel').bPopup();

            });

        });

    })(jQuery);
</script>

<div id="login-panel">
    
    
    <a href="#" class="bClose" id="subwindow_close">Close</a>
    
    <h1>Login</h1>
    
     <%
        String myname =  (String)session.getAttribute("username");
        
        if(myname!=null)
            {
             out.println("U ben ingelogd als  "+myname+"  , <a href=\"logout.jsp\" >Logout?!</a>");
            }
        else 
            {
            %>
             <form action="login.jsp" method="post" id="login-form">
    <input type="text" name="name" size="50" class="required"><img class="icon" src="images/user.png" />
    <input type="password" name="pass" size="50" class="required"><img class="icon" src="images/pass.png" />

    <input type="submit" value="Login" class="red login-knop">
    </form>
            <% 
            }
         
             
            %>

   

        
   
    
    
    
</div>

</body>
</html>