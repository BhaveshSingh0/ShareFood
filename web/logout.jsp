
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
String username = (String) session.getAttribute("fname");
if (null == username) {
   request.setAttribute("Error", "Session has ended.  Please login.");
   RequestDispatcher rd = request.getRequestDispatcher("Main.jsp");
   rd.forward(request, response);
}
else
{
    session.invalidate();
}
%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Logout</title>
    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
  </head>
  <body style="
        
  ">
      
    <nav class="navbar navbar-default" style="border: none; background-color: white; border-radius: 0;">
        <div class="container">
          
            <div class="container-fluid">
              <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                  <span class="sr-only">Toggle navigation</span>
                  <span class="icon-bar"></span>
                  <span class="icon-bar"></span>
                  <span class="icon-bar"></span>
                </button>
                  
            
            
      </div>
     </nav>
      
      
      <br><br>
      <div class="container">
            <div class="row">
                <div class="col-md-4"></div>
                <div class="col-md-4">
                    <center>
                          <p>Sign Out .....</p>
                          <div class="progress">
                              <div class="progress-bar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="min-width: 100%;"></div>
                          </div>
                          <br>
                          <img src="img/logout.png" style="margin-left: 10px;"/>
                          <br>
                          <p style="font-size: 2 em;">Thanks for Login ... !</p>
                   
                    </center>
                </div>
                <div class="col-md-4"></div>
            </div>
      </div>

    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.progresstimer.js"></script>
    <script>
    var progress = $(".progress-bar").progressTimer({
        timeLimit: 1.5,
        onFinish: function () {
            window.location = "Main.jsp";
        }
    });
    
    </script>
   
  </body>
</html>