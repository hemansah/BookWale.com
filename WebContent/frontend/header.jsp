<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<nav class="navbar navbar-expand-md navbar-light bg-faded">
	<!-- <a href="/" class="navbar-brand"><span class="title-size-header">Bookwale</span></a> -->
	<a class="navbar-brand"><p class="title-size-header my-0 ">Bookwale</p></a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbar5">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="navbar-collapse collapse" id="navbar5">
		<ul class="navbar-nav">
			<li class="nav-item dropdown">
			  <a class="nav-link dropdown-toggle active" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> Category </a>

				<div class="dropdown-menu" aria-labelledby="navbarDropdown">
					<c:forEach var="category" items="${listCategory}">
						<a href="#">
						<c:out value="${category.name}"></c:out>
						</a>
					</c:forEach>
				</div>
			</li> 

			<li class="nav-item active"><a class="nav-link" href="#">Link</a></li>
			<li class="nav-item active"><a class="nav-link" href="#">Link</a></li>
			<li class="nav-item active"><a class="nav-link" href="#">Link</a></li>
		</ul>
		<form class="mx-auto my-auto d-inline w-50">
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
		<ul class="navbar-nav ml-auto">

			<li class="nav-item"><a class="nav-link" href="#">Cart</a></li>
		</ul>

		<button class="btn btn-outline-info ml-auto mr-2">Log in</button>

		<button class="btn btn-outline-success mr-1">Sign up</button>



	</div>
</nav>
