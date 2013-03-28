<%-- 
    Document   : index
    Created on : 21-mrt-2013, 15:22:54
    Author     : Kevin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset=utf-8>
    <title>Home | FestiPedia</title>
    
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
    
 <link rel="shortcut icon" href="/images/icon.png">
    </head>

<body>



	<header class="row"> 
            
         
         	
        <div class="col col_8" ><img class="logo" src="images/red.png" alt="Site-logo"/> </div><!-- logo col_7 -->
        
        <nav class="col col_8">
        	<ul class="top_menu">
            	<li><div id="login-panel"></div><a href="#" >Admin </a></li>
                <li><a href="#" >Festivals</a></li>
                <li><a href="#" >Bands</a></li>
            	
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


<div class="row inhoud"><!-- Content -->

	 <div class="col col_16" > <h1>Home</h1></div> 
        <div class="col col_7 tabs" ><div class="col-inhoud">
          
        test1
            
            </div></div>
    <div class="col col_7 tabs" >
        <div class="col-inhoud">
            
       test2
        
         </div></div>
        
    
</div><!-- row -->

<footer class="row">

	<div>All rights reserved &copy; FestiPedia | 52framework! the framework from the future</div>

</footer>

</body>
</html>
