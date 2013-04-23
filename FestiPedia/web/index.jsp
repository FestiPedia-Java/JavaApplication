<%-- 
    Document   : index
    Created on : 21-mrt-2013, 15:22:54
    Author     : Groep 15
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="includes/header.jsp" >
   <jsp:param name="siteNaam" value="Home" />  
</jsp:include> 


<div class="row inhoud"><!-- Content -->

	 <div class="col col_16" > <h1>Home</h1></div> 
        <div class="col col_7 tabs" ><div class="col-inhoud">
        
        <div id="indexLeftColumn">
        <div id="welcomeText">
            <!-- geeft greeting in jouw taal -->
        <p style="font-size: larger"><fmt:message key='greeting'/></p>

        </div>
        </div>
        </div></div>
    <div class="col col_7 tabs" >
        <div class="col-inhoud">
        <div id="welcomeText">  
              <!-- geeft intro tekst in jouw taal -->
        <p><fmt:message key='introText'/></p>
        </div>
        </div>
        
         </div>
        
    
</div><!-- row -->



<jsp:include page="includes/log.jsp" />
<jsp:include page="includes/footer.jsp" />
