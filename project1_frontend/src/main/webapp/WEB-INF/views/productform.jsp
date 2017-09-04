<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Product Form</title>
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
				<c:url var="url" value="/admin/product/saveproduct" />
				<form:form action="${url}" method="post" modelAttribute="product"
					enctype="multipart/form-data">

					<div class="form-group">
						<form:hidden path="id" class="form-control" />
					</div>

					<div class="form-group">
						<b>Enter Product Name:</b>
						<form:input path="productName" class="form-control" />
					</div>
					<br>
					<div class="form-group">
						<b>Enter Price:</b>
						<form:input path="price" class="form-control" />
					</div>
					<br>
					<div class="form-group">
						<b>Enter Quantity:</b>
						<form:input path="quantity" class="form-control" />
					</div>
					<br>
					<div class="form-group">
						<b>Enter Description:</b>
						<form:textarea path="description" class="form-control" />
					</div>
					<br>
					<div class="form-group">
						<b>Select Category:</b>
						<form:select path="category.id">
							<c:forEach items="${categories }" var="c">
								<form:option value="${c.id }">${c.categoryName }</form:option>
							</c:forEach>
						</form:select>
					</div>
					<div class="form-group">
						<b>Upload an Image :</b><input type="file" name="image">
					</div>
					<button type="submit" class="btn btn-success center-block" >Submit</button>

				</form:form>
			</div>
		</div>
	</div>
<%@ include file="footer.jsp"%>
</body>
</html>