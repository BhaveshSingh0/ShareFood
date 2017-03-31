    
package com;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.Restrictions;

public class submit1 extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       int count = 0 ;
        PrintWriter out =  response.getWriter();
        HttpSession session = request.getSession(true);
        String email =  request.getParameter("email");
      
        String name =   request.getParameter("name") ;
       String city=  (String)session.getAttribute("City");
       String country = (String)session.getAttribute("Country");
       String mob=  (String)session.getAttribute("Mobile");
      int id1 = (Integer)session.getAttribute("id");
     Configuration cfg=new Configuration();  
     cfg.configure("hibernate.cfg.xml");//populates the data of the configuration file  
     SessionFactory factory=cfg.buildSessionFactory();  
     Session  session1=factory.openSession();
                 try{
   
             Transaction t3 = session1.beginTransaction(); 
     Date d1 =  new Date();
             
                 Donar  d = new Donar();
                 d.setCity(city);
                 d.setCountry(country);
                 d.setDonaremail(email);
                 d.setUid(id1);
                 d.setUmob(mob);
                 d.setD(d1);
                 session1.persist(d);
                 t3.commit();
               
             
              SendMail  s =  new SendMail();
        int r= s.send(email,name ,city);
        if(r== 0){
            
          Transaction t4 = session1.beginTransaction(); 
           Criteria cr = session1.createCriteria(DonarC.class);
           cr.add(Restrictions.eq("mailid", email));

             List list=cr.list();
            t4.commit();
            if(list.size() == 0){
             
            Transaction t1 = session1.beginTransaction(); 
            DonarC c = new DonarC();
            c.setCount(1);
            c.setD(d1);
            c.setMailid(email);
            c.setStatus("DONAR");
            session1.persist(c);
            t1.commit();
         }
            
            else{
        Transaction t7 = session1.beginTransaction(); 
      List list1= session1.createQuery("from com.DonarC Where MAILID='"+email+"'").list();
      Iterator iterator1 = list1.iterator(); 
     
             
      for(int j = 0; j < list1.size(); j++)
            {
                
                 
                   DonarC user =  (DonarC)iterator1.next();
                  count =  user.getCount();
    
            }
            t7.commit();
           
       count = count  +1 ; 
      Transaction t2 = session1.beginTransaction(); 
       session1.createSQLQuery("UPDATE APP.DONARC set COUNT="+count+"   WHERE MAILID='"+email+"' ").executeUpdate();
       t2.commit(); 
            
            
            
            
            
            }
            
            session.invalidate();
            RequestDispatcher rd =  request.getRequestDispatcher("Main.jsp");
            rd.forward(request, response);
            
        }
        else{
            
        }
        
        
          }
                      catch(Exception e){
                       out.println("Error");  
                 }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
