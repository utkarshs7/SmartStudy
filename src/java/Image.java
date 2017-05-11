/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.DataInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Utkarsh
 */
public class Image extends HttpServlet {

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
            out.println("<title>Servlet Image</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Image at " + request.getContextPath() + "</h1>");
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
     String l="";
String email=request.getParameter("Email");
       try{
String saveFile="";
                     //System.out.println("aa gaya bc");
                     String contentType = request.getContentType();
                     //System.out.println(contentType);
                     /*if(contentType.equals(""))
                     {
                         System.out.println("null ho gaya");
                     }*/

if(contentType!=null) 
{
   DataInputStream in = new DataInputStream(request.getInputStream());
   int formDataLength = request.getContentLength();
   System.out.println("aa gaya bc0");
   byte dataBytes[] = new byte[formDataLength];
   int byteRead = 0;
   int totalBytesRead = 0;
   while(totalBytesRead < formDataLength)
   {
      byteRead = in.read(dataBytes, totalBytesRead,formDataLength);
      System.out.println("aa gaya bc 0.5");
      totalBytesRead += byteRead;
   }
   System.out.println("aa gaya bc1");
   String file = new String(dataBytes);
   saveFile = file.substring(file.indexOf("filename=\"") + 10);
   saveFile = saveFile.substring(0, saveFile.indexOf("\n"));
   saveFile = saveFile.substring(saveFile.lastIndexOf("\\") + 1,saveFile.indexOf("\""));
   int lastIndex = contentType.lastIndexOf("=");
   System.out.println("aa gaya bc 1.5");
   String boundary = contentType.substring(lastIndex + 1,contentType.length());
   int pos;
   pos = file.indexOf("filename=\"");
   pos = file.indexOf("\n", pos) + 1;
   pos = file.indexOf("\n", pos) + 1;
   pos = file.indexOf("\n", pos) + 1;
   int boundaryLocation = file.indexOf(boundary, pos) - 4;
   int startPos = ((file.substring(0, pos)).getBytes()).length;
   int endPos = ((file.substring(0, boundaryLocation)).getBytes()).length;

   System.out.println("aa gaya bc2");
   File ff = new File(saveFile);
   FileOutputStream fileOut = new FileOutputStream(ff);
   
   fileOut.write(dataBytes, startPos, dataBytes.length-(startPos));
   fileOut.flush();
   fileOut.close();
   System.out.println("aa gaya bc3");
   File f=new File(saveFile);
   
   f.renameTo(new File("C:/Users/ashish/Documents/NetBeansProjects/TestSite/web/"+saveFile));
   
   System.out.println("!!!!!"+saveFile);
   
   String fgh=saveFile;
   
 
Connection connection = null;
          
           
if(fgh.equals(""))
{
    fgh="blank.jpg";
}    
String query="insert into imagetable(image_path,email_id) values('"+fgh+"','"+email+"')";

  Class.forName("com.mysql.jdbc.Driver");
              connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/question","root","utkarsh123");

            Statement st = connection.createStatement();

            st.executeUpdate(query);
               st.close();
            connection.close();

System.out.println("Uploaded successfully !");




  Connection connection1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/question","root","utkarsh123");

PreparedStatement stmt=connection1.prepareStatement("select image_path from imagetable where email_id=?");
stmt.setString(1,email);
ResultSet rsi = stmt.executeQuery();
            l="";
            while(rsi.next())
            { 
                 l= rsi.getString(1);
            }
           
          // String h="/home/lav/NetBeansProjects/minor/web/"+l;
//PreparedStatement stm=connection1.prepareStatement("delete * from imageTable");            
//stm.executeUpdate();           
}
            
else 
{
    
    System.out.println("aa gaya bc -1");
 Class.forName("com.mysql.jdbc.Driver");
  Connection connection1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/question","root","utkarsh123");

PreparedStatement stmt=connection1.prepareStatement("select image_path from imagetable where email_id=?");
stmt.setString(1,email);
ResultSet rsi = stmt.executeQuery();
            l="";
            while(rsi.next())
            { 
                 l= rsi.getString(1);
            }
           
          // String h="/home/lav/NetBeansProjects/minor/web/"+l;
              
//PreparedStatement st=connection1.prepareStatement("delete * from imageTable");            
//st.executeUpdate();
    }
}

      

   
    catch(Exception e2)
    {
        e2.printStackTrace();
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
