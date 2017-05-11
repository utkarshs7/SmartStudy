<%-- 
    Document   : AskedToAnswer
    Created on : 17 Apr, 2017, 4:35:38 AM
    Author     : Utkarsh
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">
    <head>
        <title>Smart Study | Asked to Answer</title>
        <meta charset="iso-8859-1">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="layout.css" rel="stylesheet">
        <link href="mediaqueries.css" rel="stylesheet">
        <!--<link rel="stylesheet" href="styles/layout.css" type="text/css" media="all">
        <link rel="stylesheet" href="styles/mediaqueries.css" type="text/css" media="all"> -->
        <script src="scripts/jquery.1.9.0.min.js"></script>
        <script src="scripts/jquery-mobilemenu.min.js"></script>
        <!--[if lt IE 9]>
        <link rel="stylesheet" href="styles/ie.css" type="text/css" media="all">
        <script src="scripts/ie/css3-mediaqueries.min.js"></script>
        <script src="scripts/ie/ie9.js"></script>
        <script src="scripts/ie/html5shiv.min.js"></script>
        <![endif]-->
        <!-- BEFORE USING THIS FRAMEWORK REMOVE THIS DEMO STYLING - ONLY USED TO EMPHASISE THE DIV CONTAINERS IN THE CONTENT AREA -->
        <!--<style type="text/css">
        div.full_width{margin-top:20px;}
        div.full_width:first-child{margin-top:0;}
        div.full_width div{color:#666666; background-color:#DEDEDE;}
        </style> -->
        <!-- END DEMO STYLING -->
    </head>
    <body>
        <style>

            .uploader {
                position:relative; 
                overflow:hidden; 
                width:300px; 
                height:350px;
                background:#f3f3f3; 
                border:2px dashed #e8e8e8;
            }

            #filePhoto{
                position:absolute;
                width:300px;
                height:400px;
                top:-50px;
                left:0;
                z-index:2;
                opacity:0;
                cursor:pointer;
            }

            .uploader img{
                position:absolute;
                width:302px;
                height:352px;
                top:-1px;
                left:-1px;
                z-index:1;
                border:none;
            }
            #sline{
                display: inline;
            }
        </style>
        <%
            String email = request.getParameter("email");
            String redirect = "QuestionAdder";
            String redirect1 = "CardboxJ.jsp?email="+email;
            String redirect2 = "AskedToAnswerJ.jsp?email=" + email;
            String redirect3 = "NormalAdderJ.jsp?email=" + email;
            String redirect4 = "MyQuestionJ.jsp?email=" + email;
        %>
    </style>
    <div class="wrapper row1">
        <header id="header" class="clear">
            <div id="hgroup">
                <h1><a href="#">Smart Study</a></h1>
                <h2>Free Question, Answer Network</h2>
            </div>
        </header>
    </div>
    <!-- ################################################################################################ -->
    <div class="wrapper row2">
        <nav id="topnav">
            <ul class="clear">
                <li class="active first"><a href=<%=redirect3%>>Homepage</a></li>
                <li><a class="drop" href="#">Drop 1</a>
                    <ul>
                        <li><a href="#">Level 2</a></li>
                        <li><a href="#">Level 2</a></li>
                        <li><a class="drop" href="#">Level 2 + Drop</a>
                            <ul>
                                <li><a href="#">Level 3</a></li>
                                <li><a class="drop" href="#">Level 3 + Drop</a>
                                    <ul>
                                        <li><a href="#">Level 4</a></li>
                                        <li><a href="#">Level 4</a></li>
                                    </ul>
                                </li>
                                <li><a href="#">Level 3</a></li>
                            </ul>
                        </li>
                    </ul>
                </li>
                <li><a href=<%=redirect1%> >Cardbox</a></li>
                <li><a href=<%=redirect4%> >My Questions</a></li>
                <li><a href=<%=redirect2%> >Asked To Answer</a></li>
                <li><a href="Invalidate">Logout</a></li>
                <li><a href="#">A Long Link Text Here</a></li>
                <li class="last-child"><a class="drop" href="#">Drop 2</a>
                    <ul>
                        <li><a href="#">Level 2</a></li>
                        <li><a href="#">Level 2</a></li>
                        <li><a class="drop" href="#">Level 2 + Drop</a>
                            <ul class="negative">
                                <li><a href="#">Level 3</a></li>
                                <li><a href="#">Level 3</a></li>
                                <li><a href="#">Level 3</a></li>
                            </ul>
                        </li>
                    </ul>
                </li>
            </ul>
        </nav>
    </div>

    <%
        //String question=request.getParameter("Question");
        //String recipient1=request.getParameter("Recipient1");
        //String recipient2=request.getParameter("Recipient2");
        //String recipient3=request.getParameter("Recipient3");
        //String recipient4=request.getParameter("Recipient4");
        //String recipient5=request.getParameter("Recipient5");
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/question", "root", "utkarsh123");
        Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/logintest", "root", "utkarsh123");
        try {
            PreparedStatement stmt = con.prepareStatement("select * from centralquestion where recipient1='" + email + "' OR recipient2='" + email + "' OR recipient3='" + email + "' OR recipient4='" + email + "' OR recipient5='" + email + "'");
            ResultSet rst = stmt.executeQuery();
            PreparedStatement stmt2 = con.prepareStatement("select questionID,question from askedanswer where askedEmail=?");
            PreparedStatement stmt3 = con.prepareStatement("insert into askedanswer(questionID,askedEmail,askerEmail,ImageID,question,answer) values(?,?,?,?,?,?)");
            stmt2.setString(1, email);
            //out.println("140");
            int flag = 0;
            while (rst.next()) {
                ResultSet rst2 = stmt2.executeQuery();
                //  out.println("145");
                flag = 0;
                while (rst2.next()) {
                    if (rst.getInt(12) == rst2.getInt(1) && (rst.getString(2).equals(rst2.getString(2)) || rst.getString(3).equals(rst2.getString(2)) || rst.getString(4).equals(rst2.getString(2)) || rst.getString(5).equals(rst2.getString(2)) || rst.getString(6).equals(rst2.getString(2)))) {
                        flag = 1;
                        break;
                    }
                }
                // out.println("155");
                if (flag == 0) {
                    PreparedStatement stmt6 = con.prepareStatement("select question1,question2,question3,question4,question5 from centralquestion where questionID='" + rst.getInt(12) + "'");
                    //     PreparedStatement stmt5=con.prepareStatement("select * from askedanswer where questionID='"+rst.getInt(12)+"' AND askedEmail='"+email+"'");
                    //   ResultSet rs=stmt5.executeQuery();
                    //   if(rs.next())
                    //     continue;
                    ResultSet rs6 = stmt6.executeQuery();
                    int i = 1;
                    //  out.println("166");
                    rs6.next();
                    while (i <= 5) {
                        //   out.println("hahah: "+rs6.getString(i));
                        if (!rs6.getString(i).equals("nothing")) {
                            stmt3.setInt(1, rst.getInt(12));
                            stmt3.setString(2, email);
                            stmt3.setString(3, rst.getString(1));
                            stmt3.setString(4, rst.getString(13));
                            stmt3.setString(5, rs6.getString(i));
                            stmt3.setString(6, "none");
                            stmt3.addBatch();
                        } else {
                            out.println(rs6.getString(i));
                            break;
                        }
                        i += 1;
                    }
                    stmt3.executeBatch();
                    //  out.println("180");
                }
            }
        } catch (Exception e) {
            out.println(e);
        }
        // } catch (Exception e) {
        // out.println(e);
        //  }
        PreparedStatement stm = con1.prepareStatement("select * from data where Email=?");
        PreparedStatement stmt4 = con.prepareStatement("select * from askedanswer where askedEmail='" + email + "'");
        ResultSet rst3 = stmt4.executeQuery();
    %>
    <!-- content -->
    <div class="wrapper row3">
        <div id="container">
            <!-- ################################################################################################ -->
            <ul style="list-style-type: none">
                <% while (rst3.next()) {
                        String ques = rst3.getString(5);
                        stm.setString(1,rst3.getString(2));
                        ResultSet rs=stm.executeQuery();
                        rs.next();
                        String user=rs.getString(1);
                        String l=rst3.getString(4);
                        ques = ques.replace(' ', '_');
                        //  String redir="PostAnswerJ.jsp?email="+email+"&AskerEmail="+rst3.getString(3)+"&ID="+rst3.getInt(1)+"&AskedEmail="+rst3.getString(2)+"&Question=";
%>
                <li><h4  style="color: #003333; margin-right: 200px; font-weight: bold"><%=rst3.getString(5)%></h4></li>
                
                  <% int ll=l.length();
                 char[] c = l.toCharArray();
                 char xx='\0';
                 for(int i=0;i<ll;++i)
                 {
                     if(c[i]=='.')
                     {
                         xx=c[i+1];
                         break;
                     }
                 }
           if(xx=='j')
           {%>     
            <html>
                <body>
                    <a href="imm.jsp" target="_blank"> <img src= "<% out.print(l); %>" style="margin-left: 705px; height: 300px; padding: 4px; width: 300px; border: 0.5px solid #003333;"/> </a>
                </body>
            </html>
          <% }
          else
          {%>
             <html>
                <body>
                    <a style="text-decoration: none; color: #003333; font-size: 120%" href="SearchP.jsp?PDF=<%=l%>&email=<%=email%>&word=at">Find</a>
                    <a href="imm.jsp" target="_blank"> <embed src= "<% out.print(l); %>" style="margin-left: 705px; height: 300px; padding: 4px; width: 300px; border: 0.5px solid #003333;"/> </a>
                </body>
            </html>
          <%}
             %> 
   <!--             <li id="sline" style="margin-left: 700px;" ><img style="width: 300px; height: 300px;" src="/TestSite/"></li> -->
                <br><br>
                    <%
                        String ans = rst3.getString(6);
                        if (ans.equals("none")) {
                    %>
                <li id="sline"><h4  style="border: 1.5px solid #003333; color: #003333; margin-right: 200px;">You haven't answered this question.</h4></li>
                <br>
               <li><a style="text-decoration: none; color: #003333; font-size: 120%" href="PostAnswerJ.jsp?email=<%=email%>&AskerEmail=<%=rst3.getString(3)%>&ID=<%=rst3.getInt(1)%>&Question=<%=ques%>">Answer this</a></li>
                    <%
                    } else {
                    %>
                <li id="sline"><h4  style="border: 1.5px solid #003333; color: #003333; margin-right: 200px;"><%=rst3.getString(6)%></h4></li>
                <br>
               <li><a style="text-decoration: none; color: #003333; font-size: 120%" href="PostAnswerJ.jsp?email=<%=email%>&AskerEmail=<%=rst3.getString(3)%>&ID=<%=rst3.getInt(1)%>&Question=<%=ques%>">Edit this answer</a></li>
                    <%
                        }
                    %>
                               <li><a style="text-decoration: none; color: #003333; font-size: 120%" href="ViewOtherJ.jsp?email=<%=email%>&Question=<%=ques%>&ID=<%=rst3.getInt(1)%>">View Other Answers</a></li>
                 <li><h4 style="margin-left: 600px; font-size: 120%; color: #003333; border-bottom: 1px solid #003333; margin-right: 410px;"><%=user%>, <%=rst3.getString(3)%></h4></li>
                <br><br>
                <% }%>
            </ul> 
            <!-- ################################################################################################ 
            ################################################################################################ 
            <div class="full_width clear">
              <h2>Third Columns</h2>
              <div class="one_third first">One Third</div>
              <div class="one_third">One Third</div>
              <div class="one_third">One Third</div>
            </div>
            <div class="full_width clear">
              <div class="one_third first">One Third</div>
              <div class="two_third">Two Third</div>
            </div>
            <div class="full_width clear">
              <div class="two_third first">Two Third</div>
              <div class="one_third">One Third</div>
            </div>
             ################################################################################################ 
             ################################################################################################ 
            <div class="full_width clear">
              <h2>Quarter Columns</h2>
              <div class="one_quarter first">One Quarter</div>
              <div class="one_quarter">One Quarter</div>
              <div class="one_quarter">One Quarter</div>
              <div class="one_quarter">One Quarter</div>
            </div>
            <div class="full_width clear">
              <div class="one_quarter first">One Quarter</div>
              <div class="one_quarter">One Quarter</div>
              <div class="two_quarter">Two Quarter</div>
            </div>
            <div class="full_width clear">
              <div class="two_quarter first">Two Quarter</div>
              <div class="one_quarter">One Quarter</div>
              <div class="one_quarter">One Quarter</div>
            </div>
            <div class="full_width clear">
              <div class="one_quarter first">One Quarter</div>
              <div class="two_quarter">Two Quarter</div>
              <div class="one_quarter">One Quarter</div>
            </div>
            <div class="full_width clear">
              <div class="one_quarter first">One Quarter</div>
              <div class="three_quarter">Three Quarter</div>
            </div>
            <div class="full_width clear">
              <div class="three_quarter first">Three Quarter</div>
              <div class="one_quarter">One Quarter</div>
            </div>
             ################################################################################################     
             ################################################################################################ 
            <div class="full_width clear">
              <h2>Fifth Columns</h2>
              <div class="one_fifth first">One Fifth</div>
              <div class="one_fifth">One Fifth</div>
              <div class="one_fifth">One Fifth</div>
              <div class="one_fifth">One Fifth</div>
              <div class="one_fifth">One Fifth</div>
            </div>
            <div class="full_width clear">
              <div class="one_fifth first">One Fifth</div>
              <div class="one_fifth">One Fifth</div>
              <div class="one_fifth">One Fifth</div>
              <div class="two_fifth">Two Fifth</div>
            </div>
            <div class="full_width clear">
              <div class="one_fifth first">One Fifth</div>
              <div class="one_fifth">One Fifth</div>
              <div class="three_fifth">Three Fifth</div>
            </div>
            <div class="full_width clear">
              <div class="one_fifth first">One Fifth</div>
              <div class="four_fifth">Four Fifth</div>
            </div>
            <div class="full_width clear">
              <div class="two_fifth first">Two Fifth</div>
              <div class="three_fifth">Three Fifth</div>
            </div>
            ################################################################################################ 
             ################################################################################################ 
            <div class="full_width clear">
              <h2>Sixth Columns</h2>
              <div class="one_sixth first">One Sixth</div>
              <div class="one_sixth">One Sixth</div>
              <div class="one_sixth">One Sixth</div>
              <div class="one_sixth">One Sixth</div>
              <div class="one_sixth">One Sixth</div>
              <div class="one_sixth">One Sixth</div>
            </div>
            <div class="full_width clear">
              <div class="one_sixth first">One Sixth</div>
              <div class="one_sixth">One Sixth</div>
              <div class="one_sixth">One Sixth</div>
              <div class="one_sixth">One Sixth</div>
              <div class="two_sixth">Two Sixth</div>
            </div>
            <div class="full_width clear">
              <div class="one_sixth first">One Sixth</div>
              <div class="one_sixth">One Sixth</div>
              <div class="one_sixth">One Sixth</div>
              <div class="three_sixth">Three Sixth</div>
            </div>
            <div class="full_width clear">
              <div class="one_sixth first">One Sixth</div>
              <div class="one_sixth">One Sixth</div>
              <div class="four_sixth">Four Sixth</div>
            </div>
            <div class="full_width clear">
              <div class="one_sixth first">One Sixth</div>
              <div class="five_sixth">Five Sixth</div>
            </div>
            <div class="full_width clear">
              <div class="two_sixth first">Two Sixth</div>
              <div class="one_sixth">One Sixth</div>
              <div class="three_sixth">Three Sixth</div>
            </div>
             ################################################################################################ -->
        </div>
    </div>
    <!-- Footer -->
    <div class="wrapper row4">
        <footer id="footer" class="clear">
            <p class="fl_left">Copyright &copy; 2017 - All Rights Reserved - <a href="#">Domain Name</a></p>
            <!--  <p class="fl_right">Template by <a href="http://www.os-templates.com/" title="Free Website Templates">OS Templates</a></p> -->
        </footer>
    </div>
</body>
</html>