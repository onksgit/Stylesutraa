<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>s
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
								href="adminViewCategories" active>Categories</a></li>
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
		<c:if test="${not empty Categorysavedmsg}">
			<div
				class="alert alert-primary alert-dismissible fade show mt-1 p-1 "
				style="height: 35px" role="alert">
				<c:out value="${Categorysavedmsg}" />
				<button type="button" class="btn-close p-1" data-bs-dismiss="alert"
					aria-label="Close"></button>
			</div>
		</c:if>
	</div>




	<div class="container">
		<button type="button" class="btn btn-outline-success btn-sm float-end"
			data-bs-toggle="modal" data-bs-target="#addCategoryModal">Add
			Category</button>
			
		<table class="table table-hover table-responsive">
			<thead>
				<tr>
					<th scope="col">Category Name</th>
<!-- 					<th scope="col">Category Type</th> -->
					<th scope="col">Description</th>
					<th scope="col">Edit</th>
					<th scope="col">Delete</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="categories" items="${categories}">
					<tr>
						<th contenteditable="true">${categories.category_name}</th>
<%-- 						<td contenteditable="true">${categories.category_type}</td> --%>
						<td contenteditable="true">${categories.category_description}</td>
						<td><a
							href="adminEditViewCategories?category_id=${categories.category_id}">Edit</a></td>
						<td><a
							href="adminDeleteCategories?category_id=${categories.category_id}">Delete</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<div class="modal fade" id="addCategoryModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="addCategoryModalLabel">Add
						Category</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form action="adminSaveCategory" method="Post">
						<div class="mb-3">
							<label for="category_name" class="col-form-label">Name:</label> <input
								type="text" class="form-control" id="category_name"
								name="category_name" required="required">
						</div>
<!-- 						<div class="mb-3"> -->
<!-- 							<label for="category_type" class="col-form-label">Type:</label> <input -->
<!-- 								type="text" class="form-control" id="category_type" -->
<!-- 								name="category_type" required="required"> -->
<!-- 						</div> -->
						<div class="mb-3">
							<label for="category_description" class="col-form-label">Description:</label>
							<textarea class="form-control" id="category_description"
								name="category_description" required="required"></textarea>
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