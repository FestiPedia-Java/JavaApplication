<%-- 
    Document   : header
    Created on : Apr 18, 2013, 9:29:14 AM
    Author     : roep 16
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset=utf-8>
    <title>${param.siteNaam} | FestiPedia</title>
    
    <script src="js/modernizr-1.7.min.js"></script><!-- this is the javascript allowing html5 to run in older browsers -->
    
    <link rel="stylesheet" type="text/css" href="css/reset.css" media="screen" title="html5doctor.com Reset Stylesheet" />
    
    <!-- in the CSS3 stylesheet you will find examples of some great new features CSS has to offer -->
    <link rel="stylesheet" type="text/css" href="css/css3.css" media="screen" />
    
    <!-- general stylesheet contains some default styles, you do not need this, but it helps you keep a uniform style -->
    <link rel="stylesheet" type="text/css" href="css/general.css" media="screen" />
    
    <!-- grid's will help you keep your website appealing to your users, view 52framework.com website for documentation -->
    <link rel="stylesheet" type="text/css" href="css/grid.css" media="screen" />

 <!-- standard form -->
    <link rel="stylesheet" type="text/css" href="css/forms.css" media="screen" />
    <!-- Own additions -->
     <link rel="stylesheet" type="text/css" href="css/festipedia.css" media="screen" />
    
     <script src="js/jquery.js"></script>
     <script src="js/jquery-bpop.js"></script>
     <script src="js/validator.js"></script>
     
 <link rel="shortcut icon" href="/images/icon.png">
    </head>

<body>



	<header class="row"> 
            
         
         	
        <div class="col col_8" ><img class="logo" src="images/red.png" alt="Site-logo"/> </div><!-- logo col_7 -->
        
        <nav class="col col_8">
        	<ul class="top_menu">
            	
                <li><a href="#" >Festivals</a></li>
                <li><a href="bands.jsp" >Bands</a></li>
            	
            </ul>
        </nav>
        

    </header>


<div class="row menu-container"><!-- Main Menu -->

	
     <ul id="nav">
    <li>
        <a href="#">Home</a>
    </li>

    <li>
        <a href="#">Info</a>
        <ul>
            <li><a href="#">Festivals</a></li>

            <li><a href="#">Bands</a></li>
        </ul>
    </li>
         <li>
        <a href="#">Contact</a>
    </li>
   
    
</ul>

<div id="search-div"><form name="search" method="post"> <input type="text" placeholder="Search"/></form> </div>
        
    
</div><!-- row -->
