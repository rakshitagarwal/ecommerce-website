<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Context-Type" context="text/html; charset=ISO-8859-1">
<title>Bootstrap Example</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.5/angular.min.js"></script>

<!-- jquery -->
<script src="http://code.jquery.com/jquery-2.2.1.min.js"></script>
<script
	src="http://cdn.datatables.net/1/10.10./js/jquery.dataTables.min.js"></script>

<link
	href="http://cdn.datatables.net/1/10.10./css/jquery.dataTables.min.js"
	rel="stylesheet">
</head>
<body>

	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#collapse-example"
				aria-expanded="false">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>

			</button>

			<div class="navbar-header">
				<c:url value="/resources/images/ast.jpg" var="url5"></c:url>
				<a class="navbar-brand" href="#"><img src="${url5}" alt="NIIT"
					height="30px" width="30px"></a>

			</div>
			<div class="collapse navbar-collapse" id="collapse-example">
				<ul class="nav navbar-nav">
					<c:url value="/home" var="url1"></c:url>
					<li class="active"><a href="${url1 }">Home<span
							class="sr-only">You are in home page link</span></a></li>
					<c:url value="/aboutus" var="url2"></c:url>
					<li><a href="${url2}">About Us</a></li>
					<c:url value="/getproductform" var="url2"></c:url>
					<li><a href="${url3}">Add Product</a></li>

					<c:url value="/all/product/getallproducts" var="url4"></c:url>
					<li><a href="${url4}">Browse All Products</a></li>
				</ul>
			</div>
		</div>
	</nav>

</body>
</html>