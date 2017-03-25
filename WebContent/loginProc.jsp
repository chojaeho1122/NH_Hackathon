<%@ page contentType = "text/html; charset=utf-8" %>
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
        PreparedStatement pstmt2=null;
        
        ResultSet rs=null;
        ResultSet rs2=null;
        
         // sql 구사
         // 전 페이지인 LOGIN.jsp input에 입력한 값들을 변수에 담는다
        String id= request.getParameter("id");
        String pwd= request.getParameter("pwd");
        
        // 내가 입려한 id와 pw 값이 DB안에 있는지 확인한다
        Class.forName("org.gjt.mm.mysql.Driver");
        conn=DriverManager.getConnection(URL,USER,PASS);
        
        // isLogin 은 로그인 확인 유무를 위한 변수
        boolean isLogin = false;
        while(rs.next()) {
            // rs.next가 true 라면 = 정보가 있다
            isLogin = true;
        }
        /*나중에 pwd encrypt하기 */ 
        pstmt=conn.prepareStatement("SELECT * FROM USER WHERE ID='" + id + "' AND PWD='" + pwd + "'");
        rs = pstmt.executeQuery();
        /*농부확인*/
        pstmt2=conn.prepareStatement("SELECT * FROM FARMER WHERE ID='" + id + "' AND PWD='" + pwd + "'");
        rs2 = pstmt2.executeQuery();
        if(rs.next()){
           String role = "user";
           session.setAttribute("s_id",id);
            session.setAttribute("role", role);
            response.sendRedirect("main.jsp");     
        }else if(rs2.next()){ //농부 id있을때 
           String role = "farmer";
            session.setAttribute("s_id", id);
            session.setAttribute("role",role); 
            response.sendRedirect("main.jsp");
        }else //둘다없을때 
        {
            %> <script> alert("로그인 실패: 없는 아이디 혹은 패스워드 오류"); history.go(-1); </script> <%   
        } 
        
    }
    catch (Exception e) {       
       out.print(e.getMessage());
    }
%>
