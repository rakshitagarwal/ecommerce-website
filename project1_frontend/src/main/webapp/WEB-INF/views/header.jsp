<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib  prefix="security" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<style type="text/css">
	section{
	background-color:#d9d9d9;
	}
	.navbar{
		background-color:#d9d9d9;
	}
	</style>


<link href="https://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css" rel="stylesheet">


<script src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>


</head>
<header>
	<nav class="navbar-inverse navbar-fixed-top" role="navigation">
	<div class="container-fluid">
		<button type="button" class="navbar-toggle collapsed"
			data-toggle="collapse" data-target="#collapse-example"
			aria-expanded="false">
			<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span>
			<span class="icon-bar"></span> <span class="icon-bar"></span>
		</button>

		<div class="navbar-header">
			<c:url value="/images/logo.png" var="url5"></c:url>
			<c:url value="/home" var="url1"></c:url>
			<a class="navbar-brand" href="${url1 }"><img
				src="${url5 }"  height="30px" width="30px"></a>
		</div>
		<div class="collapse navbar-collapse" id="collapse-example">
			<ul class="nav navbar-nav">
				<c:url value="/home" var="url1"></c:url>
				<li><a href="${url1 }"><span class="glyphicon glyphicon-home"></span> Home
				<span class="sr-only">You are in home page link</span></a></li>
  
				<c:url value="/aboutus" var="url2"></c:url>
				<li><a href="${url2 }">About Us</a></li>

				<!-- http://localhost:8080/Project_Frontend/getproductform -->

				<c:if test="${pageContext.request.userPrincipal.name!=null }">
					<security:authorize access="hasRole('ROLE_ADMIN')">
						<c:url value="/admin/product/getproductform" var="url3"></c:url>
						<li><a href="${url3 }"><span class="glyphicon glyphicon-pencil"></span> Add Product</a>
					</security:authorize>
				</c:if>
				</li>

				<c:url value="/all/product/getallproducts" var="url4"></c:url>
				<li><a href="${url4 }">Browse All Products</a></li>

				<li class="dropdown"><a href="" class="dropdown-toggle"
					data-toggle="dropdown">Select by Category<b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><c:forEach items="${categories }" var="c">
								<c:url
									value="/all/product/searchbycategory?searchCondition=${c.categoryName }"
									var="url"></c:url>
								<a href="${url }">${c.categoryName }</a>
							</c:forEach> <c:url value="/all/product/searchbycategory?searchCondition=All"
								var="url1">
							</c:url> <a href="${url1 }">All</a></li>
					</ul></li>
					<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>

				<li><c:if test="${pageContext.request.userPrincipal.name!=null }">
						<a href=""><span class="glyphicon glyphicon-hand-right"></span>  Welcome ${pageContext.request.userPrincipal.name }</a>
					</c:if>
			    </li>
			    <li></li>
				<c:if test="${pageContext.request.userPrincipal.name==null }">
				<ul class="nav navbar-nav navbar-right">
				
					<c:url value="/all/registrationform" var="url5"></c:url>
					<c:url value="/login" var="url6"></c:url>
										<c:url value="/login" var="url6"></c:url>
					
					<li><a href="${url5 }"><span class="glyphicon glyphicon-log-in"></span>  Sign Up</a></li>
					<li><a href="${url6 }"><span class="glyphicon glyphicon-user"></span> Login</a></li>
				</ul>
				</c:if>

				<li><security:authorize access="hasRole('ROLE_USER')">
			<li><c:url value="/cart/getcart" var="urlCart"></c:url> <a href="${urlCart }">
			<span class="glyphicon glyphicon-shopping-cart"></span>  Cart</a></li>
					</security:authorize></li>
					
				<c:url value="/j_spring_security_logout" var="logoutUrl"></c:url>
				<c:if test="${pageContext.request.userPrincipal.name!=null }">
					<li><a href="${logoutUrl }"><span class="glyphicon glyphicon-user"></span>  Logout</a></li>
				</c:if>
			</ul>
		</div>
	</div>
	</nav>
	</header>
	</html>