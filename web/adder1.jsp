<%-- 
    Document   : adder
    Created on : 14 Mar, 2017, 11:09:28 PM
    Author     : Utkarsh
--%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="java.io.*,java.util.*"%>
<%@ page import="javax.activation.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
        <%

//HttpSession Hsession=request.getSession();
//Hsession.setAttribute("theEmail", email);
            String email = request.getParameter("Email");
            String name = request.getParameter("Name");
            String password = (String) request.getParameter("Password");
            Connection check = null;

            String querycheck = "select Email from data where Email='" + email + "'";
            Class.forName("com.mysql.jdbc.Driver");
            ResultSet rstcheck = null;
            check = DriverManager.getConnection("jdbc:mysql://localhost:3306/logintest", "root", "utkarsh123");
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
            if (rstcheck == null) {
                Connection con = null;

                String queryText = "insert into data (Name, Email, Password) values('" + name + "','" + email + "','" + password + "')";

                //  try {
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/logintest", "root", "utkarsh123");

                Statement stat = con.createStatement();

                int rst = stat.executeUpdate(queryText);

                stat.close();
                con.close();
                HttpSession Hsession = request.getSession();
                Hsession.setAttribute("Name", name);
            }

            // } catch (Exception e) {
            // out.println(e);
            //  }
        %>











        <!doctype html>
    <html lang="en">
        <head>
            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <meta name="description" content="A layout example that shows off a responsive product landing page.">
            <title>Landing Page &ndash; Layout Examples &ndash; Pure</title>

            <link rel="stylesheet" href="https://unpkg.com/purecss@0.6.2/build/pure-min.css" integrity="sha384-" crossorigin="anonymous">

            <!--[if lte IE 8]>
                <link rel="stylesheet" href="https://unpkg.com/purecss@0.6.2/build/grids-responsive-old-ie-min.css">
            <![endif]-->
            <!--[if gt IE 8]><!-->
            <link rel="stylesheet" href="https://unpkg.com/purecss@0.6.2/build/grids-responsive-min.css">
            <!--<![endif]-->

            <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">

            <!--[if lte IE 8]>
                <link rel="stylesheet" href="css/layouts/marketing-old-ie.css">
            <![endif]-->
            <!--[if gt IE 8]><!-->
            <link rel="stylesheet" href="css/layouts/marketing.css">
            <!--<![endif]-->
        </head>
        <body>









            <div class="header">
                <div class="home-menu pure-menu pure-menu-horizontal pure-menu-fixed">
                    <a class="pure-menu-heading" href="">Your Site</a>

                    <ul class="pure-menu-list">
                        <li class="pure-menu-item pure-menu-selected"><a href="#" class="pure-menu-link">Home</a></li>
                        <li class="pure-menu-item"><a href="#" class="pure-menu-link">Tour</a></li>
                        <li class="pure-menu-item"><a href="#" class="pure-menu-link">Sign Up</a></li>
                    </ul>
                </div>
            </div>

            <div class="splash-container">
                <div class="splash">
                    <h1 class="splash-head">Big Bold Text</h1>
                    <p class="splash-subhead">
                        Lorem ipsum dolor sit amet, consectetur adipisicing elit.
                    </p>
                    <p>
                        <a href="http://purecss.io" class="pure-button pure-button-primary">Get Started</a>
                    </p>
                </div>
            </div>

            <div class="content-wrapper">
                <div class="content">
                    <h2 class="content-head is-center">Excepteur sint occaecat cupidatat.</h2>

                    <div class="pure-g">
                        <div class="l-box pure-u-1 pure-u-md-1-2 pure-u-lg-1-4">

                            <h3 class="content-subhead">
                                <i class="fa fa-rocket"></i>
                                Get Started Quickly
                            </h3>
                            <p>
                                Phasellus eget enim eu lectus faucibus vestibulum. Suspendisse sodales pellentesque elementum.
                            </p>
                        </div>
                        <div class="l-box pure-u-1 pure-u-md-1-2 pure-u-lg-1-4">
                            <h3 class="content-subhead">
                                <i class="fa fa-mobile"></i>
                                Responsive Layouts
                            </h3>
                            <p>
                                Phasellus eget enim eu lectus faucibus vestibulum. Suspendisse sodales pellentesque elementum.
                            </p>
                        </div>
                        <div class="l-box pure-u-1 pure-u-md-1-2 pure-u-lg-1-4">
                            <h3 class="content-subhead">
                                <i class="fa fa-th-large"></i>
                                Modular
                            </h3>
                            <p>
                                Phasellus eget enim eu lectus faucibus vestibulum. Suspendisse sodales pellentesque elementum.
                            </p>
                        </div>
                        <div class="l-box pure-u-1 pure-u-md-1-2 pure-u-lg-1-4">
                            <h3 class="content-subhead">
                                <i class="fa fa-check-square-o"></i>
                                Plays Nice
                            </h3>
                            <p>
                                Phasellus eget enim eu lectus faucibus vestibulum. Suspendisse sodales pellentesque elementum.
                            </p>
                        </div>
                    </div>
                </div>

                <div class="ribbon l-box-lrg pure-g">
                    <div class="l-box-lrg is-center pure-u-1 pure-u-md-1-2 pure-u-lg-2-5">
                        <img width="300" alt="File Icons" class="pure-img-responsive" src="img/common/file-icons.png">
                    </div>
                    <div class="pure-u-1 pure-u-md-1-2 pure-u-lg-3-5">

                        <h2 class="content-head content-head-ribbon">Laboris nisi ut aliquip.</h2>

                        <p>
                            Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                            tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
                            quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
                            consequat. Duis aute irure dolor.
                        </p>
                    </div>
                </div>

                <div class="content">
                    <h2 class="content-head is-center">Dolore magna aliqua. Uis aute irure.</h2>

                    <div class="pure-g">
                        <div class="l-box-lrg pure-u-1 pure-u-md-2-5">
                            <form class="pure-form pure-form-stacked">
                                <fieldset>

                                    <label for="name">Your Name</label>
                                    <input id="name" type="text" placeholder="Your Name">


                                    <label for="email">Your Email</label>
                                    <input id="email" type="email" placeholder="Your Email">

                                    <label for="password">Your Password</label>
                                    <input id="password" type="password" placeholder="Your Password">

                                    <button type="submit" class="pure-button">Sign Up</button>
                                </fieldset>
                            </form>
                        </div>

                        <div class="l-box-lrg pure-u-1 pure-u-md-3-5">
                            <h4>Contact Us</h4>
                            <p>
                                Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                                tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
                                quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
                                consequat.
                            </p>

                            <h4>More Information</h4>
                            <p>
                                Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                                tempor incididunt ut labore et dolore magna aliqua.
                            </p>
                        </div>
                    </div>

                </div>

                <div class="footer l-box is-center">
                    View the source of this layout to learn more. Made with love by the YUI Team.
                </div>

            </div>




        </body>
    </html>

    <script language="JavaScript">
        function showInput() {
            document.getElementById('display').innerHTML =
                    document.getElementById("user_input").value;
        }
    </script>

    <label>Quantity</label><input type="text" id="qty" name="qty" />

    <div id="newFields"></div>


    <script type="text/javascript">
        $(function () {

            var input = $('<input type="text" />');
            var newFields = $('');

            $('#qty').bind('blur keyup change', function () {
                var n = this.value || 0;
                if (n + 1) {
                    if (n > newFields.length) {
                        addFields(n);
                    } else {
                        removeFields(n);
                    }
                }
            });

            function addFields(n) {
                for (i = newFields.length; i < n; i++) {
                    var newInput = input.clone();
                    newFields = newFields.add(newInput);
                    newInput.appendTo('#newFields');
                }
            }

            function removeFields(n) {
                var removeField = newFields.slice(n).remove();
                newFields = newFields.not(removeField);
            }
        });
    </script>
    <form class="form" method="post" method="get" action="adder.jsp">
        <label><b>Enter a Message</b></label>
        <input type="text" name="message" id="user_input"  >
        <br><br>
        <label><b>Enter Your EmailID</b></label>
        <input type="email" name="Useremail" id="user_email">
        <input type="submit" onclick="showInput();" value="daba"><br/>   
    </form>
    <label>Your input: </label>


    <p><span id='display'></span></p>






    <%       //out.println(email);
        //Hsession.setAttribute("theEmail", email);                
        String QT = request.getParameter("message");
        String Ue = request.getParameter("Useremail");
        String res;
        Connection co = null;
        //String postemail=(String)session.getAttribute("theEmail");
        // out.println(postemail);
        String query = "insert into adques (question,askeremail) values('" + QT + "','" + Ue + "')";

        if (QT != "" && Ue != "") {
            //  try {
            Class.forName("com.mysql.jdbc.Driver");
            co = DriverManager.getConnection("jdbc:mysql://localhost:3306/Question", "root", "utkarsh123");

            Statement st = co.createStatement();

            int rs = st.executeUpdate(query);
        }

            /*st.close();
             co.close();*/
            // out.println("teri ma ka");
    %>
    <%                       Connection con1 = null;
            Class.forName("com.mysql.jdbc.Driver");
            con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/question", "root", "utkarsh123");

            Statement stat1 = con1.createStatement();

            ResultSet rs1 = null;

            try {

                rs1 = stat1.executeQuery("select question,askeremail from adques where askeremail='" + Ue + "'");
                /* while (rs1.next()) {
// String coffeeName = rs1.getString("question");
// String gete=rs1.getString("askeremail");
    out.println("\n\n\n\n");
// out.println(coffeeName);
 out.println("\n\n\n\n");
// out.println(gete);
         
}*/
            } catch (SQLException e) {
                e.getMessage();
            }
        /*finally {
if (stat1 != null) { stat1.close(); }
}*/


/*     //  int rst = stat.executeUpdate(queryText);

//  stat.close();
// con.close();
// String id = request.getParameter("id");  

 ResultSet resultset = 
     stat.executeQuery("select * from adques") ; 
// String q=resultset.getString(1);
/*if(!resultset.next()) {
     out.println("Sorry, could not find that publisher. ");
 } else {  */
    %>
    <ul>
        <% while(rs1.next()) {%>
        <li><h4><%= rs1.getString(1)%></h4></li>
        <li><h4><%= rs1.getString(2)%></h4></li>
                <% }%>
    </ul>






</body>
</html>