/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com;

import java.io.IOException;
import java.io.PrintWriter;

import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;


public class reg extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
           
         String city = request.getParameter("city");
         String state = request.getParameter("state");
         String zip = request.getParameter("zip");
         String country = request.getParameter("country");
         String mob= request.getParameter("mob");
         String org = request.getParameter("mem");
         String total_pr = request.getParameter("total");
         int personCount = Integer.parseInt(total_pr);
        Date date = new Date();
        User u = new User();
        u.setCity(city);
        u.setCountry(country);
        u.setD(date);
        u.setMobile(mob);
        u.setOrganization(org);
        u.setState(state);
        u.setZipcode(zip);
        u.setPersonCount(personCount);
        
        
        try{
     Configuration cfg=new Configuration();  
     cfg.configure("hibernate.cfg.xml");//populates the data of the configuration file  
     SessionFactory factory=cfg.buildSessionFactory();  
     Session session=factory.openSession();  
     Transaction t=session.beginTransaction();  
     
     
         session.persist(u);
         t.commit();
      session.close();
    
    
    
                    request.setAttribute("sendSuccess", "block");
                    RequestDispatcher rd = request.getRequestDispatcher("Main.jsp");
                    rd.forward(request, response);
        }
        
        
        catch(Exception e){
            
            request.setAttribute("dbError", "block");
            RequestDispatcher rd = request.getRequestDispatcher("Main.jsp");
            rd.forward(request, response);
            
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
