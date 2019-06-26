<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Manage Books - Bookwale Administration</title>
<jsp:directive.include file="links.jsp" />
<jsp:directive.include file="scripts.jsp" />

</head>
<body>
	<jsp:directive.include file="header.jsp" />
	<div class="container-fluid">
	
		<div class="row">
			<div class="col-12 my-2" align="center">
				<a href="new_book"><button class="btn btn-secondary">Add New Book</button></a>
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
						<th>Image</th>
						<th>Title</th>
						<th>Author</th>
						<th>Category</th>
						<th>Price</th>
						<th>Last Updated</th>
						<th>Actions</th>
						
					</thead>
					
					<tbody class="text-center">
						<c:forEach var="book" items="${listBooks}" varStatus="status">
							<tr>
								<td>${status.index + 1}</td>
								<td>${book.bookId}</td>
								
								<td>
									<img  src="data:image/jpg;base64,${book.base64Image}"/>
								</td>
								
								<td>${book.title}</td>
								<td>${book.author}</td>
								<td>${book.category.name}</td>
								<td>${book.price}</td>
								<td>${book.lastUpdateTime}</td>
								<td>
									<a href="edit_book?id=${book.bookId}"><button class="btn btn-outline-info">Edit</button></a>
									<a href="javascript:void(0);" id="${book.bookId}" class="deleteLink"><button class="btn btn-outline-danger">Delete</button></a>
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

	$(document).ready(function(){
		$(".deleteLink").each(function(){
			$(this).on("click",function(){
				userId = $(this).attr("id");
				if(confirm('Are you sure you want to delete the user with Id: '+userId)){
					window.location = 'delete_user?id=' + userId;
				}
			})
		})
	});
</script>
<jsp:directive.include file = "footer.jsp"/>
</html>