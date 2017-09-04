<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="header.jsp" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Order Details</title>
<style>
strong{
color:blue;
font-family: "Kaushan Script";
}
p{
font-family: "Kaushan Script";
}
.f{
font-family: "Kaushan Script";
}
.page-header{
margin-top: 1px;
text-align: center;
color: black;

}
</style>
</head>
<body>
<%@ include file="header.jsp"%>
<br>
<br>
<br>
	<jsp:useBean id="now" class="java.util.Date" />
	<div class="container-wrapper">
		<div class="container">
			<div class="page-header">
			<br>
				<p class="lead" style="font-size: 37px; color: purple; font-family:Kaushan Script;">Order Confirmation</p>
			</div>

			<div class="container">
				<c:url value="/cart/confirm/${cartid }" var="url"></c:url>
				<form:form action="${url }" modelAttribute="order">
					<div class="row">

						<div class="well col-xs-10 col-sm-10 col-md-6 col-xs-offset-1 col-sm-offset-1 col-md-offset-3">
							<div class="txt-center">
								<p style="font-size: 27px; color: green; font-family:Kaushan Script;">Summary</p>
							</div>
							ORDER ID: ${order.orderId }
							<br>
							Order Date:
								<fmt:formatDate type="date" value="${now}" />
								

							<div class="row">
								<div class="col-xs-6 col-sm-6 col-md-6">
								<br><address>
										<strong>Shipping Address</strong><br />
										${order.cart.customer.shippingAddress.streetname} <br />
										${order.cart.customer.shippingAddress.city},
										${order.cart.customer.shippingAddress.state} <br />
										${order.cart.customer.shippingAddress.country},
										${order.cart.customer.shippingAddress.zipcode}
									</address>
								</div>
								
							</div>

							<div class="row">
								<div class="col-xs-6 col-sm-6 col-md-6">
									<address>
										<strong>Billing Address</strong><br />
										${order.cart.customer.billingAddress.streetname} <br />
										${order.cart.customer.billingAddress.city},
										${order.cart.customer.billingAddress.state} <br />
										${order.cart.customer.billingAddress.country},
										${order.cart.customer.billingAddress.zipcode}
									</address>
								</div>
							</div>

							<div class="row">
								<table class="table table-hover">
									<thead>
										<tr>
											<td>Product</td>
											<td>Quantity</td>
											<td class="text-center">Price</td>
											<td class="text-center">Total</td>
										</tr>
									</thead>
									<tbody>
										<c:set var="grandTotal" value="0.0"></c:set>
										<c:forEach var="cartItem" items="${order.cart.cartItems}">
											<tr>
											    <c:url value="/images/${cartItem.product.id}.jpg" var="image"></c:url>
												<td class="col-md-7" class ="f"><img src="${image}" height="50" width="50" />${cartItem.product.productName}</td>
												<td class="col-md-1" class ="f" style="text-align: center">${cartItem.quantity}</td>
												<td class="col-md-2" class ="f" style="text-align: center">&#8377; ${cartItem.product.price}</td>
												<td class="col-md-2" class ="f" style="text-align: center">${cartItem.totalPrice}</td>
												<c:set var="grandTotal" value="${grandTotal + cartItem.totalPrice }"></c:set>
											</tr>
										</c:forEach>

										<tr>
											<td></td>
											<td colspan="2" class="text-center" class ="f">
													<strong>Grand Total : </strong>
											</td>
											<td class="text-center text-danger" class ="f">
													<strong>&#8377; ${grandTotal}</strong>
											</td>
										</tr>

									</tbody>
								</table>
	                           <button type="submit" class="btn btn-success center-block" >Order</button>
								
							</div>

						</div>

					</div>

				</form:form>
			</div>
		</div>
	</div>
</body>
</html>