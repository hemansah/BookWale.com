<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Results for ${keyword}</title>

<jsp:directive.include file="links.jsp" />
<jsp:directive.include file="scripts.jsp" />

</head>
<body>
	<jsp:directive.include file="header.jsp" />
	<div class="conatiner-fluid">

		<div class="row">
			<div class="col-sm-12">
				<c:if test="${fn:length(result) == 0 }">
					<h2>
						No result found for "
						<c:out value="${keyword}"></c:out>
						"
					</h2>
				</c:if>
			</div>
		</div>

		<c:if test="${fn:length(result) > 0 }">

			<div class="row my-3">
				<div class="col-12">
					<center>
						<h3 class="new-books">
							<span> Results for "<c:out value="${keyword }"></c:out> "
							</span>
						</h3>
					</center>
				</div>
			</div>


			<c:forEach items="${result}" var="book">
				<div class="row my-4">
					<div class="col-sm-2 mx-5">
						
							<img class="img-thumbnail"
								src="data:image/jpg;base64,${book.base64Image}"
								style="width: 250px; height: 300px;" />
					</div>

					<div class="col-sm-6 mx-2">
						<h3>
							<b><c:out value="${book.title}"></c:out></b>
						</h3>
						<p>Rating *****</p>
						<p><i>by <c:out value="${book.author}"></c:out></i></p>
						<p style="text-align: justify;">${book.description}</p>
					</div>
					
					<div class="col-sm-2 mx-2">
						<h3><i class="fa fa-inr"></i>${book.price}</h3>
						<button class="btn btn-outline-warning my-3">Add to Cart</button>
					</div>
					
				</div>
				
				<div class="row">
					<p><hr style="height:1px; border:none; color:#000; background-color:#000; width:80%;  margin: 0 auto 0 auto;"></p>
				</div>
				
			</c:forEach>

		</c:if>

	</div>
</body>
<jsp:directive.include file="footer.jsp" />
</html>