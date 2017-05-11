package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;
import java.io.*;
import com.snowtide.PDF;
import com.snowtide.pdf.Document;
import com.snowtide.pdf.OutputTarget;
import org.apache.tika.exception.TikaException;
import org.apache.tika.metadata.Metadata;
import org.apache.tika.parser.ParseContext;
import org.apache.tika.parser.pdf.PDFParser;
import org.apache.tika.sax.BodyContentHandler;
import org.xml.sax.SAXException;

public final class SearchP_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {


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
         
  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\" dir=\"ltr\">\n");
      out.write("    <head>\n");
      out.write("        <title>Smart Study | View Other</title>\n");
      out.write("        <meta charset=\"iso-8859-1\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("        <link href=\"layout.css\" rel=\"stylesheet\">\n");
      out.write("        <link href=\"mediaqueries.css\" rel=\"stylesheet\">\n");
      out.write("        <!--<link rel=\"stylesheet\" href=\"styles/layout.css\" type=\"text/css\" media=\"all\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"styles/mediaqueries.css\" type=\"text/css\" media=\"all\"> -->\n");
      out.write("        <script src=\"scripts/jquery.1.9.0.min.js\"></script>\n");
      out.write("        <script src=\"scripts/jquery-mobilemenu.min.js\"></script>\n");
      out.write("        <!--[if lt IE 9]>\n");
      out.write("        <link rel=\"stylesheet\" href=\"styles/ie.css\" type=\"text/css\" media=\"all\">\n");
      out.write("        <script src=\"scripts/ie/css3-mediaqueries.min.js\"></script>\n");
      out.write("        <script src=\"scripts/ie/ie9.js\"></script>\n");
      out.write("        <script src=\"scripts/ie/html5shiv.min.js\"></script>\n");
      out.write("        <![endif]-->\n");
      out.write("        <!-- BEFORE USING THIS FRAMEWORK REMOVE THIS DEMO STYLING - ONLY USED TO EMPHASISE THE DIV CONTAINERS IN THE CONTENT AREA -->\n");
      out.write("        <!--<style type=\"text/css\">\n");
      out.write("        div.full_width{margin-top:20px;}\n");
      out.write("        div.full_width:first-child{margin-top:0;}\n");
      out.write("        div.full_width div{color:#666666; background-color:#DEDEDE;}\n");
      out.write("        </style> -->\n");
      out.write("        <!-- END DEMO STYLING -->\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <style>\n");
      out.write("\n");
      out.write("            .uploader {\n");
      out.write("                position:relative; \n");
      out.write("                overflow:hidden; \n");
      out.write("                width:300px; \n");
      out.write("                height:350px;\n");
      out.write("                background:#f3f3f3; \n");
      out.write("                border:2px dashed #e8e8e8;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            #filePhoto{\n");
      out.write("                position:absolute;\n");
      out.write("                width:300px;\n");
      out.write("                height:400px;\n");
      out.write("                top:-50px;\n");
      out.write("                left:0;\n");
      out.write("                z-index:2;\n");
      out.write("                opacity:0;\n");
      out.write("                cursor:pointer;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .uploader img{\n");
      out.write("                position:absolute;\n");
      out.write("                width:302px;\n");
      out.write("                height:352px;\n");
      out.write("                top:-1px;\n");
      out.write("                left:-1px;\n");
      out.write("                z-index:1;\n");
      out.write("                border:none;\n");
      out.write("            }\n");
      out.write("            #same{\n");
      out.write("                float: left;\n");
      out.write("            }\n");
      out.write("        </style>\n");
      out.write("        ");

            String email = request.getParameter("email");
            String redirect = "QuestionAdder";
            String redirect1 = "CardboxJ.jsp?email="+email;
            String redirect2 = "AskedToAnswerJ.jsp?email=" + email;
            String redirect3 = "NormalAdderJ.jsp?email=" + email;
            String redirect4 = "MyQuestionJ.jsp?email=" + email;
        
      out.write("\n");
      out.write("    </style>\n");
      out.write("    <div class=\"wrapper row1\">\n");
      out.write("        <header id=\"header\" class=\"clear\">\n");
      out.write("            <div id=\"hgroup\">\n");
      out.write("                <h1><a href=\"#\">Smart Study</a></h1>\n");
      out.write("                <h2>Free Question, Answer Network</h2>\n");
      out.write("            </div>\n");
      out.write("        </header>\n");
      out.write("    </div>\n");
      out.write("    <!-- ################################################################################################ -->\n");
      out.write("    <div class=\"wrapper row2\">\n");
      out.write("        <nav id=\"topnav\">\n");
      out.write("            <ul class=\"clear\">\n");
      out.write("                <li class=\"active first\"><a href=");
      out.print(redirect3);
      out.write(">Homepage</a></li>\n");
      out.write("                <li><a class=\"drop\" href=\"#\">Drop 1</a>\n");
      out.write("                    <ul>\n");
      out.write("                        <li><a href=\"#\">Level 2</a></li>\n");
      out.write("                        <li><a href=\"#\">Level 2</a></li>\n");
      out.write("                        <li><a class=\"drop\" href=\"#\">Level 2 + Drop</a>\n");
      out.write("                            <ul>\n");
      out.write("                                <li><a href=\"#\">Level 3</a></li>\n");
      out.write("                                <li><a class=\"drop\" href=\"#\">Level 3 + Drop</a>\n");
      out.write("                                    <ul>\n");
      out.write("                                        <li><a href=\"#\">Level 4</a></li>\n");
      out.write("                                        <li><a href=\"#\">Level 4</a></li>\n");
      out.write("                                    </ul>\n");
      out.write("                                </li>\n");
      out.write("                                <li><a href=\"#\">Level 3</a></li>\n");
      out.write("                            </ul>\n");
      out.write("                        </li>\n");
      out.write("                    </ul>\n");
      out.write("                </li>\n");
      out.write("                <li><a href=");
      out.print(redirect1);
      out.write(" >Cardbox</a></li>\n");
      out.write("                <li><a href=");
      out.print(redirect4);
      out.write(" >My Questions</a></li>\n");
      out.write("                <li><a href=");
      out.print(redirect2);
      out.write(" >Asked To Answer</a></li>\n");
      out.write("                <li><a href=\"Invalidate\">Logout</a></li>\n");
      out.write("                <li><a href=\"#\">A Long Link Text Here</a></li>\n");
      out.write("                <li class=\"last-child\"><a class=\"drop\" href=\"#\">Drop 2</a>\n");
      out.write("                    <ul>\n");
      out.write("                        <li><a href=\"#\">Level 2</a></li>\n");
      out.write("                        <li><a href=\"#\">Level 2</a></li>\n");
      out.write("                        <li><a class=\"drop\" href=\"#\">Level 2 + Drop</a>\n");
      out.write("                            <ul class=\"negative\">\n");
      out.write("                                <li><a href=\"#\">Level 3</a></li>\n");
      out.write("                                <li><a href=\"#\">Level 3</a></li>\n");
      out.write("                                <li><a href=\"#\">Level 3</a></li>\n");
      out.write("                            </ul>\n");
      out.write("                        </li>\n");
      out.write("                    </ul>\n");
      out.write("                </li>\n");
      out.write("            </ul>\n");
      out.write("        </nav>\n");
      out.write("    </div>\n");
      out.write("       <div class=\"wrapper row3\">\n");
      out.write("    ");
      out.write('\n');

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
    if(word==null)
    {
    KnuthMorrisPrattMatcher obj=new KnuthMorrisPrattMatcher();
    texts.toString().trim();
    pos=obj.match(texts.toString(),word);
    }
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
      
      out.write("\n");
      out.write("      <br><br><br>\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<form action=\"SearchReflect?PDF=");
      out.print(y);
      out.write("&email=");
      out.print(email);
      out.write("&pos=");
      out.print(pos);
      out.write("\" method=\"post\">\n");
      out.write("            <label style=\"margin-left: 100px; color: #003333;\">Find: </label>\n");
      out.write("            <input style=\"margin-left: 150px;\" type=\"text\" name=\"word1\">\n");
      out.write("            <input type=\"hidden\" name=\"PDF\" value=");
      out.print(y);
      out.write(">\n");
      out.write("            <input type=\"hidden\" name=\"email\" value=");
      out.print(email);
      out.write(">\n");
      out.write("            <input type=\"hidden\" name=\"pos\" value=");
      out.print(pos);
      out.write(">\n");
      out.write("           <input type=\"submit\" value=\"Search\">\n");
      out.write("        </form>\n");
      out.write("            <br><br>\n");
      out.write("      ");

          if(word!=null)
          {
      
      out.write("\n");
      out.write("       <a href=\"imm.jsp\" target=\"_blank\"> <embed src= \"");
 out.print(y); 
      out.write("\" style=\"margin-left: 905px; height: 300px; padding: 4px; width: 500px; border: 3px solid #003333;\"/> </a>\n");
      out.write("       ");

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
        
      out.write("\n");
      out.write("        <h5 style=\"margin-left: 100px; color: #003333; font-size: 120%;\">Found : ");
      out.print(posy);
      out.write("</h5>\n");
      out.write("        ");

            }
            }
            
      out.write("\n");
      out.write("            <br><br>\n");
      out.write("       </div>\n");
      out.write("       <div class=\"wrapper row4\">\n");
      out.write("  <footer id=\"footer\" class=\"clear\">\n");
      out.write("    <p class=\"fl_left\">Copyright & copy; 2017 - All Rights Reserved - <a href=\"#\">Domain Name</a></p>\n");
      out.write("   <!-- <p class=\"fl_right\">Template by <a href=\"http://www.os-templates.com/\" title=\"Free Website Templates\">OS Templates</a></p> -->\n");
      out.write("  </footer>\n");
      out.write("</body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
