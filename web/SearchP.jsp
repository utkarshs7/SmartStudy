<%-- 
    Document   : SearchP
    Created on : 3 May, 2017, 3:16:55 AM
    Author     : Utkarsh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="java.io.*" %>
<%@page import="com.snowtide.PDF" %>
<%@page import="com.snowtide.pdf.Document" %>
<%@page import="com.snowtide.pdf.OutputTarget" %>
<%@page import="org.apache.tika.exception.TikaException" %>
<%@page import="org.apache.tika.metadata.Metadata" %>
<%@page import="org.apache.tika.parser.ParseContext" %>
<%@page import="org.apache.tika.parser.pdf.PDFParser" %>
<%@page import="org.apache.tika.sax.BodyContentHandler" %>
<%@page import="org.xml.sax.SAXException" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">
    <head>
        <title>Smart Study | View Other</title>
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
            #same{
                float: left;
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
       <div class="wrapper row3">
    <%!
         class KnuthMorrisPrattMatcher {
    public static final int NOT_FOUND_INDEX = -1;
        /**
         * This static method implements the 
         * <a href="https://en.wikipedia.org/wiki/Knuth%E2%80%93Morris%E2%80%93Pratt_algorithm">
         * Knuth-Morris-Pratt</a> pattern matching algorithm that runs in time
         * {@code O(n + m)}, where {@code n} is the length of the text to search
         * and {@code m} is the length of the pattern to search.
         * 
         * @param text       the text to search in.
         * @param pattern    the pattern to search for.
         * @param startIndex the character index from which to start matching.
         * @return the smallest index no less than {@code startIndex} of the
         *         position where the pattern occurs if there is a match, or
         *         {@code NOT_FOUND_INDEX} if there is no match.
         */
        public int match(String text, String pattern, int startIndex) {
            if (pattern.isEmpty()) {
                return 0;
            }

            int n = text.length();
            int m = pattern.length();

            if (m > n) {
                return -1;
            }

            int[] prefixFunction = computePrefixFunction(pattern);
            int q = 0;

            for (int i = Math.max(0, startIndex); i < n; ++i) {
                while (q > 0 && pattern.charAt(q) != text.charAt(i)) {
                    q = prefixFunction[q - 1];
                }

                if (pattern.charAt(q) == text.charAt(i)) {
                    ++q;
                }

                if (q == m) {
                    return i - m + 1;
                }
            }

            return NOT_FOUND_INDEX;
        }

        public int match(String text, String pattern) {
            return match(text, pattern, 0);
        }

        private int[] computePrefixFunction(String pattern) {
            int m = pattern.length();
            int[] prefixFunction = new int[m];
            int k = 0;

            for (int q = 1; q < m; ++q) {
                while (k > 0 && pattern.charAt(k) != pattern.charAt(q)) {
                    k = prefixFunction[k - 1];
                }

                if (pattern.charAt(k) == pattern.charAt(q)) {
                    ++k;
                }

                prefixFunction[q] = k;
            }

            return prefixFunction;
        }
    }
         %>
<%
      String word=request.getParameter("word");
      StringBuilder texts;  
      String y=request.getParameter("PDF");
      String x="C:/Users/ashish/Documents/NetBeansProjects/TestSite/web/"+y;
      
    Document pdf = PDF.open(x);
    texts = new StringBuilder(100000000);
    pdf.pipe(new OutputTarget(texts));
    pdf.close();
    //System.out.println(texts);
    int pos=-1;
    KnuthMorrisPrattMatcher obj=new KnuthMorrisPrattMatcher();
    texts.toString().trim();
    pos=obj.match(texts.toString(),word);
    //    assertEquals(0,  KnuthMorrisPrattMatcher.match("aaaa", "aaaa"));
     //   assertEquals(-1, KnuthMorrisPrattMatcher.match("aaaa", "bb"));
      //  assertEquals(1,  KnuthMorrisPrattMatcher.match("abbb", "bb"));
      //  assertEquals(2,  KnuthMorrisPrattMatcher.match("abcc", "cc"));
  //    FileInputStream inputstream = new FileInputStream(new File(x));
    //  ParseContext pcontext = new ParseContext();
      
      //parsing the document using PDF parser
    //  PDFParser pdfparser = new PDFParser(); 
    //  pdfparser.parse(inputstream, handler, metadata,pcontext);
      
      //getting the content of the document
      %>
      <br><br><br>
<!DOCTYPE html>
<form action="SearchReflect?PDF=<%=y%>&email=<%=email%>&pos=<%=pos%>" method="post">
            <label style="margin-left: 100px; color: #003333;">Find: </label>
            <input style="margin-left: 150px;" type="text" name="word1">
            <input type="hidden" name="PDF" value=<%=y%>>
            <input type="hidden" name="email" value=<%=email%>>
            <input type="hidden" name="pos" value=<%=pos%>>
           <input type="submit" value="Search">
        </form>
            <br><br>
      <%
          if(word!=null)
          {
      %>
       <a href="imm.jsp" target="_blank"> <embed src= "<% out.print(y); %>" style="margin-left: 905px; height: 300px; padding: 4px; width: 500px; border: 3px solid #003333;"/> </a>
       <%
          String posy="";
          if(pos==-1)
              posy="No.";
          else if(pos<300&&pos!=-1)
              posy="At top of page 1.";
          else if(pos>300&&pos<900)
            posy="At around middle of page 1.";
           else if(pos>900)
            posy="At end of page 1.";
         if(!word.equals("at"))
         {
        %>
        <h5 style="margin-left: 100px; color: #003333; font-size: 120%;">Found : <%=posy%></h5>
        <%
            }
            }
            %>
            <br><br>
       </div>
       <div class="wrapper row4">
  <footer id="footer" class="clear">
    <p class="fl_left">Copyright & copy; 2017 - All Rights Reserved - <a href="#">Domain Name</a></p>
   <!-- <p class="fl_right">Template by <a href="http://www.os-templates.com/" title="Free Website Templates">OS Templates</a></p> -->
  </footer>
</body>
</html>
