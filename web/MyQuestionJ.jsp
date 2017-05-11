<%-- 
    Document   : MyQuestionJ
    Created on : 25 Apr, 2017, 7:27:45 PM
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
<title>Smart Study | My Question</title>
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
<%
   // Assuming you are sending email from localhost
  // String host = application.getInitParameter("host");
  // String port = application.getInitParameter("port");

   // Get system properties object
  // Properties properties = System.getProperties();

   // Setup mail server
  /* properties.put("mail.smtp.host", host);
   properties.put("mail.smtp.port", port);
   properties.put("mail.smtp.auth", "true");
   properties.put("mail.smtp.starttls.enable", "true");
   Authenticator auth = new Authenticator() {
            public PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication( "srivastava0701@gmail.com","Ut@8860418550");
            }
        };
   // Get the default Session object.
   Session mailSession = Session.getInstance(properties, auth);
   String subject = "Smart Study Verification";
   String content = "Hello User!!";
 
        String resultMessage = "";
   try{
        Message msg = new MimeMessage(mailSession);
 
        msg.setFrom(new InternetAddress("srivastava0701@gmail.com"));
        InternetAddress[] toAddresses = { new InternetAddress(email) };
        msg.setRecipients(Message.RecipientType.TO, toAddresses);
        msg.setSubject(subject);
        msg.setSentDate(new java.util.Date());
        msg.setText(content);
 
        // sends the e-mail
        Transport.send(msg);
      result = "Sent message successfully....";
   }catch (MessagingException mex) {
      mex.printStackTrace();
      result = "Error: unable to send message....";
   }*/
 String email=request.getParameter("email");
 String redirect="QuestionAdder";
 String redirect1="CardboxJ.jsp?email="+email;
 String redirect2="AskedToAnswerJ.jsp?email="+email;
 String redirect3="NormalAdderJ.jsp?email="+email;
 String redirect4="MyQuestionJ.jsp?email="+email;
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
      <li><a href=<%=redirect1%> >CardBox</a></li>
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
 
<!-- content -->
<div class="wrapper row3">
  <div id="container">
    <!-- ################################################################################################ -->
    <%
       Class.forName("com.mysql.jdbc.Driver");
       Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/question","root","utkarsh123");
       Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/logintest","root","utkarsh123");
       PreparedStatement stm=con1.prepareStatement("select * from data where Email=?");
       stm.setString(1,email);
       ResultSet rs=stm.executeQuery();
       rs.next();
       PreparedStatement stmt=con.prepareStatement("select * from centralquestion where sender=?");
       stmt.setString(1,email);
       ResultSet rst1=stmt.executeQuery();
       PreparedStatement stmt2=con.prepareStatement("select * from askedanswer where questionID=? and question=?");
       int flag=0;
    %>
    <%while(rst1.next())
     {
        flag=1;
        int i=2;
        while(i<=6)
        {
          String quest=rst1.getString(i);
            if(!quest.equals("nothing"))
            {
             String l=rst1.getString(13);
         %>
    <ul style="list-style-type: none;">
        <li><h3 style="color: #003333; margin-right: 200px; font-weight: bold;"><%=quest%></h3></li>
          <% int ll=l.length();
                 char[] c = l.toCharArray();
                 char xx='\0';
                 for(int j=0;j<ll;++j)
                 {
                     if(c[j]=='.')
                     {
                         xx=c[j+1];
                         break;
                     }
                 }
           if(xx=='j')
           {%>     
            <html>
                <body>
                    
                    <a href="imm.jsp" target="_blank"> <img src= "<% out.print(l); %>" style="margin-left: 700px; height: 300px; padding: 4px; width: 500px; border: 1px solid #003333;"/> </a>
                </body>
            </html>
          <% }
          else
          {%>
             <html>
                <body>
                    <a style="text-decoration: none; color: #003333; font-size: 120%" href="SearchP.jsp?PDF=<%=l%>&email=<%=email%>">Find</a>
                    <a href="imm.jsp" target="_blank"> <embed src= "<% out.print(l); %>" style="margin-left: 700px; height: 300px; padding: 4px; width: 500px; border: 1px solid #003333;"/> </a>
                </body>
            </html>
          <%}
             %> 
 <!--       <li><img style="margin-left: 700px; width: 300px; height: 300px;" src="/TestSite/"</li> -->
                <ul style="list-style-type: none;">
                    <div id="">
        <%
            stmt2.setInt(1,rst1.getInt(12));
            stmt2.setString(2,quest);
            ResultSet rst2=stmt2.executeQuery();
            if(rst2.next()==false)
            {
               %>
               <br><li><h4 style="border: 1.5px solid #003333; margin-right: 200px; color: #003333;">No recipient has opened this question yet.</h4></li><br>
                          <%
            }
          else
           {
            rst2.previous();
            while(rst2.next())
            {
               String ans=rst2.getString(6);
               String writer=rst2.getString(2);
               String answithouts=ans.replace(' ','_');
               String ID=rst2.getString(1);
               if(!ans.equals("none"))
                  {
        %>
               <br>
           <li><h4 style="border: 1.5px solid #003333; margin-right: 150px; color: #003333;"><%=ans%></h4></li>
           <%
             }
             else
              {
           %>
           <br>
           <li><h4 style="border: 1.5px solid #003333; margin-right: 200px; color: #003333;">Not Answered Yet.</h4></li>
           <%
              }
             if(rst2.getInt(8)==0)
              {
                 String ques=quest.replace(' ','_');
           %>
           <li><a style="text-decoration: none; color: #003333; font-size: 120%" href="Cardbox?email=<%=email%>&AskedEmail=<%=rst2.getString(2)%>&Asker=<%=rst2.getString(3)%>&Question=<%=ques%>&ans=<%=answithouts%>&ID=<%=ID%>&Image=<%=rst2.getString(4)%>&From=0&Add=1">Add To Cardbox</a></li>
           <%
              }
             else
              { 
              String ques=quest.replace(' ','_');
           %>
           <li><a style="text-decoration: none; color: #003333; font-size: 120%" href="Cardbox?email=<%=email%>&AskedEmail=<%=rst2.getString(2)%>&Asker=<%=rst2.getString(3)%>&Question=<%=ques%>&ans=<%=answithouts%>&ID=<%=ID%>&Image=<%=rst2.getString(4)%>&From=0&Add=0">Remove From Cardbox</a></li>
           <%
              }
           %>
           <h6 style="margin-left: 600px; font-size: 120%; color: #003333; border-bottom: 1px solid #003333; margin-right: 330px;"><%=rs.getString(1)%>, <%=writer%></h6>
        <%
            }
}
        %>
                    </div>
                </ul>
    </ul>
        <%
           }
         i+=1;
          }
         }
        if(flag==0)
          {
        %>
        <h3 style="color: #003333; margin-right: 200px;">You haven't asked any Questions yet, <%=rs.getString(1)%>.</h3>
        <br>
        <h3 style="color: #003333; margin-right: 200px;">Go to Home, and start asking.</h3>
        
        <%
          }
          con.close();
          con1.close();
        %>
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
    <p class="fl_left">Copyright & copy; 2017 - All Rights Reserved - <a href="#">Domain Name</a></p>
   <!-- <p class="fl_right">Template by <a href="http://www.os-templates.com/" title="Free Website Templates">OS Templates</a></p> -->
  </footer>
</div>
</body>
</html>