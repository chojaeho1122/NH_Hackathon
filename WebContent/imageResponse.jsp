<%@ page contentType = "text/html; charset=utf-8" %>
<%@ page import = "java.sql.*,java.io.*,java.util.zip.*" %>
<%
String URL = "jdbc:mysql://localhost/hakathon";
String USER =  "root";
String PASS="hakathon";

Connection conn=null;
PreparedStatement pstmt = null;
ResultSet rs=null;

%>
<!DOCTYPE html>
  <head>
    

</head>
<body>

   
<%!  
  void sendImage( HttpServletResponse response , byte[] imgContentsArray ) {       
    ServletOutputStream  svrOut = null ;   BufferedOutputStream outStream = null ;
     try {                  
         svrOut = response.getOutputStream(); 
         outStream =  new BufferedOutputStream( svrOut );                   
         outStream.write(  imgContentsArray, 0, imgContentsArray.length );     
         outStream.flush();                      
       } catch( Exception writeException ) {
         writeException.printStackTrace();
       } finally {
          try {            
             if ( outStream != null ) outStream.close(); 
           } catch( Exception closeException ) {
            closeException.printStackTrace();
           }   
       }
  }
  byte[] readImage() throws Exception
  {   
    String filePath = "C:/Users/chojaeho1122/Desktop/default_user_image.png" ;     int BUF_SIZE  ;    byte[] buf = null ;   
    DataInputStream in =  null ;
    try {         
    File imgFile= new File(filePath) ;
    BUF_SIZE = (int)imgFile.length() ;   
    buf = new byte[BUF_SIZE] ;  
    in = new DataInputStream(new FileInputStream(imgFile));      
    in.readFully(buf);       
    } finally {
      in.close();
    }
    return   buf;
  }
 
%>
<% 
 
  try {    
      
     sendImage( response ,  readImage() ) ;
    
   } catch ( Exception e )  {
      e.printStackTrace();
   }
  
%>
                
         
</body>

</html>
