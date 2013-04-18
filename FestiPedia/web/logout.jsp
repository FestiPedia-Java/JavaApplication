<%-- 
    Document   : logout
    Created on : Apr 18, 2013, 2:18:15 PM
    Author     : 3130536
--%>


<jsp:include page="includes/header.jsp" >
   <jsp:param name="siteNaam" value="Login" />  
</jsp:include> 


<div class="row inhoud"><!-- Content -->

	 <div class="col col_16" > 
         

<%
 
     String username=(String)session.getAttribute("username");
    if(username!=null)
        {
           out.println(username+" logged out, <a href=\"index.jsp\">Back</a>");
            session.removeAttribute("username");
             
        }
     else 
         {
         out.println("Waarom uitloggen als je niet ingelogd bent? <a href=\"index.jsp\">Back</a>");
     }
 
 
 
%>  
             
         </div> 
       
        
    
</div><!-- row -->
<jsp:include page="includes/footer.jsp" />
