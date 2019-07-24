<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>${book.title}-Online Book Store</title>

<jsp:directive.include file="links.jsp" />
<jsp:directive.include file="scripts.jsp" />

</head>
<body>
	<jsp:directive.include file="header.jsp" />

	<div class="container-fluid">

		<div class="row my-2">
			<div class="col-sm-4 mx-5">
				<h3>
					<c:out value="${book.title}"></c:out>
				</h3>
				<p>by ${book.author}</p>
			</div>
		</div>

		<div class="row my-4">
			<div class="col-sm-4 mx-5">
				<img class="card-img-top img-thumbnail"
					src="data:image/jpg;base64,${book.base64Image}"
					style="width: 350px; height: 450px;" />
			</div>

			<div class="col-sm-4 my-3">
				<p><jsp:directive.include file="book_rating.jsp" /> <a href="#reviews"> ${fn:length(book.reviews)}Reviews</a> </p>
				<p style="text-align: justify;">${book.description}</p>

			</div>

			<div class="col-sm-2 ml-5 my-5">
				<h3>
					<i class="fa fa-inr">&nbsp</i>
					<c:out value="${book.price}"></c:out>
				</h3>
				<button class="btn btn-outline-warning my-3">Add to Cart</button>
			</div>
		</div>

		<div class="row">
			<div class="col-sm-10 offset-1" style="display: inline-block;">
				<h4> <a id="reviews">Customer Reviews</a> </h4>
				<button class="btn btn-outline-info my-3" id="buttonWriteReview">Write a customer
					review</button>
			</div>
		</div>
		
		

		<div class="row">
			<c:forEach items="${book.reviews }" var="review">
			<div class="col-10 offset-1">
				
					<c:forTokens items="${review.stars}" delims="," var="star">
						<c:if test="${star eq 'on'}">
							<img alt="" src="images/rating-on.png">
						</c:if>

						<c:if test="${star eq 'off'}">
							<img alt="" src="images/rating-off.png">
						</c:if>
					</c:forTokens>
					
					<b><c:out value="${review.headline}"></c:out></b>
					<p>by <c:out value="${review.customer.fullname }"></c:out> on <c:out value="${review.reviewTime }"></c:out></p>
					<p><i><c:out value="${review.comment }"></c:out></i></p>
				
			</div>
			</c:forEach>
		</div>

	</div>

</body>
<jsp:directive.include file="footer.jsp" />
<script type="text/javascript">
 		$(document).ready(function() {
 			$("#buttonWriteReview").click(function() {
 				window.location = 'write_review?book_id=' +${book.bookId}; 
 			});
 		});
</script>
</html>