<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Product</title>
<style>
td{
font-family:Kaushan Script;
}
</style>
</head>
<body>

<jsp:include page="header.jsp"></jsp:include>
<br>
<br>
<br>
	
	<p align="center" valign="top" width="620" style="font-family:Kaushan Script; font-size: 37px; color: purple; ">
	<strong>Details about the Product</strong></p>
	
	<div class="col-md-3" style="margin-left:0px;">
	</div>
	
	<div class="col-md-3" style="margin-left:0px;">
	
	<br><br>
	<c:url value="/images/${product.id }.jpg" var="imageUrl"></c:url>
	<img src="${imageUrl }" height="300" width="300">
	</div>
	
	<div class="col-md-6" style="margin-top:50px;">
	<table style="font-size: 24px;">

		<tr>
			<td valign="top" width="500"><b>Product Name</b></td>
			<td>:${product.productName }</td>
		</tr>
		<tr>
			<td>Price</td>
			<td>:&#8377; ${product.price }</td>
		</tr>
		<tr>
			<td>Description</td>
			<td>:${product.description }</td>
		</tr>

		<tr>
			<td>Quantity</td>
			<td>:${product.quantity }</td>
		</tr>
	</table>
	</div>
	
		<div class="container">
		<div class="col-md-4"></div>
		<div class="col-md-8">
   
   <security:authorize access="hasRole('ROLE_USER')">
	<c:if test="${product.quantity==0 }">Out Of Stock</c:if>

	<c:if test="${product.quantity!=0 }">
		<c:url value="/cart/addtocart/${product.id }" var="url"></c:url>
		<form action="${url }">
		<div class="form-group" style="font-family:Kaushan Script;
		 font-size: 24px;">
			<br><center>Enter Units:</center>
			</div>
            <div class="form-group" style="padding-left:300px;">
			<input type="text" name="units" class="form-control" style="width:50%;">
			<button type="submit" class="btn btn-default btn-lg">
				<span class="glyphicon glyphicon-shopping-cart"> BUY</span>
			</button>
			</div>
		</form>
	</c:if>
	</security:authorize>

	</div>

	</div>
    <br>
	<br>
	<br>
    <c:url value="/all/product/getallproducts" var="url1"></c:url>
	<h3><p align="center" style="font-family:Kaushan Script; "><a href="${url1 }">Back to product list</a></p></h3>
	<br>
	<br>
	<br>
	<br>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>