<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
<title>Smart Study | Home</title>
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
 String redirect="QuestionAdder?email="+email;
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
      <li><a href=<%=redirect1%> >Cardbox</a></li>
      <li><a href=<%=redirect4%> >My Questions</a></li>
      <li><a href=<%=redirect2%> >Asked To Answer</a></li>
      <li><a href="Invalidate">Logout</a></li>
      <li><a href="#">A Long Link Text Here</a></li>
      <form method="post" action="crawling.jsp">
          <li>
              <input type="text" name="psearch" title="search" placeholder="Search" required="required" value="" target="_blank"/></li>
          <li><input type="submit">Search</li>	
		<!--	<button input type="submit">Search</button>  -->
      </form>
      
      
          
      
      
  <!--    <li class="last-child"><a class="drop" href="#">Drop 2</a>  -->
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
<style>
p.ex1 {
    margin-left: 8cm;
}
</style>

      
<p class="ex1">  
      <div class="diy-nav__secondary" style="margin-left: 1000px; margin-top: 0px;">
			<form class="diy-nav__secondary-item diy-nav__secondary-item--inline-search"
				method="get" action="crawlingm.jsp" role="form">
			
                           
				
						
						
                            <a  target="_blank">	<input  type="text" name="psearch"
							title="search" placeholder="Search" required="required" value=""/>
						
					</a>
				
				<button class="btn btn-primary sr-only" input type="submit">Search</button>
			</form>
			
		</div>
      
      </p> 
<!-- content -->
<div class="wrapper row3">
  <div id="container">
    <!-- ################################################################################################ -->
    <form action=<%=redirect%> method="post">
        <label style="margin-left: 100px;" >Enter Question</label>
        <input type="text" placeholder="Question" style="margin-left: 100px;" name="Question1" value="nothing"><br><br>
        <label style="margin-left: 100px;">Enter Question</label>
        <input type="text" placeholder="Question" style="margin-left: 100px;" name="Question2" value="nothing"><br><br>
        <label style="margin-left: 100px;">Enter Question</label>
        <input type="text" placeholder="Question" style="margin-left: 100px;" name="Question3" value="nothing"><br><br>
        <label style="margin-left: 100px;">Enter Question</label>
        <input type="text" placeholder="Question" style="margin-left: 100px;" name="Question4" value="nothing"><br><br>
        <label style="margin-left: 100px;">Enter Question</label>
        <input type="text" placeholder="Question" style="margin-left: 100px;" name="Question5" value="nothing"><br><br>
        <label style="margin-left: 100px;">Your ID</label>
        <input type="text" style="margin-left: 140px;" name="Email" value=<%=email%> readonly><br><br>
        <label style="margin-left: 100px;">Recipient 1</label>
        <input type="text" style="margin-left: 120px;" placeholder="Recipient" name="Recipient1" value="none"><br><br>
        <label style="margin-left: 100px;">Recipient 2</label>
        <input type="text" style="margin-left: 120px;" placeholder="Recipient" name="Recipient2" value="none"><br><br>
        <label style="margin-left: 100px;">Recipient 3</label>
        <input type="text" style="margin-left: 120px;" placeholder="Recipient" name="Recipient3" value="none"><br><br>
        <label style="margin-left: 100px;">Recipient 4</label>
        <input type="text" style="margin-left: 120px;" placeholder="Recipient" name="Recipient4" value="none"><br><br>
        <label style="margin-left: 100px;">Recipient 5</label>
        <input type="text" style="margin-left: 120px;" placeholder="Recipient" name="Recipient5" value="none"><br><br>
        <input type="submit" style="margin-left: 120px;" value="Post">
    </form>
      <%@ page import="java.io.*,java.sql.*,java.util.zip.*" %>



<FORM ENCTYPE="multipart/form-data" ACTION="Image?Email=<%=email%>" METHOD=POST>
<center>
<table border="0" bgcolor=#ccFDDEE>
<tr>
<center><td colspan="2" align="center"><B>Upload File</B><center></td>
</tr>
<tr><td colspan="2" align="center"> </td></tr>
<tr><td><b>Choose the file To Upload:</b></td>
<td><INPUT NAME="file" TYPE="file"></td>
</tr>
<tr><td colspan="2" align="center"> </td></tr>
<tr><td colspan="2" align="center"><input type="submit" value="Send File"> </td></tr>
<table>
</center>
</FORM>
    
  
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