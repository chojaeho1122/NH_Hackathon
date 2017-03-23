<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest,java.util.*,java.io.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.*" %>
<%
    try {
        // 드라이버 로딩
        //String driver = "oracle.jdbc.driver.OracleDriver";
        //Class.forName(driver);
        Class.forName("org.gjt.mm.mysql.Driver");
        
        // 관리자 Login
        String URL = "jdbc:mysql://localhost/hakathon";
		String USER =  "root";
		String PASS="hakathon";

		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String realFolder = ""; //파일경로를 알아보기위한 임시변수를 하나 만들고,
		String saveFolder = "upload"; //파일저장 폴더명을 설정한 뒤에...
		String encType = "utf-8"; //인코딩방식도 함께 설정한 뒤,
		int maxSize = 10*1024*1024; //파일 최대용량(현재 10메가)
		ServletContext context = getServletContext();
		realFolder = context.getRealPath(saveFolder);//서버에 저장한 경로

         // 전 페이지인 write.jsp input에 입력한 값들을 변수에 담는다
        MultipartRequest multi = new MultipartRequest( request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
          
 		Enumeration files = multi.getFileNames();
 		

         String pname= multi.getParameter("pname");
         String category= multi.getParameter("category");
         String weight= multi.getParameter("weight");
         String price= multi.getParameter("price"); 
         String due= multi.getParameter("due");
         String pdate= new java.text.SimpleDateFormat("yyyyMMddHHmmss").format(new java.util.Date() );
         String image= multi.getParameter("image");
         String contents= multi.getParameter("contents");
         String farmer_id=(String)session.getAttribute("s_id");
         //String filename = farmer_id+pdate;
         
        /*while(files.hasMoreElements()){
   	      String name = (String)files.nextElement();
         String fileName = multi.getFilesystemName(name);
         String now = pdate;  //현재시간

         int i = -1;
         i = fileName.lastIndexOf("."); // 파일 확장자 위치
         String realFileName = now + fileName.substring(i, fileName.length());  //현재시간과 확장자 합치기
   
   		 File oldFile = new File(saveFolder + fileName);
   		 File newFile = new File(saveFolder + realFileName); 
   
   		 oldFile.renameTo(newFile); // 파일명 변경
        }*/
   
         //while(files.hasMoreElements()){
   	      String name = (String)files.nextElement();//파라메터이름을 가져온뒤
   	      String filename = multi.getFilesystemName(name);//이름을 이용해 저장된 파일이름을 가져온다.
          out.println("저장된 파일 이름 : " + filename +"<br>");
   	      out.println("저장된 파일 경로 : " + realFolder +"<br>");
         //}
         
        // insert
        Class.forName("org.gjt.mm.mysql.Driver");
    	conn=DriverManager.getConnection(URL,USER,PASS);
    	pstmt=conn.prepareStatement("INSERT INTO PRODUCT VALUE('0',?,?,?,?,?,?,?,?,?,'0','0')");
    	//pstmt=conn.prepareStatement("INSERT INTO PRODUCT VALUE('0','" + pname + "','" + category + "','" + weight + "','" + price + "','1','" + pdate + "','" + image + "','" + contents + "','" + farmer_id + "','0','0')");
        
    	pstmt.setString(1, pname);
    	pstmt.setString(2, category);
    	pstmt.setString(3, weight);
    	pstmt.setString(4, price);
    	pstmt.setString(5, due);
    	pstmt.setString(6, pdate);
    	pstmt.setString(7, filename);
    	pstmt.setString(8, contents);
    	pstmt.setString(9, farmer_id);
    	pstmt.executeUpdate();
    	
    	pstmt.close();
    	conn.close();
    }
catch(SQLException e)
{
	out.print(e.getMessage());
}
    %>
<!-- <script language=javascript>

   self.window.alert("업로드 성공");
   location.href="main.jsp"; 

</script> -->