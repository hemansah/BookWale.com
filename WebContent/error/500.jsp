<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Internal Server Error</title>
<jsp:directive.include file="../frontend/links.jsp"/>
</head>
<body>

	<div class="container-fluid">
		<div class="row">
			<div class="col-12 text-center">
				<h2 class="text-center my-5 text-danger">Sorry, the server has encountered an error while fulfilling your request.</h2>
				<h3 class="text-center text-danger"> Please check back later or contact our administrator.</h3>
				<a href="javascript:history.go(-1);"><button class="btn btn-success my-4">Go back</button></a>
			</div>
		</div>
	</div>
</body>
</html>