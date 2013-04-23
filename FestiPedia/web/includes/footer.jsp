<%-- 
    Document   : footer
    Created on : Apr 18, 2013, 9:29:38 AM
    Author     : groep 16
--%>

<footer class="row">

	<div>All rights reserved &copy; FestiPedia | 52framework! the framework from the future</div>
        <a href="" id="admin-knop">Admin</a>

</footer>

    <%@page import="java.sql.*" %>
    <%@page import="java.io.*" %>
    <%
     try{
                String connectionURL = "jdbc:mysql://localhost:3306/groep15_festivals?zeroDateTimeBehavior=convertToNull";
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                Connection connection = DriverManager.getConnection(connectionURL, "root", "");
                Statement statement = connection.createStatement();
                
                String ip = request.getRemoteAddr();
                ResultSet rs1 = statement.executeQuery("SELECT * from ips where ip='" + ip + "'");
               
                if(rs1.next()){
                    
                    int kliks = rs1.getInt("site_kliks");
                    kliks++;
                    statement.executeUpdate("Update ips SET site_kliks=" + kliks +" where ip='"+ ip +"'" );
                  }
                else{           
                 int klik = 1;                             
                 statement.executeUpdate("INSERT INTO ips (ip, site_kliks) VALUES ('" + ip + "'," + klik + ")");
                }
                
                
               
              
    

        connection.close();
    }catch(Exception e){
        
         out.println("Connectie Fout");
    }
%>


</body>
</html>