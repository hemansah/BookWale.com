<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Your shopping cart</title>
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
			
			<div class="form-group text-center">
				<h3>Shopping Cart</h3>
			</div>
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
						<form action="">
							<table class="table table-responsive">
								<thead class="thead-dark">
									<tr>
										<th>No.</th>
										<th>Book</th>
										<th>Quantity</th>
										<th>Price</th>
										<th>Subtotal</th>
										<th>
											<a href=""><b>Clear Cart</b></a>
										</th>
									</tr>
								</thead>
								
								<tbody>
									<c:forEach items="${cart.items}" var="item" varStatus="status">
										<tr>
											<td> ${status.index+1}</td>
											<td>
												<img class="card-img-top img-thumbnail"
													src="data:image/jpg;base64,${item.key.base64Image}"
													style="width: 100px; height: 140px;"/>${item.key.title}
												</td>
											<td><i class="fa fa-inr">&nbsp</i>${item.key.price}</td>
											<td>${item.value}</td>
											<td> ${item.value * item.key.price}</td>
											<td><a href="">Remove</a> </td>
										</tr>
									</c:forEach>
									
									<tr>
										<td></td>
										<td></td>
										<td><b>${cart.totalQuantity} book(s)</b></td>
										<td>Total:</td>
										<td> ${cart.totalAmount}</td>
									</tr>
									
								</tbody>
							</table>
						</form>	
					</div>
			</c:if>
			</div>
			
		</div>
	</div>

</body>
<jsp:directive.include file="footer.jsp" />
<script type="text/javascript">
	$(document).ready(function() {
		$("#loginform").validate({
			rules : {
				email : {
					required : true,
					email : true
				},
				password : "required",
			},

			message : {
				email : {
					required : "Please enter email id",
					email : "Please enter valid email id"
				},
				password : "Please enter password"
			}
		});

	});
</script>
</html>

