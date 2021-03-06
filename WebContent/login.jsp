<%@ page contentType="text/html;charset=EUC-KR"%>
<!DOCTYPE html>
  <head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Hackathona</title>
    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- font awesome -->
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet" />
    <!-- Custom Style -->
    <link href="css/style.css" rel="stylesheet">
 
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></scri.row>.containerpt>
    <![endif]-->
  </head>

  <body onload="login.id.focus()">
    
      <div class="row">
        <div class="page-header">
 
        </div>
        <div class="col-md-3">
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
 
  <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <!-- Include all compiled plugins (below), or include individual files as needed -->
  <script src="js/bootstrap.min.js"></script>
  </body>
  </html>