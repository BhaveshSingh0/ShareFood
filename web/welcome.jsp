

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
          <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
   <link type="text/css" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500">
   
    <link href="css/jquery.dataTables.min.css" rel="stylesheet" type="text/css"/>
    <link href="//cdn.dataTables.net/tabletools/2.2.4/css/dataTables.tableTools.css" rel="stylesheet" type="text/css"/>
    <style>
        
        
                    h1 {
  font-family: "Avant Garde", Avantgarde, "Century Gothic", CenturyGothic, "AppleGothic", sans-serif;
  font-size: 32px;
  padding: 20px 2px;
  text-align: center;
  text-transform: uppercase;
}



.deepshd {
  color: #e0dfdc;
  background-color: #333;
  letter-spacing: .1em;
  text-shadow: 0 -1px 0 #fff, 0 1px 0 #2e2e2e, 0 2px 0 #2c2c2c, 0 3px 0 #2a2a2a, 0 4px 0 #282828, 0 5px 0 #262626, 0 6px 0 #242424, 0 7px 0 #222, 0 8px 0 #202020, 0 9px 0 #1e1e1e, 0 10px 0 #1c1c1c, 0 11px 0 #1a1a1a, 0 12px 0 #181818, 0 13px 0 #161616, 0 14px 0 #141414, 0 15px 0 #121212, 0 22px 30px rgba(0, 0, 0, 0.9);
}


        </style>
        
    </head>
    <body>
         
        <h1 class="deepshd"> Share Food  <span class="glyphicon glyphicon-share-alt"></span> </h1>
        
        <% 
            
                
                        
      String  mob=  (String)session.getAttribute("Mobile");
      String  City=  (String)session.getAttribute("City");
      String  C =  (String)session.getAttribute("Country");
      int id =  (Integer)session.getAttribute("id");
        
        %>
        
        <br>
        <br>
        <div class="container">
            <div class="row">
                
                <div class="col-md-5">
     <div class="alert alert-success">
  <strong>Please!</strong>  Call to the Given Below Number to let them Know .
</div>
                    <form action="submit1" method="post">
                        <div class="form-group">
    <label for="email">Name:</label>
    <input type="text" class="form-control" name="name" required>
  </div>
  <div class="form-group">
    <label for="email"> Your Email address:</label>
    <input type="email" class="form-control" name="email" required>
  </div>
                       
  <div class="form-group">
    <label for="pwd">City</label>
    <input type="text" class="form-control" name="city" value="<%= City %>" disabled="true">
  </div>
  
  <div class="form-group">
    <label for="pwd">Country</label>
    <input type="text" class="form-control" name="country" value="<%= C %>" disabled="true">
  </div>
  
  <div class="form-group">
    <label for="pwd">Mobile</label>
    <input type="Number" class="form-control" name="mob" value="<%= mob  %>" disabled="true">
  </div>
 
  <div class="form-group">
    
    <input type="hidden" class="form-control" name="id1" value="<%= id  %>" disabled="true">
  </div>
  
  <button type="submit" class="btn btn-default">Submit</button>
</form>
                </div>
            </div>
            
        </div>
        
        
    </body>
</html>
