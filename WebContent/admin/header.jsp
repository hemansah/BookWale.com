<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<nav class="navbar navbar-expand-md navbar-light bg-faded" id="navbar">
	<!-- <a href="/" class="navbar-brand"><span class="title-size-header">Bookwale</span></a> -->
	<a class="navbar-brand" href="${pageContext.request.contextPath }/admin/" >
		<p class=" my-0 title-header">
			<img src="../images/book.png" style="height: 35px; width: 35px;"/>
			Bookwale
		</p>
	</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbar5">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="navbar-collapse collapse" id="navbar5">
		<ul class="navbar-nav">

			<li class="nav-item active"><a class="nav-link" href="list_users">Users</a></li>
			<li class="nav-item active"><a class="nav-link" href="list_category">Categories</a></li>
			<li class="nav-item active"><a class="nav-link" href="list_books">Books</a></li>
			<li class="nav-item active"><a class="nav-link" href="list_customer">Customers</a></li>
			<li class="nav-item active"><a class="nav-link" href="list_review">Reviews</a></li>
			<li class="nav-item active"><a class="nav-link" href="#">Orders</a></li>
		</ul>
		<form class="mx-auto my-auto d-inline w-25">
			<div class="input-group">
				<input type="text" class="form-control border border-right-0"
					placeholder="Search..."> <span class="input-group-append">
					<button class="btn btn-outline-secondary border border-left-0"
						type="button">
						<i class="fa fa-search"></i>
					</button>
				</span>
			</div>
		</form>
		<ul class="navbar-nav">

			<div><c:out value="${sessionScope.useremail}"></c:out></div>
			<a href="logout">&nbsp;<button class="btn btn-outline-primary">Logout</button></a>
		</ul>

		<a href="login.jsp"><button class="btn btn-outline-info ml-auto mr-1">Log in</button></a>

		<button class="btn btn-outline-success mr-1">Sign up</button>
	</div>
</nav>


