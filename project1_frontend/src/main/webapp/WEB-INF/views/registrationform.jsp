<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SIGN UP PAGE</title>
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

<p align="center" valign="top" width="620" style="font-size: 37px; font-family:Kaushan Script; color: purple; ">
	<strong>SIGN UP</strong></p>
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
		        <c:url value="/all/savecustomer" var="url"></c:url>
	           	<form:form action="${url }" modelAttribute="customer">
	           	
	           	<h3><b style="font-size: 27px; font-family:Kaushan Script; color: green;">Enter Details</b></h3><br>
		
                <div class="form-group">
					<form:label path="firstname">Enter First Name</form:label>
					<form:input path="firstname" class="form-control" placeholder="Enter First Name" pattern="^[a-zA-Z]+$"/>
					<form:errors path="firstname" cssStyle="color:red"></form:errors>
				</div>

				<div class="form-group">
					<form:label path="lastname">Enter Last Name</form:label>
					<form:input path="lastname" class="form-control" placeholder="Enter Last Name" pattern="^[a-zA-Z]+$"/>
					<form:errors path="lastname" cssStyle="color:red"></form:errors>
				</div>

				<div class="form-group">
					<form:label path="email">Enter Email</form:label>
					<form:input path="email" class="form-control"
						placeholder="Enter Email"
						pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" />
					<form:errors path="email" cssStyle="color:red"></form:errors>
					<p style="color: red">${duplicateEmail }</p>
				</div>

				<div class="form-group">
					<form:label path="phone">Enter Mobile Number</form:label>
					<form:input path="phone" class="form-control"
						placeholder="Enter Mobile Number" pattern="[789]\d{9}" />
					<form:errors path="phone" cssStyle="color:red"></form:errors>
				</div>


				<div class="form-group">
					<form:label path="user.username">Enter User Name</form:label>
					<form:input path="user.username" class="form-control" placeholder="Enter Username"/>
					<form:errors path="user.username" cssStyle="color:red"></form:errors>
					<p style="color: red">${duplicateUsername }</p>
				</div>

				<div class="form-group">
					<form:label path="user.password">Enter Password</form:label>
					<form:input path="user.password" type="password"
						class="form-control" placeholder="Enter Password"/>
					<form:errors path="user.password" cssStyle="color:red"></form:errors>
				</div>
				<br><br>

			<h3><b style="font-size: 27px; font-family:Kaushan Script; color: green;">Billing Address</b></h3><br>
				<div class="form-group">
					<form:label path="billingAddress.streetname">Enter Street Name</form:label>
					<form:input path="billingAddress.streetname" class="form-control" placeholder="Enter Street Name"/>
					<form:errors path="billingAddress.streetname" cssStyle="color:red"></form:errors>
				</div>

				<div class="form-group">
					<form:label path="billingAddress.apartmentnumber">Enter Apartment Number</form:label>
					<form:input path="billingAddress.apartmentnumber"
						class="form-control" placeholder="Enter Apartment Number"/>
					<form:errors path="billingAddress.apartmentnumber"
						cssStyle="color:red"></form:errors>
				</div>

				<div class="form-group">
					<form:label path="billingAddress.city">Enter City</form:label>
					<form:input path="billingAddress.city" class="form-control" placeholder="Enter City" pattern="^[a-zA-Z]+$"/>
					<form:errors path="billingAddress.city" cssStyle="color:red"></form:errors>
				</div>

				<div class="form-group">
					<form:label path="billingAddress.state">Enter State</form:label>
					<form:input path="billingAddress.state" class="form-control" placeholder="Enter State" pattern="^[a-zA-Z]+$"/>
					<form:errors path="billingAddress.state" cssStyle="color:red"></form:errors>
				</div>

				<div class="form-group">
					<form:label path="billingAddress.country">Enter Country</form:label>
					<form:input path="billingAddress.country" class="form-control" placeholder="Enter Country" pattern="^[a-zA-Z]+$"/>
					<form:errors path="billingAddress.country" cssStyle="color:red"></form:errors>
				</div>

				<div class="form-group">
					<form:label path="billingAddress.zipcode">Enter Zip Code</form:label>
					<form:input path="billingAddress.zipcode" class="form-control" placeholder="Enter Zip Code" pattern="^[0-9]+$"/>
					<form:errors path="billingAddress.zipcode" cssStyle="color:red"></form:errors>
				</div>
				<br><br>
				
			<h3><b style="font-size: 27px; font-family:Kaushan Script; color: green;">Shipping Address</b></h3><br>
				<div class="form-group">
					<form:label path="shippingAddress.streetname">Enter Street Name</form:label>
					<form:input path="shippingAddress.streetname" class="form-control" placeholder="Enter Street Name"/>
					<form:errors path="shippingAddress.streetname" cssStyle="color:red"></form:errors>
				</div>

				<div class="form-group">
					<form:label path="shippingAddress.apartmentnumber">Enter Apartment Number</form:label>
					<form:input path="shippingAddress.apartmentnumber"
						class="form-control" placeholder="Enter Apartment Number"/>
					<form:errors path="shippingAddress.apartmentnumber"
						cssStyle="color:red"></form:errors>
				</div>

				<div class="form-group">
					<form:label path="shippingAddress.city">Enter City</form:label>
					<form:input path="shippingAddress.city" class="form-control" placeholder="Enter City" pattern="^[a-zA-Z]+$"/>
					<form:errors path="shippingAddress.city" cssStyle="color:red"></form:errors>
				</div>

				<div class="form-group">
					<form:label path="shippingAddress.state">Enter State</form:label>
					<form:input path="shippingAddress.state" class="form-control" placeholder="Enter State" pattern="^[a-zA-Z]+$"/>
					<form:errors path="shippingAddress.state" cssStyle="color:red"></form:errors>
				</div>

				<div class="form-group">
					<form:label path="shippingAddress.country">Enter Country</form:label>
					<form:input path="shippingAddress.country" class="form-control" placeholder="Enter Country" pattern="^[a-zA-Z]+$"/>
					<form:errors path="shippingAddress.country" cssStyle="color:red"></form:errors>
				</div>

				<div class="form-group">
					<form:label path="shippingAddress.zipcode">Enter Zip Code</form:label>
					<form:input path="shippingAddress.zipcode" class="form-control" placeholder="Enter Zip Code" pattern="^[0-9]+$"/>
					<form:errors path="shippingAddress.zipcode" cssStyle="color:red"></form:errors>
				</div>
									
									<div class="form-group">
										<div class="col-xs-offset-3 col-md-8 col-sm-9">
											<span class="text-muted"><span class="label label-danger">Note:-</span> By clicking Sign
												Up, you agree to our <a href="#">Terms</a> and that you have
												read our <a href="#">Policy</a>, including our <a href="#">Cookie
													Use</a>.</span>
										</div>



									<div class="form-group">
										<div class="row">
											<div class="col-sm-6 col-sm-offset-3">
												<button class="btn btn-lg btn-primary btn-block"
													type="submit">Sign up</button>
											</div>
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
<%@ include file="footer.jsp"%>
</body>
</html>