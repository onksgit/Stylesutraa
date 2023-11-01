<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/components/comman_css_and_js.jsp"%>
</head>
<body>
	<div class="container">
		<nav class="navbar fixed-top shadow p-2 mb-4">
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
							<li class="nav-item"><a class="nav-link" href="dashbord">Hoodies</a></li>
							<li class="nav-item"><a class="nav-link" href="#">Oversized</a></li>
						</ul>
					</div>
				</div>
				<h2>
					<a class="navbar-brand badge badge-secondary" href="#">STYLESUTRA</a>
				</h2>

				<ul class="nav nav-underline justify-content-end">
					<li class="nav-item sm-d-none"><h5>
							<a class="nav-link text-light" href="login"><i
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
		<nav class="container-fluid navbar justify-content-center" style="background-color:#e4e4e4; height: 60px;">
			<ul class="nav nav-underline">
				<li class="nav-item"><a class="nav-link text-dark" href="#">Address</a></li>
				<li class="nav-item"><a class="nav-link text-dark" href="#">Orders</a></li>
				<span><li class="nav-item"><a class="nav-link text-dark fw-light" href="userLogout">Logout</a></li></span>
			</ul>

		</nav>
	</div>

	<c:if test="${not empty user}">
		<c:out value="${user}"></c:out>
	</c:if>

</body>
</html>