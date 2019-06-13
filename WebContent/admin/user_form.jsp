<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Create New User</title>
<jsp:directive.include file="links.jsp" />
<jsp:directive.include file="scripts.jsp" />
<style type="text/css">
.center_div{
 margin: 0 auto;
    width:50%
}
</style>
</head>
<body>
	<jsp:directive.include file="header.jsp" />
	<div class="container-fluid center_div">
		<div class="row">
			<div class="col-12 my-5">
				<div align="center">
					<h3 class="">Create New User</h3>
				</div>
			</div>
		</div>

		<div class="row my-3" align="center" >
			<div class="col-12" >
				<form action="create_user" method="post" onsubmit="return validateFormInput()">
					<div class="form-group">
					<input type="text" id="fullname" name="fullname" class="form-control my-2" placeholder="Enter your Full Name">
					<input type="email" id="email" name="email" class="form-control my-2" placeholder="Enter your email">
					<input type="password" id="password" name="password" class="form-control my-2" placeholder="Enter your Password">
					</div>
					<input value="Save" class="btn btn-primary" type="submit"/>
					<button type="" class="btn btn-danger" onclick="javascript:history.go(-1);">Cancel</button>
				</form>
			</div>
		</div>
	</div>
</body>

<script type="text/javascript">
		function validateFormInput() {
			var fieldEmail = document.getElementById("email");
			var fieldFullName = document.getElementById("fullname");
			var fieldPassword = document.getElementById("password");
			
			if(fieldFullName.value.length==0){
				alert("Fullname is Required");
				fieldFullName.focus();
				return false;
			}
			
			if(fieldEmail.value.length==0){
				alert("Email is Required");
				fieldEmail.focus();
				return false;
			}
			
			if(fieldPassword.value.length==0){
				alert("Password is Required");
				fieldPassword.focus();
				return false;
			}
			
			return true;
		}
</script>
</html>