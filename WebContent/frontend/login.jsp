<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Customer Login</title>
<jsp:directive.include file="links.jsp" />
<jsp:directive.include file="scripts.jsp" />
<style type="text/css">
.center_div {
	margin: 0 auto;
	width: 40%
}
</style>
</head>
<body>
<jsp:directive.include file="header.jsp" />
	<div class="d-flex h-100 my-5">
		<div class="m-auto">
			
			<div class="form-group text-center">
				<h3>Customer Login</h3>
			</div>
			<c:if test="${message!=null}">

				<div class="form-group">
					<h3 class="text-danger bg-light">${message}</h3>
				</div>
			</c:if>

			<form action="login" method="post" id="loginform"
				class=" justify-content-center">
				<div class="form-group">
					<input class="form-control my-4" type="text" id="email"
						name="email" placeholder="Login id" />
				</div>
				<div class="form-group">
					<input class="form-control" type="password" id="password"
						name="password" placeholder="Password" /><br>
				</div>
				<div class="form-group text-center">
					<button type="submit" class="btn btn-primary">Login</button>
				</div>
			</form>
		</div>
	</div>

</body>
<jsp:directive.include file="footer.jsp" />
<script type="text/javascript">
	$(document).ready(function() {
		$("#loginform").validate({
			rules : {
				email : {
					required : true,
					email : true
				},
				password : "required",
			},

			message : {
				email : {
					required : "Please enter email id",
					email : "Please enter valid email id"
				},
				password : "Please enter password"
			}
		});

	});
</script>
</html>

