/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.*;
import java.sql.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.text.*;

/**
 *
 * @author Utkarsh
 */
public class QuestionAdder extends HttpServlet {

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
            out.println("<title>Servlet QuestionAdder</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet QuestionAdder at " + request.getContextPath() + "</h1>");
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
      //  processRequest(request, response);
       // 
        String email=request.getParameter("Email");
        PrintWriter out=response.getWriter();
 String question[]=new String[10];
 String recipient[]=new String[10];
 String t="Question";
 String e="Recipient";
 String l="";
 for(int i=1;i<=5;i++)
 {
     String x=e+String.valueOf(i);
     recipient[i]=request.getParameter(x);
  //   out.println("Recipient "+i+": "+recipient[i]);
 }
 for(int i=1;i<=5;i++)
 {
     String x=t+String.valueOf(i);
     question[i]=request.getParameter(x);
    // out.println("Question "+i+": "+question[i]);
 }
 
 try{
 Class.forName("com.mysql.jdbc.Driver");
 Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/question","root","utkarsh123");
 PreparedStatement stmt1=con.prepareStatement("select * from imagetable where email_id=?");
 stmt1.setString(1,email);
 ResultSet rst1=stmt1.executeQuery();
 rst1.next();
 l=rst1.getString(2);
 PreparedStatement stmt2=con.prepareStatement("delete from imagetable where email_id=?");
 stmt2.setString(1,email);
 stmt2.executeUpdate();
 PreparedStatement stmt=con.prepareStatement("insert into centralquestion(sender,question1,question2,question3,question4,question5,recipient1,recipient2,recipient3,recipient4,recipient5,questionID,imageID) values(?,?,?,?,?,?,?,?,?,?,?,?,?)");
 stmt.setString(1,email);
 for(int i=1;i<=5;i++)
 {
     stmt.setString(1+i, question[i]);
 }
 for(int i=1;i<=5;i++)
 {
      stmt.setString(6+i,recipient[i]);
 }
 Random num=new Random();
 stmt.setInt(12,Math.abs(num.nextInt()));
 if(l.equals(""))
     stmt.setString(13,"blank.jpg");
 else
     stmt.setString(13,l);
 stmt.executeUpdate();
con.close();
}catch(Exception E)
 {
     out.println(E);
 }
 RequestDispatcher rd=request.getRequestDispatcher("/NormalAdderJ.jsp?email="+email);
 rd.include(request,response);
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

