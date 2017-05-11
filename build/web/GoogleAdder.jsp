<%-- 
    Document   : GoogleAdder
    Created on : 16 Mar, 2017, 9:37:47 PM
    Author     : Utkarsh
--%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Smart Study | User Home</title>
    </head>
    <body>
        <%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="java.io.*,java.util.*"%>
<%@ page import="javax.activation.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Smart Study | User Page</title>
    </head>
    <body>
      <style>
  

ul {
    list-style-type: none;
    padding-left: 100px;
    font-size: 20px;
    padding-right: 100px;
}

li {
    padding-left: 110px;
    font-size: 20px;
    border: 2px solid #080808;
}
.dropbtn {
    background-color: #4CAF50;
    color: white;
    padding: 16px;
    font-size: 16px;
    border: none;
    cursor: pointer;
}

#newFields input {
    display: block;
    border: 2px solid;
    margin-left: 40px;
    margin-bottom: 10px;
    width: 300px;
    resize: both;
    overflow: auto; 
}
.dropdown {
    position: relative;
    display: inline-block;
}

.dropdown-content {
    display: none;
    position: absolute;
    background-color: #f9f9f9;
    min-width: 160px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index: 1;
}

.dropdown-content a {
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
}

.dropdown-content a:hover {background-color: #f1f1f1}

.dropdown:hover .dropdown-content {
    display: block;
}

.dropdown:hover .dropbtn {
    background-color: #3e8e41;
}
</style> 
      
        <%
  
//HttpSession Hsession=request.getSession();
//Hsession.setAttribute("theEmail", email);
String name = request.getParameter("Name");
String email = request.getParameter("Email");  
String Id = (String)request.getParameter("ID");
Connection check=null;

String querycheck="select GmailID from google_user where GmailID='"+email+"'";
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
 if(rstcheck==null)
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
            HttpSession Hsession=request.getSession();
            Hsession.setAttribute("Name", name);
 }

       // } catch (Exception e) {
       // out.println(e);
      //  }
 %>
        
        
        
        
        
        
        
        
        
        
        
  




<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Smart Study</title>
    </head>
    <body>     
        
     <!DOCTYPE html>
<html>
<head>
   
   
    <meta name="ib_meta" lang="en-us" content="" />
    <meta name="verify-v1" content="WvEStgbV0+DiR1hcpBfdfBM9W69VRpa0XzuJnv1lXOA=" />
    <meta name="vis_key" content="" />
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" /><script type="text/javascript">window.NREUM||(NREUM={}),__nr_require=function(e,t,n){function r(n){if(!t[n]){var o=t[n]={exports:{}};e[n][0].call(o.exports,function(t){var o=e[n][1][t];return r(o||t)},o,o.exports)}return t[n].exports}if("function"==typeof __nr_require)return __nr_require;for(var o=0;o<n.length;o++)r(n[o]);return r}({1:[function(e,t,n){function r(){}function o(e,t,n){return function(){return i(e,[(new Date).getTime()].concat(u(arguments)),t?null:this,n),t?void 0:this}}var i=e("handle"),a=e(2),u=e(3),c=e("ee").get("tracer"),f=NREUM;"undefined"==typeof window.newrelic&&(newrelic=f);var s=["setPageViewName","setCustomAttribute","setErrorHandler","finished","addToTrace","inlineHit","addRelease"],l="api-",p=l+"ixn-";a(s,function(e,t){f[t]=o(l+t,!0,"api")}),f.addPageAction=o(l+"addPageAction",!0),f.setCurrentRouteName=o(l+"routeName",!0),t.exports=newrelic,f.interaction=function(){return(new r).get()};var d=r.prototype={createTracer:function(e,t){var n={},r=this,o="function"==typeof t;return i(p+"tracer",[Date.now(),e,n],r),function(){if(c.emit((o?"":"no-")+"fn-start",[Date.now(),r,o],n),o)try{return t.apply(this,arguments)}finally{c.emit("fn-end",[Date.now()],n)}}}};a("setName,setAttribute,save,ignore,onEnd,getContext,end,get".split(","),function(e,t){d[t]=o(p+t)}),newrelic.noticeError=function(e){"string"==typeof e&&(e=new Error(e)),i("err",[e,(new Date).getTime()])}},{}],2:[function(e,t,n){function r(e,t){var n=[],r="",i=0;for(r in e)o.call(e,r)&&(n[i]=t(r,e[r]),i+=1);return n}var o=Object.prototype.hasOwnProperty;t.exports=r},{}],3:[function(e,t,n){function r(e,t,n){t||(t=0),"undefined"==typeof n&&(n=e?e.length:0);for(var r=-1,o=n-t||0,i=Array(o<0?0:o);++r<o;)i[r]=e[t+r];return i}t.exports=r},{}],ee:[function(e,t,n){function r(){}function o(e){function t(e){return e&&e instanceof r?e:e?c(e,u,i):i()}function n(n,r,o){if(!p.aborted){e&&e(n,r,o);for(var i=t(o),a=v(n),u=a.length,c=0;c<u;c++)a[c].apply(i,r);var f=s[w[n]];return f&&f.push([y,n,r,i]),i}}function d(e,t){b[e]=v(e).concat(t)}function v(e){return b[e]||[]}function g(e){return l[e]=l[e]||o(n)}function m(e,t){f(e,function(e,n){t=t||"feature",w[n]=t,t in s||(s[t]=[])})}var b={},w={},y={on:d,emit:n,get:g,listeners:v,context:t,buffer:m,abort:a,aborted:!1};return y}function i(){return new r}function a(){(s.api||s.feature)&&(p.aborted=!0,s=p.backlog={})}var u="nr@context",c=e("gos"),f=e(2),s={},l={},p=t.exports=o();p.backlog=s},{}],gos:[function(e,t,n){function r(e,t,n){if(o.call(e,t))return e[t];var r=n();if(Object.defineProperty&&Object.keys)try{return Object.defineProperty(e,t,{value:r,writable:!0,enumerable:!1}),r}catch(i){}return e[t]=r,r}var o=Object.prototype.hasOwnProperty;t.exports=r},{}],handle:[function(e,t,n){function r(e,t,n,r){o.buffer([e],r),o.emit(e,t,n)}var o=e("ee").get("handle");t.exports=r,r.ee=o},{}],id:[function(e,t,n){function r(e){var t=typeof e;return!e||"object"!==t&&"function"!==t?-1:e===window?0:a(e,i,function(){return o++})}var o=1,i="nr@id",a=e("gos");t.exports=r},{}],loader:[function(e,t,n){function r(){if(!h++){var e=y.info=NREUM.info,t=l.getElementsByTagName("script")[0];if(setTimeout(f.abort,3e4),!(e&&e.licenseKey&&e.applicationID&&t))return f.abort();c(b,function(t,n){e[t]||(e[t]=n)}),u("mark",["onload",a()],null,"api");var n=l.createElement("script");n.src="https://"+e.agent,t.parentNode.insertBefore(n,t)}}function o(){"complete"===l.readyState&&i()}function i(){u("mark",["domContent",a()],null,"api")}function a(){return(new Date).getTime()}var u=e("handle"),c=e(2),f=e("ee"),s=window,l=s.document,p="addEventListener",d="attachEvent",v=s.XMLHttpRequest,g=v&&v.prototype;NREUM.o={ST:setTimeout,CT:clearTimeout,XHR:v,REQ:s.Request,EV:s.Event,PR:s.Promise,MO:s.MutationObserver},e(1);var m=""+location,b={beacon:"bam.nr-data.net",errorBeacon:"bam.nr-data.net",agent:"js-agent.newrelic.com/nr-1016.min.js"},w=v&&g&&g[p]&&!/CriOS/.test(navigator.userAgent),y=t.exports={offset:a(),origin:m,features:{},xhrWrappable:w};l[p]?(l[p]("DOMContentLoaded",i,!1),s[p]("load",r,!1)):(l[d]("onreadystatechange",o),s[d]("onload",r)),u("mark",["firstbyte",a()],null,"api");var h=0},{}]},{},["loader"]);</script>
   
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <link media="screen" rel="stylesheet" type="text/css" href="https://www.doityourself.com/min/f=css/bootstrap/bootstrap.3.0.0.min.css,css/main.css,css/author-styles.css,css/diy/ib-ad-slider.css,css/jquery/plugins/jquery.interactions.1.12.1.min.css?v=02232017" />
        <link media="screen" rel="stylesheet" type="text/css" href="https://www.doityourself.com/min/f=css/dim/create-edit-project.css?v=02232017" />
    
    <link media="print" rel="stylesheet" type="text/css" href="https://www.doityourself.com/min/f=css/print.css?v=02232017" />

        

 

        <script type="text/javascript" src="https://www.doityourself.com/min/f=js/jquery/jquery-1.9.1.min.js,js/bootstrap/bootstrap.3.0.0.min.js,js/jquery/plugins/jquery.form.3.5.0.min.js,js/jquery/plugins/jquery.interactions.1.12.1.min.js,js/jquery/plugins/jquery.ui.touch-punch.min.js,js/main.js,js/ib-ad-slider.js,js/jquery/plugins/jQuery-menu-aim/jquery.menu-aim.js,js/galleria/galleria-1.4.2.js,js/newsletter.js?v=02232017"></script>
            <script type="text/javascript" src="https://www.doityourself.com/min/f=js/dim/js/load-image.all.min.js,js/dim/js/canvas-to-blob.min.js,js/dim/js/jquery.ui.widget.js,js/dim/js/jquery.iframe-transport.js,js/dim/js/jquery.fileupload.js,js/dim/js/jquery.fileupload-process.js,js/dim/js/jquery.fileupload-image.js?v=02232017"></script>
    
 
</script>
<div class="diy-nav js-diy-nav" id="nav">
	<div class="diy-nav__container diy-nav__container--main clearfix">
		<div class="diy-nav__logo">
			</a>
		</div>
		<div class="diy-nav__secondary">
			<form class="diy-nav__secondary-item diy-nav__secondary-item--inline-search"
				method="get" action="search.jsp" role="form">
			<!--	<input type="hidden" name="search" value="" />  -->
                                
                              
				<div class="search-group">
					<div class="search-group__expandable-container js-search-group js-expandable-search">
						<button type="reset" class="search-group__cancel js-search-group__cancel">Cancel</button>
						<span class="search-group__icon"><button class="icon icon__search--gray2 absolute-center"></button></span>
						<input class="search-group__input form-control input-sm js-search-group__input absolute-center" type="text" name="psearch"
							title="search" placeholder="Search" required="required" value="" target="_blank"/>
						<button type="reset" class="search-group__clear js-search-group__reset hidden"  target="_blank"><span class="icon icon__remove absolute-center"></span></button>
					</div>
				</div>
				<button class="btn btn-primary sr-only" input type="submit">Search</button>
			</form>
			<a class="diy-nav__secondary-item diy-nav__panel-control diy-nav__panel-control--search js-panel-control"
				href="http://www.google.com/Search" data-target=".js-panel-search">
				<span class="diy-nav__panel-control-icon"><span class="icon icon__search--yellow absolute-center"></span></span>
			</a>
			<a class="diy-nav__secondary-item diy-nav__panel-control js-panel-control"
				href="http://www.goole.com/forum/" data-target=".js-panel-login">
				<span class="diy-nav__panel-control-icon"><span class="icon icon__profile absolute-center"></span></span>
			</a>
		</div>
		
			
	<div class="diy-nav__panel diy-nav__panel--mobile-search js-panel js-panel-search hidden">
		<div class="diy-nav__container">
			<form class="form-inline search-panel" method="get" action="http://www.google.com/psearch" role="form">
				<fieldset>
					<legend class="sr-only">search</legend>
					<input type="hidden" name="dsp" value='your-projects' />
					<div class="form-group">
						<input class="form-control" type="text" name="psearch" title="search"
							placeholder="Search" value="" target="_blank"/>
					</div>
					<input class="sr-only" type="submit" value="search" />
                                        <div class="diy-nav__panel js-panel js-panel-login hidden">
                                            				</fieldset>
			</form>
		</div>
	</div>
        <!--    	<div class="diy-nav__panel js-panel js-panel-login hidden">  -->
	<!--	<div class="diy-nav__container"> -->
			<div class="login-panel clearfix">
								<span class="login-panel__content--logged-in">
					Hi
					<span class="diy-nav__username"></span>
					|
					<a href="javascript:void(0)" class="js-logout" id="vbLogout">Logout</a>
				</span>
		<!--	<span class="login-panel__content--logged-out">
					<span class="login-panel__row login-panel__row--login"> -->
                       
						<a class="btn btn--header btn--header-large btn--login pull-left" href="https://www.google.com/accounts/Logout?continue=https://appengine.google.com/_ah/logout?continue=http://localhost:8080/TestSite/">Logout</a>
                       <!--                 </span>
                        </span> -->
		<!--	</div>  -->
       <!--		</div>   -->
<!--	</div>  -->
</div>
        </div>
<script type="text/javascript" src="//www.doityourself.com/svc/cm/how-to"></script>
<script type="text/javascript">
//<![CDATA[
	if (typeof initHeader == 'function') {
		initHeader();
	}
//]]>
</script>
    
    <div id="diygptAdSlot-1-all" class="ad ad-slot-1"></div>

</div>
 <h1 class="dim-create-title">Post your Questions</h1><br><br>
       
    <div class="dim-create-step clearfix" id="step2">
        <h2 class="dim-create-step__title" style="margin-left: 15px;"> Add Pictures</h2>
      <!--  <p class="dim-create-step__note" style="margin-left: 25px;">Please note: You may upload photos. The selected option when you click "Submit for Review" will be displayed in your final Your Project submission.</p> -->
        <p class="dim-create-step__file-number-info">You may upload up to 25 Images <i class="fa fa-arrows pull-right" aria-hidden="true" data-toggle="tooltip" data-placement="left" data-original-title="Drag images to reorder."></i></p>
    
        <p class ="dim-create-step__file-size-limit-info js-dim-create-step__file-size-limit-info"></p>
        <div class="dim-create-step__content">
            <div class="dim-upload js-dimc-upload">
                <div class="clearfix">
                    <label class="dim-upload__control js-dimc-upload__control js-diy-check__wrapper dim-upload__control--active">
                            </span>
                        </span>
                        <span class="control-label font-normal">Photos</span>
                    </label>

                    
                </div>

                <div class="js-dimc-upload__photos dimc-upload__photos collapse in">
                    <div class="js-dimc-uploaded-photos collapse in">
                        <div class ="js-dimc-image-container dimc-image-container col-xs-12"></div>
                        <div class="js-dimc-selected-image dimc-selected-image col-xs-12">
                            <img class="dim-upload-panel__img " />
                        </div>
                        <div class="js-dimc-image-description dimc-image-description col-xs-12"></div>
                    </div>
                    <div class="dim-upload-panel js-upload-photos-errors upload-photos-errors col-xs-12 text-danger collapse"></div>
                    <form class="dim-upload-panel dim-upload-panel--buttons js-dimc-upload-photos-form" id="dimc-upload-photos-form" role="form" method="post" enctype="multipart/form-data">
                        <div class="row">
                            <div class="col-xs-12 col-sm-12">
                                <div id="dim-img-loading" class="col-xs-12">
                                    <img src="https://www.doityourself.com/images/misc/loader.gif">
                                </div>
                                <label class="file dim-upload-panel__upload dim-upload-panel__upload--pics">
                                    <span class="btn btn--upload btn-block btn--secondary visible-xs js-dimc-upload-pics-text">Upload Pictures</span>
                                    <span class="hidden-xs js-dimc-upload-pics-text">Upload Pictures</span>
                                    <input class="file__input js-dimc-upload-img" name="image-upload" type="file" multiple accept="image/*" />
                                </label>
                            </div>
                        </div>
                    </form>
                </div>

              
 <script language="JavaScript">
    function showInput() {
        document.getElementById('display').innerHTML = 
                    document.getElementById("user_input").value;
    }
  </script>

<div id="newFields"></div>

  
  <script type="text/javascript">
  $(function() {

    var input = $('<input type="text" />');
    var newFields = $('');

    $('#qty').bind('blur keyup change', function() {
        var n = this.value || 0;
        if (n+1) {
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
	<form class="form" method="post" method="get" action="GoogleAdder.jsp">
            <br><br>
    <label style="padding-left: 50px; padding-right: 90px;"><b>Enter your Question</b></label>
    <input style="width: 600px; height: 55px; resize: auto;"type="text" name="message" id="user_input"  >
    <br><br>
    <label style="padding-left: 50px; padding-right: 98px;"><b>Enter Your EmailID</b></label>
    <input type="email" name="Useremail" id="user_email" style="width: 400px; height: 55px; resize: auto;">
    <br><br>
    <input type="submit" style="margin-left: 500px;" value="Post"><br/>   
        </form>
 
  <p><span id='display'></span></p>


  
 


   <% 
       //out.println(email);
    //Hsession.setAttribute("theEmail", email);  
    String QT="";
    String Ue="";
QT = request.getParameter("message"); 
Ue = request.getParameter("Useremail"); 
String res="";
             Connection co = null;
          //String postemail=(String)session.getAttribute("theEmail");
      // out.println(postemail);
   if(Ue!=null&&QT!=null)
   {
    String query = "insert into adques (question,askeremail) values('"+QT+"','"+Ue+"')";
    
    
   
      //  try {
              Class.forName("com.mysql.jdbc.Driver");
              co = DriverManager.getConnection("jdbc:mysql://localhost:3306/Question","root","utkarsh123");

            Statement st = co.createStatement();

            int rs = st.executeUpdate(query);

            /*st.close();
            co.close();*/
          // out.println("teri ma ka");
   }
           Connection con1 = null;
             Class.forName("com.mysql.jdbc.Driver");
             con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/question","root","utkarsh123");

            Statement stat1 = con1.createStatement();
            ResultSet rs1=null;
            
   try{
      
        rs1 = stat1.executeQuery("select question,askeremail from adques where askeremail='"+Ue+"'");
       /* while (rs1.next()) {
           // String coffeeName = rs1.getString("question");
           // String gete=rs1.getString("askeremail");
               out.println("\n\n\n\n");
           // out.println(coffeeName);
            out.println("\n\n\n\n");
           // out.println(gete);
         
        }*/
    } catch (SQLException e ) {
       e.getMessage();
    } /*finally {
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
          <% while(rs1.next()){ %>
          <li><h4><%= rs1.getString(1) %></h4></li>
          <br><br>
           <% } %>
        </ul>        
    </body>
</html>
