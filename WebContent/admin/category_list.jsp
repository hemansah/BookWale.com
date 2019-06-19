<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Manage Categories - Bookwale Administration</title>
<jsp:directive.include file="links.jsp" />
<jsp:directive.include file="scripts.jsp" />
</head>
<body>
	<jsp:directive.include file="header.jsp" />
	<div class="container-fluid">
	
		<div class="row">
			<div class="col-12 my-2" align="center">
				<a href="category_form.jsp"><button class="btn btn-secondary">Create New Category</button></a>
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
						<th>Name</th>
						<th>Actions</th>
					</thead>
					
					<tbody class="text-center">
						<c:forEach var="cat" items="${listCategory}" varStatus="status">
							<tr>
								<td>${status.index + 1}</td>
								<td>${cat.categoryId}</td>
								<td>${cat.name}</td>
								<td>
									<a href="edit_category?id=${cat.categoryId}"><button class="btn btn-outline-secondary">Edit</button></a>
								    <a href="javascript:confirmDelete(${cat.categoryId })"><button class="btn btn-outline-danger">Delete</button></a> 
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
	function confirmDelete(categoryId) {
		if(confirm('Are you sure you want to delete the category with Id: '+categoryId)){
			
			window.location = 'delete_category?id=' + categoryId;
		}
	}
</script>
<jsp:directive.include file = "footer.jsp"/>
</html>