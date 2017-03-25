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
  <head>f
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
    .zt-skill-bar {
        color: #fff;
        font-size: 11px;
        line-height: 25px;
        height: 25px;
        margin-bottom: 5px;

        background-color: rgba(0,0,0,0.1);

        -webkit-border-radius: 2px;
           -moz-border-radius: 2px;
            -ms-border-radius: 2px;
                border-radius: 2px;

    }

    .zt-skill-bar * {
        webkit-transition: all 0.5s ease;
          -moz-transition: all 0.5s ease;
           -ms-transition: all 0.5s ease;
            -o-transition: all 0.5s ease;
               transition: all 0.5s ease;
    }

    .zt-skill-bar div {
        background-color: #9FC93C;
        position: relative;
        padding-left: 25px;
        width: 0;

        -webkit-border-radius: 2px;
           -moz-border-radius: 2px;
           -ms- border-radius: 2px;
                border-radius: 2px;
    }

    .zt-skill-bar span {
        display: block;
        position: absolute;
        right: 0;
        top: 0;
        height: 100%;
        padding: 0 5px 0 10px;
        background-color: #1a1a1a;

        -webkit-border-radius: 0 2px 2px 0;
           -moz-border-radius: 0 2px 2px 0;
            -ms-border-radius: 0 2px 2px 0;
                border-radius: 0 2px 2px 0;
    }

    .zt-skill-bar span:before {
        content: "";
        position: absolute;
        width: 6px;
        height: 6px;
        top: 50%;
        left: -3px;
        margin-top: -3px;
        background-color: #1a1a1a;

        -webkit-transform: rotate(45deg);
           -moz-transform: rotate(45deg);
            -ms-transform: rotate(45deg);
                transform: rotate(45deg);
    }

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

 a:link { color: none;; text-decoration: none; color:#000;}
 a:visited { color: none; text-decoration: none; color:#000;}
 a:hover { color: none; text-decoration: none; color: #9FC93C;}
 
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

#footer {
    width:100%;
    height:50px;
}

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
                    }
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
   
<form name="writeform" method="get" action="write_ok.jsp" enctype="multipart/form-data" style="margin-top:60px;">
   
      <!-- 갤러리 시작 -->
     
<div class="container gallery-container">

    <h1>My Page</h1>

    <p><%  out.print(s_id);out.print("님이 투자한 상품");%></p>
    
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