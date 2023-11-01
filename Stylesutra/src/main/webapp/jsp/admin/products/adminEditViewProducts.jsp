<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>s
<%@include file="/components/comman_css_and_js.jsp"%>
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
								href="adminViewCaregories">Categories</a></li>
							<li class="nav-item"><a class="nav-link"
								href="adminViewProducts">Products</a></li>
							<li class="nav-item"><a class="nav-link"
								href="adminViewOrders">Orders</a></li>
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

	<div class="container">
		<c:if test="${not empty otpmsg}">
			<div
				class="alert alert-primary alert-dismissible fade show mt-1 p-1 "
				style="height: 35px" role="alert">
				<c:out value="${otpmsg}" />
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
						<h2>Update Product</h2>
					</div>
					<div class="card-body">
						<form action="adminEditSaveProduct" method="Post">
						<div class="mb-3">
							<label for="product_id" class="col-form-label">Id:</label> <input
								type="text" class="form-control" id="product_id"
								name="product_id"  value="${products.product_id}" readonly="readonly">
						</div>
						<div class="mb-3">
							<label for="category_name" class="col-form-label">Name:</label> <input
								type="text" class="form-control" id="category_name"
								name="category_name" value="${products.product_name}" required="required">
						</div>
<!-- 						<div class="mb-3"> -->
<!-- 							<label for="category_type" class="col-form-label">Type:</label> <input -->
<!-- 								type="text" class="form-control" id="category_type" -->
<%-- 								name="category_type" value="${categories.category_type}" required="required"> --%>
<!-- 						</div> -->
						<div class="mb-3">
							<label for="category_description" class="col-form-label">Description:</label>
							<textarea class="form-control" id="category_description"
								name="category_description" required="required">${categories.category_description}</textarea>
						</div>
						<input type="submit" value="Update" class="btn btn-primary">
					</form>
					</div>
				</div>
			</div>
		</div>
	</div>








</body>
</html>