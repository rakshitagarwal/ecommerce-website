<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login Page</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
   <link href="<c:url value="/resources/css/log.css" />" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<br>
<br>
<br>
<div class="thumbnail">
                <img src="images/logo1.jpg">
            </div>
<p align="center" valign="top" width="620" style="font-size: 37px; font-family:Kaushan Script; color: purple; ">
	<strong>LOGIN PAGE</strong></p>

	<div class="container">
     <div class="row">
      <div class="col-md-6 col-md-offset-3">
        <div class="panel panel-login">
          <div class="panel-heading">
            <div class="row">   
              <div class="col-xs-6">
              </div>
             
            </div>
          </div>
          <div class="panel-body">
            <div class="row">
              <div class="col-lg-12">
               <c:url value="/j_spring_security_check" var="login"></c:url>
		        <form action="${login }" method="post">
                  <div class="form-group" style="font-size: 27px; font-family:Kaushan Script; color: green;">
                    <label for="j_username">Username:</label>
                    <input type="text" name="j_username" tabindex="1" class="form-control" placeholder="Username" value="" required>
                  </div>
                  <div class="form-group" style="font-size: 27px; font-family:Kaushan Script; color: green;">
                    <label for="j_password">Password:</label>
                    <input type="password" name="j_password" id="password" tabindex="2" class="form-control" placeholder="Password" required>
                  </div><br><br><br>
                  <div class="form-group text-center">
                    <input type="checkbox" tabindex="3" class="" name="remember" id="remember">
                    <label for="remember"> Remember Me</label>
                  </div>
                  
                  <div class="form-group">
                    <div class="row">
                      <div class="col-sm-6 col-sm-offset-3">
                       <button class="btn btn-lg btn-primary btn-block" type="submit">
                     Login</button>
                        </div>
                    </div>
                  </div>
                  
                  
                </form>  
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
<%@ include file="footer.jsp"%>
</body>
</html>