<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Manage Reviews - Bookwale Administration</title>
<jsp:directive.include file="links.jsp" />
<jsp:directive.include file="scripts.jsp" />
</head>
<body>
	<jsp:directive.include file="header.jsp" />
	<div class="container-fluid">

		<div class="row">
			<div class="col-12 my-2" align="center">
				<h3>Review Management</h3>
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
					<table class="table ml-auto table-bordered ">
						<thead class="text-center thead-dark">
							<th>Index</th>
							<th>ID</th>
							<th>Book</th>
							<th>Rating</th>
							<th>Headline</th>
							<th>Customer</th>
							<th>Review On</th>
							<th>Actions</th>
						</thead>

						<tbody class="text-center">
							<c:forEach var="review" items="${listReviews}" varStatus="status">
								<tr>
									<td>${status.index + 1}</td>
									<td>${review.reviewId}</td>
									<td>${review.book.title}</td>
									<td>${review.rating}</td>
									<td>${review.headline}</td>
									<td>${review.customer.fullname}</td>
									<td>${review.reviewTime}</td>
									<td><a href="edit_review?id=${review.reviewId}"><button
												class="btn btn-outline-secondary">Edit</button></a> <a
										href="javascript:void(0)" class="deleteLink"
										id="${review.reviewId}"><button
												class="btn btn-outline-danger">Delete</button></a></td>
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
	$(document)
			.ready(
					function() {
						$(".deleteLink")
								.each(
										function() {
											$(this)
													.on(
															"click",
															function() {
																categoryId = $(
																		this)
																		.attr(
																				"id");
																if (confirm('Are you sure you want to delete the category with Id: '
																		+ categoryId)) {
																	window.location = 'delete_category?id='
																			+ categoryId;
																}
															})
										})
					});
</script>
<jsp:directive.include file="footer.jsp" />
</html>