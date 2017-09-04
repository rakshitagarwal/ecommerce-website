<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Shipping Address</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
   <link href="<c:url value="/resources/css/log.css" />" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<br>
	<br>
	<br>
	<br>
<br>
<br>
	<p align="center" valign="top" width="620" style="font-size: 37px; font-family: Kaushan Script; color: purple;">Shipping Address</p>
										
	<div class="container">
		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<div class="panel panel-register">
					<div class="panel-heading">
						<div class="row">
							<div class="col-xs-6"></div>
						</div>
					</div>

					<div class="panel-body">
						<div class="row">
							<div class="col-lg-12">
								<c:url value="/cart/order/${cartid}" var="url"></c:url>
								<form:form action="${url }" modelAttribute="shippingAddress">
									<form:hidden path="id" />

									<br>

									<div class="form-group">
										<form:label path="streetname">Enter Street Name</form:label>
										<form:input path="streetname" class="form-control" placeholder="Enter Street Name"/>
										<form:errors path="streetname" cssStyle="color:red"></form:errors>
									</div>

									<div class="form-group">
										<form:label path="apartmentnumber">Enter Apartment Number</form:label>
										<form:input path="apartmentnumber" class="form-control" placeholder="Enter Apartment Number"/>
										<form:errors path="apartmentnumber" cssStyle="color:red"></form:errors>
									</div>

									<div class="form-group">
										<form:label path="city">Enter City</form:label>
										<form:input path="city" class="form-control" placeholder="Enter City" pattern="^[a-zA-Z]+$"/>
										<form:errors path="city" cssStyle="color:red"></form:errors>
									</div>

									<div class="form-group">
										<form:label path="state">Enter State</form:label>
										<form:input path="state" class="form-control" placeholder="Enter State" pattern="^[a-zA-Z]+$"/>
										<form:errors path="state" cssStyle="color:red"></form:errors>
									</div>

									<div class="form-group">
										<form:label path="country">Enter Country</form:label>
										<form:input path="country" class="form-control" placeholder="Enter Country" pattern="^[a-zA-Z]+$"/>
										<form:errors path="country" cssStyle="color:red"></form:errors>
									</div>

									<div class="form-group">
										<form:label path="zipcode">Enter Zipcode</form:label>
										<form:input path="zipcode" class="form-control" placeholder="Enter Zip Code" pattern="^[0-9]+$"/>
										<form:errors path="zipcode" cssStyle="color:red"></form:errors>
									</div>
									<div class="form-group">
										<div class="row">
											<div class="col-sm-6 col-sm-offset-3">
												<button class="btn btn-lg btn-primary btn-block" type="submit">Submit</button>
											</div>
										</div>
									</div>

								</form:form>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
</body>
</html>