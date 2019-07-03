<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
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
				<div class="table-responsive-sm">
				<table class="table  table-bordered">
					<thead class="text-center thead-dark">
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
									<img  src="data:image/jpg;base64,${book.base64Image}" style="width: 100px; height: 150px;"/>
								</td>
								
								<td>${book.title}</td>
								<td>${book.author}</td>
								<td>${book.category.name}</td>
								<td><i class="fa fa-inr"></i>${book.price}</td>
								<td><fmt:formatDate pattern='mm/dd/yyyy' value='${book.lastUpdateTime}'/></td>
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
	</div>

	<!-- Container ends here  -->
</body>
<script type="text/javascript">

	$(document).ready(function(){
		$(".deleteLink").each(function(){
			$(this).on("click",function(){
				bookId = $(this).attr("id");
				if(confirm('Are you sure you want to delete the book with Id: '+bookId)){
					window.location = 'delete_book?id=' + bookId;
				}
			})
		})
	});
</script>
<jsp:directive.include file = "footer.jsp"/>
</html>