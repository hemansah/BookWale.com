<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Edit Customer Profile</title>
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
					<h3>Edit My Profile</h3>
				</div>



				<form action="update_profile" method="post" id="customerform">



					<div class="form-group">
						<input type="text" class="form-control my-2" name="email"
							id="email" placeholder="Enter email of the customer" disabled="disabled"  value="${loggedCustomer.email }"/> 
							<input
							type="text" class="form-control" name="fullName" id="fullName"
							placeholder="Enter Fullname" value="${loggedCustomer.fullname }" /> 
							
							<small><i>(Leave password fields blank if you don't want to change your password)</i></small>
							<input type="password"
							class="form-control my-2" name="password" id="password" value=""
							placeholder="Enter Password" />
							
							<input type="password"
							class="form-control" name="confirmPassword" id="confirmPassword"
							placeholder="Confirm Password" /> 
							
							<input type="text"
							class="form-control my-2" name="phone" id="phone" value="${loggedCustomer.phone }"
							placeholder="Enter Phone number" /> 
							
							<input type="text"
							class="form-control my-2" name="address" id="address" value="${loggedCustomer.address }"
							placeholder="Enter Address" /> 
							<input type="text"
							class="form-control my-2" name="city" id="city" value="${loggedCustomer.city }"
							placeholder="Enter City" /> <input type="text"
							class="form-control my-2" name="zipCode" id="zipCode" value="${loggedCustomer.zipcode }"
							placeholder="Enter Zipcode" /> 
							<input type="text"
							class="form-control my-2" name="country" id="country" value="${loggedCustomer.country }"
							placeholder="Enter Country" />
					</div>

					<div class="form-group text-center">
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
	$(document).ready(function() {

		$("#customerform").validate({
			rules : {
				email : {
					required : true,
					email : true,
				},
				fullName : "required",
			
				confirmPassword : {
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

				
				confirmPassword : {

					equalTo : "Password doesn't match"
				},
				phone : "Please enter phone number",
				address : "Please enter address",
				city : "Please enter city",
				zipCode : "Please enter zipcode",
				country : "Please enter country",
			}
		});

		$("#buttonCancel").click(function() {
			history.go(-1);
		})
	});
</script>
</html>