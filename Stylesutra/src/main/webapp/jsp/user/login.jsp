<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%@ include file="/components/comman_css_and_js.jsp"%>

<body>
	<div class="container">
		<nav class="navbar fixed-top shadow p-2 mb-5">
			<div class="container-fluid">
				<button class="navbar-toggler" type="button"
					data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar"
					aria-controls="offcanvasNavbar" aria-label="Toggle navigation">
					<span class="#"><i class="bi bi-list-nested text-light"></i></span>
				</button>
				<div
					class="offcanvas offcanvas-start shadow w-25 p-3 h-75 mt-3 mb-5 rounded"
					tabindex="-1" id="offcanvasNavbar"
					aria-labelledby="offcanvasNavbarLabel">
					<div class="offcanvas-header">
						<h5 class="offcanvas-title" id="offcanvasNavbarLabel">categories</h5>
						<button type="button" class="btn-close"
							data-bs-dismiss="offcanvas" aria-label="Close"></button>
					</div>
					<div class="offcanvas-body">
						<ul class="navbar-nav justify-content-center">
							<li class="nav-item"><a class="nav-link active"
								aria-current="page" href="#">All</a></li>
							<li class="nav-item"><a class="nav-link" href="tshirts">Tshirts</a></li>
							<li class="nav-item"><a class="nav-link" href="#">Hoodies</a></li>
							<li class="nav-item"><a class="nav-link" href="#">Oversized</a></li>
						</ul>
					</div>
				</div>
				<h2>
					<a class="navbar-brand badge badge-secondary" href="#">STYLESUTRA</a>
				</h2>

				<ul class="nav nav-underline justify-content-end">
					<li class="nav-item sm-d-none"><h5>
							<a class="nav-link text-light" href="tshirts"><i
								class="bi bi-person"></i></a>
						</h5></li>
					<li class="nav-item"><h5>
							<a class="nav-link text-light" href="tshirts"><i
								class="bi bi-search"></i></a>
						</h5></li>
					<li class="nav-item"><h5>
							<a class="nav-link text-light" href="tshirts"><i
								class="bi bi-cart-plus-fill"></i></a>
						</h5></li>
				</ul>
			</div>
		</nav>
	</div>
	<br>
	<br>
	<br>
	<br>
	
	
		<div class="container">
		<c:if test="${not empty usermsg}">
			<div
				class="alert alert-primary alert-dismissible fade show mt-1 p-1 "
				style="height: 35px" role="alert">
				<c:out value="${usermsg}" />
				<button type="button" class="btn-close p-1" data-bs-dismiss="alert"
					aria-label="Close"></button>
			</div>
		</c:if>
	</div>

	<div class="container">
		<div class="row justify-content-center">
			<div class="col-md-4">
				<div class="card mt-5 ">
					<div class="card-header bg-light text-center">
						<h2>Login</h2>
					</div>
					<div class="card-body">
						<form action="validateuser" method="post">
							<div class="form-group">
								<label for="username">Email</label> <input type="text"
									class="form-control" id="user_email" name="user_email"
									placeholder="Enter your Email" required>
							</div>
							<div class="form-group">
								<label for="password">Password</label> <input type="password"
									class="form-control" id="user_password" name="user_password"
									placeholder="Enter your password" required>
							</div><a href="#">Forgot Your Password..?</a> <br><br>
							<div class="d-grid">
							<button type="submit" class="btn btn-outline-info">Login</button>
							</div>
							<div class="text-start mt-2">
							<a href="register">Sign Up</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>



	<div class="container-fluid bg-body-secondary shadow mt-5">
		<footer class="py-5">
			<div class="row">
				<div class="col-6 col-md-2 mb-3">
					<h5>Section</h5>
					<ul class="nav flex-column">
						<li class="nav-item mb-2"><a href="#"
							class="nav-link p-0 text-body-secondary">Home</a></li>
						<li class="nav-item mb-2"><a href="#"
							class="nav-link p-0 text-body-secondary">Features</a></li>
						<li class="nav-item mb-2"><a href="#"
							class="nav-link p-0 text-body-secondary">Pricing</a></li>
						<li class="nav-item mb-2"><a href="#"
							class="nav-link p-0 text-body-secondary">FAQs</a></li>
						<li class="nav-item mb-2"><a href="#"
							class="nav-link p-0 text-body-secondary">About</a></li>
					</ul>
				</div>

				<div class="col-6 col-md-2 mb-3">
					<h5>Section</h5>
					<ul class="nav flex-column">
						<li class="nav-item mb-2"><a href="#"
							class="nav-link p-0 text-body-secondary">Home</a></li>
						<li class="nav-item mb-2"><a href="#"
							class="nav-link p-0 text-body-secondary">Features</a></li>
						<li class="nav-item mb-2"><a href="#"
							class="nav-link p-0 text-body-secondary">Pricing</a></li>
						<li class="nav-item mb-2"><a href="#"
							class="nav-link p-0 text-body-secondary">FAQs</a></li>
						<li class="nav-item mb-2"><a href="#"
							class="nav-link p-0 text-body-secondary">About</a></li>
					</ul>
				</div>

				<div class="col-6 col-md-2 mb-3">
					<h5>Section</h5>
					<ul class="nav flex-column">
						<li class="nav-item mb-2"><a href="#"
							class="nav-link p-0 text-body-secondary">Home</a></li>
						<li class="nav-item mb-2"><a href="#"
							class="nav-link p-0 text-body-secondary">Features</a></li>
						<li class="nav-item mb-2"><a href="#"
							class="nav-link p-0 text-body-secondary">Pricing</a></li>
						<li class="nav-item mb-2"><a href="#"
							class="nav-link p-0 text-body-secondary">FAQs</a></li>
						<li class="nav-item mb-2"><a href="#"
							class="nav-link p-0 text-body-secondary">About</a></li>
					</ul>
				</div>

				<div class="col-md-5 offset-md-1 mb-3">
					<form>
						<h5>Subscribe to our STYLESUTRAA</h5>
						<p>A Brand What You WANT.</p>
						<div class="d-flex flex-column flex-sm-row w-100 gap-2">
							<label for="newsletter1" class="visually-hidden">Email
								address</label> <input id="newsletter1" type="text" class="form-control"
								placeholder="Email address">
							<button class="btn btn-outline-info" type="button">Subscribe</button>
						</div>
					</form>
				</div>
			</div>

			<div
				class="d-flex flex-column flex-sm-row justify-content-between py-4 my-4 border-top">
				<p>© 2023 Company, Inc. All rights reserved.</p>
				<ul class="list-unstyled d-flex">
					<li class="ms-3"><a class="link-body-emphasis" href="#"><i
								class="bi bi-instagram" width="24" height="24">
								<use xlink:href="#instagram"></use></i></a></li>
					<li class="ms-3"><a class="link-body-emphasis" href="#"><i
								class="bi bi-facebook"width="24" height="24">
								<use xlink:href="#facebook"></use></i></a></li>
				</ul>
			</div>
		</footer>
	</div>


</body>
</html>