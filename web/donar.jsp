<%-- 
    Document   : donar
    Created on : Mar 12, 2017, 4:03:24 PM
    Author     : Bhavesh Singh
--%>

<%@page import="org.hibernate.criterion.Order"%>
<%@page import="com.DonarC"%>
<%@page import="com.Donar"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
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
        <title>Donar</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link type="text/css" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500">
   <link href="css/style.css" rel="stylesheet" type="text/css"/>
   <link href="css/jquery.dataTables.min.css" rel="stylesheet" type="text/css"/>
    <link href="//cdn.dataTables.net/tabletools/2.2.4/css/dataTables.tableTools.css" rel="stylesheet" type="text/css"/>
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    </head>
    <body>
        
        <br>
        <br>
        
       <% 
              
              
          try{
     Configuration cfg=new Configuration();  
     cfg.configure("hibernate.cfg.xml");//populates the data of the configuration file  
     SessionFactory factory=cfg.buildSessionFactory();  
     Session  session1=factory.openSession();  
     
     
    



Transaction t1 = session1.beginTransaction();
Criteria cr1 = session1.createCriteria(Donar.class);

   List  list1 = cr1.list();
       Iterator it = list1.iterator();

      %>
            
                          <div class="row">
                              <div class="col-md-7" style="background-color: white; padding: 20px; border:1px #080808; outline: none;">
                                 
                                  
                                  <table id="example" class="display" cellspacing="0" width="100%" style="background-color: #ddd;">
                                    <thead>
                                        <tr>
                                            <th>Sr. No</th>
                                            <th>Donar Mail</th>
                                            <th>Donated To City</th>
                                            <th>Date</th>
                                            
                                           
                                        <!--    <th>Ordered Time</th> -->
                                        </tr>
                                    </thead>
                                   
                                    <tbody>
     <%
      
  
      
      for (int i = 0; i < list1.size(); i++)
{      
             Donar user =  (Donar)it.next();
        
    
             %>
             
                 
             <tr><td><%= user.getId()%></td><td><%= user.getDonaremail()%></td><td><%= user.getCity()%></td><td><%= user.getD()  %></td></tr> 
                                        
                            
             
             <%
    
    
}
t1.commit();
      %>
      
                                            </tbody>
                                </table>
                              </div>
                         
              
                                  
          <%
              
              
              


Transaction t = session1.beginTransaction();
Criteria cr = session1.createCriteria(DonarC.class);
  cr.addOrder(Order.desc("count"));
   List  list = cr.list();
       Iterator it1 = list.iterator();

      %>
          <div class="col-md-5">
              <br>
              <br><br>
              <br>
                                  <table class="table table-hover" >
                                    <thead>
                                        <tr>
                                            <th>Sr. No</th>
                                            <th>Donar Mail</th>
                                            <th>Donated(Times)</th>
                                      
                                            
                                           
                                        <!--    <th>Ordered Time</th> -->
                                        </tr>
                                    </thead>
                                   
                                    <tbody>
     <%
      
  
      
      for (int i = 0; i < list.size(); i++)
{      
             DonarC user =  (DonarC)it1.next();
        
    
             %>
             <tr><td><%= user.getId() %></td><td><%= user.getMailid()%></td><td><%= user.getCount() %></td></tr>
                                        
                            
             
             <%
    
    
}
t.commit();
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
              
        
        
        
        
        
        
        
        <%
      
    session1.close();  
   }
        
        
        catch(Exception e){
      
            
        }
   
        %> 
           
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
    </body>
</html>
