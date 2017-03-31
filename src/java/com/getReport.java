/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

public class getReport extends HttpServlet {
    int reg = 0 ;
    int d = 0;
   String city = "" ;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out =  response.getWriter();
     Configuration cfg=new Configuration();  
     cfg.configure("hibernate.cfg.xml");//populates the data of the configuration file  
     SessionFactory factory=cfg.buildSessionFactory();  
     int count = Integer.parseInt(request.getParameter("c"));
     city =  request.getParameter("city");
     Session  session1=factory.openSession();  
    // 
    
    
     try{
        if(count == 1){
         
        Transaction t = session1.beginTransaction();  
        List list =  session1.createQuery(" from com.Donar").list();
        Iterator iterator = list.iterator(); 
       
      for (int i = 0; i<list.size(); i++)
        {      
             Donar user =  (Donar) iterator.next();
               
               if(user.getCity().equals(city)) {
                   d++ ;
               }
             
             
             
         }   
        t.commit();
        
        Transaction t2 = session1.beginTransaction();  
        List list2 =  session1.createQuery(" from com.User").list();
        Iterator iterator2 = list2.iterator(); 
       
      for (int i = 0; i<list2.size(); i++)
        {      
             User user =  (User) iterator2.next();
               
               if(user.getCity().equals(city)) {
                   reg++ ;
               }
             
             
             
         }   
        t2.commit();
        
       
        
     request.setAttribute("count","2");
      request.setAttribute("reg",reg);
      request.setAttribute("donate",d);
      request.setAttribute("city",city);
      reg =0 ;
      d =0 ;
      city = "" ;
      
    //    RequestDispatcher rd = request.getRequestDispatcher("get.jsp");
    //    rd.forward(request, response);
        
        
        
         }
        
        else if(count  == 2)  {
                
            
            
        
DateFormat formatter = new SimpleDateFormat("MM-DD-YYYY"); 


            String dat = request.getParameter("date");
              Date date = (Date)formatter.parse(dat);
              
    out.println(date);
    out.print("<br>");
    int day =  date.getDay();
    int month = date.getMonth();
    out.print(day);
    out.print("<br>");
    out.print(month);       
            
            
            
            Transaction t = session1.beginTransaction();  
        List list =  session1.createQuery(" from com.Donar").list();
        Iterator iterator = list.iterator(); 
       
      for (int i = 0; i<list.size(); i++)
        {      
             Donar user =  (Donar) iterator.next();
               
               if(user.getCity().equals(city)) {
                   d++ ;
               }
             
             
             
         }   
        t.commit();
        
        Transaction t2 = session1.beginTransaction();  
        List list2 =  session1.createQuery(" from com.User").list();
        Iterator iterator2 = list2.iterator(); 
       
      for (int i = 0; i<list2.size(); i++)
        {      
             User user =  (User) iterator2.next();
               
               if(user.getCity().equals(city)) {
                   reg++ ;
               }
             
             
             
         }   
        t2.commit();
        
       
        
     request.setAttribute("count","1");
      request.setAttribute("reg",reg);
      request.setAttribute("donate",d);
      request.setAttribute("city",city);
      reg =0 ;
      d =0 ;
      city = "" ;
      
    //    RequestDispatcher rd = request.getRequestDispatcher("get.jsp");
    //    rd.forward(request, response);
        
        
            
            
            
            
            
            
            
            
            
            
                
                }
       
        
        
     }
     catch(Exception e) {
         out.print("eroor");
         e.printStackTrace();
          
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

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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
