<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Bookwale Administration</title>
<jsp:directive.include file="links.jsp" />
<jsp:directive.include file="scripts.jsp" />

</head>
<body>
	<jsp:directive.include file="header.jsp" />
	<div class="container-fluid">
		<div class="row">
			<div class="col-12" align="center">
				<div class="card">
					<div class="card-body">
						<h6 class="card-title">Quick Actions</h6>
						<a href="new_book" class="card-link">New Book</a>&nbsp;&nbsp;&nbsp;&nbsp;|
						<a href="user_form.jsp" class="card-link">New User</a>&nbsp;&nbsp;&nbsp;&nbsp;|
						<a href="category_form.jsp" class="card-link">New Category</a>&nbsp;&nbsp;&nbsp;&nbsp;|
						<a href="customer_form.jsp" class="card-link">New Customer</a>
					</div>
				</div>
			</div>
		</div>
		
		<div class="row">
		
		</div>
		
		
		<div class="form-group text-center my-3">
				<h3>Recent Sales</h3>
			</div>	
				<div class="table-responsive-sm">
				<table class="table table-bordered">
					<thead class="thead-dark">
						<th>Order ID</th>
						<th>Ordered By</th>
						<th>Book Copies</th>
						<th>Total</th>
						<th>Payment Method</th>
						<th>Status</th>
						<th>Order Date</th>
					</thead>
				
				
					<c:forEach items="${listMostRecentSales}" var="order" varStatus="status">
						<tbody>
						<tr>
							<td> <a href="view_order?id=${order.orderId}"><button
												class="btn btn-outline-success">${order.orderId }</button></a></td>
							<td> ${order.customer.fullname }</td>
							<td> ${order.bookCopies }</td>
							<td> <i class="fa fa-inr"></i>${order.total}</td>
							<td> ${order.paymentMethod}</td>
							<td> ${order.status}</td>
							<td> ${order.orderDate}</td>
						</tr>
						<!-- <tr></tr> -->
						</tbody>
					</c:forEach>
				
				
				
				</table>
				</div>
				
				<div class="row">
				<div class="form-group text-center my-3">
					<h3>Recent Reviews</h3>
				</div>	
				<table class="table table-bordered table-responsive-sm">
					<thead class="thead-dark">
						<th>Book</th>
						<th>Rating</th>
						<th>Headline</th>
						<th>Customer</th>
						<th>Review On</th>
					</thead>
				
				
					<c:forEach items="${listMostRecentReviews}" var="review" varStatus="status">
						<tbody>
						<tr>
							<%-- <td> <a href="view_order?id=${review.reviewId}"><button
												class="btn btn-outline-success">${review.book.bookId}</button></a></td> --%>
							<td> ${review.book.title}</td>
							<td> ${review.rating}</td>
							<td> ${review.headline}</td>
							<td> ${review.customer.fullname}</td>
							<td> ${review.reviewTime}</td>
						</tr>
						<!-- <tr></tr> -->
						</tbody>
					</c:forEach>
				</table>
				</div>
				
				
				<div class="row">
					<div class="col-sm-3 offset-3">
					<table class="table table-responsive-sm table-borderless">
					<thead class="thead-dark">
					<th>Statistics</th>
					</thead>
					
					<tr><td align="center">Total Users : ${totalUsers}</td> </tr>
					<tr><td align="center">Total Books : ${totalBooks}</td> </tr>
					<tr><td align="center">Total Customers :${totalCustomers}</td> </tr>
					<tr><td align="center">Total Reviews : ${totalReviews}</td> </tr>
					<tr><td align="center">Total Orders : ${totalOrders}</td> </tr>
					
					</table>
					</div>
				</div>
				
				<%-- <div class="form-group">
					<h3>Statistics</h3>
					 Total Users : ${totalUsers} &nbsp;&nbsp;&nbsp;&nbsp;
					 Total Books : ${totalBooks}&nbsp;&nbsp;&nbsp;&nbsp;
					 Total Customers :${totalCustomers} &nbsp;&nbsp;&nbsp;&nbsp;
					 Total Reviews : ${totalReviews} &nbsp;&nbsp;&nbsp;&nbsp;
					 Total Orders : ${totalOrders} &nbsp;&nbsp;&nbsp;&nbsp;
				</div>	 --%>


	</div>
	</div>
	<!-- Container ends here  -->

</body>
<jsp:directive.include file="footer.jsp" />
</html>