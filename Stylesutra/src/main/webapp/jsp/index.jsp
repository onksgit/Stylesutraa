<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HOME</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="/components/comman_css_and_js.jsp"%>
</head>
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
							<a class="nav-link text-light" href="#"><i
								class="bi bi-search"></i></a>
						</h5></li>
					<li class="nav-item"><h5>
							<a class="nav-link text-light" href="#"><i
								class="bi bi-cart-plus-fill"></i><span class="cart-items"></span></a>
						</h5></li>
				</ul>
			</div>
		</nav>
	</div>
	<br>
	<br>
	<br>
	<br>

	<c:if test="${not empty verificationsuccessmsg}">
		<script>
			$(document).ready(function() {
				$('#msgmodal').modal('show'); // Show the modal
			});
		</script>
	</c:if>


	<div id="msgmodal" class="modal fade" tabindex="-1"
		aria-labelledby="VerificationMSG" aria-hidden="true" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="staticBackdropLabel">Verification
						Link Sent</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<h5>
						A verification link has been sent to your email address. Please
						check your inbox and click the link to verify your account.<br>
						If you don't see the email,<br> please also check your spam
						or junk folder.
					</h5>
				</div>
			</div>
		</div>
	</div>


	<div class="container-fluid me-2 ">
		<div id="carouselExampleDark"
			class="carousel carousel-light slide overflow-scroll"
			data-bs-ride="carousel">
			<div class="carousel-indicators">
				<button type="button" data-bs-target="#carouselExampleDark"
					data-bs-slide-to="0" class="active" aria-current="true"
					aria-label="Slide 1"></button>
				<button type="button" data-bs-target="#carouselExampleDark"
					data-bs-slide-to="1" aria-label="Slide 2"></button>
				<button type="button" data-bs-target="#carouselExampleDark"
					data-bs-slide-to="2" aria-label="Slide 3"></button>
			</div>
			<div class="carousel-inner">
				<div class="carousel-item active" data-bs-interval="10000">
					<img
						src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRg4chPkipsNBAZS4otjJ14-Kqn7Y3Ltse4dQ&usqp=CAU"
						alt="..." class="d-block w-100 img-fluid overflow-y-auto">
					<div class="carousel-caption d-none d-md-block">
						<h5>First slide label</h5>
						<p>Some representative placeholder content for the first
							slide.</p>
					</div>
				</div>
				<div class="carousel-item" data-bs-interval="2000">
					<img
						src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRg4chPkipsNBAZS4otjJ14-Kqn7Y3Ltse4dQ&usqp=CAU"
						alt="..." class="d-block w-100 img-fluid overflow-y-auto">
					<div class="carousel-caption d-none d-md-block">
						<h5>Second slide label</h5>
						<p>Some representative placeholder content for the second
							slide.</p>
					</div>
				</div>
				<div class="carousel-item">
					<img
						src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRg4chPkipsNBAZS4otjJ14-Kqn7Y3Ltse4dQ&usqp=CAU"
						alt="..." class="d-block w-100 img-fluid overflow-y-auto">
					<div class="carousel-caption d-none d-md-block">
						<h5>Third slide label</h5>
						<p>Some representative placeholder content for the third
							slide.</p>
					</div>
				</div>
			</div>
			<button class="carousel-control-prev" type="button"
				data-bs-target="#carouselExampleDark" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#carouselExampleDark" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>
	</div>
	<br>
	<br>
	<br>



	<div class="container-fluid mt-3">
		<center>
			<h5>TRENDING</h5>
		</center>
		<br>
		<div class="row scrolling-row ">
			<div class="col">
				<img
					class="bd-placeholder-img rounded-circle mx-auto d-block  category-img"
					alt="Category" width="200" height="200"
					src="https://images.unsplash.com/photo-1586790170083-2f9ceadc732d?auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8dCUyMHNoaXJ0fGVufDB8fDB8fHww&w=500">
				<h2 class="fw-normal text-center">Tshirts</h2>
				<!-- 				<p class="text-center">Some representative placeholder content for the three columns -->
				<!-- 					of text below the carousel. This is the first column.</p> -->
				<!-- 				<p> -->
				<!-- 					<a class="btn btn-secondary" href="#">View details »</a> -->
				<!-- 				</p> -->
			</div>
			<div class="col">
				<img
					class="bd-placeholder-img rounded-circle mx-auto d-block category-img"
					width="200" height="200" alt=""
					src="https://www.w3schools.com/bootstrap/la.jpg">
				<h2 class="fw-normal text-center">Heading</h2>
			</div>
			<div class="col">
				<img
					class="bd-placeholder-img rounded-circle mx-auto d-block category-img"
					width="200" height="200" alt=""
					src="https://images.unsplash.com/photo-1618333826210-34c62badc237?auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fGhvb2RpZXN8ZW58MHx8MHx8fDA%3D&w=500">
				<h2 class="fw-normal text-center">Hodiees</h2>
			</div>
			<div class="col">
				<img
					class="bd-placeholder-img rounded-circle mx-auto d-block category-img"
					width="200" height="200" alt=""
					src="data:image/jpeg;base64,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">
				<h2 class="fw-normal text-center">Over Sized</h2>
			</div>
			<div class="col">
				<img
					class="bd-placeholder-img rounded-circle mx-auto d-block category-img"
					width="200" height="200" alt=""
					src="data:image/jpeg;base64,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">
				<h2 class="fw-normal text-center">Heading</h2>
			</div>
			<div class="col">
				<img
					class="bd-placeholder-img rounded-circle mx-auto d-block category-img"
					width="200" height="200" alt=""
					src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS8QGIvMPiG78vg995APbvs98Vquw4Wb9oNun5JUZaTJD-9xep7kHdxEEZw0eG16xMT7cQ&usqp=CAU">
				<h2 class="fw-normal text-center">Heading</h2>
			</div>
		</div>
	</div>
	<br>

	<div class="container">
		<div class="row gy-2 my-2">
			<c:forEach var="products" items="${products}" varStatus="loop">
				<div class="col-6 col-sm-6 col-md-4 col-lg-4 col-xl-3">
					<div class="card"
						style="box-shadow: rgba(0, 0, 0, 0.25) 0px 54px 55px, rgba(0, 0, 0, 0.12) 0px -12px 30px, rgba(0, 0, 0, 0.12) 0px 4px 6px, rgba(0, 0, 0, 0.17) 0px 12px 13px, rgba(0, 0, 0, 0.09) 0px -3px 5px;">
						<div class="container-fluid">


							<%-- 					<div id="imageCarousel-${products.product_id}" --%>
							<!-- 						class="carousel slide" data-ride="carousel"> -->
							<!-- 						<div class="carousel-inner"> -->
							<c:set var="img"
								value="${fn:split(products.product_imagepath, ',')}" />
							<%-- 							<c:forEach items="${img}" var="img" varStatus="loop"> --%>
							<%-- 								<div class="carousel-item ${loop.first ? 'active' : ''}"> --%>
							<img src="img/products/${img[0]}" class="card-img-top img-fluid"
								alt="Image1" id="image1"> <img
								src="img/products/${img[1]}"
								class="card-img-top img-fluid hover-image" alt="image2"
								id="image2">
							<c:if test="${products.product_discount_in_percentage>0}">
								<div
									class=" mt-2 ms-2 position-absolute top-0 start-0 badge rounded-pill text-bg-danger  mb-2"
									style="padding: 3px 5px">Save
									${products.product_discount_in_percentage}%</div>
							</c:if>
							<!-- 								</div> -->
							<%-- 							</c:forEach> --%>
							<!-- 						</div> -->

							<!-- 						<button class="carousel-control-prev" type="button" -->
							<%-- 							data-bs-target="#imageCarousel-${products.product_id}" --%>
							<!-- 							data-bs-slide="prev"> -->
							<!-- 							<span class="carousel-control-prev-icon" aria-hidden="true"></span> -->
							<!-- 							<span class="visually-hidden">Previous</span> -->
							<!-- 						</button> -->
							<!-- 						<button class="carousel-control-next" type="button" -->
							<%-- 							data-bs-target="#imageCarousel-${products.product_id}" --%>
							<!-- 							data-bs-slide="next"> -->
							<!-- 							<span class="carousel-control-next-icon" aria-hidden="true"></span> -->
							<!-- 							<span class="visually-hidden">Next</span> -->
							<!-- 						</button> -->
						</div>
						<div class="card-body">
							<a
								class="card-title fw-bold text-decoration-none text-dark text-sm text-ellipsis"
								href="#">${products.product_name}</a>
							<h5 class="fs-5 text-sm" style="color: red">
								<b class="fw-bolder">&#8377</b>
								${products.getproductPriceInInteger()} <span
									class="fs-6 text-muted text-decoration-line-through text-sm">&#8377
									${products.getDiscountedPrice()} </span>
							</h5>
							<%-- 							<c:if test="${products.product_discount_in_percentage>0}"> --%>
							<!-- 								<div class="badge rounded-pill text-bg-info  mb-2" -->
							<!-- 									style="padding: 3px 5px">Save -->
							<%-- 									${products.product_discount_in_percentage} %</div> --%>
							<%-- 							</c:if> --%>

							<div class="container">
								<a href="#" class="d-grid btn btn-outline-warning rounded-pill"
									style="padding: 7px 11px"
									onclick="add_to_cart(${products.product_id},'${products.product_name}',${products.getDiscountedPrice()})">Add
									to cart</a>
								<!-- 									<a href="#" class="btn btn-outline-danger rounded-pill" style="padding: 7px 11px">Buy -->
								<!-- 									Now</a> -->
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	<!-- 	</div> -->




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
							class="bi bi-instagram" width="24" height="24"> <use
									xlink:href="#instagram"></use></i></a></li>
					<li class="ms-3"><a class="link-body-emphasis" href="#"><i
							class="bi bi-facebook" width="24" height="24"> <use
									xlink:href="#facebook"></use></i></a></li>
				</ul>
			</div>
		</footer>
	</div>

</body>
<style>
.scrolling-row {
	white-space: nowrap;
	overflow-x: scroll;
	flex-wrap: nowrap;
}

.scrolling-row .col {
	display: inline-block;
	margin-right: 30px; /* Adjust spacing between columns */
	margin-bottom: 10px;
}
</style>

<style>
.container-fluid {
	position: relative;
	overflow: hidden;
}

.hover-image {
	display: none;
	transform: scale(1);
	transition: transform 0.3s ease, opacity 0.9s ease;
	opacity: 0;
}

.container-fluid:hover .hover-image {
	display: block;
	transform: scale(1.1);
	opacity: 1;
}

.container-fluid #image1 {
	transform: scale(1.1);
}

.container-fluid:hover #image1 {
	display: none;
}
</style>


<style>
/* Custom CSS for responsive image and text size */
@media ( min-width : 300px) and (max-width: 576px) {
	.category-img {
		width: 890px;
		height: 90px;
	}
	h2 {
		font-size: 18px;
	}
}

@media ( max-width : 576px) {
	.category-img {
		width: 100px;
		height: 100px;
	}
	h2 {
		font-size: 20px;
	}
}

@media ( min-width : 577px) and (max-width: 992px) {
	.category-img {
		width: 150px;
		height: 150px;
	}
	h2 {
		font-size: 24px;
	}
}

@media ( min-width : 993px) {
	.category-img {
		width: 170px;
		height: 170px;
	}
	h2 {
		font-size: 26px;
	}
}
</style>


<script type="text/javascript">

</script>
</html>

