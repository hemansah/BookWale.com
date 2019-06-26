<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add New Book</title>
<jsp:directive.include file="links.jsp" />
<jsp:directive.include file="scripts.jsp" />
<style type="text/css">
.center_div {
	margin: 0 auto;
	width: 50%
}
</style>
</head>
<body>
	<jsp:directive.include file="header.jsp" />
	<div class="container-fluid center_div">
		<div class="row">
			<div class="col-12 my-2">
				<div align="center">

					<h3>
						<c:if test="${book != null}">
							Edit Book
						</c:if>

						<c:if test="${book == null}">
							Add New Book
						</c:if>
					</h3>
				</div>
			</div>
		</div>

		<div class="row my-1" align="center">
			<div class="col-12">
				<c:if test="${book != null }">
					<form action="update_book" method="post" id="userform">
						<input type="hidden" name="userId" value="${user.userId }" />
				</c:if>
				<c:if test="${book == null }">
					<form action="create_book" method="post" id="bookform" enctype="multipart/form-data">
				</c:if>
				<div class="form-group">
					<select class="form-control" name="category" id="category">
						<option>Select Category</option>
						<c:forEach items="${listCategory}" var="category">
							<option value="${category.categoryId}">
								${category.name}
							</option>
						</c:forEach>
					</select>
					
					<input type="text" class="form-control my-2" name="title" id="title" value="${book.title}" placeholder="Enter title of the book"/>
					<input type="text" class="form-control" name="author" id="author" value="${book.author }" placeholder="Enter Author name"/>
					<input type="text" class="form-control my-2" name="isbn" id="isbn" value="${book.isbn}" placeholder="Enter ISBN"/>
					<input type="text" class="form-control" name="publishDate" id="publishDate" value="${book.publishDate}" placeholder="Enter Publishing Date"/>
					<input type="file" class="form-control my-2 form-control-file" name="bookImage" id="bookImage" value=""/>
						<img alt="Image Preview" id="thumbnail" style="width: 80px"; height="100px;" />
					<input type="text" class="form-control" name="price" id="price" value="${book.price}" placeholder="Enter Price"/>
					<textarea type="text" class="form-control my-2" name="description" id="description" value="" placeholder="Write Description..."></textarea> 
					<!-- <input type="" class="form-control my-2" name="" id="" value="" placeholder=""/> -->
					

				</div>
				<input value="Save" class="btn btn-primary" type="submit" />
				<button type="" class="btn btn-danger" id="buttonCancel">Cancel</button>
				</form>
			</div>
		</div>
	</div>
</body>
<jsp:directive.include file="footer.jsp" />
<script >
$(document).ready(function(){
	$('#publishDate').datepicker();
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
			bookImage : "required",
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