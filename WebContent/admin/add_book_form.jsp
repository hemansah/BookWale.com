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
	<div class="d-flex h-100 my-5">
		<div class="m-auto">
			<div class="form-group">
				<h3>Add book to orderId : ${order.orderId}</h3>
				<form action="add_book_to_order" method="post">
					<table class="table table-borderless">
						<tr>
							<td>Select a book</td>
							<td><select name="bookId" class="form-control">
									<c:forEach items="${listBook}" var="book" varStatus="status">
										<option value="${book.bookId }">${book.title} - ${book.author}</option>
									</c:forEach>
							</select></td>
						</tr>
						
						<tr>
							<td>&nbsp;</td>
						</tr>
						
						<tr>
							<td>Number of Copies : </td>
							<td>
								<select name="quantity" class="form-control">
									<option>1</option>
									<option>2</option>
									<option>3</option>
									<option>4</option>
									<option>5</option>
									<option>6</option>
									<option>7</option>
								</select>
							</td>
						</tr>
						
						<tr>
							<td>
								<input type="submit" class=" btn btn-primary form-control" name="" id="" value="Add"/>
							</td>
							<td>
								<input type="button" class="form-control btn btn-danger" name="" id="" value="Cancel" size="1" onclick="javascript: self.close();"/>
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
</body>
</html>