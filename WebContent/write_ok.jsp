<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest,java.util.*,java.io.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.*" %>
<%
    try {
        // ����̹� �ε�
        //String driver = "oracle.jdbc.driver.OracleDriver";
        //Class.forName(driver);
        Class.forName("org.gjt.mm.mysql.Driver");
        
        // ������ Login
        String URL = "jdbc:mysql://localhost/hakathon";
		String USER =  "root";
		String PASS="hakathon";

		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String realFolder = ""; //���ϰ�θ� �˾ƺ������� �ӽú����� �ϳ� �����,
		String saveFolder = "upload"; //�������� �������� ������ �ڿ�...
		String encType = "utf-8"; //���ڵ���ĵ� �Բ� ������ ��,
		int maxSize = 10*1024*1024; //���� �ִ�뷮(���� 10�ް�)
		ServletContext context = getServletContext();
		realFolder = context.getRealPath(saveFolder);//������ ������ ���

         // �� �������� write.jsp input�� �Է��� ������ ������ ��´�
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
         String now = pdate;  //����ð�

         int i = -1;
         i = fileName.lastIndexOf("."); // ���� Ȯ���� ��ġ
         String realFileName = now + fileName.substring(i, fileName.length());  //����ð��� Ȯ���� ��ġ��
   
   		 File oldFile = new File(saveFolder + fileName);
   		 File newFile = new File(saveFolder + realFileName); 
   
   		 oldFile.renameTo(newFile); // ���ϸ� ����
        }*/
   
         //while(files.hasMoreElements()){
   	      String name = (String)files.nextElement();//�Ķ�����̸��� �����µ�
   	      String filename = multi.getFilesystemName(name);//�̸��� �̿��� ����� �����̸��� �����´�.
          out.println("����� ���� �̸� : " + filename +"<br>");
   	      out.println("����� ���� ��� : " + realFolder +"<br>");
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

   self.window.alert("���ε� ����");
   location.href="main.jsp"; 

</script> -->