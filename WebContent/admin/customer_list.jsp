<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Manage Customers - Bookwale Administration</title>
<jsp:directive.include file="links.jsp" />
<jsp:directive.include file="scripts.jsp" />

</head>
<body>
	<jsp:directive.include file="header.jsp" />
	<div class="container-fluid">
	
		<div class="row">
			<div class="col-12 my-2" align="center">
				<a href="new_customer"><button class="btn btn-secondary">Create New Customer</button></a>
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
				<div class="table-responsive">
				<table class="table ml-auto table-bordered">
					<thead class="text-center thead-dark">
						<th>Index</th>
						<th>ID</th>
						<th>E-mail</th>
						<th>Fullname</th>
						<th>City</th>
						<th>Country</th>
						<th>Registered Date</th>
						<th>Actions</th>
					</thead>
					
					<tbody class="text-center">
						<c:forEach var="customer" items="${listCustomer}" varStatus="status">
							<tr>
								<td>${status.index + 1}</td>
								<td>${customer.customerId}</td>
								<td>${customer.email}</td>
								<td>${customer.fullname}</td>
								<td>${customer.city}</ td>
								<td>${customer.country}</td>
								<td>${customer.registerDate}</td>
								<td>
									<a href="edit_customer?id=${customer.customerId}"><button class="btn btn-outline-info">Edit</button></a>
									<a href="javascript:void(0);" id="${customer.customerId}" class="deleteLink"><button class="btn btn-outline-danger">Delete</button></a>
								</td> 
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
				customerId = $(this).attr("id");
				if(confirm('Are you sure you want to delete the customer with Id: '+customerId)){
					window.location = 'delete_book?id=' + customerId;
				}
			})
		})
	});
</script>
<jsp:directive.include file = "footer.jsp"/>
</html>