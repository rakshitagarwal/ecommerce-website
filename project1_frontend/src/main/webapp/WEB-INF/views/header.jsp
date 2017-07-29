<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Context-Type" content="text/html; charset=ISO-8859-1">
<title>My ecommerce Project</title>

<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.0.1/angular.min.js"></script>

<!-- jquery -->
<script src="https://code.jquery.com/jquery-2.2.1.min.js"></script>
<script
	src="https://cdn.datatables.net/1.10.10./js/jquery.dataTables.min.js"></script>

<link
	href="https://cdn.datatables.net/1.10.10./css/jquery.dataTables.min.css"
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
					<li class="active"><a href="${url1}">Home<span
							class="sr-only">You are in home page link</span></a></li>

					<c:url value="/aboutus" var="url2"></c:url>
					<li><a href="${url2}">About Us</a></li>
					
					<c:url value="/admin/getproductform" var="url3"></c:url>
                    <li>
					<c:if test="${pageContext.request.userPrincipal.name!=null }">
					<security:authorize access="hasRole('ROLE_ADMIN')">
					<a href="${url3}">Add Product</a>
					</security:authorize>
					</c:if>
					</li>

					<c:url value="/all/product/getallproducts" var="url4"></c:url>
					<li><a href="${url4}">Browse All Products</a></li>

					<li class="dropdown"><a href="" class="dropdown-toggle"
						data-toggle="dropdown">Select by Category<b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li>
							<c:forEach items="${categories}" var="c">
							<c:url value="/all/product/searchbycategory?searchCondition=${c.categoryName}" var="url"></c:url>
							<a href="${url}">${c.categoryName}</a>
							</c:forEach>
							 
								
								<c:url value="/all/product/searchbycategory?searchCondition=ALL" var="url1"></c:url> 
								<a href="${url1}">ALL</a></li>
						</ul></li>
						
						<li>
						<c:if test="${pageContext.request.userPrincipal.name!=null }">
						<a href="">Welcome ${pageContext.request.userPrincipal.name}</a>
						</c:if>
						</li>
						
						<li><security:authorize access="hasRole('ROLE_USER')">
						<li><a href = "<c:url value="/cart/getcart"></c:url>">Cart</a></li>
						</security:authorize></li>
					
					<c:if test="${pageContext.request.userPrincipal.name==null }">
					<c:url value="/all/registrationform" var="url5"></c:url>
					<li><a href="${url5}">Sign up</a></li>
					
					<c:url value="/login" var="url6"></c:url>
					<li><a href="${url6}">Sign in</a></li>
					</c:if>
					
					<c:url value="/j_spring_security_logout" var="logouturl"></c:url>
					<c:if test="${pageContext.request.userPrincipal.name!=null }">
					<li><a href="${logouturl}">Log Out</a></li>
				    </c:if>
				    </ul>
			        </div>
		</div>
	</nav>

</body>
</html>
