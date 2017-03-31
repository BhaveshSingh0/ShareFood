 

<%@page import="org.hibernate.criterion.ProjectionList"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="org.hibernate.criterion.Projections"%>
<%@page import="org.hibernate.transform.Transformers"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Report</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
   <link type="text/css" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500">
 
    </head>
    <body>
        
        <h4> Get the Report :</h4>
          <% 
          try{
     Configuration cfg=new Configuration();  
     cfg.configure("hibernate.cfg.xml");//populates the data of the configuration file  
     SessionFactory factory=cfg.buildSessionFactory();  
     Session  session1=factory.openSession();  
     Transaction t = session1.beginTransaction();  
     
     
     %>
     
     <br>
            <div class="col-md-2" style="margin-top: 0px;">
                <form action="getReport" >
                    <div class="form-group" >
                      <label for="sel1"><b>Select City  :</b></label>
                      <input type="hidden" value="1"  name="c" />
                    <select class="form-control" name="city" id="sel1" >
                      
                      <%
 
Criteria cr = session1.createCriteria(User.class);
ProjectionList projectionList = Projections.projectionList();
ProjectionList projectionList2 = Projections.projectionList();
projectionList2.add(Projections.distinct(projectionList.add(Projections.property("city"), "city")));

cr.setProjection(projectionList2);
cr.setResultTransformer(Transformers.aliasToBean(User.class));
     List list = cr.list();
       
      Iterator iterator = list.iterator(); 
      
      for (int i = 0; i < list.size(); i++)
{
             User user =  (User) iterator.next();
   
    
             %>
             <option  value="<%= user.getCity() %>"><%= user.getCity() %></option>
             
             <%
    
    
}
t.commit();
session1.close();
      %>
                    </select>
                      </div>
                   </div>
                    <div class="col-md-1">
                        <button type="submit" style="margin-top: 20px;" class="btn btn-group-vertical" ><b>Report</b></button>
                    </div>
               </form>
            
           
        </div> 
        
       
          
                    <div class="col-md-1">
                        <button type="submit" style="margin-top: 20px;" class="btn btn-group-vertical" ><b>Report</b></button>
                    </div>
                   
            </form>
            
        </div>
</div>
   



      
      
       <%
      
      
   }
        
        
        catch(Exception e){
      
            
        }
   
        %>
 
        
       
        <div class="container">
            <div class="row" >
                <div class="col-md-5">
                    
                    
                </div>
                    
            </div>
            
        </div>
        
    
    </body>
</html>
