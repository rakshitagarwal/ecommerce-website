<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Your Cart</title>
</head>
<body>
<%@ include file="header.jsp"%>
<br>
<br>
<br>
<p align="center" valign="top" width="620" style="font-size: 37px; font-family:Kaushan Script; color: purple; ">
	<strong>CART</strong></p>
	<br><br>
<div class="container" style="width:70%;">
	
		<div class="row" style="width:70%; margin:0px auto;">
		<table class="table table-stripped"  width="70%">
			<thead width="70%">
				<tr>
					<th>         </th>
					<th>         </th>
					<th>         </th>
					<th>         </th>
					<th>         </th>
				</tr>
			</thead>
			<c:set var="grandTotal" value="0"></c:set>
			<tbody width="70%">
			<c:forEach items="${cart.cartItems}" var="cartItem">
				<tr>
				<c:url value="/images/${cartItem.product.id}.jpg" var="image"></c:url>
				
					<td><img src="${image}" height="50" width="70" />${cartItem.product.productName }</td>
					
					<td>${cartItem.quantity }  </td>
					
					<td align="right">          &#8377; ${cartItem.totalPrice }</td>
					<td>&nbsp;</td>
					<c:url value="/cart/removecartitem/${cartItem.cartItemId }"
						var="remove"></c:url>
					<td><a href="${remove }" class="label label-danger pull-left">
					<c:set var="grandTotal" value="${cartItem.totalPrice + grandTotal }"></c:set> 
					<span class="glyphicon glyphicon-remove"></span>Remove</a>
					</td>
					
				</tr>
				<tr>
				<td colspan="5" style="text-align:right;font-size: 24px;">
				<br>
				<h4>
				Grand Total  : &#8377; ${grandTotal }</h4>
				</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
		</div>
		
		<div class="row" style="width:70%; margin:0px auto;">
		<c:url value="/cart/clearcart/${cart.id }" var="clear"></c:url>
		<a href="${clear }" class="btn btn-danger pull-left"> 
		<span class="glyphicon glyphicon-remove-sign"></span> Clear Cart
		</a> 
		<a href="<c:url value="/cart/shippingaddressform/${cart.id }"></c:url>"
			class="btn btn-success pull-right"> 
			<span class="glyphicon glyphicon-shopping-cart"></span> Check Out
		</a>
		</div>

</div>
<div class="row" style="width:70%; margin:0px auto;">
<br><br><br><br>
	<c:url value="/all/product/getallproducts" var="url1"></c:url>
	<p align="center" style="font-size:37px; font-family:Kaushan Script;"><a href="${url1 }"><u>Back to product list</u></a></p>
		</div>
</body>
</html>