<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
        
		// sql 구사
         // 전 페이지인 write.jsp input에 입력한 값들을 변수에 담는다
         String pname= request.getParameter("pname");
         String category= request.getParameter("category");
         String weight= request.getParameter("weight");
         String price= request.getParameter("price");
         String due= request.getParameter("due");
         String pdate= (new SimpleDateFormat("yyyyMMddHHmmss")).format( new Date() );
         String image= request.getParameter("image");
         String contents= request.getParameter("contents");
         String farmer_id=(String)session.getAttribute("s_id");
        
        // insert
        Class.forName("org.gjt.mm.mysql.Driver");
    	conn=DriverManager.getConnection(URL,USER,PASS);
    	pstmt=conn.prepareStatement("INSERT INTO PRODUCT VALUE('0','" + pname + "','" + category + "','" + weight + "','" + price + "','" + due + "','" + pdate + "','" + image + "','" + contents + "','" + farmer_id + "','0','0')");
    	rs = pstmt.executeQuery();
        
       
        } else {
            // DB에 내가적은 정보가 없다면 경고창을 띄워준다
            %> <script> alert("업로드 실패"); history.go(-1); </script> <%            
        }
        
        
    }
catch(SQLException e)
{
	out.print(e.getMessage());
}
finally{
	if(rs!=null)try{rs.close();}catch(SQLException ex){}
	if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
	if(conn!=null)try{conn.close();}catch(SQLException ex){}
}
    %>
<script language=javascript>
   self.window.alert("업로드 성공");
   location.href="main.jsp"; 

</script>
