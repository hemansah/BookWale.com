<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Write Review - Bookwale.com</title>
<jsp:directive.include file="links.jsp" />
<jsp:directive.include file="scripts.jsp" />


</head>

<body>
	<jsp:directive.include file="header.jsp" />

	<div class="container-fluid">
		
			
				<form action="submit_review" method="post" id="reviewForm">
					  <div class="row my-5">
					  		<div class="col-sm-8">
					  			<h3>Your Reviews</h3>
					  		</div>
					  		<div class="col-sm-2">
					  			<h4>${loggedCustomer.fullname}</h4>
					  		</div>
					  </div>
					  
					  <div class="row">
					  		<div class="col-sm-2 offset-1">
					  			<h5>${book.title}</h5><br>
					  			<img class="card-img-top img-thumbnail" src="data:image/jpg;base64,${book.base64Image}" style="width: 250px; height: 350px;" />
					  		</div>
					  		
					  		<div class="col-sm-8">
					  			<div id="rateYo"></div>
								<input type="hidden" id="rating" name="rating" />
								<input type="hidden"  name="bookId" value="${book.bookId}" />
								<input class="form-control my-3" type="text" name="headline" id="headline" placeholder="Headline or summary for your review(required)"/><br>
								<textarea class="form-control" name="comment" rows="5" id="comment" cols="100" placeholder="Write your review details..."></textarea>
					  		</div>
					  </div>
					  
					  <div class="row my-3">
					  		<div class="col-sm-2 offset-5">
									<input value="Submit" class="btn btn-primary" type="submit" />
									<button type="" class="btn btn-danger " id="buttonCancel">Cancel</button>
					  		</div>
					  
					  		
					  </div>
					
				</form>
			
		

</div>
	<!-- Container ends here -->
</body>
<jsp:directive.include file="footer.jsp" />
<script type="text/javascript">
	$(document).ready(function() {
		$("#reviewForm").validate({
			rules : {
				headline : "required",
				comment : "required"

			},

			message : {
				headline : "Please enter the headline",
				comment : "Please enter the comment",
			}
		});
		
		$("#buttonCancel").click(function() {
			history.go(-1);
		});
		
		$("#rateYo").rateYo({
		    starWidth: "40px",
		    fullStar : true,
		    onSet : function(rating , rateYoInstance) {
		    	$('#rating').val(rating);
		    }
		  });
		
	});
</script>
</html>

