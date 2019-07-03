<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Add New Book</title>
<jsp:directive.include file="links.jsp" />
<jsp:directive.include file="scripts.jsp" />
<style type="text/css">
.center_div {
	margin: 0 auto;
	width: 60%
}
</style>
</head>
<body>
	<jsp:directive.include file="header.jsp" />
	<div class="container-fluid">
		<div class="d-flex h-100">
			<div class="m-auto">
				<div class="form-group my-2 text-center">
					<h3>
						<c:if test="${book != null}">
							Edit Book
						</c:if>

						<c:if test="${book == null}">
							Add New Book
						</c:if>
					</h3>
				</div>



				<c:if test="${book != null }">
					<form action="update_book" method="post" id="bookform"
						enctype="multipart/form-data">
						<div class="form-group">
							<input type="hidden" name="bookId" value="${book.bookId}" />
						</div>
				</c:if>
				<c:if test="${book == null }">
					<form action="create_book" method="post" id="bookform"
						enctype="multipart/form-data">
				</c:if>
				<div class="form-group">
					<select class="form-control" name="category" id="category">

						<c:forEach items="${listCategory}" var="category">
							<c:if test="${category.categoryId eq book.category.categoryId }">
								<option value="${category.categoryId}" selected="selected">
							</c:if>
							<c:if test="${category.categoryId ne book.category.categoryId }">
								<option value="${category.categoryId}">
							</c:if>
								${category.name}
							</option>
						</c:forEach>
					</select>
				</div>

				<div class="form-group">
					<input type="text" class="form-control my-2" name="title"
						id="title" value="${book.title}"
						placeholder="Enter title of the book" /> <input type="text"
						class="form-control" name="author" id="author"
						value="${book.author }" placeholder="Enter Author name" /> <input
						type="text" class="form-control my-2" name="isbn" id="isbn"
						value="${book.isbn}" placeholder="Enter ISBN" /> <input
						type="text" class="form-control" name="publishDate"
						id="publishDate"
						value="<fmt:formatDate pattern='mm/dd/yyyy' value='${book.publishDate}'/>"
						placeholder="Enter Publishing Date" /> <input type="file"
						class="form-control my-2 form-control-file" name="bookImage"
						id="bookImage" value="" /> <img alt="Image Preview"
						id="thumbnail" style="width: 80px" ; height="100px;"
						src="data:image/jpg;base64,${book.base64Image}" /> <input
						type="text" class="form-control my-2" name="price" id="price"
						value="${book.price}" placeholder="Enter Price" />

					<textarea type="text" class="form-control " name="description"
						id="description" value="" placeholder="Write Description...">${book.description}</textarea>
				</div>

				<div class="form-group">
					<input value="Save" class="btn btn-primary" type="submit" />
					<button type="" class="btn btn-danger" id="buttonCancel">Cancel</button>
				</div>
				</form>
			</div>
		</div>

	</div>
</body>
<jsp:directive.include file="footer.jsp" />
<script>
$(document).ready(function(){
	$('#publishDate').datepicker();
	$('#description').richText();
	
	
	$('#bookImage').change(function(){
		showImageThumbnail(this);
	});
	$("#bookform").validate({
		rules : {
			category : "required",
			title : "required",
			author : "required",
			isbn : "required",
			publishDate : "required",
			
			<c:if test="${book == null}">
			bookImage : "required",
			</c:if>
			price : "required",
			description : "required",
		},
		
		message : {	
			category : "Please choose category",
			title : "Please enter the book title",
			author : "Please enter the book author name",
			isbn : "Please enter the book isbn",
			publishDate : "Please enter the publishing date",
			bookImage : "Please enter the book image",
			price : "Please enter the book price",
			description : "Please write the description of the book",
		}
	});
	
	$("#buttonCancel").click(function(){
		history.go(-1);
	})
});

	function showImageThumbnail(fileInput) {
	
		var file = fileInput.files[0];
		var reader = new FileReader();
		reader.onload = function(e) {
			$('#thumbnail').attr('src', e.target.result);
		};
		
		reader.readAsDataURL(file);
		
	}
</script>
</html>