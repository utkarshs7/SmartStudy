/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Utkarsh
 */
public class NormalAdder extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet NormalAdder</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet NormalAdder at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
     //   processRequest(request, response);
        PrintWriter out=response.getWriter();
        try
        {
            String name=(String)request.getParameter("Name");
            String email=(String)request.getParameter("Email");
            String password=(String)request.getParameter("Password");
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/logintest", "root", "utkarsh123");
            PreparedStatement stmt=con.prepareStatement("select * from data where email=?");
            stmt.setString(1, email);
            ResultSet rst=null;
            rst=stmt.executeQuery();
    //        if(rst==null)
      //      {
               stmt=con.prepareStatement("insert into data(Name,Email,Password) values(?,?,?)");
               stmt.setString(1,name);
               stmt.setString(2,email);
               stmt.setString(3,password);
               stmt.executeUpdate();
               RequestDispatcher rd=request.getRequestDispatcher("/NormalAdderJ.jsp?email="+email);
               rd.include(request,response);
        //    }
           // else
           // {
         //      RequestDispatcher rd=request.getRequestDispatcher("index.html");
         //      rd.include(request,response);  
            
       // }
        }
        catch(Exception e)
        {
            out.println(e);
        }
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
