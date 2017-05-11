<%-- 
    Document   : jetter
    Created on : 21 Mar, 2017, 7:50:37 PM
    Author     : lav
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="java.io.*,java.util.*"%>
<%@ page import="javax.activation.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <% 
            String email = (String)request.getParameter("Email"); 
            String password = (String)request.getParameter("Password");
            out.println(email);
            out.println(password);
            Connection con = null;
            Class.forName("com.mysql.jdbc.Driver");
              con = DriverManager.getConnection("jdbc:mysql://localhost:3306/logintest","root","utkarsh123");

            Statement stat = con.createStatement();
    String queryText = "SELECT Email, Password FROM data;";
    try
    {
        stat.executeQuery(queryText);
        ResultSet rs = stat.getResultSet();
        String dbemail ;
        String dbPassword;
        out.println(email);
            out.println(password);
        while(rs.next()){
                dbemail = rs.getString("Email");
                dbPassword = rs.getString("Password");
                out.println(dbemail+"   "+dbPassword);
                if(dbemail.equals(email) && dbPassword.equals(password))
                {
                    out.println("OK");
                    //login = true;
                   // <a href="adder.jsp">
                   response.sendRedirect("adder.jsp");

                } 
                }
                //else
                //{  %>
                
                <script>
                    alert("NOT FOUND!!!");
                    </script>
                <% // }
                //System.out.println(username + password + " " + dbUsername + dbPassword);
            
    }
   catch(SQLException e )
   {
       e.getMessage();
   }
      //  try {
              

            //int rst = stat.executeUpdate(queryText);

            //stat.close();
            //con.close();
        %>
    </body>
</html>
