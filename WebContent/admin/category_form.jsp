<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Create New Category - Bookwale.com</title>
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

	<div class="container-fluid">
		<div class="d-flex h-100">
			<div class="m-auto">
				<div class="form-group my-5">
					<h3>
						<c:if test="${category != null}">
							Edit Category
						</c:if>

						<c:if test="${category == null}">
							Create New Category
						</c:if>
					</h3>
				</div>


				<c:if test="${category != null }">
					<form action="edit_category" method="post" id="categoryform">

						<div class="form-group">
							<input type="hidden" name="categoryId"
								value="${category.categoryId }" />
						</div>
				</c:if>
				<c:if test="${category == null }">
					<form action="create_category" method="post" id="categoryform">
				</c:if>
				<div class="form-group">
					<input type="text" id="name" value="${category.name}" name="name"
						class="form-control my-2" placeholder="Enter Category Name" />
				</div>
				<div class="form-group text-center">
					<input value="Save" class="btn btn-primary" type="submit" />
					<button type="" class="btn btn-danger" id="buttonCancel">Cancel</button>
				</div>
				</form>


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