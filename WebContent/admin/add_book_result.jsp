<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Book to Order</title>
<jsp:directive.include file="links.jsp" />
<jsp:directive.include file="scripts.jsp" />
</head>
<body>
	<div align="center">
		 <h2>The book <i>${book.title}</i> has been added to the <b>order ID ${order.orderId}</b></h2>
		 <input type="button" class="btn btn-outline-success" value="Close" onclick="javascript:self.close();" />
	</div>
	<script type="text/javascript">
		window.onunload = function() {
			window.opener.location.reload();
		}
	</script>
</body>
</html>