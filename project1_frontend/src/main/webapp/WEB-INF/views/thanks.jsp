<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Thank you </title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
   body {
	background-image: url("https://static1.squarespace.com/static/513ca580e4b060b33d4e136a/t/55edb02fe4b06837e70386a3/1441640496979/image.jpg");
	background-repeat: no-repeat;
	background-size:100%;
	
}
</style>
</head>
<body>

<div class="container" style="margin-top:5%;">
	<div class="row">
        <div class="jumbotron" style="box-shadow: 2px 2px 4px #000000;">
   <h2 class="text-center">Thank you for Shopping <span style="color:#F89406;">
   Your order has been submitted successfully.</span><br><span style="color:#26A65B;">Lets Shop</span><span style="color:#19B5FE;">
     Your order will be shipped with in three business days!</span></h2>
            <center><div class="btn-group" style="margin-top:50px;">
            <c:url value="/cart/confirm/home" var="url1"></c:url>
                <a href="home" class="btn btn-lg btn-primary">Back to Home</a>
            
            </div></center>
        </div>
	</div>
</div>

</body>
</html>