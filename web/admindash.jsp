

<%@page import="com.DonarC"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="com.User"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String pwd = (String)session.getAttribute("pwd");
    if(!pwd.equals("divyakadam"))
   {
  RequestDispatcher rd = request.getRequestDispatcher("Main.jsp");
   rd.forward(request, response);
        
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Dash</title>
         <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link type="text/css" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500">
   <link href="css/style.css" rel="stylesheet" type="text/css"/>
   <link href="css/jquery.dataTables.min.css" rel="stylesheet" type="text/css"/>
    <link href="//cdn.dataTables.net/tabletools/2.2.4/css/dataTables.tableTools.css" rel="stylesheet" type="text/css"/>
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <style>
            
             ul{

       
	margin-top: 30px;
}

li:hover {
  
   background-color: #ddd;

   font-size: 28px;


}
  a{
   font-family: "Avant Garde", Avantgarde, "Century Gothic", CenturyGothic, "AppleGothic", sans-serif;
   text-decoration: none;
  }
 li {

 	list-style-type: none ;
 	display: inline;
 	padding: 16px;
 	font-size: 22px;
 }
      
  

      
      
    .nav-tabs { border-bottom: 2px solid #DDD; }
    .nav-tabs > li.active > a, .nav-tabs > li.active > a:focus, .nav-tabs > li.active > a:hover { border-width: 0; }
    .nav-tabs > li > a { border: none; color: #666; }
    .nav-tabs > li.active > a, .nav-tabs > li > a:hover { border: none; color: #4285F4 !important; background: transparent; }
    .nav-tabs > li > a::after { content: ""; background: #4285F4; height: 4px; position: absolute; width: 100%; left: 0px; bottom: -1px; transition: all 250ms ease 0s; transform: scale(0); }
    .nav-tabs > li.active > a::after, .nav-tabs > li:hover > a::after { transform: scale(1); }
    .tab-nav > li > a::after { background: #21527d none repeat scroll 0% 0%; color: #fff; }
    .tab-pane { padding: 15px 0; }
    .tab-content{padding:20px}

.card {background: #FFF none repeat scroll 0% 0%; box-shadow: 0px 1px 3px rgba(0, 0, 0, 0.3); margin-bottom: 30px; }
body{ background: #EDECEC; padding:50px}






                    h1 {
  font-family: "Avant Garde", Avantgarde, "Century Gothic", CenturyGothic, "AppleGothic", sans-serif;
  font-size: 32px;
  padding: 20px 10px;
  text-align: center;
  text-transform: uppercase;
  text-rendering: optimizeLegibility;
}



.deepshd {
    
  color: #e0dfdc;
  margin-top: -10px;
  background-color: #333;
  letter-spacing: .1em;
  text-shadow: 0 -1px 0 #fff, 0 1px 0 #2e2e2e, 0 2px 0 #2c2c2c, 0 3px 0 #2a2a2a, 0 4px 0 #282828, 0 5px 0 #262626, 0 6px 0 #242424, 0 7px 0 #222, 0 8px 0 #202020, 0 9px 0 #1e1e1e, 0 10px 0 #1c1c1c, 0 11px 0 #1a1a1a, 0 12px 0 #181818, 0 13px 0 #161616, 0 14px 0 #141414, 0 15px 0 #121212, 0 22px 30px rgba(0, 0, 0, 0.9);
}



  </style>
       <script type="text/javascript">
      
            $(document).ready(function(){
                $('#count-box').CountUpCircle({
                    duration: 1000,
                    opacity_anim: true,
                    step_divider: 2
                });
                 $('#count-box2').CountUpCircle({
                    duration: 1000,
                    opacity_anim: true,
                    step_divider: 2
                });
                 $('#count-box3').CountUpCircle({
                    duration: 1000,
                    opacity_anim: true,
                    step_divider: 2
                });
            });
     </script>   
      
    </head>
    <body>
        
          <% 
              
              
          try{
     Configuration cfg=new Configuration();  
     cfg.configure("hibernate.cfg.xml");//populates the data of the configuration file  
     SessionFactory factory=cfg.buildSessionFactory();  
     Session  session1=factory.openSession();  
     Transaction t = session1.beginTransaction();  
     
     
     %>
        
                      <%
 
Criteria cr = session1.createCriteria(User.class);

   List  list = cr.list();
       
t.commit();



Transaction t1 = session1.beginTransaction();
Criteria cr1 = session1.createCriteria(DonarC.class);

   List  list1 = cr1.list();
       t1.commit();

      %>
            
          <h1 class="deepshd"> Share Food  <span class="glyphicon glyphicon-share-alt"></span> </h1>
          
          <div class="row">
              <div class="col-md-offset-5 col-md-7">
            
          <ul>
          <li><a href=""><i class="fa fa-user" style="font-size: 30px;" aria-hidden="true"></i> &nbsp; Admin</a></li>
          <li><a href="donar.jsp"> &nbsp; Donar Record</a></li>
       <!--   <li><a href="report.jsp"> &nbsp; Report</a></li> -->
          <li><a href="logout.jsp"><i class="fa fa-sign-out" style="font-size: 30px;" aria-hidden="true"></i> &nbsp; SignOut</a></li>
          
          
          </ul>
          
              </div>
          </div>
          <br>
          <br>
          
            <div class="container">
                          <div class="row">
                              <div class="col-md-12" style="background-color: white; padding: 20px; border:1px #080808; outline: none;">
                                  <h2> Records:</h2>
                                  
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
                                            
                                           
                                        <!--    <th>Ordered Time</th> -->
                                        </tr>
                                    </thead>
                                   
                                    <tbody>
     <%
       Transaction t3 =session1.beginTransaction();
     Criteria cr3 = session1.createCriteria(com.User.class); 
     List list3=cr3.list();
       
      Iterator iterator3 = list3.iterator(); 
  
      
      for (int i = 0; i < list3.size(); i++)
{      
             User user =  (User) iterator3.next();
        
    
             %>
             
                 
                                    <tr><td><%= user.getId()%></td><td><%= user.getCity()   %></td><td><%= user.getCountry()   %></td><td><%= user.getZipcode()  %></td><td><%= user.getState()   %></td><td><%= user.getMobile()   %></td><td><%= user.getOrganization()  %></td><td><%= user.getPersonCount() %></td> <td><%= user.getD()  %></td></tr> 
                                        
                            
             
             <%
    
    
}
t3.commit();
      %>
      
                                            </tbody>
                                </table>
                              </div>
                          </div>
                      </div>
                  </div>
              </div>
          </div>
                                  
      
          
          
          <br>
          <br>
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
                <div class="row">
     <div class=" col-md-offset-2 col-md-4 ">

                                 <div class="wrapper">

                                   <div id="count-box2"><%= list.size() %></div> 
                                </div>
                                         <h3>People Registered &nbsp;<span class="glyphicon glyphicon-registration-mark"></span></h3>
                                </div>


                                <div class=" col-md-offset-2 col-md-4 ">
                                 <div class="wrapper">
                                   <div id="count-box3"><%= list1.size() %></div> 
                                </div>
                                     <h3>People Donated &nbsp;<span class="glyphicon glyphicon-tree-deciduous"></span></h3>
                                </div>
                
                
                </div>
                
                <br>
        <hr>
        
        
        
    <footer style="width: 100%; background-color: black; font-size: 12px; color: white; padding: 10px;">
        <center>
            While using this site, you agree to have read and accepted our terms of use, cookie and privacy policy.
	    <br/>
            &copy; Copyright 2016-2017 by <a href="index.html">ShareFree.Ltd.</a> &reg; All Rights Reserved.
        </center>
    </footer>
        
        
        
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
    <script src="js/jquery.countupcircle.js" type="text/javascript"></script>
         <%
      
    session1.close();  
   }
        
        
        catch(Exception e){
      
            
        }
   
        %> 
    </body>
</html>
