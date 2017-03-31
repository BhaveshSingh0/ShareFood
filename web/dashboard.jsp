


<%@page import="java.io.OutputStream"%>
<%@page import="org.hibernate.Criteria"%>

<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.Transaction"%>

<%@page import="org.hibernate.cfg.Configuration"%>
<%@page import="com.User"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DashBoard</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link type="text/css" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500">
   
    <link href="css/jquery.dataTables.min.css" rel="stylesheet" type="text/css"/>
    <link href="//cdn.dataTables.net/tabletools/2.2.4/css/dataTables.tableTools.css" rel="stylesheet" type="text/css"/>
    <style>
        
        
                    h1 {
  font-family: "Avant Garde", Avantgarde, "Century Gothic", CenturyGothic, "AppleGothic", sans-serif;
  font-size: 62px;
  padding: 30px 30px;
  text-align: center;
  text-transform: uppercase;
  text-rendering: optimizeLegibility;
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
          try{
     Configuration cfg=new Configuration();  
     cfg.configure("hibernate.cfg.xml");//populates the data of the configuration file  
     SessionFactory factory=cfg.buildSessionFactory();  
     Session  session1=factory.openSession();  
     Transaction t = session1.beginTransaction();  
     
     
     %>
     
     <%! int n =0 ; %>
       <div class="container">
                          <div class="row">
                              <div class="col-md-12" style="background-color: white; padding: 40px; border:1px #080808; outline: none;">
                                  <table id="example" class="display" cellspacing="0" width="100%" style="background-color: #ddd;">
                                    <thead>
                                        <tr>
                                            <th>Sr. No</th>
                                            <th>City</th>
                                            <th>Country</th>
                                            <th>Zipcode</th>
                                            <th>State</th>
                                           
                                            <th>Mobile</th>
                                            <th>Organization</th>
                                            <th>PersonCount</th>
                                            <th>Date</th>
                                            <th>Donate</th>
                                           
                                        <!--    <th>Ordered Time</th> -->
                                        </tr>
                                    </thead>
                                   
                                    <tbody>
     <%
         
         String city = request.getParameter("city");
     Criteria cr = session1.createCriteria(com.User.class); 
     List list=cr.list();
       
      Iterator iterator = list.iterator(); 
  
      
      for (int i = 0; i < list.size(); i++)
{      
             User user =  (User) iterator.next();
         if(!user.getCity().equals(city)){
            continue;
            
         }
    
             %>
             
                 
                                    <tr> <form action="auth" method="post" > <input type="hidden" name="id" value="<%=user.getId() %>" ><td><%= user.getId()%></td><td><%= user.getCity()   %></td><td><%= user.getCountry()   %></td><td><%= user.getZipcode()  %></td><td><%= user.getState()   %></td><td><%= user.getMobile()   %></td><td><%= user.getOrganization()  %></td><td><%= user.getPersonCount() %></td> <td><%= user.getD()  %></td><td><input   type="submit"  style="background-color: #21527d; margin-top: 7px; color: white;"  class="btn btn-group-vertical" value="Donate"  /></td></form></tr> 
                                        
                            
             
             <%
    
    
}
t.commit();
session1.close();
      %>
      
                                            </tbody>
                                </table>
                              </div>
                          </div>
                      </div>
                  </div>
              </div>
          </div>
                                  
      
      <%
      
      
   }
        
        
        catch(Exception e){
            
            request.setAttribute("dbError", "block");
            RequestDispatcher rd = request.getRequestDispatcher("Main.jsp");
            rd.forward(request, response);
            
        }
   
        %>
        
        
        
         
        
            
        
        
        
        
        
        
                     <script src="js/jquery.min.js"></script>
                     <script src="js/bootstrap.min.js"></script>
                     <script src="js/jquery.dataTables.min.js" type="text/javascript"></script>
                     <script src="//cdn.dataTables.net/tabletools/2.2.4/js/dataTables.tableTools.min.js" type="text/javascript"></script>
<script>
    $(document).ready(function() {
    var table = $('#example').dataTable();
    var tool = new $.fn.dataTable.TableTools(table,{
        
        
        'sSwfPath':'//cdn.dataTables.net/tabletools/2.2.4/swf/copy_csv_xls_pdf.swf'
    });
    $(tool.fnContainer()).insertBefore('#example_wrapper');
    
    
} );
</script>

<script>
        $(function(){
            $('[data-toggle="tooltip"]').tooltip();
          });
</script>


 <hr>
    <footer style="width: 100%; background-color: black; font-size: 12px; color: white; padding: 10px;">
        <center>
            While using this site, you agree to have read and accepted our terms of use, cookie and privacy policy.
	    <br/>
            &copy; Copyright 2016-2017 by <a href="index.html">ShareFree.Ltd.</a> &reg; All Rights Reserved.
        </center>
    </footer>
    </body>
</html>
