<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Create New Customer</title>
<jsp:directive.include file="links.jsp" />
<jsp:directive.include file="scripts.jsp" />

</style>
</head>
<body>
	<jsp:directive.include file="header.jsp" />
	<div class="container-fluid">
		<div class="d-flex h-100">
			<div class="m-auto">
				<div class="form-group my-2 text-center">
					<h3>
						<c:if test="${customer != null}">
							Edit Customer
						</c:if>

						<c:if test="${customer== null}">
							Add New Customer
						</c:if>
					</h3>
				</div>

				<c:if test="${customer != null }">
					<form action="update_customer" method="post" id="customerform">
						<div class="form-group">
							<input type="hidden" name="customerId" value="${customer.customerId}" />
						</div>
				</c:if>
				<c:if test="${customer == null }">
					<form action="create_customer" method="post" id="customerform">
				</c:if>


				<div class="form-group">
					<input type="text" class="form-control my-2" name="email"
						id="email" value="${customer.email}"
						placeholder="Enter email of the customer" />
						
					 <input type="text"
						class="form-control" name="fullName" id="fullName"
						value="${customer.fullname}" placeholder="Enter Fullname" />

					<input type="password" class="form-control my-2" name="password"
						id="password" value="${customer.password}"
						placeholder="Enter Password" />
					
					<input type="password" class="form-control" name="confirmPassword"
						id="confirmPassword" value="${customer.password}"
						placeholder="Confirm Password" /> 
					
					<input type="text"
						class="form-control my-2" name="phone" id="phone"
						value="${customer.phone}" placeholder="Enter Phone number" /> 
					
					<input
						type="text" class="form-control my-2" name="address" id="address"
						value="${customer.address}" placeholder="Enter Address" /> 
						
					<input
						type="text" class="form-control my-2" name="city" id="city"
						value="${customer.city}" placeholder="Enter City" /> 
						
					<input
						type="text" class="form-control my-2" name="zipCode" id="zipCode"
						value="${customer.zipcode}" placeholder="Enter Zipcode" /> 
					
					<input
						type="text" class="form-control my-2" name="country" id="country"
						value="${customer.country}" placeholder="Enter Country" />
				</div>

				<div class="form-group text-center" >
					<input value="Save" class="btn btn-primary" type="submit" />
					<button type="" class="btn btn-danger" id="buttonCancel">Cancel</button>
				</div>
				</form>
			</div>
		</div>

	</div>
</body>
<jsp:directive.include file="footer.jsp" />
<script>
$(document).ready(function(){

	$("#customerform").validate({
		rules : {
			email : {
				required : true,
				email : true,
			},
			fullName : "required",
			password : "required",
			confirmPassword :  {
				required : true,
				equalTo : "#password",
				
			},
			phone : "required",
			address : "required",
			city : "required",
			zipCode : "required",
			country : "required",
			
		},
		
		message : {	
			email : {
					required : "Please enter email address",
					email : "Please enter a valid email address"
			},
			fullName : "Please enter full name",
			password : "Please enter  password",
			confirmPassword : {
				required : true,
				equalTo : "Password doesn't match"
			},
			phone : "Please enter phone number",
			address : "Please enter address",
			city : "Please enter city",
			zipCode : "Please enter zipcode",
			country : "Please enter country",
		}
	});
	
	$("#buttonCancel").click(function(){
		history.go(-1);
	})
});

	
</script>
</html>