<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>  
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
<title>sign up page</title>
<!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- font awesome -->
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <!-- Custom Style -->
    <link href="css/style.css" rel="stylesheet">
</head>
<body>
   <div class="container">
      <div class="row"> 
        <div class="col-md-3">
          <div class="login-box well">
        <form accept-charset="UTF-8" role="form" method="post" action="signUpCheck.jsp">
            <legend>Sign In</legend>
            <div class="form-group">
                <label>Who are you?
                   <input type="radio" name="chk_info" value='farmer'/>Farmer
                   <input type="radio" name="chk_info" value='customer'/>Customer
               </label>
            </div>
            <div class="form-group">
                <label>ID :<input name="user_id" value='' id="username-email" placeholder="Insert ID" type="text" class="form-control" />
               </label>
            </div>
            <div class="form-group">
                <label>Password :<input name="password" id="password" value='' placeholder="Password" type="password" class="form-control" />
                 </label>
            </div>
            <div class="form-group">
                <label>PWD check :<input name="passwordCheck" value='' placeholder="Password" type="password" class="form-control" />
                 </label>
            </div>
            <div class="form-group">
                <label>E-mail :<input name="user_email" value='' placeholder="Insert E-mail" type="text" class="form-control" />
                 </label>
            </div>
            <div class="form-group">
                <label>Address :<input name="address" value='' placeholder="Insert Address" type="text" class="form-control" />
                 </label>
            </div>
            <div class="form-group">
                <label>Bank Account :<input name="account" value='' placeholder="Type account" type="text" class="form-control" />
                 </label>
            </div>
            <div class="form-group">
                <input type="submit" class="btn btn-default btn-login-submit btn-block m-t-md" value="register" />
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