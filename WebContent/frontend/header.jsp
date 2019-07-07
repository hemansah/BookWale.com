<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<nav class="navbar navbar-expand-md navbar-light bg-faded" id="navbar">
	<!-- <a href="/" class="navbar-brand"><span id="title-size-header">Bookwale</span></a> -->
	<a class="navbar-brand" href="${pageContext.request.contextPath }/">
		<p class=" my-0 title-header">
			<img src="images/book.png" style="height: 35px; width: 35px;" />Bookwale
		</p>
	</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbar5">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="navbar-collapse collapse" id="navbar5">
		<ul class="navbar-nav">
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle active" href="#" role="button"
				data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					Category </a>

				<div class="dropdown-menu" id="navbarDropdown"
					aria-labelledby="navbarDropdown">
					<c:forEach var="category" items="${listCategory}">
						<a class="dropdown-item"
							href="view_category?id=${category.categoryId}"><c:out
								value="${category.name }" /></a>
					</c:forEach>
				</div></li>

			<li class="nav-item active"><a class="nav-link" href="#">Link</a></li>
			<li class="nav-item active"><a class="nav-link" href="#">Link</a></li>
			<li class="nav-item active"><a class="nav-link" href="#">Link</a></li>
		</ul>
		<form action="search" method="get"
			class="mx-auto my-auto d-inline w-50">
			<div class="input-group">
				<input type="text" name="keyword"
					class="form-control border border-right-0" placeholder="Search...">
				<span class="input-group-append">
					<button class="btn btn-outline-secondary border border-left-0"
						type="submit">
						<i class="fa fa-search"></i>
					</button>
				</span>
			</div>
		</form>
		<ul class="navbar-nav mr-5">
			<a class="nav-link" href="#">Cart</a>
		</ul>

		<c:if test="${loggedCustomer == null }">
			<a href="login"><button class="btn btn-outline-info ml-auto mr-2">Log in</button></a>
			<a href="register"><button class="btn btn-outline-success mr-1">Sign up</button></a>
		</c:if>
		
		<c:if test="${loggedCustomer != null }">
			<a href="view_profile" class="mr-3">Hi, ${loggedCustomer.fullname}</a>
			<a href="view_orders" class="mr-2">My orders</a>
			<a href="logout"><button class="btn btn-outline-success ml-1">Logout</button></a>
		</c:if>



	</div>
</nav>
