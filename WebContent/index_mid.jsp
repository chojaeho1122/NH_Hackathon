<%@ page language="java" contentType="text/html; charset=utf-8"
	import="java.sql.*,java.util.*"
	pageEncoding="utf-8"%>

<title>test_01_soowan</title>

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
<body>
<link href="https://fonts.googleapis.com/css?family=Sanchez" rel="stylesheet">
<style>
#google{font-family: 'Sanchez', serif;}
<style>
		#slide { position:relative; width:600px; height:300px; overflow:hidden; }
		#slide img{ position:absolute; top:0; left:0;}
</style>

<table id="google" border=0 width=800 cellspacing=100px>
<tr align=center>
<td><font size=3>
<%
 java.text.SimpleDateFormat formatter = 
 new java.text.SimpleDateFormat("yyyy년MM월dd일HHmmss");
 String today = formatter.format(new java.util.Date()); 
 formatter = new java.text.SimpleDateFormat("yyyy"); 
 today = formatter.format(new java.util.Date()); 
 out.println(today + ".&nbsp;");
 
 formatter = new java.text.SimpleDateFormat("MM"); 
 today = formatter.format(new java.util.Date()); 
 out.println(today + ".&nbsp;");
 
 formatter = new java.text.SimpleDateFormat("dd"); 
 today = formatter.format(new java.util.Date()); 
 out.println(today + "<br/>");
%></font></td></tr></table>
 <!-- 갤러리 시작 -->
     <div class="container">
<h2>&nbsp;&nbsp;</h2>
<div>

<div class="col-sm-3 col-md-3">
 <img src="./images/apple.jpg" height="200" width="200" alt="amazing" class="img-circle">
</div>

<div class="col-sm-3 col-md-3">
 <image src="./images/banana.jpg" alt="my_image1" height="200" width="200" class="img-circle"/>
</div>
<div class="col-sm-3 col-md-3">
<image src="./images/stro.PNG" alt="my_image2" height="200" width="200" class="img-circle"/>
</div>

<div class="col-sm-3 col-md-3">
</div>
   </div>

<!-- 
<table id="google" border=0 width=800 class="container gallery-container">
<div  class="page-description text-center">
<tr align=center >
<td colspan="3" width=50%><img src="./images/review.jpg" width=500 weight=100></td></tr>
<tr><td>&nbsp;&nbsp;</td><td>&nbsp;&nbsp;</td><td>&nbsp;&nbsp;</td></tr>
<tr><td>&nbsp;&nbsp;</td><td>&nbsp;&nbsp;</td><td>&nbsp;&nbsp;</td></tr>
<tr align=center>
<td><font size=5>crop 1's name</td>
<td><font size=5>crop 2's name</td>
<td><font size=5>crop 3's name</td></tr>
<tr align=center>
<td><img src="./images/main.jpg" width=100% class="lightbox"></td>
<td><img src="./images/main.jpg" width=100% class="lightbox"></td>
<td><img src="./images/main.jpg" width=100% class="lightbox"></td></tr>
<tr align=right>
<td><font size=5 color=red>(price upload)</td>
<td><font size=5 color=red>(price upload)</td>
<td><font size=5 color=red>(price upload)</td></tr> -->
</font>
</table>

</body>
</html>