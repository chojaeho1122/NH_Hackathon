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
      PreparedStatement pstmt1=null;
      PreparedStatement pstmt2=null;
      ResultSet rs1=null;
      ResultSet rs2=null;
      

      PreparedStatement pstmt=null; 
      ResultSet rs=null;
      
        
      // sql 구사
         // 전 페이지인 LOGIN.jsp input에 입력한 값들을 변수에 담는다
         String id= request.getParameter("user_id");
         String pwd= request.getParameter("password");
         String pwdchk= request.getParameter("passwordCheck");
         String email= request.getParameter("user_email"); 
         String address= request.getParameter("address");
         String whoareyou= request.getParameter("chk_info");
         String account= request.getParameter("account");
         /*pwdFail.jsp, signUpFail.jsp*/
         if(!pwd.equals(pwdchk)){
            response.sendRedirect("pwdFail.jsp");
         }else{
        // 내가 입려한 id와 pw 값이 DB안에 있는지 확인한다
        Class.forName("org.gjt.mm.mysql.Driver");
       conn=DriverManager.getConnection(URL,USER,PASS);
    
       //수정해야댐 
       pstmt1=conn.prepareStatement("SELECT * FROM USER WHERE ID='" + id +"' " );
       rs1 = pstmt1.executeQuery(); 
       pstmt2=conn.prepareStatement("SELECT * FROM FARMER WHERE ID='" + id +"' " );
       rs2 = pstmt1.executeQuery();
       if(rs1.next())
       {
          response.sendRedirect("signUpFail.jsp");
       }
       else if(rs2.next())
       {
          response.sendRedirect("signUpFail.jsp"); //id 존재 
       }else{
          /* 2개 if문 DB안에 ID가 존재하는지 확인*/ 
          if(whoareyou.equals("farmer")){
             pstmt = conn.prepareStatement("INSERT INTO FAMER VALUES(?,?,?,?,?,?,?)");
             pstmt.setString(1,id);
             pstmt.setString(2,pwd);
             pstmt.setString(3,email);
             pstmt.setString(4,address);
             pstmt.setString(5,"profile");
             pstmt.setString(6,"coin"); 
             pstmt.setString(7,account); 
             response.sendRedirect("signUpSuccess.jsp");
          }
          else if(whoareyou.equals("customer")){
             pstmt = conn.prepareStatement("INSERT INTO USER VALUES(?,?,?,?,?,?,?,?)");
             pstmt.setString(1,id);
             pstmt.setString(2,pwd);
             pstmt.setString(3,email);
             pstmt.setString(4,address);
             pstmt.setString(5,"profile");
             pstmt.setString(6,"coin"); 
             pstmt.setString(7,"123"); 
             pstmt.setString(8,account); 
             response.sendRedirect("signUpSuccess.jsp");
          }
       }
        // DB에 내가 적은 정보가 있다면
        } 
    } catch (Exception e) {       
       out.print(e.getMessage());
    }
 %>

