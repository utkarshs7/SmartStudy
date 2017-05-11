<%@page import="java.util.Comparator"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.*"%>
<%//@page  import="minor.pair.java"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.net.URL,java.net.HttpURLConnection,java.net.URLEncoder,java.io.IOException,org.jsoup.Jsoup,org.jsoup.nodes.Document,org.jsoup.nodes.Element,org.jsoup.select.Elements"%>  
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%  
    
      
      int nodes,i,j,cost;
      String pages[]=new String[5];
      pages[4]="https://www.tutorialspoint.com";
      pages[3]="https://stackoverflow.com";
      pages[2]="https://www.w3schools.com";
      pages[1]="https://en.wikipedia.org/wiki";
      pages[0]="http://www.geeksforgeeks.org";
        //Scanner in = new Scanner(System.in);
        //System.out.println("Enter the Number of WebPages \n");
        nodes = 5;
        //PageRank p = new PageRank();
        //System.out.println("Enter the Adjacency Matrix with 1->PATH & 0->NO PATH Between two WebPages: \n");
        //int[][] path=new path[10][10];
        int[][] path={ {0, 1, 0, 0, 0} ,{0,0,0,0,1} ,{1,1,0,1,1},{0,0,1,0,1},{0,0,0,1,0} };
        
        double pagerank[] = new double[10];
    /*    pair<Integer,String>a[]=new pair<Integer,String>[10];
         
        Collections.sort(words, new Comparator<Pair<String, Integer>>() {
    @Override
    public int compare(final Pair<String, Integer> o1, final Pair<String, Integer> o2) {
        // TODO: implement your logic here
    }
});*/
        double InitialPageRank=0.0;
        double OutgoingLinks=0; 
        double DampingFactor = 0.85; 
        double TempPageRank[] = new double[10];
 
        int ExternalNodeNumber=0;
        int InternalNodeNumber=0; 
        int k=1; // For Traversing
        int ITERATION_STEP=1;
 
        InitialPageRank = 1/5.0;
        //System.out.printf(" Total Number of Nodes :"+totalNodes+"\t Initial PageRank  of All Nodes :"+InitialPageRank+"\n");
  
// 0th ITERATION  _ OR _ INITIALIZATION PHASE
        for(k=0;k<nodes;k++)
        {
           pagerank[k]=InitialPageRank;
        }   
   
//System.out.printf("\n Initial PageRank Values , 0th Step \n");
        for(k=0;k<nodes;k++)
        {
           System.out.printf(" Page Rank of "+k+" is :\t"+pagerank[k]+"\n");
        }  
   
        while(ITERATION_STEP<=2) // Iterations
        {
   // Store the PageRank for All Nodes in Temporary Array 
           for(k=0;k<nodes;k++)
           {  
              TempPageRank[k]=pagerank[k];
              pagerank[k]=0;
           }
     
           for(InternalNodeNumber=0;InternalNodeNumber<nodes;InternalNodeNumber++)
           {
              for(ExternalNodeNumber=0;ExternalNodeNumber<nodes;ExternalNodeNumber++)
              {
                 if(path[ExternalNodeNumber][InternalNodeNumber] == 1)
                 { 
                   k=0;
                   OutgoingLinks=0;  // Count the Number of Outgoing Links for each ExternalNodeNumber
                   while(k<nodes)
                   {
                     if(path[ExternalNodeNumber][k]==1)
                     {
                        OutgoingLinks=OutgoingLinks+1; // Counter for Outgoing Links
                     }  
                     k=k+1;  
                   } 
         // Calculate PageRank     
                   pagerank[InternalNodeNumber]+=TempPageRank[ExternalNodeNumber]*(1.0/OutgoingLinks);    
                  }
               }  
           }    
      
           System.out.printf("\n After "+ITERATION_STEP+"th Step \n");
   
           for(k=0;k<nodes;k++) 
           System.out.printf(" Page Rank of "+k+" is :\t"+pagerank[k]+"\n"); 
   
           ITERATION_STEP = ITERATION_STEP+1;
        }
 
// Add the Damping Factor to PageRank
        for(k=0;k<nodes;k++)
        {
          pagerank[k]=(1-DampingFactor)+ DampingFactor*pagerank[k]; 
        } 
   
// Display PageRank
        System.out.printf("\n Final Page Rank : \n"); 
        for(k=0;k<nodes;k++)
        {
          System.out.printf(" Page Rank of "+k+" is :\t"+pagerank[k]+"\n"); 
        }
   
  
        double h=-2.0;
        int pos=-1;
        for(i=0;i<nodes;++i)
        {
            if(h<pagerank[i])
            {
                pos=i;
            }
        }
        
        
        
        
        
        
        
        
        
     System.out.println(pages[pos]+" "+pagerank[pos]);
    String search=(String)request.getParameter("psearch");
    search=search.toLowerCase();
    System.out.println(search+"!@$%%^###@");
    URL url4=new URL(pages[pos]+"/"+search);
    HttpURLConnection connection4 = (HttpURLConnection)url4.openConnection();
    connection4.setRequestMethod("GET");
    connection4.connect();
    int code4 = connection4.getResponseCode();
    
    
   
    
    
    
    
    
    
    
    
    //System.out.println(code0+" "+code1+" "+code2+" "+code3+" "+code4+"!@@#$##@%%$%#$%#%#$%#");
    System.out.println(code4+"!@#$%");
    if(code4!=301 && code4!=200)
    {
        URL url3=new URL(pages[3]+"/"+search);
        HttpURLConnection connection3 = (HttpURLConnection)url3.openConnection();
        connection3.setRequestMethod("GET");
        connection3.connect();
        int code3 = connection3.getResponseCode();
         System.out.println(code3+"!@#$%");
        if(code3==301 || code3==200)
        {
           Document doc = Jsoup.connect(pages[3]+"/"+search).get();  
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
                
    <%}
    else
    {
       URL url2=new URL(pages[2]+"/"+search);
    HttpURLConnection connection2 = (HttpURLConnection)url2.openConnection();
    connection2.setRequestMethod("GET");
    connection2.connect();
    int code2 = connection2.getResponseCode();
 System.out.println(code2+"!@#$%");
    if(code2==301 || code2==200) 
    {
     
         Document doc = Jsoup.connect(pages[2]+"/"+search).get();  
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
  <%  }
else
{
   URL url1=new URL(pages[1]+"/"+search);
    HttpURLConnection connection1 = (HttpURLConnection)url1.openConnection();
    connection1.setRequestMethod("GET");
    connection1.connect();
    int code1 = connection1.getResponseCode();
 System.out.println(code1+"!@#$%");
    if(code1==200 || code1==301)
{
    Document doc = Jsoup.connect(pages[1]+"/"+search).get();  
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
<%}
else
{
    URL url0=new URL(pages[0]+"/"+search);
    HttpURLConnection connection0 = (HttpURLConnection)url0.openConnection();
    connection0.setRequestMethod("GET");
    connection0.connect();
    int code0 = connection0.getResponseCode(); 
     System.out.println(code0+"!@#$%");

    if(code0==301 || code0==200)
{
     Document doc = Jsoup.connect(pages[0]+"/"+search).get();  
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
<%}
 else
{
out.println("page not found!!!!!!");
}
}
}
    }
    
    
    
    }
    else
    {
    Document doc = Jsoup.connect(pages[pos]+"/"+search).get();  
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
     <%}%>              
                
                 