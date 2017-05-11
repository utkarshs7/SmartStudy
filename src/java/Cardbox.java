/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.*;
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
public class Cardbox extends HttpServlet {

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
            out.println("<title>Servlet Cardbox</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Cardbox at " + request.getContextPath() + "</h1>");
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
    //    processRequest(request, response);
           String question=request.getParameter("Question");
           String email=request.getParameter("email");
           String id=request.getParameter("ID");
           String askedemail=request.getParameter("AskedEmail");
           String image=request.getParameter("Image");
           String from=request.getParameter("From");
           String add=request.getParameter("Add");
           String asker=request.getParameter("Asker");
           String ans=request.getParameter("ans");
           String answiths=ans.replace('_',' ');
           //int i=0;
           String questionwiths=question.replace('_',' ');
           PrintWriter out=response.getWriter();
      try{
           Class.forName("com.mysql.jdbc.Driver");
           Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/question","root","utkarsh123");
           PreparedStatement stmt=con.prepareStatement("insert into cardbox(saver,questionID,askedEmail,askerEmail,ImageID,question,answer) values (?,?,?,?,?,?,?)");
           PreparedStatement stmt1=con.prepareStatement("delete from cardbox where saver=? and questionID=? and askedEmail=? and askerEmail=? and question=? and answer=?");
           if(add.equals("1"))
           {
               stmt.setString(1, email);
               stmt.setInt(2, Integer.parseInt(id));
               stmt.setString(3, askedemail);
               stmt.setString(4, asker);
               stmt.setString(5, image);
               stmt.setString(6, questionwiths);
               stmt.setString(7, answiths);
               stmt.executeUpdate();
           }
           else
           {
               stmt1.setString(1, email);
               stmt1.setInt(2, Integer.parseInt(id));
               stmt1.setString(3, askedemail);
               stmt1.setString(4, asker);
               stmt1.setString(5, questionwiths);
               stmt1.setString(6, answiths);
               stmt1.executeUpdate();
           }
       //    stmt.setInt(2, Integer.parseInt(id));
        //   stmt.setString(3,askedemail);
        //   stmt.setString(4,questionwiths);
        //   stmt.executeUpdate();
           if(from.equals("0"))
           {
           RequestDispatcher rd=request.getRequestDispatcher("/MyQuestionJ.jsp?email="+email);
           rd.include(request,response);
           }
           else if(from.equals("2")) 
           {
           RequestDispatcher rd=request.getRequestDispatcher("/ViewOtherJ.jsp?email="+email);
           rd.include(request,response);  
           }
           else 
           {
           RequestDispatcher rd=request.getRequestDispatcher("/CardboxJ.jsp?email="+email);
           rd.include(request,response);  
           }
    }
      catch(Exception e)
      {
         out.println(e); 
      }
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
