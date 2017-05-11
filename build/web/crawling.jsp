<%-- 
    Document   : crawling
    Created on : 1 May, 2017, 12:45:35 PM
    Author     : Utkarsh
--%>

<%@page import="java.io.IOException,org.jsoup.Jsoup,org.jsoup.nodes.Document,org.jsoup.nodes.Element,org.jsoup.select.Elements"%>  
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String search=(String)request.getParameter("psearch");
    Document doc = Jsoup.connect("https://en.wikipedia.org/wiki/"+search).get();  
                   String title ="Your search results:";
                //
               // Elements images = doc.select("img[src~=(?i)\\.(png|jpe?g|gif)]"); 
                Elements question = doc.select("html");%>
                
                
                <html>
                    <body>
                    <header>
                        <title>
                        <%out.println(title);%>
                        </title>
                    </header>
                        <style>
                            div {
                                   
                                   margin-right: 20px;
                                   margin-left: 20px;
                                   background-color: lightblue;
                                }
                            p.ridge {border-style: ridge;}
                            p.center{
                                text-align: justify;
                                color: red;
                            }
                            </style>
                           <div> <p class="center"><%out.println(question);%> </p> </div>
                    </body>
                </html>
                   
                
                 