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
      PreparedStatement pstmt3 = null;
      
      ResultSet rs=null;

      ResultSet rs2=null;
      ResultSet rs3=null;
       
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
            %> <script> alert("회원가입 실패: 비밀번호가 일치하지 않습니다"); history.go(-1); </script> <%     
         }
        else{
           // 내가 입려한 id와 pw 값이 DB안에 있는지 확인한다
          Class.forName("org.gjt.mm.mysql.Driver");
          conn=DriverManager.getConnection(URL,USER,PASS);
          
          if(whoareyou.equals("farmer")){
             pstmt =conn.prepareStatement("Select * from farmer where id='"+id+"'");
             rs = pstmt.executeQuery(); 
             if(rs.next())
             {
                 %> <script> alert("회원가입 실패: 이미 존재하는 아이디입니다"); history.go(-1); </script> <%   
             }
             else{
                pstmt3 = conn.prepareStatement("Select * from user where id='"+id+"'");
                rs3 = pstmt3.executeQuery();
                if(rs3.next()){
                      %> <script> alert("회원가입 실패: 이미 존재하는 아이디입니다"); history.go(-1); </script> <%   
                }else{
                   pstmt2 = conn.prepareStatement("insert into farmer values(?,?,?,?,?,?,?,?)");
                   pstmt2.setString(1,"0");
                   pstmt2.setString(2,id);
                    pstmt2.setString(3,pwd);
                    pstmt2.setString(4,email);
                    pstmt2.setString(5,address);
                    pstmt2.setString(6,"profile");
                    pstmt2.setString(7,"0");  
                    pstmt2.setString(8,account);  
                    
                    //    response.sendRedirect("signUpSuccess.jsp");
                   pstmt2.executeUpdate();
                   pstmt2.close();
                   response.sendRedirect("login.jsp");    
                }
                pstmt3.close();
             }

             pstmt.close(); 
             conn.close();
          }else if(whoareyou.equals("customer")){
             pstmt =conn.prepareStatement("Select * from user where id='"+id+"'");
             rs = pstmt.executeQuery();
             if(rs.next())
             {
                    %> <script> alert("회원가입 실패: 이미 존재하는 아이디입니다"); history.go(-1); </script> <%   
             }
             else{
                pstmt3 = conn.prepareStatement("Select * from farmer where id='"+id+"'");
                rs3 = pstmt3.executeQuery();
                if(rs3.next())
                {
                      %> <script> alert("회원가입 실패: 이미 존재하는 아이디입니다"); history.go(-1); </script> <%   
                }else{
                   pstmt2 = conn.prepareStatement("insert into user values(?,?,?,?,?,?,?,?,?)");
                   pstmt2.setString(1,"0");
                   pstmt2.setString(2,id);
                    pstmt2.setString(3,pwd);
                    pstmt2.setString(4,email);
                    pstmt2.setString(5,address);
                    pstmt2.setString(6,"profile");
                    pstmt2.setString(7,"0"); 
                    pstmt2.setString(8,"bank");
                    pstmt2.setString(9,account); 
                    
                      pstmt2.executeUpdate();
                      pstmt2.close();
                      response.sendRedirect("login.jsp"); 
                }
                pstmt3.close();
             }  
             pstmt.close(); 
             conn.close();
          } 
        } 
    } catch (Exception e) {       
       out.print(e.getMessage());
    }
 %>
