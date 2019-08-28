
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Login</title>

  <!-- Custom fonts for this template-->
 
  <link  href="<c:url value ="vendor/fontawesome-free/css/all.min.css"></c:url>"  rel="stylesheet" type="text/css">

  <!-- Custom styles for this template-->
  <link href="<c:url value="css/sb-admin.min.css"></c:url>" rel="stylesheet">

</head>

<body class="bg-dark">
<% 
response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");

  %>
	<h3 align="center" style="color: white;">Po Tracker Login</h3>

  <div class="container">
    <div class="card card-login mx-auto mt-5">
      <div class="card-header">Login</div>
      <div>
      </div>
      <div class="card-body">
        <form action="checkLogin" method="POST">
       
          <div class="form-group">
            <div class="form-label-group">
              <input type="text"  class="form-control" id="inputEmail" required name="username" placeholder="Enter Username"  autofocus="autofocus">
              <label for="inputEmail">Username</label>
            </div>
          </div>
          <div class="form-group">
            <div class="form-label-group">
              <input type="password"  class="form-control" id="inputPassword" required name="password" placeholder="Enter Password"  autofocus="autofocus">
              <label for="inputPassword">Password</label>
            </div>
          </div>
         <!--  <div class="form-group">
            <div class="checkbox">
              <label>
                <input type="checkbox" value="remember-me">
                Remember Password
              </label>
            </div>
          </div> -->
          <!-- <a class="btn btn-primary btn-block" href="index.html">Login</a> -->
          <button type="submit" class="btn btn-primary btn-block" id="btnadd"
										name="btnadd">Login</button>
										
			 <div class="form-group">
         <div class="form-label-group" align="center">
        <c:if test="${msg != null}">
			<label style="color: red;">${msg}</label>        
</c:if>
</div>
</div>							
										       
        </form>
        <!-- <div class="text-center">
          <a class="d-block small mt-3" href="register.html">Register an Account</a>
          <a class="d-block small" href="forgot-password.html">Forgot Password?</a>
        </div> -->

      </div>
    </div>
  </div>

  <!-- Bootstrap core JavaScript-->
  <script src="<c:url value="vendor/jquery/jquery.min.js"></c:url>"></script>
  <script src="<c:url value ="vendor/bootstrap/js/bootstrap.bundle.min.js"></c:url>"></script>

  <!-- Core plugin JavaScript-->
  <script src="<c:url value ="vendor/jquery-easing/jquery.easing.min.js"></c:url>"></script>

</body>

</html>
