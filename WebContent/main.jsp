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
   				<img style="
					border-radius: 70px;
					-moz-border-radius: 70px;
					-khtml-border-radius: 70px;
					-webkit-border-radius: 70px;"
					 src="http://localhost:8080/hakaton/imageResponse.jsp" alt="로딩" width=100 height="100"/>
   				</li>
                <li><aa>
                    <%
                    String s_id=null;
                    if(session.getAttribute("s_id")==null){
                    	response.sendRedirect("login.jsp");
                    }else{
                    	s_id=(String)session.getAttribute("s_id");
                    }
                    out.print(" ");
                    out.print(s_id+"님");
                    %>
                    </aa>
                    </li>
                    
                    <li>
                    <aa>
                    <%
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
                    </aa></li>
                    <li>
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
        
        <!-- /#page-content-wrapper -->
	<center>
	<h1>main</h1>
	</center>
	<!-- 상단바 부분 -->
	<nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand"> 
       </a>
    </div>
    <ul class="nav navbar-nav">
    <li>
                        	<a href="#menu-toggle" id="menu-toggle" class="fa fa-align-justify" aria-hidden="true"></a>
         	      	 
            		
    </li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <li><a href='#'><span class="glyphicon glyphicon-user"></span>정보수정 </a></li>
      <li><a href="logout.jsp"><span class="glyphicon glyphicon-log-in"></span> Sign out</a></li>
    </ul>
  </div>
</nav>
	<!-- 상단바 부분 끝 -->
    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

    <!-- Menu Toggle Script -->
    <script>
    $("#wrapper").toggleClass("toggled");//사이드바 자동으로 나오게
    $("#menu-toggle").click(function(e) {
        e.preventDefault();
        $("#wrapper").toggleClass("toggled");
    });
    </script>

</body>

</html>
