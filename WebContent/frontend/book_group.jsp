<div class="col-sm-2 my-3 mx-3 mx-auto">
<div class="text-center">
	<div class="card" style="width: 250px;">
		<img class="card-img-top img-thumbnail"
			src="data:image/jpg;base64,${book.base64Image}"
			style="width: 100%; height: 210px;" />
		<div class="card-body">
			<p class="card-text"
				style="width: 160px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">
				<b><c:out value="${book.title}"></c:out></b></br> <i>by <c:out
						value="${book.author}"></c:out></i></br> <i class="fa fa-inr"></i>
				<c:out value="${book.price}"></c:out>
				</br>
				<!--Book Rating Here  -->
				<jsp:directive.include file="book_rating.jsp" />
			</p>
			<a href="view_book?id=${book.bookId}" class="stretched-link"></a>
		</div>
	</div>
</div>
</div>