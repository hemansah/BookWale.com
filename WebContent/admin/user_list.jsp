<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Manage Users - Bookwale Administration</title>
<jsp:directive.include file="links.jsp" />
<jsp:directive.include file="scripts.jsp" />

</head>
<body>
	<jsp:directive.include file="header.jsp" />
	<div class="container-fluid">
	
		<div class="row">
			<div class="col-12 my-2" align="center">
				<a href="user_form.jsp"><button class="btn btn-secondary">Create New User</button></a>
			</div>
		</div>
		
		<c:if test="${message!=null}">
		<div class="row">
			<div class="col-12 my-2" align="center">
				<h3 class="text-success bg-light">${message}</h3>
			</div>
		</div>
		</c:if>
		
		
		<div class="row">
			<div class="col-10 my-5 offset-1">
				<table class="table ml-auto table-bordered">
					<thead class="text-center">
						<th>Index</th>
						<th>ID</th>
						<th>Email</th>
						<th>Full Name</th>
						<th>Actions</th>
					</thead>
					
					<tbody class="text-center">
						<c:forEach var="user" items="${listUsers}" varStatus="status">
							<tr>
								<td>${status.index + 1}</td>
								<td>${user.userId}</td>
								<td>${user.email}</td>
								<td>${user.fullName}</td>
								<td>
									<a href="edit_user?id=${user.userId}"><button class="btn btn-outline-info">Edit</button></a>
									<a href="javascript:confirmDelete(${user.userId })"><button class="btn btn-outline-danger">Delete</button></a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>

	<!-- Container ends here  -->
</body>
<script type="text/javascript">
	function confirmDelete(userId) {
		if(confirm('Are you sure you want to delete the user with Id: '+userId)){
			
			window.location = 'delete_user?id=' + userId;
		}
	}
</script>
<jsp:directive.include file = "footer.jsp"/>
</html>