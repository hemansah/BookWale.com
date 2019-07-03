<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Books in ${category.name} - Online Book Store</title>

<jsp:directive.include file="links.jsp" />
<jsp:directive.include file="scripts.jsp" />

</head>

<body>
	<jsp:directive.include file="header.jsp" />

	<div class="container-fluid">
	<div class="row">
		<div class="col-12 ">
			
			<h3 class="category-name"><c:out value="${category.name}"></c:out></h3>
		
		</div>
	</div>
	
	
	
		<div class="row my-5 mx-auto">
			
			<c:forEach items="${listBooks}" var="book">
				
					
					<div class="col-sm-2 ">
						<div class="card">
							<img class="card-img-top img-thumbnail"
								src="data:image/jpg;base64,${book.base64Image}"
								style="width: 220px; height: 210px;" />
							<div class="card-body">
								<p class="card-text"
									style="width: 160px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">
									<b><c:out value="${book.title}"></c:out></b></br> <i>by <c:out
											value="${book.author}"></c:out></i></br> <i class="fa fa-inr"></i>
									<c:out value="${book.price}">
									</c:out>
								</p>
								<a href="view_book?id=${book.bookId}" class="stretched-link"></a>
							</div>
						</div>
					</div>
				
			</c:forEach>
			
		</div>
	</div>




</body>
<jsp:directive.include file="footer.jsp" />
</html>