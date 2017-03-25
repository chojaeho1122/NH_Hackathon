<%@ page contentType = "text/html; charset=utf-8" %>
<%@ page import = "java.sql.*,java.io.*,java.util.zip.*" %>
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
<!-- 이부분부터는 갤러리를 위함 -->
 <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <title>Freebie: 4 Bootstrap Gallery Templates</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css?family=Droid+Sans:400,700" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/baguettebox.js/1.8.1/baguetteBox.min.css">
    <link rel="stylesheet" href="./css/gallery-grid.css"><!-- 이부분때문에 바디가 내려옴 -->
<!-- 갤러리 부분 끝 -->

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

body {
    background-image: linear-gradient(to top, #ecedee 0%, #eceeef 75%, #e7e8e9 100%);
    min-height: 100vh;
    font: normal 16px sans-serif;
    padding: 60px 0;
}

.container.gallery-container {
    background-color: #fff;
    color: #35373a;
    min-height: 100vh;
    border-radius: 20px;
    box-shadow: 0 8px 15px rgba(0, 0, 0, 0.06);
}

.gallery-container h1 {
    text-align: center;
    margin-top: 70px;
    font-family: 'Droid Sans', sans-serif;
    font-weight: bold;
}

.gallery-container p.page-description {
    text-align: center;
    max-width: 800px;
    margin: 25px auto;
    color: #888;
    font-size: 18px;
}

.tz-gallery {
    padding: 40px;
}

.tz-gallery .lightbox img {
    width: 100%;
    margin-bottom: 30px;
    transition: 0.2s ease-in-out;
    box-shadow: 0 2px 3px rgba(0,0,0,0.2);
}


.tz-gallery .lightbox img:hover {
    transform: scale(1.05);
    box-shadow: 0 8px 15px rgba(0,0,0,0.3);
}

.tz-gallery img {
    border-radius: 4px;
}

.baguetteBox-button {
    background-color: transparent !important;
}


@media(max-width: 768px) {
    body {
        padding: 0;
    }

    .container.gallery-container {
        border-radius: 0;
    }
}

</style>
<body style="margin-top:-70px;">
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
                src="http://localhost:8080/hakaton/imageResponse.jsp" alt="로딩" width=100 height="100"/><!-- imageResponse를 부르기만 하는 것 -->
               </li>
                <li>
                <aa>
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
                </aa>
                </li>
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
      <!--  <div id="page-content-wrapper">
               <div class="container-fluid">
                   <div class="row">
                         <div class="col-lg-12">
                           <a href="#menu-toggle" id="menu-toggle" class="fa fa-align-justify" aria-hidden="true"></a>
                         </div>   
                  </div>
              </div>                       
            </div>--><!-- 주석처리 했음 -->
        
        <!-- /#page-content-wrapper -->
   <!--<center>
   <h1>My PAGE</h1>
   </center>  -->
   <nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand">  </a>
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
   
<form name="writeform" method="get" action="write_ok.jsp" enctype="multipart/form-data">
   
      <!-- 갤러리 시작 -->
     
<div class="container gallery-container">

    <h1>My Page</h1>

    <p class="page-description text-center">   <%  out.print(s_id);out.print("님이 투자한 상품");%></p>
    
    <div class="tz-gallery">
        <div class="row">
            <div class="col-sm-4 col-md-4">
                <a class="lightbox" href="../images/park.jpg">
                    <img src="../images/park.jpg" alt="Park">
                </a>
            </div>
            <div class="col-sm-4 col-md-4">
                <a class="lightbox" href="../images/bridge.jpg">
                    <img src="../images/bridge.jpg" alt="Bridge">
                </a>
            </div>
            <div class="col-sm-4 col-md-4">
                <a class="lightbox" href="../images/tunnel.jpg">
                    <img src="../images/tunnel.jpg" alt="Tunnel">
                </a>
            </div>
        </div>
    </div>
    
    <p class="page-description text-center">   <%  out.print(s_id);out.print("님의 기여도");%></p>
    
    <div class="tz-gallery">
        <div class="row">
            <div class="col-sm-12 col-md-12">
                <a class="lightbox" href="../images/park.jpg">
                    <!-- 기여도 관련된 코딩이 들어가면 되는 부분 -->
                </a>
            </div>
        </div>
    </div>
   <p class="page-description text-center">   <%  out.print(s_id);out.print("님의 당첨내역");%></p>
    
    <div class="tz-gallery">
        <div class="row">
            <div class="col-sm-12 col-md-12">
                <a class="lightbox" href="../images/park.jpg">
                    <!-- 당첨내역 관련된 코딩이 들어가면 되는 부분 -->
                </a>
            </div>
        </div>
    </div>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/baguettebox.js/1.8.1/baguetteBox.min.js"></script>
<script>
    baguetteBox.run('.tz-gallery');
</script>
     <!-- 갤러리 끝 -->
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

    $("#wrapper").toggleClass("toggled");//사이드바 자동으로 나오게
    $("#menu-toggle").click(function(e) {
        e.preventDefault();
        $("#wrapper").toggleClass("toggled");
    });

    </script>

</body>

</html>