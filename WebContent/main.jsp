<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
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

.pic {
    max-width: 300px;
    max-height: 200px;
    position: relative;
    overflow: hidden;
    margin: 10px;
    display: inline-block;
    -webkit-animation: anima 2s;
    -moz-animation: anima 2s;
    -o-animation: anima 2s;
    -ms-animation: anima 2s;
    animation: anima 2s;
    -webkit-backface-visibility: hidden;
    -moz-backface-visibility: hidden;
    -o-backface-visibility: hidden;
    -ms-backface-visibility: hidden;
    backface-visibility: hidden;
	

}

.pic-3d {
    -webkit-perspective: 500;
    -moz-perspective: 500;
    -o-perspective: 500;
    -ms-perspective: 500;
    perspective: 500;
    -webkit-transform-style: preserve-3d;
    -moz-transform-style: preserve-3d;
    -o-transform-style: preserve-3d;
    -ms-transform-style: preserve-3d;
    transform-style: preserve-3d
}

.pic-caption {
    cursor: default;
    position: absolute;
    width: 100%;
    height: 100%;
    background: rgba(255, 255, 255, 0.41);
    padding: 10px;
    text-align: center;
    -ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=($opacity * 100))";
    filter: alpha(opacity=0);
    -moz-opacity: 0;
    -khtml-opacity: 0;
    opacity: 0
}

.pic-image {
    -webkit-transform: scale(1.1);
    -moz-transform: scale(1.1);
    -o-transform: scale(1.1);
    -ms-transform: scale(1.1);
    transform: scale(1.1)
}

.pic:hover .pic-image {
    -webkit-transform: scale(1);
    -moz-transform: scale(1);
    -o-transform: scale(1);
    -ms-transform: scale(1);
    transform: scale(1)
}

.pic-title {
    font-size: 1.8em
}
a,
a:hover,
.pic .pic-image,
.pic-caption,
.pic:hover .pic-caption,
.pic:hover img {
    -webkit-transition: all 0.5s ease;
    -moz-transition: all 0.5s ease;
    -o-transition: all 0.5s ease;
    -ms-transition: all 0.5s ease;
    transition: all 0.5s ease
}


.pic:hover .open-left{
    -ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=($opacity * 100))";
    filter: alpha(opacity=100);
    -moz-opacity: 1;
    -khtml-opacity: 1;
    opacity: 1;
    -webkit-user-select: none;
    -moz-user-select: none;
    -o-user-select: none;
    -ms-user-select: none;
    user-select: none;
    -webkit-touch-callout: none;
    -moz-touch-callout: none;
    -o-touch-callout: none;
    -ms-touch-callout: none;
    touch-callout: none;
    -webkit-tap-highlight-color: transparent;
    -moz-tap-highlight-color: transparent;
    -o-tap-highlight-color: transparent;
    -ms-tap-highlight-color: transparent;
    tap-highlight-color: transparent
}

.open-left {
    -webkit-transform: rotateY(180deg);
    -moz-transform: rotateY(180deg);
    -o-transform: rotateY(180deg);
    -ms-transform: rotateY(180deg);
    transform: rotateY(180deg);
    left: 0;
    top: 0
}

.pic:hover .open-left {
    -webkit-transform: rotateY(0deg);
    -moz-transform: rotateY(0deg);
    -o-transform: rotateY(0deg);
    -ms-transform: rotateY(0deg);
    transform: rotateY(0deg)
}
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
                        <!--<a href="#menu-toggle" class="btn btn-default" id="menu-toggle"><img src="images/menu.png" width="50" height="35"/></a>  -->
                    </div>
                </div>
            </div>
        </div>
        <!-- /#page-content-wrapper -->
   <center>
   <h1>농산물 구경하기</h1>
   </center>
    </div>
    <center><br><br>
    <!-- /#wrapper -->
<%
String realFolder = "";
String saveFolder = "upload";
ServletContext context = getServletContext();
realFolder = context.getRealPath(saveFolder);
		try
                    {
                       Class.forName("org.gjt.mm.mysql.Driver");
                       conn=DriverManager.getConnection(URL,USER,PASS);
                       pstmt=conn.prepareStatement("SELECT * FROM PRODUCT ORDER BY IDX DESC;");
                       rs = pstmt.executeQuery();
                       while(rs.next()){
   						String pname = rs.getString(2);
   						String weight = rs.getString(4);
   						String price = rs.getString(5);
   						String image = rs.getString(8);
   						String contents = rs.getString(9);
   						String farmer_id = rs.getString(10);
   						
   						String imagePath = realFolder + "\\" + image;
   						%>
   						<div class="pic pic-3d">
                		<a href="buyProc.jsp"><img src=<%=imagePath %> class="pic-image" alt="Pic"></a>
                		<span class="pic-caption open-left">
		        		<h1 class="pic-title"><%=pname %></h1>
		        		<p>
		        		<table>
		        		<tr><td width="80">무게</td><td><%=weight %>kg</td></tr>
						<tr><td width="80">가격</td><td><%=price %>원</td></tr>
						<tr><td width="80">게시자</td><td><%=farmer_id %></td></tr>
						<tr><td width="80">설명</td><td><%=contents %></td></tr>
						</table>
						</p></span>
            			</div>
   						
   						<!--<table>
						<tr><td colspan="2"><img src=<%=imagePath %> width=170 height=200></td></tr>
						<tr><td width="80">상품명</td><td><%=pname %></td></tr>
						<tr><td width="80">무게</td><td><%=weight %>kg</td></tr>
						<tr><td width="80">가격</td><td><%=price %>원</td></tr>
						<tr><td width="80">게시자</td><td><%=farmer_id %></td></tr>
						<tr><td width="80">설명</td><td><%=contents %></td></tr>
						</table><br>-->
   						<%

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
</center>
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