<%-- <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/format" %> --%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Manage Orders - Bookwale Administration</title>
<jsp:directive.include file="links.jsp" />
<jsp:directive.include file="scripts.jsp" />
</head>
<body>
	<jsp:directive.include file="header.jsp" />
	<div class="container-fluid">

		<div class="row">
			<div class="col-12 my-2" align="center">
				<h3>Book Order Management</h3>
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
							<th>Order ID</th>
							<th>Ordered By</th>
							<th>Book Copies</th>
							<th>Total</th>
							<th>Payment Method</th>
							<th>Status</th>
							<th>Order Date</th>
							<th>Actions</th>
						</thead>

						<tbody class="text-center">
							<c:forEach var="order" items="${listOrder}" varStatus="status">
								<tr>
									<td>${status.index + 1}</td>
									<td>${order.orderId}</td>
									<td>${order.customer.fullname}</td>
									<td>${order.bookCopies} </td>
									<td>${order.total}</td>
									<td>${order.paymentMethod}</td>
									<td>${order.status}</td>
									<td>${order.orderDate}</td>
									
									
									<td>
									<a href="view_order?view_id=${order.orderId}"><button
												class="btn btn-outline-secondary">Details</button></a>
									<a href="edit_review?id=${review.reviewId}"><button
												class="btn btn-outline-secondary">Edit</button></a> 
									<a href="javascript:void(0)" class="deleteLink" id="${review.reviewId}"><button
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

	$(document).ready(function(){
		$(".deleteLink").each(function(){
			$(this).on("click",function(){
				reviewId = $(this).attr("id");
				if(confirm('Are you sure you want to delete the review with Id: '+reviewId)){
					window.location = 'delete_review?id=' + reviewId;
				}
			})
		})
	});
</script>
<jsp:directive.include file="footer.jsp" />
</html>