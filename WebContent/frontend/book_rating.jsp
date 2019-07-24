<c:forTokens items="${book.ratingStars}" delims="," var="star">
	<c:if test="${star eq 'on'}">
		<img alt="" src="images/rating-on.png">
	</c:if>

	<c:if test="${star eq 'off'}">
		<img alt="" src="images/rating-off.png">
	</c:if>

	<c:if test="${star eq 'half'}">
		<img alt="" src="images/rating-half.png">
	</c:if>
</c:forTokens>