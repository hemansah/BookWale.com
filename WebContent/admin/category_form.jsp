<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Create New Category - Bookwale.com</title>
<jsp:directive.include file="links.jsp" />
<jsp:directive.include file="scripts.jsp" />
<style type="text/css">
.center_div{
 margin: 0 auto;
    width:40%
}
</style>

</head>

<body>
	<jsp:directive.include file="header.jsp" />

	<div class="container-fluid center_div ">
		<div class="row">
			<div class="col-sm-12 my-5">
				<div align="center">

					<h3>
						<c:if test="${category != null}">
							Edit Category
						</c:if>

						<c:if test="${category == null}">
							Create New Category
						</c:if>
					</h3>
				</div>
			</div>
		</div>

		<div class="row my-3" align="center">
			<div class="col-sm-12">
				<c:if test="${category != null }">
					<form action="edit_category" method="post"
						onsubmit="return validateFormInput()">
						<input type="hidden" name="categoryId" value="${category.categoryId }" />
				</c:if>
				<c:if test="${category == null }">
					<form action="create_category" method="post"
						onsubmit="return validateFormInput()">
				</c:if>
				<div class="form-group">
					<input type="text" id="name" value="${category.name}"
						name="name" class="form-control my-2"
						placeholder="Enter Category Name"> 
				</div>
				<input value="Save" class="btn btn-primary" type="submit" />
				<button type="" class="btn btn-danger"
					onclick="javascript:history.go(-1);">Cancel</button>
				</form>
			</div>
		</div>


	</div>
	<!-- Container ends here -->

</body>

<script type="text/javascript">
		function validateFormInput() {
			var fieldName = document.getElementById("name");
			
			
			if(fieldName.value.length==0){
				alert("Category name is Required");
				fieldFullName.focus();
				return false;
			}
			
			return true;
		}
</script>
</html>