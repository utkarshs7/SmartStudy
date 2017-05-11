<%-- 
    Document   : search
    Created on : 21 Mar, 2017, 11:24:53 AM
    Author     : lav
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Google Search</title>
</head>
<body>
<%
String text = request.getParameter("psearch");


out.println(text);
if(!((text) == null))
{
String url = "http://www.google.com/#hl=en&tbo=d&site=&source=hp&q="+text;
response.sendRedirect(url);
}
%>

</body>
</html>