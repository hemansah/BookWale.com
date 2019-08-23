<%-- <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/format" %> --%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Edit Order - Bookwale Administration</title>
<jsp:directive.include file="links.jsp" />
<jsp:directive.include file="scripts.jsp" />
</head>
<body>
	<jsp:directive.include file="header.jsp" />
	<div class="container-fluid">

		<div class="row">
			<div class="col-12 my-2" align="center">
				<h3>Edit OrdeId : ${order.orderId}</h3>
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
				<div class="">
					<h3 class="text-center">Order Overview</h3>

					<form method="post" action="update_order" id="orderForm">
						<table class="table table-bordered">

							<tr>
								<td>Ordered By :</td>
								<td>${order.customer.fullname }</td>
							</tr>

							<tr>
								<td>Order Date</td>
								<td>${order.orderDate }</td>
							</tr>

							<tr>
								<td>Recipient Name</td>
								<td><input type="text" id="" name="recipientName"
									class="form-control" value="${order.recipientName }" /></td>
							</tr>

							<tr>
								<td>Recipient Phone</td>
								<td><input type="text" id="" name="recipientPhone"
									class="form-control" value=" ${order.recipientPhone }" /></td>
							</tr>

							<tr>
								<td>Ship to</td>
								<td><input type="text" id="" name="shippingAddress"
									class="form-control" value=" ${order.shippingAddress }" /></td>
							</tr>

							<tr>
								<td>Payment Method</td>
								<td><select name="paymentMethod" class="form-control">
										<option value="Cash on Delivery">Cash on Delivery</option>
								</select></td>
							</tr>
							<tr>
								<td>Order Status</td>
								<td><select name="orderStatus" class="form-control">
										<option value="Processing" <c:if test="${order.status eq 'Processing'}">selected='selected' </c:if> >Processing</option>
										<option value="Shipping" <c:if test="${order.status eq 'Shipping'}">selected='selected' </c:if>>Shipping</option>
										<option value="Delivered" <c:if test="${order.status eq 'Delivered'}">selected='selected' </c:if>>Delivered</option>
										<option value="Completed" <c:if test="${order.status eq 'Completed'}">selected='selected' </c:if>>Completed</option>
										<option value="Cancelled" <c:if test="${order.status eq 'Cancelled'}">selected='selected' </c:if>>Cancelled</option>
								</select></td>
							</tr>



						</table>

						<table class="table table-bordered border-2">
							<thead>
								<th>Index</th>
								<th>Book Title</th>
								<th>Author</th>
								<th>Price</th>
								<th>Quantity</th>
								<th>Sub Total</th>
								<th></th>
							</thead>

							<c:forEach items="${order.orderDetails }" var="orderDetail"
								varStatus="status">
								<tbody>
									<tr>
										<td>${status.index+1}</td>
										<td><img style="vertical-align: middle"
											src="data:image/jpg;base64,${orderDetail.book.base64Image }"
											width="48" height="64"> ${orderDetail.book.title}</td>
										<td>${orderDetail.book.author}</td>
										<td>
										<input type="hidden" id="" name="price"
									class="form-control" value="${orderDetail.book.price}" />
									<i class="fa fa-inr">&nbsp</i>${orderDetail.book.price}
										
										</td>
										<td><input type="hidden" name="bookId"
											value="${orderDetail.book.bookId}" /> 
											
											<input type="text"
											id="quantity" name="quantity${status.index+1 }" class="form-control" size="1"
											value="${orderDetail.quantity}" /></td>

										<td>${orderDetail.subtotal}</td>
										<td><a
											href="remove_book_from_order?id=${orderDetail.book.bookId}">Remove</a>
										</td>
									</tr>

									<tr>
										<td colspan="3" align="right">Total :</td>
										<td>${order.bookCopies }</td>
										<td><i class="fa fa-inr">&nbsp</i><b>${order.total }</b></td>
									</tr>

								</tbody>
							</c:forEach>
						</table>
				</div>
			</div>
		</div>

		<input type="submit" value="Save" class="btn btn-primary" /> <input
			type="button" value="Cancel" class="btn btn-danger"
			onclick="javascript:window.location.href='list_order';" />
		</form>
	</div>
	<a href="javascript:showAddBookPopup()"><button
			class="btn btn-success">Add Books</button></a>
	<!-- Container ends here  -->
</body>
<script type="text/javascript">

	function showAddBookPopup(){
		var width = 500;
		var height = 400;
		var left  = (screen.width - width) / 2;
		var top  = (screen.height- height) / 2;
		window.open('add_book_form','_blank', 'width='+ width +', height='+ height +', top='+ top +', left='+left);
	}
	
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
	
	$(document).ready(function(){
		$("#orderForm").validate({
			rules :	{
				recipientName : "required", 
				recipientPhone :"required",
				shippingAddress : "required",
				<c:forEach items="${order.orderDetails}" var="book" varStatus="status">
					quantity${status.index+1} : {
					required:true, number : true, min : 1,
					},
				</c:forEach>
			},
			
			messages : {
				recipientName : "Please enter recipient name",
				recipientPhone : "Please enter recipient Phone",
				shippingAddress : "Please enter recipient name",
				
				<c:forEach items="${order.orderDetails}" var="book" varStatus="status">
					quantity${status.index+1} : {
					required: "Please enter quantity.",
					number : "Quantity must be a number.",
					min : "Quantity must be greater than zero."
					},
				</c:forEach>
			}
		})
	});
</script>
<jsp:directive.include file="footer.jsp" />
</html>