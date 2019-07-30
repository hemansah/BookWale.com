	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Checkout - Bookwale.com</title>
<jsp:directive.include file="links.jsp" />
<jsp:directive.include file="scripts.jsp" />
<style type="text/css">
.center_div {
	margin: 0 auto;
	width: 40%
}
</style>
</head>
<body>
<jsp:directive.include file="header.jsp" />
	<div class="d-flex h-100 my-5">
		<div class="m-auto">

			<c:if test="${message!=null}">

				<div class="form-group">
					<h3 class="text-danger bg-light">${message}</h3>
				</div>
			</c:if>
			
			<c:set var="cart" value="${sessionScope['cart']}"/>
			
			<c:if test="${cart.totalItems==0 }">
				<h2>There's no item in your cart.</h2>
			</c:if>
			
			
			
			<div class="form-group text-center">
				<c:if test="${cart.totalItems > 0 }">
					<div>
						<h3>Review your Order Details <a href="view_cart"><button class="btn btn-outline-info">Edit</button> </a> </h3>
						<form action="update_cart" method="post" id="cartForm">
							<table class="table table-responsive">
								<thead class="thead-dark">
									<tr>
										<th>No.</th>
										<th>Book</th>
										<th>Author</th>
										<th>Price</th>
										<th>Quantity</th>
										<th>Subtotal</th>
										
									</tr>
								</thead>
								
								<tbody>
									<c:forEach items="${cart.items}" var="item" varStatus="status">
										<tr>
											<td> ${status.index+1}</td>
											<td>
												<img class=""
													src="data:image/jpg;base64,${item.key.base64Image}"
													style="width: 100px; height: 140px;"/>${item.key.title}
												</td>
											<td>${item.key.author}</td>	
											
											<td>
												<input type="hidden" name="bookId" value="${item.key.bookId}"/>
												<i class="fa fa-inr">&nbsp</i>${item.key.price}
												 
											</td>
											<td><input class="form-control" readonly="readonly" size="1" name="quantity${status.index+1}" value="${item.value}" type="text" /></td>
											<td><i class="fa fa-inr">&nbsp</i> ${item.value * item.key.price}</td>
											
										</tr>
									</c:forEach>
									
									<tr>
										<td></td>
										<td></td>
										<td><b>${cart.totalQuantity} book(s)</b></td>
										<td>Total:</td>
										<td><i class="fa fa-inr">&nbsp</i> ${cart.totalAmount}</td>
									</tr>
									
								</tbody>
							</table>
							</form>
					
					<h2>Your Shipping Information</h2>
					<form method="post" action="place_order" id="orderForm">
						<table class="table">
							<tbody>
								<tr>
									<td>Recipient Name : </td>
									<td><input type="text" name="recipientName" class="form-control" value="${loggedCustomer.fullname }"/> </td>
								</tr>
								<tr>
									<td>Recipient Phone : </td>
									<td><input type="text" name="recipientPhone" class="form-control" value="${loggedCustomer.phone}"/> </td>
								</tr>
								<tr>
									<td>Street Address : </td>
									<td><input type="text" name="address" class="form-control" value="${loggedCustomer.address}"/> </td>
								</tr>
								<tr>
									<td>City:</td>
									<td><input type="text" name="city" class="form-control" value="${loggedCustomer.city}"/> </td>
								</tr>
								<tr>
									<td>ZIP code:</td>
									<td><input type="text" name="zipCode" class="form-control" value="${loggedCustomer.zipcode}"/> </td>
								</tr>
								<tr>
									<td>Country:</td>
									<td><input type="text" name="country" class="form-control" value="${loggedCustomer.country}"/> </td>
								</tr>
								
							</tbody>
						</table>
						<h3>Payment</h3>
						Choose payment method
						<select name="paymentMethod" class="form-control">
							<option value="Cash on Delivery">Cash on Delivery</option>
						</select>
						
						<div class="my-2">
						 <button type="submit" class="btn btn-outline-primary">Place Order</button>						
						
						</div>
						
					</form>
					<a href="${pageContext.request.contextPath}/"><button class="btn my-2 btn-outline-danger">Continue Shopping</button> </a>
					
					</div>
					
					
			</c:if>
			</div>
			
		</div>
	</div>

</body>
<jsp:directive.include file="footer.jsp" />
<script type="text/javascript">
	$(document).ready(function() {
		$("#orderForm").validate({
			rules : {
				recipientName : "required",
				recipientPhone: "required",
				address : "required",
				city: "required",
				zipcode: "required",
				country: "required",
			},
			
			messages : {
				recipientName : "Please Enter recipient name",
				recipientPhone: "Please enter phone number",
				address : "Please enter street address",
				city: "Please enter city",
				zipcode: "Please enter zipcode",
				country: "Please enter country",
			}
		});

	});
</script>
</html>

