<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Products</title>
<script>
	$(document).ready(function() {
		var searchCondition = '${searchCondition}';
		$('.table').DataTable({
			"lengthMenu" : [ [ 5, 7, 9, -1 ], [ 5, 7, 9, "All" ] ],
			"oSearch" : {
				"sSearch" : searchCondition
			}
		})
	});
</script>
</head>
<body>
<br>
<br>
<br>
<br>
	<p align="center" valign="top" width="620" style="font-size: 37px; color: purple; font-family:Kaushan Script;">
	List of Products</p>
	<br><br>
	<div class="container">
		<table class="table table-striped">
			<thead>
				<tr>
					<th>Image</th>
					<th>Product Name</th>
					<th>Category</th>
					<th>Price</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${products }" var="p">
					<c:url value="/images/${p.id }.jpg" var="imageUrl"></c:url>
					<c:url value="/all/product/viewproduct/${p.id }" var="viewUrl"></c:url>
					<c:url value="/admin/product/deleteproduct/${p.id }"
						var="deleteUrl"></c:url>
					<tr>
						<td><img src="${imageUrl }" height="50" width="50"></td>
						<td><a href="${viewUrl }">${p.productName }</a></td>
						<td>${p.category.categoryName }</td>
						<td>${p.price }</td>
						<td><a href="${viewUrl }"><span
								class="glyphicon glyphicon-info-sign"></span></a> <security:authorize
								access="hasRole('ROLE_ADMIN')">
								<a href="${deleteUrl }"><span
									class="glyphicon glyphicon-trash"></span></a>
								<c:url value="/admin/product/geteditform/${p.id }" var="editUrl"></c:url>
								<a href="${editUrl }"><span
									class="glyphicon glyphicon-pencil"></span></a>
							</security:authorize></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

</body>
</html>