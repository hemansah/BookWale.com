<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Home-BookWale</title>

<jsp:directive.include file="links.jsp" />
<jsp:directive.include file="scripts.jsp" />

</head>
<body>
	

	<div class="container-fluid">
		<jsp:directive.include file="header.jsp" />
		
		<div class="row">
			<div class="col-12 fancy">
				<hr style="width: 100%; display: block; border-width: 2px; background-color: black; color: black;">
			</div>
		</div>
		
		<div class="row my-3 ">
			<div class="col-12">
				<h3 class="new-books form-group text-center fancy">
					<span> New Books</span>
				</h3>
			</div>
		</div>


		<div class="row my-4">

			<c:forEach items="${listNewBooks}" var="book">
				<jsp:directive.include file="book_group.jsp" />
			</c:forEach>
		</div>
		
		<div class="row">
			<div class="col-12 fancy">
				<hr style="width: 100%; display: block; border-width: 2px; background-color: black; color: black;">
			</div>
		</div>

		<div class="row my-3 ">
			<div class="col-12">
				<h3 class="new-books form-group text-center fancy">
					<span> Best Selling Books</span>
				</h3>
			</div>
		</div> 

		
		<div class="row my-4">

			<c:forEach items="${listBestSellingBooks}" var="book">
				<jsp:directive.include file="book_group.jsp" />
			</c:forEach>
		</div>
		
		<div class="row">
			<div class="col-12 fancy">
				<hr style="width: 100%; display: block; border-width: 2px; background-color: black; color: black;">
			</div>
		</div>

		<div class="row my-3 ">
			<div class="col-12">
				<h3 class="new-books form-group text-center fancy">
					<span> Most Favored Books</span>
				</h3>
			</div>
		</div> 
		
		
		<div class="row my-4"">
			<c:forEach items="${listFavoredBooks}" var="book">
				<jsp:directive.include file="book_group.jsp" />
			</c:forEach>
		</div>
		
		<div class="row">
			<div class="col-12 fancy">
				<hr style="width: 100%; display: block; border-width: 2px; background-color: black; color: black;">
			</div>
		</div>

	</div>
	

	
</body>
<jsp:directive.include file="footer.jsp" />
</html>