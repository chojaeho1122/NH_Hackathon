<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
        
		// sql ����
         // �� �������� write.jsp input�� �Է��� ������ ������ ��´�
         String pname= request.getParameter("pname");
         String category= request.getParameter("category");
         String weight= request.getParameter("weight");
         String price= request.getParameter("price");
         String due= request.getParameter("due");
         String pdate= new java.text.SimpleDateFormat("yyyyMMddHHmmss").format(new java.util.Date() );
         String image= request.getParameter("image");
         String contents= request.getParameter("contents");
         String farmer_id=(String)session.getAttribute("s_id");
        
         
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
    	pstmt.setString(7, image);
    	pstmt.setString(8, contents);
    	pstmt.setString(9, farmer_id);
    	pstmt.executeUpdate();
    	
    	String path = application.getRealPath("/images/product");
    	MultipartRequest mr = new MultipartRequest( request, path, 1024*1024*5, "utf-8", new DefaultFileRenamePolicy());
    	File s_file = mr.getFile( "image");
    	String o_name = mr.getOriginalFileName( "s_file");

    	
    	pstmt.close();
    	conn.close();
    }
catch(SQLException e)
{
	out.print(e.getMessage());
}
    %>
<script language=javascript>
   self.window.alert("���ε� ����");
   location.href="main.jsp"; 

</script>
