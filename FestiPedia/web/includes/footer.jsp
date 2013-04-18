<%-- 
    Document   : footer
    Created on : Apr 18, 2013, 9:29:38 AM
    Author     : groep 16
--%>

<footer class="row">

	<div>All rights reserved &copy; FestiPedia | 52framework! the framework from the future</div>
        <a href="" id="admin-knop">Admin</a>

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


</body>
</html>