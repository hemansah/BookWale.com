<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Edit Review - Bookwale.com</title>
<jsp:directive.include file="links.jsp" />
<jsp:directive.include file="scripts.jsp" />


</head>

<body>
	<jsp:directive.include file="header.jsp" />

	<div class="container-fluid">
		<div class="d-flex h-100">
			<div class="m-auto">
				<div class="form-group my-5">
					<h3>Edit Review</h3>
				</div>



				<form action="update_review" method="post" id="reivewform">
					<div class="form-group table-responsive table-borderless">
						<input type="hidden" name="reviewId"
							value="${review.reviewId }" />
							<p>Hello<c:out value="${review.reviewId}"></c:out> </p>
					</div>
			
					
						
					
					
					<div class="form-group text-center">
						<input value="Save" class="btn btn-primary" type="submit" />
						<button type="" class="btn btn-danger" id="buttonCancel">Cancel</button>
					</div>
				</form>


			</div>
		</div>
		</div>
		<!-- Container ends here -->
</body>

<script type="text/javascript">
	$(document).ready(function() {
		$("#categoryform").validate({
			rules : {
				name : "required",

			},

			message : {
				name : "Please enter the category name",
			}
		});
		$("#buttonCancel").click(function() {
			history.go(-1);
		})
	});
</script>
</html>