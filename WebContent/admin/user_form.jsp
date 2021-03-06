<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Create New User</title>
<jsp:directive.include file="links.jsp" />
<jsp:directive.include file="scripts.jsp" />
<style type="text/css">
.center_div {
	margin: 0 auto;
	width: 50%
}
</style>
</head>
<body>
	<jsp:directive.include file="header.jsp" />
	<div class="container-fluid">
		<div class="d-flex h-100">
			<div class="m-auto">
				<div class="row">
				<div class="col-12">
				<div class="form-group my-5">
					<h3>
						<c:if test="${user != null}">
							Edit User
						</c:if>

						<c:if test="${user == null}">
							Create New User
						</c:if>
					</h3>
				</div>



				<c:if test="${user != null }">
					<form action="update_user" method="post" id="userform">
						<div class="form-group">
							<input type="hidden" name="userId" value="${user.userId }" />
						</div>
				</c:if>
				<c:if test="${user == null }">
					<form action="create_user" method="post" id="userform">
				</c:if>

				<div class="form-group">
					<input type="text" id="fullname" value="${user.fullName}"
						name="fullname" class="form-control my-2"
						placeholder="Enter your Full Name">
				</div>
				<div class="form-group">
					<input type="email" id="email" value="${user.email}" name="email"
						class="form-control my-2" placeholder="Enter your email">
				</div>
				<div class="form-group">
					<input type="password" id="password" value="${user.password }"
						name="password" class="form-control my-2"
						placeholder="Enter your Password">
				</div>
				<div class="form-group text-center">
					<input value="Save" class="btn btn-primary" type="submit" />
					<button type="" class="btn btn-danger" id="buttonCancel">Cancel</button>
				</div>
				</form>
				</div>
				</div>
			</div>
		</div>
	</div>
</body>
<jsp:directive.include file="footer.jsp" />

<script type="text/javascript">

	$(document).ready(function(){
		$("#userform").validate({
			rules : {
				email : {
					required : true,
					email : true
				},
				fullname : "required",
				password : "required"	
			},
			
			message : {
				email : {
					required : "Please enter an email",
					email : "Please enter a valid email address"
				},
				fullname : "Please enter fullname",
				<c:if test="${user == null}">
				
				password: "Please enter password"
				</c:if>	
				
			}
		});
		
		$("#buttonCancel").click(function(){
			history.go(-1);
		})
	});

</script>
</html>