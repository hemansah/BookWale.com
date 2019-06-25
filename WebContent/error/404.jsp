<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Not found error</title>
<jsp:directive.include file="../frontend/links.jsp"/>
</head>
<body>

	<div class="container-fluid">
		<div class="row">
			<div class="col-12 text-center">
				<h2 class="text-center my-5 text-danger">Sorry, the requested page is not found</h2>
					<a href="javascript:history.go(-1);"><button class="btn btn-success mr-auto ml-0">Go back</button></a>
			</div>
		</div>
	</div>
</body>
</html>