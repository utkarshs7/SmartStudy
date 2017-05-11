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
      <li class="active first"><a href="index.html">Homepage</a></li>
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
      <li><a href="#">Style Demo</a></li>
      <li><a href="#">Full Width</a></li>
      <li><a href="AskedToAnswer.jsp">Asked To Answer</a></li>
      <li><a href="https://www.google.com/accounts/Logout?continue=https://appengine.google.com/_ah/logout?continue=http://localhost:8080/TestSite/">Logout</a></li>
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
String name = (String)request.getParameter("GName");
String email = (String)request.getParameter("Gmail");  
out.println(email);
String Id = (String)request.getParameter("GID");
HttpSession Hsession=request.getSession(true);
 Hsession.setAttribute("theEmail", email);
email=(String)Hsession.getAttribute("theEmail");
Connection check=null;
String querycheck="select * from google_user where GmailID='"+email+"'";
 Class.forName("com.mysql.jdbc.Driver");
 ResultSet rstcheck=null;
 check = DriverManager.getConnection("jdbc:mysql://localhost:3306/logintest","root","utkarsh123");
Statement statecheck = check.createStatement();
rstcheck = statecheck.executeQuery(querycheck);

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
 if(!rstcheck.next())
 {
    Connection con = null;
    
        String queryText = "insert into google_user (GmailID, Name, ID) values('"+email+"','"+name+"','"+Id+"')";

        try {
              Class.forName("com.mysql.jdbc.Driver");
              con = DriverManager.getConnection("jdbc:mysql://localhost:3306/logintest","root","utkarsh123");

            Statement stat = con.createStatement();

            int rst = stat.executeUpdate(queryText);

            stat.close();
            con.close();
        } catch (Exception e) {
        out.println(e);
        }
       //     HttpSession Hsession=request.getSession();
         //   Hsession.setAttribute("Email", email);
 }
 check.close();
 String question=request.getParameter("Question");
 String recipient1=request.getParameter("Recipient1");
 String recipient2=request.getParameter("Recipient2");
 String recipient3=request.getParameter("Recipient3");
 String recipient4=request.getParameter("Recipient4");
 String recipient5=request.getParameter("Recipient5");
if(question!="")
{
 try{
 Class.forName("com.mysql.jdbc.Driver");
 Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/question","root","utkarsh123");
 PreparedStatement stmt=con.prepareStatement("insert into centralquestion(sender,question,imageID,recipient1,recipient2,recipient3,recipient4,recipient5,questionID) values(?,?,?,?,?,?,?,?,?)");
 stmt.setString(1,email);
 stmt.setString(2, question);
 stmt.setString(3,"blank");
 if(recipient1!="")
  stmt.setString(4,recipient1);
 else
  stmt.setString(4,"none");
 if(recipient2!="")
  stmt.setString(5,recipient2);
 else
  stmt.setString(5,"none");
 if(recipient3!="")
  stmt.setString(6,recipient3);
 else
  stmt.setString(6,"none");
 if(recipient4!="")
  stmt.setString(7,recipient4);
 else
  stmt.setString(7,"none");
 if(recipient5!="")
  stmt.setString(8,recipient5);
 else
  stmt.setString(8,"none");
 Random num=new Random();
 stmt.setInt(9,Math.abs(num.nextInt()));
 stmt.executeUpdate();
}
 catch(Exception e)
 {
     out.println(e);
 }
}
// } catch (Exception e) {
       // out.println(e);
      //  }
 %>
<!-- content -->
<div class="wrapper row3">
  <div id="container">
    <!-- ################################################################################################ -->
    <form action="AdderTest.jsp" method="post">
        <label style="margin-left: 100px;">Enter Question</label>
        <input type="text" placeholder="Question" style="margin-left: 100px;" name="Question" value=""><br><br>
        <label style="margin-left: 100px;">Your ID</label>
        <input type="text" style="margin-left: 140px;" name="Email" value=<%=email%> readonly><br><br>
        <label style="margin-left: 100px;">Recipient 1</label>
        <input type="text" style="margin-left: 120px;" placeholder="Recipient" name="Recipient1" value=""><br><br>
        <label style="margin-left: 100px;">Recipient 2</label>
        <input type="text" style="margin-left: 120px;" placeholder="Recipient" name="Recipient2" value=""><br><br>
        <label style="margin-left: 100px;">Recipient 3</label>
        <input type="text" style="margin-left: 120px;" placeholder="Recipient" name="Recipient3" value=""><br><br>
        <label style="margin-left: 100px;">Recipient 4</label>
        <input type="text" style="margin-left: 120px;" placeholder="Recipient" name="Recipient4" value=""><br><br>
        <label style="margin-left: 100px;">Recipient 5</label>
        <input type="text" style="margin-left: 120px;" placeholder="Recipient" name="Recipient5" value=""><br><br>
        <input type="submit" style="margin-left: 120px;" value="Post">
    </form>
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