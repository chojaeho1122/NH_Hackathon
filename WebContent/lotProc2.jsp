<%@ page language="java" contentType = "text/html; charset=utf-8" %>
<%@ page import = "java.sql.*" %>
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
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Hakathon</title>
 
    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- font awesome -->
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet" />
    <!-- Custom Style -->
    <link href="css/simple-sidebar.css" rel="stylesheet">
 
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></scri.row>.containerpt>
    <![endif]-->

</head>
<style>
.btn{
border: 0;
outline: 0;
}
.btn:hover {
border: 0;
outline: 0;
}
.btn:active {
border: 0;
outline: 0;

}

table.upload {
    border-collapse: separate;
    border-spacing: 1px;
    text-align: left;
    line-height: 1.5;
    margin: 0px 0px 0px 200px;
    border-bottom: none;
}
table.upload th {
    width: 150px;
    padding: 10px;
    font-weight: bold;
    border-bottom: none;
    color:#BDBDBD;
}
table.upload td {
    width: 350px;
    padding: 10px;
    vertical-align: top;
}

 a:link { color: none;; text-decoration: none;}
 a:visited { color: none; text-decoration: none;}
 a:hover { color: none; text-decoration: none;}

input {
  border: 1px solid #bcbcbc;
  border-radius: 0px;
  -webkit-appearance: none;
  height: 30px;
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
  border-radius: 5px;
}
.file_input label {
    position:relative;
    cursor:pointer;
    display:inline-block;
    vertical-align:middle;
    overflow:hidden;
    width:100px;
    height:30px;
    background:#777;
    color:#fff;
    text-align:center;
    line-height:30px;
}
.file_input label input {
    position:absolute;
    width:0;
    height:0;
    overflow:hidden;
}
.file_input input[type=text] {
    vertical-align:middle;
    display:inline-block;
    width:400px;
    height:28px;
    line-height:28px;
    font-size:11px;
    padding:0;
    border:0;
    border:1px solid #777;
}

</style>

<body style="margin-top:-10px;">
    <div id="wrapper">
        <!-- Sidebar -->
        <div id="sidebar-wrapper">
            <ul class="sidebar-nav">
                 <li class="sidebar-brand">
               <li>
               <img style="
               border-radius: 70px;
               -moz-border-radius: 70px;
               -khtml-border-radius: 70px;
               -webkit-border-radius: 70px;"
                src="images/profile/man.png"width=100 height="100"/><!-- imageResponse를 부르기만 하는 것 -->
               </li>
                <li>
                <aa>
                     <%
                    String s_id=null;
                    String role=null; /* farmer user */
                    if(session.getAttribute("s_id")==null){
                       response.sendRedirect("login.jsp");
                    }else{
                       s_id=(String)session.getAttribute("s_id");
                       role=(String)session.getAttribute("role"); /* farmer user */
                       System.out.print(role);
                    }
                    out.print(" ");
                    out.print(s_id+"님");
                    out.print("<a href='logout.jsp'>logout</a>");  
                    /*try
                    {
                       Class.forName("org.gjt.mm.mysql.Driver");
                       conn=DriverManager.getConnection(URL,USER,PASS);
                       pstmt=conn.prepareStatement("SELECT * FROM USER WHERE ID='" + s_id + "'");
                       rs = pstmt.executeQuery();
                       while(rs.next())
                       {
                          String coin = rs.getString("COIN");
                          out.print("<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Coin : "+coin+"원");
                          
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
                    }*/
                    %>
                </aa>
                </li>
                <li>&nbsp;
                </li>
                <li>
                    <a href="mypage.jsp">Mypage</a>
                </li>
                <li>
                    <a href="#">Product</a>
                </li>
                <li>
                    <a href="#">Statics</a>
                </li>
                <li>
                    <a href="#">View</a>
                </li>
            </ul>
        </div>
        <!-- /#sidebar-wrapper -->

        <!-- Page Content -->
       
        <!-- /#page-content-wrapper -->
   <center><br><br><br>
   <h1>Thanks for your doantion!</h1>
   <br><br>
<p>당첨에는 실패했지만, 소중한 500원이 <img src="images/1.PNG" width="170" height="50">에 기부되었습니다. </p>
<br>
<a href='http://jikigi.nonghyup.com/user/indexMain.do?siteId=jikigi'><img src="images/기부.PNG" width="700" height="430"></a>

   </center>
 

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

    <!-- Menu Toggle Script -->
    <script>
    $("#wrapper").toggleClass("toggled");
    $("#menu-toggle").click(function(e) {
        e.preventDefault();
        $("#wrapper").toggleClass("toggled");
    });

    </script>
<footer>
<br><br>
</footer>
</body>

</html>