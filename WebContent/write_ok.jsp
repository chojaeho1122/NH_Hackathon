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
    	pstmt=conn.prepareStatement("INSERT INTO PRODUCT VALUE('0','" + pname + "','" + category + "','" + weight + "','" + price + "','" + due + "','" + pdate + "','" + image + "','" + contents + "','" + farmer_id + "','0','0')");
    	pstmt.executeUpdate();
        
        
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
