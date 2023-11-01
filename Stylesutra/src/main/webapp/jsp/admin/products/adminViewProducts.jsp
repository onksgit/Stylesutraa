	<%@page import="java.util.List"%>
<%@page import="com.Style.model.Products"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
							<li class="nav-item"><a class="nav-link" aria-current="page"
								href="dashbord">Dashbord</a></li>
							<li class="nav-item"><a class="nav-link"
								href="adminViewCaregories">Categories</a></li>
							<li class="nav-item"><a class="nav-link"
								href="adminViewProducts" active>Products</a></li>
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
		<c:if test="${not empty Productsavedmsg}">
			<div
				class="alert alert-primary alert-dismissible fade show mt-1 p-1 "
				style="height: 35px" role="alert">
				<c:out value="${Productsavedmsg}" />
				<button type="button" class="btn-close p-1" data-bs-dismiss="alert"
					aria-label="Close"></button>
			</div>
		</c:if>
	</div>



	<button type="button" class="btn btn-outline-success btn-sm float-end"
		data-bs-toggle="modal" data-bs-target="#addProductModal">Add
		Product</button>

	<div class="container-fluid row mt-2">
		<c:forEach var="products" items="${products}" varStatus="loop">
			<c:choose>
				<c:when test="${loop.index % 3 == 0}">
					<div class="container-fluid row mt-2 ms-3">
						<hr>
					</div>
				</c:when>
			</c:choose>

			<div class="card col ms-3">
				<div class="container">
					<div id="imageCarousel-${products.product_id}"
						class="carousel slide" data-ride="carousel">
						<div class="carousel-inner">
							<c:set var="img"
								value="${fn:split(products.product_imagepath, ',')}" />
							<c:forEach items="${img}" var="img" varStatus="loop">
								<div class="carousel-item ${loop.first ? 'active' : ''}">
									<img src="img/products/${img}"
										class="card-img-top img-fluid rounded">
								</div>
							</c:forEach>
						</div>

						<button class="carousel-control-prev" type="button"
							data-bs-target="#imageCarousel-${products.product_id}"
							data-bs-slide="prev">
							<span class="carousel-control-prev-icon" aria-hidden="true"></span>
							<span class="visually-hidden">Previous</span>
						</button>
						<button class="carousel-control-next" type="button"
							data-bs-target="#imageCarousel-${products.product_id}"
							data-bs-slide="next">
							<span class="carousel-control-next-icon" aria-hidden="true"></span>
							<span class="visually-hidden">Next</span>
						</button>
					</div>

				</div>
				<div class="card-body">
					<h5 class="card-title">${products.product_name}</h5>
					<h6 class="card-subtitle mb-2 text-muted">${products.product_type}</h6>
					<p class="card-text">${products.product_description}</p>
					<br>
					<p class="card-text">${products.product_info}</p>
					<h6 class="card-subtitle mb-2 text-muted">Price:
						${products.product_price}</h6>
					<h6 class="card-subtitle mb-2 text-muted">Discount:
						${products.product_discount_in_percentage} %</h6>
					<div class="card-footer text-muted">
						<a class="card-link"
							href="adminEditViewProducts?product_id=${products.product_id}">Edit</a>
						<a class="card-link"
							href="adminDeleteProducts?product_id=${products.product_id}">Delete</a>
					</div>
				</div>
			</div>
		</c:forEach>

	</div>

	<div class="modal fade" id="addProductModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div
			class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="addProductModalLabel">Add
						Product</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form action="adminSaveProduct" method="Post"
						enctype="multipart/form-data">
						<div class="form-floating mb-3">
							<input type="text" class="form-control" id="product_name"
								name="product_name" placeholder="onks" required="required">
							<label for="product_name" class="col-form-label">Name</label>
						</div>
						<div class="form-floating mb-3">
							<input type="text" class="form-control" id="product_type"
								name="product_type" placeholder="type" required="required">
							<label for="product_type" class="col-form-label">Type</label>
						</div>
						<div class="form-floating mb-3">
							<textarea class="form-control" id="product_description"
								name="product_description" placeholder="desc"
								required="required"></textarea>
							<label for="product_description" class="col-form-label">Description</label>
						</div>
						<div class="form-floating mb-3">
							<select class="form-select" id="fk_category_id"
								name="category_id" required="required">
								<c:forEach var="categories" items="${categories}">
									<option value="${categories.category_id}">${categories.category_name}</option>
								</c:forEach>
							</select> <label for="categories" class="col-form-label">-Category-</label>
						</div>
						<div class="form-floating mb-3">
							<textarea class="form-control" id="product_info"
								name="product_info" placeholder="extra-info" required="required"></textarea>
							<label for="product_info" class="col-form-label">Extra
								Info</label>
						</div>
						<div class="form-floating mb-3">
							<input type="number" class="form-control" id="product_price"
								name="product_price" placeholder="price" required="required">
							<label for="product_price" class="col-form-label">Price</label>
						</div>
						<div class="form-floating mb-3">
							<input type="number" class="form-control"
								id="product_discount_in_percentage"
								name="product_discount_in_percentage" placeholder="50.3"
								required="required"> <label
								for="product_discount_in_percentage" class="col-form-label">Discount(Enter
								number's Only)</label>
						</div>

						<div class="form-floating mb-3">
							<input type="number" class="form-control" id="product_quantity"
								name="product_quantity" placeholder="quantity"
								required="required"> <label for="product_quantity"
								class="col-form-label">Quantity</label>
						</div>
						<div class="mb-3">
							<label for="product_imagepath1" class="col-form-label">Select
								Image</label> <input type="file" class="form-control"
								id="product_imagepath" name="product_image" placeholder="image1"
								multiple="multiple">
						</div>

						<input type="submit" value="Add" class="btn btn-primary">
					</form>
				</div>
			</div>
		</div>
	</div>
</body>

<script>
	$(document).ready(function() {

	});
</script>
</html>