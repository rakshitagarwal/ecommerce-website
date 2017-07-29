<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="header.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div>
<div>
<a href="/clearcart/${cart.id }" class="btn btn-danger" pull-left >
<span class="glyphicon glyphicon-remove-sign"></span>
Clear Cart
</a>

<a href="<c:url value="/order/${cart.id}"></c:url>" class="btn btn-success pull-right"><span class="glyphicon glyphicon-remove-sign"></span>Check Out</a>
<table class="table table-striped">
<thead>
<tr><th>Name</th><th>Quantity</th><th>Total Price</th><th>Remove</th></tr>
</thead>
<c:set var="grandTotal" value="0" ></c:set>
<c:forEach items="${cart.cartItems }" var="cartItem">
<tr>
<td>${cartItem.product.productName}</td>
<td>${cartItem.quantity}</td>
<td>${cartItem.totalPrice}</td>
<td><a href="/removecartitem/${cartItem.cartItemId }" class="label label-danger" pull-left>
<c:set var="grandTotal" value="${cartItem.totalPrice + grandTotal}" ></c:set>
<span class="glyphicon glyphicon-remove"></span>Remove
</a></td>
<td></td>

</tr>
</c:forEach>
</table>
Total Price : ${grandTotal}
</div>
</div>
</body>
<%@include file="footer.jsp" %>
</html>