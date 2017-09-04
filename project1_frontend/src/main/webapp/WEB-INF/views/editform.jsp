<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Product</title>
</head>
<body>
	<%@ include file="header.jsp"%>
	<br>
	<br>
	<br>
	<p align="center" valign="top" width="620" style="font-size: 37px; color: purple; ">
	<strong><u>Product Form</u></strong></p>
	<br><br>
	<div class="container">
		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<c:url value="/admin/product/editproduct" var="url"></c:url>
				<form:form action="${url }" modelAttribute="productObj"
					enctype="multipart/form-data">
					<div class="form-group">
						<form:hidden path="id" class="form-group" />
						<div>
							<div class="form-group">
								<b>Product Name :</b>
								<form:input path="productName" class="form-control" />
							</div>
							<br>
							<div class="form-group">
								<b>Product Price :</b>
								<form:input path="price" class="form-control" />
							</div>
							<br>
							<div class="form-group">
								<b>Quantity :</b>
								<form:input path="quantity" class="form-control" />
							</div>
							<br>
							<div class="form-group">
								<b>Description :</b>
								<form:textarea path="description" class="form-control" />
							</div>
							<br>
							<div class="form-group">
								<b>Category :</b>
								<c:forEach items="${categories }" var="c">
									<form:radiobutton path="category.id" value="${c.id }" />${c.categoryName }
					</c:forEach>
							</div>
							<div class="form-group">
								<b>Upload an Image :</b><input type="file" name="image">
							</div><br>
							<div class="form-group">
								<input type="submit" value="Edit Product">
							</div>
						</div>
					</div>
				</form:form>
			</div>
		</div>
	</div>
<%@ include file="footer.jsp"%>
</body>
</html>