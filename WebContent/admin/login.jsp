<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Login</title>
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
	<div class="container-fluid center_div">
		<div class="row my-5" align="center">
			<div class="col-10">
				<h1>BookWale Administration</h1>
				<h2>Admin Login here</h2>

				<c:if test="${message!=null}">
					<div class="row">
						<div class="col-12 my-2" align="center">
							<h3 class="text-danger bg-light">${message}</h3>
						</div>
					</div>
				</c:if>
				
				<form action="login" method="post" id="loginform">
					<input class="form-control my-4" type="text" id="email"
						name="email" placeholder="Login id" /> <input class="form-control"
						type="password" id="password" name="password"
						placeholder="Password" /><br>
					<button type="submit" class="btn btn-primary">Login</button>
				</form>
			</div>
		</div>
	</div>
</body>

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