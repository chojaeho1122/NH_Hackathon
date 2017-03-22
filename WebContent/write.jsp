<%@ page contentType = "text/html; charset=utf-8" %>
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
}
table.upload td {
    width: 350px;
    padding: 10px;
    vertical-align: top;
}

 a:link { color: none;; text-decoration: none;}
 a:visited { color: none; text-decoration: none;}
 a:hover { color: none; text-decoration: none;}

</style>
<body>

    <div id="wrapper">
        <!-- Sidebar -->
        <div id="sidebar-wrapper">
            <ul class="sidebar-nav">
                <li class="sidebar-brand">
                <li>
                    <%
                    String s_id=null;
                    if(session.getAttribute("s_id")==null){
                    	response.sendRedirect("login.jsp");
                    }else{
                    	s_id=(String)session.getAttribute("s_id");
                    }
                    out.print(" ");
                    out.print(s_id+"님");
                    try
                    {
                    	Class.forName("org.gjt.mm.mysql.Driver");
                    	conn=DriverManager.getConnection(URL,USER,PASS);
                    	pstmt=conn.prepareStatement("SELECT * FROM USER WHERE ID='" + s_id + "'");
                    	rs = pstmt.executeQuery();
                    	while(rs.next())
                    	{
                    		String coin = rs.getString("COIN");
                    		out.print("<br>&nbsp;&nbsp;&nbsp;&nbsp;Coin : "+coin+"원");
                    		
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
                <a href='logout.jsp'>logout</a><br><br>
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
        <div id="page-content-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <a href="#menu-toggle" id="menu-toggle" class="fa fa-align-justify" aria-hidden="true"></a>
                        </div>
                </div>
            </div>
        </div>
        <!-- /#page-content-wrapper -->
	<center>
	<h1>Upload Your Product</h1>
	<br><br>
<form name="writeform" method="post" action="write_ok.jsp" enctype="multipart/form-data">
  <tr>
   <td>
   <table class="upload" frame="void">
     <tr>
      <th align="center">상품명</th>
      <td><input name="pname" size="50" maxlength="100"></td>
     </tr>
    <tr>
      <th align="center">카테고리</th>
      <td>
      <select name="category">
      <option value="">category</option>
      <option value="채소">채소</option>
      <option value="과일">과일</option>
      <option value="곡물">곡물</option>
</select></td>
     </tr>
    <tr>
      <th align="center">무게(kg)</th>
      <td><input name="weight" size="20" maxlength="30"></td>
     </tr>
    <tr>
      <th align="center">가격</th>
      <td><input name="price" size="20" maxlength="30"></td>
     </tr>
     <tr>
      <th align="center">상품판매기한</th>
      <td><input name="due" size="20" maxlength="30"></td>
     </tr>
    <tr>
      <th align="center">상품 사진</th>
      <td><input name="image" type="file" size="40" maxlength="30"></td>
     </tr>
     <tr>
      <th align="center">상품 설명</th>
      <td><textarea name="memo" cols="70" rows="13"></textarea></td>
      <td>&nbsp;</td>
     </tr>
     <tr align="center">
      <td>&nbsp;</td>
      <td colspan="2"><input class=button type=submit value="등록">
       <input class=button type=button value="취소" OnClick="javascript:history.back(-1)">
      <td>&nbsp;</td>
     </tr>
    </table>
   </td>
  </tr>
  </form>
	</center>

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

    <!-- Menu Toggle Script -->
    <script>
    $("#menu-toggle").click(function(e) {
        e.preventDefault();
        $("#wrapper").toggleClass("toggled");
    });

    </script>

</body>

</html>
