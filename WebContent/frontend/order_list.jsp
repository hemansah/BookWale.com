<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>My Orders - Bookwale </title>
<jsp:directive.include file="links.jsp" />
<jsp:directive.include file="scripts.jsp" />
</head>
<body>
	<jsp:directive.include file="header.jsp" />
	<div class="container-fluid">

		<div class="row">
			<div class="col-12 my-2" align="center">
				<h3>My Order History</h3>
			</div>
		</div>
		
		<c:if test="${fn:length(listOrders)==0 }">
			<h3>You haven't placed any order.</h3>
		</c:if>
		


	<c:if test="${fn:length(listOrders) > 0 }">
		<div class="row">
			<div class="col-10 my-5 offset-1">
				<div class="table-responsive-sm">
					<table class="table ml-auto table-bordered ">
						<thead class="text-center thead-dark">
							<th>Index</th>
							<th>Order ID</th>
							<th>Quantity</th>
							<th>Total Amount</th>
							<th>Order Date</th>
							<th>Status</th>
							<th>Actions</th>
						</thead>

						<tbody class="text-center">
							<c:forEach var="order" items="${listOrder}" varStatus="status">
								<tr>
									<td>${status.index + 1}</td>
									<td>${order.orderId}</td>
									<td>${order.bookCopies} </td>
									<td>${order.total}</td>
									<td>${order.orderDate}</td>
									<td>${order.status}</td>
									
									
									<td>
									<a href="show_order_detail?id=${order.orderId}"><button
												class="btn btn-outline-secondary">View Details</button></a>
									
								</tr> 
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		</c:if>
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