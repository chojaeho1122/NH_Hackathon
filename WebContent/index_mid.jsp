<%@ page language="java" contentType="text/html; charset=EUC-KR"
	import="java.sql.*,java.util.*"
	pageEncoding="EUC-KR"%>

<title>test_01_soowan</title>
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
 new java.text.SimpleDateFormat("yyyy³âMM¿ùddÀÏHHmmss");
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

<table id="google" border=0 width=800>
<tr align=center>
<td colspan="3" width=50%><img src="./images/review.jpg" width=500 weight=100></td></tr>
<tr><td>&nbsp;&nbsp;</td><td>&nbsp;&nbsp;</td><td>&nbsp;&nbsp;</td></tr>
<tr><td>&nbsp;&nbsp;</td><td>&nbsp;&nbsp;</td><td>&nbsp;&nbsp;</td></tr>
<tr align=center>
<td><font size=5>crop 1's name</td>
<td><font size=5>crop 2's name</td>
<td><font size=5>crop 3's name</td></tr>
<tr align=center>
<td><img src="./images/main.jpg" width=100%></td>
<td><img src="./images/main.jpg" width=100%></td>
<td><img src="./images/main.jpg" width=100%></td></tr>
<tr align=right>
<td><font size=5 color=red>(price upload)</td>
<td><font size=5 color=red>(price upload)</td>
<td><font size=5 color=red>(price upload)</td></tr>
</font>
</table>

</body>
</html>