<%-- <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/format" %> --%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Order Details - Bookwale Administration</title>
<jsp:directive.include file="links.jsp" />
<jsp:directive.include file="scripts.jsp" />
</head>
<body>
	<jsp:directive.include file="header.jsp" />
	<div class="container-fluid">

		<div class="row">
			<div class="col-12 my-2" align="center">
				<h3> Details of OrdeId : ${order.orderId}</h3>
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
					<table class="table">
						<tr align="center">Order Overview</tr>
						<tr>
							<td>Ordered By :</td>
							<td> ${order.customer.fullname }</td>
						</tr>
						<tr>
							<td>Book Copies</td>
							<td>${order.bookCopies }</td>
						</tr>
						<tr>
							<td>Total Amount</td>
							<td>${order.total }</td>
						</tr>
						<tr>
							<td>Recipient Name</td>
							<td>${order.RecipientName }</td>
						</tr>
						
						<tr>
							<td>Recipient Phone</td>
							<td>${order.recipientPhone }</td>
						</tr>
						<tr>
							<td>Ship to</td>
							<td>${order.shippingAddress }</td>
						</tr>
						<tr>
							<td>Payment Method</td>
							<td>${order.paymentMethod }</td>
						</tr>
						<tr>
							<td>Order Status</td>
							<td>${order.status }</td>
						</tr>
						<tr>
							<td>Order Date</td>
							<td>${order.orderDate }</td>
						</tr>
						
						
					</table>
					
					<table class="table">
						<thead>
							<th>Index</th>
							<th>Book Title</th>
							<th>Author</th>
							<th>Price</th>
							<th>Quantity</th>
							<th>Sub Total</th>
						</thead>
						
						<c:forEach items="${order.orderDetails }" var="orderDetail" varStatus="status">						
						<tbody>
							<tr>
								<td> ${status.index+1 }</td>
								<td> ${orderDetail.book.title }</td>
								<td> ${orderDetail.book.price }</td>
								<td> ${orderDetail.quantity }</td>
								<td> ${orderDetail.subtotal }</td>
							</tr>
							
							<tr>
								<td>Total : </td>
								<td>${order.bookCopies }</td>
								<td> ${order.total }</td>
							</tr>
							
						</tbody>
						</c:forEach>
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