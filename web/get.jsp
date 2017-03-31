<%-- 
    Document   : get.jsp
    Created on : Mar 12, 2017, 5:23:58 PM
    Author     : Bhavesh Singh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </head>
    <body>
        <br>
        <br>
        
        
        <div class="row">
            <div class="col-md-offset-3 col-md-4 col-md-offset-5">
                <h2> Report </h2>
                <br>
                <%
                    
 String c =  (String)request.getAttribute("count");
                    %>

  <table class="table table-hover">
      
       <thead>
      <%   
    if( c.equals("1") ){
        

int reg = (Integer)request.getAttribute("reg");
 String city = (String)request.getAttribute("city");
int don = (Integer)request.getAttribute("donate");
   
        %>
        <tr><td>Number Of Times  Donated in <%= city %> </td><td><%= don %></td></tr>
        
        <tr><td>Number Of People  Registered in <%= city %> </td><td><%= reg %></td></tr>
        
        <%
        
  
    
    
    }
    
    %>
   
      
    </thead>
    
  </table>
</div>
 </div>
        </div>
    </body>
</html>
