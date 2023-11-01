<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="/components/comman_css_and_js.jsp"%>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<nav class="navbar fixed-top shadow p-2 mb-5">
			<div class="container-fluid">

				<h3>
					<button type="button" class="btn btn-warning rounded">Admin
						Panel</button>
				</h3>
				<h2>
					<a class="navbar-brand" href="#">STYLESUTRA</a>
				</h2>

				<button class="navbar-toggler" type="button"
					data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar"
					aria-controls="offcanvasNavbar" aria-label="Toggle navigation">
					<span class="#"><i class="bi bi-list-nested text-light"></i></span>
				</button>
				<div
					class="offcanvas offcanvas-end shadow w-25 p-3 h-75 mt-3 mb-5 rounded"
					tabindex="-1" id="offcanvasNavbar"
					aria-labelledby="offcanvasNavbarLabel">
					<div class="offcanvas-header">
						<h5 class="offcanvas-title" id="offcanvasNavbarLabel">ADMIN</h5>
						<button type="button" class="btn-close"
							data-bs-dismiss="offcanvas" aria-label="Close"></button>
					</div>
					<div class="offcanvas-body">
						<ul class="navbar-nav justify-content-center">
							<li class="nav-item"><a class="nav-link active"
								aria-current="page" href="#">Dashbord</a></li>
							<li class="nav-item"><a class="nav-link"
								href="adminViewCategories">Categories</a></li>
							<li class="nav-item"><a class="nav-link"
								href="adminViewProducts">Products</a></li>
							<li class="nav-item"><a class="nav-link"
								href="adminViewOrders">Orders</a></li>
						</ul>
					</div>
					<div class="offcanvas-footer">
						<ul class="navbar-nav justify-content-center">
						<li class="nav-item"><a class="nav-link"
							href="adminLogout">logout</a></li>
						</ul>
					</div>
				</div>

			</div>
		</nav>
	</div>
	<br>
	<br>
	<br>
	<br>






</body>
</html>