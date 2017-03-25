<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>welcome to nanuڸ</title>
    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- font awesome -->
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet" />
    <!-- Custom Style -->
    <link href="css/style.css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
</head>
<body>

<table align=center>
<tr>
<td>&nbsp;&nbsp;</td><td>&nbsp;&nbsp;</td><td>&nbsp;&nbsp;</td>
<td>&nbsp;&nbsp;</td><td>&nbsp;&nbsp;</td><td>&nbsp;&nbsp;</td>
<td>&nbsp;&nbsp;</td><td>&nbsp;&nbsp;</td><td>&nbsp;&nbsp;</td>
<td>&nbsp;&nbsp;</td><td>&nbsp;&nbsp;</td><td>&nbsp;&nbsp;</td>
<td><img src="./images/logo.jpg" width=600 height=300></td></tr>
</table>
<table align=center>
<tr>

   <td>
    <body onload="login.id.focus()">
    <!-- <div class="container">
      <div class="row" >
        </div> -->
        <div class="col-md-50">
          <div class="login-box well">
        <form name="login" accept-charset="UTF-8" role="form" method="post" action="loginProc.jsp">
            <legend>login</legend>
            <div class="form-group">
                <label for="username-email">ID</label>
                <input name="id" value='' id="id" placeholder="ID" type="text" class="form-control" />
            </div>
            <div class="form-group">
                <label for="password">password</label>
                <input name="pwd" id="pwd" value='' placeholder="Password" type="password" class="form-control" />
            </div>
            <div class="form-group">
                <input type="submit" class="btn btn-default btn-login-submit btn-block m-t-md" value="Login" />
            </div>
            <span class='text-center'><a href="/bbs/index.php?mid=index&act=dispMemberFindAccount" class="text-sm">find password</a></span>
            <hr />
            <div class="form-group">
                <a href="signUp.jsp" class="btn btn-default btn-block m-t-md">Sign Up</a>
            </div>
        </form>
          </div>
        </div>
      </div>
    </div>
 </td>
 <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
  <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <!-- Include all compiled plugins (below), or include individual files as needed -->
  <script src="js/bootstrap.min.js"></script>
   
   
   <TD> <jsp:include page="test_01.jsp"  flush="false"/></TD>
   <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
   <TD> <jsp:include page="test_view.jsp" flush="false"/></TD>
</tr>
</table>

</body>
</html>