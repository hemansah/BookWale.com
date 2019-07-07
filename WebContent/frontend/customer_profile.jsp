<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Customer Profile</title>
<jsp:directive.include file="links.jsp" />
<jsp:directive.include file="scripts.jsp" />

</head>
<body>
	<jsp:directive.include file="header.jsp" />
	<div class="container-fluid">
		<div class="d-flex h-100">
			<div class="m-auto">
				<h2 class="my-3">
					Welcome,
					<c:out value="${loggedCustomer.fullname}"></c:out>
				</h2>

				<table class="table table-borderless table-sm">

					<tbody>
						<tr>
							<td>Full Name :</td>
							<td><c:out value="${loggedCustomer.fullname}"></c:out></td>
						</tr>

						<tr>
							<td>Phone Number :</td>
							<td><c:out value="${loggedCustomer.phone}"></c:out></td>
						</tr>

						<tr>
							<td>Address :</td>
							<td><c:out value="${loggedCustomer.address}"></c:out></td>
						</tr>

						<tr>
							<td>City :</td>
							<td><c:out value="${loggedCustomer.city}"></c:out></td>
						</tr>

						<tr>
							<td>Zip Code :</td>
							<td><c:out value="${loggedCustomer.zipcode}"></c:out></td>
						</tr>

						<tr>
							<td>Country :</td>
							<td><c:out value="${loggedCustomer.country}"></c:out></td>
						</tr>

					</tbody>
				</table>
				
					<div class="form-group">
						<a href="edit_profile"><button
							class="btn btn-outline-info my-3">Edit your profile</button></a>
					</div>




			</div>
		</div>
	</div>



	<jsp:directive.include file="footer.jsp" />
</body>
</html>