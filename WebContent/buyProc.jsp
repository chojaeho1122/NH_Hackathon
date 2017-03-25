<%@ page contentType = "text/html; charset=utf-8" %>
<%@ page import = "java.sql.*" %>
<%@page import="com.oreilly.servlet.MultipartRequest,java.util.*,java.io.*"%>
<%
    try { 
        Class.forName("org.gjt.mm.mysql.Driver"); 
        // 관리자 Login
        String URL = "jdbc:mysql://localhost/hakathon";
        String USER =  "root";
        String PASS="hakathon";

        Connection conn=null;
        PreparedStatement pstmt=null;  
        ResultSet rs=null;  
        ResultSet idx=null;  
        //구매하려는 product INDEXt값 가져오기 main에서 parameter로 넘겨줘야됌 
        String productIdx= request.getParameter("idx"); 
        System.out.print(productIdx);
        // DB에서 productIdx가져오기 
        Class.forName("org.gjt.mm.mysql.Driver");
        conn=DriverManager.getConnection(URL,USER,PASS);
        
        /*나중에 pwd encrypt하기 */ 
        pstmt=conn.prepareStatement("SELECT * FROM PRODUCT WHERE IDX='" + productIdx + "'");  
        rs = pstmt.executeQuery();
       
        String u_id=null; 
        u_id=(String)session.getAttribute("s_id"); 
        PreparedStatement userIDX = conn.prepareStatement(
            "SELECT * FROM USER WHERE ID = ?");
           userIDX.setString(1,u_id);
           String u_idx=null;
           idx = userIDX.executeQuery();
            if(idx.next()){   
              u_idx = idx.getString(1);
            }
        
        if(rs.next()){
           int count = Integer.parseInt(rs.getString(11));  
           int f_id_tmp = Integer.parseInt(rs.getString(1)); 
           String f_idx = Integer.toString(f_id_tmp);

             String ldate= new java.text.SimpleDateFormat("yyyyMMddHHmmss").format(new java.util.Date() );
         if(count>=10)
         {
               %> <script> alert("더이상 해당 상품을 구매할 수 없습니다"); history.go(-1); </script> <%   
         }else{
            
            //입출금 api  
            
            //list 만들어줘야돼고 
            PreparedStatement list = conn.prepareStatement(
                  "INSERT INTO LIST VALUES(?,?,?,?)");
               list.setString(1,"0"); //index
               list.setString(2, u_idx); //index
               list.setString(3, f_idx); //index
               list.setString(4,ldate); //index

                 list.executeUpdate(); 
                  
               //update 
               count++; 
               String cnt =Integer.toString(count);
               PreparedStatement ps = conn.prepareStatement(
                        "UPDATE PRODUCT SET COUNT = ? WHERE IDX = ?");
                      // set the preparedstatement parameters
                      ps.setString(1,cnt);
                      ps.setString(2,productIdx);  
                      // call executeUpdate to execute our sql update statement
                      ps.executeUpdate();
                      response.sendRedirect("main.jsp");
                      ps.close();
                      
                      // 다시 main문 켜줘야됌 
                      
         }
         
         
        //System.out.print(count);
        }
       conn.close();
    }
    catch (Exception e) {       
       out.print(e.getMessage());
    }
%> 