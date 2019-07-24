<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Review Posted - Bookwale.com</title>
<jsp:directive.include file="links.jsp" />
<jsp:directive.include file="scripts.jsp" />
</head>

<body>
	<jsp:directive.include file="header.jsp" />

	<div class="container-fluid">
		
			
				
					  <div class="row my-5">
					  		<div class="col-sm-8">
					  			<h3>Your Reviews</h3>
					  		</div>
					  		<div class="col-sm-2">
					  			<h4>${loggedCustomer.fullname}</h4>
					  		</div>
					  </div>
					  
					  <div class="row">
					  		<div class="col-sm-2 offset-4">
					  			<h5>${book.title}</h5><br>
					  			<img class="card-img-top img-thumbnail" src="data:image/jpg;base64,${book.base64Image}" style="width: 250px; height: 350px;" />
					  		</div>
					  </div>
					  
					  <div class="row my-3">
					  		<div class="col-sm-5 offset-3">
					  			<h3>Your review has been posted. ThankYou!</h3>
					  		</div>
					  		
					  </div>
		

</div>
	<!-- Container ends here -->
</body>
<jsp:directive.include file="footer.jsp" />
</html>
