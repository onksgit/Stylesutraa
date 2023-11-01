<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/components/comman_css_and_js.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


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
						<h2>Sign Up</h2>
					</div>
					<div class="card-body">
						<form action="verifyuser" method="Post">
							<div class="form-group form-floating mb-3">
								<input type="text" class="form-control" id=user_firstname
									name="user_firstname" placeholder="Enter your Firstname"
									required> <label for="user_firstname">First
									Name</label>
							</div>
							<div class="form-group form-floating mb-3">
								<input type="text" class="form-control" id="user_lastname"
									name="user_lastname" placeholder="Enter your Lastname" required>
								<label for="user_lastname">Last Name</label>
							</div>
							<div class="form-group form-floating mb-3">
								<!-- 								<div class="input-group"> -->
								<input type="text" class="form-control" id="user_email"
									name="user_email" placeholder="Enter your Email address"
									value="${email}" required> <label for="username">E-Mail</label>
								<!-- 									<div class="input-group-append"> -->
								<!-- 										<button type="submit" name="otp" -->
								<!-- 											class="btn btn-outline-warning" onclick="sendotp()">Send -->
								<!-- 											OTP</button> -->
								<!-- 									</div> -->
								<!-- 								</div> -->
							</div>
							<!-- 							<div class="container"> -->
							<%-- 								<c:if test="${not empty otpmsg}"> --%>
							<!-- 									<div -->
							<!-- 										class="alert alert-primary alert-dismissible fade show mt-1 p-1 " -->
							<!-- 										style="height: 35px" role="alert"> -->
							<%-- 										<c:out value="${otpmsg}" /> --%>
							<!-- 										<button type="button" class="btn-close p-1" -->
							<!-- 											data-bs-dismiss="alert" aria-label="Close"></button> -->
							<!-- 									</div> -->
							<%-- 								</c:if> --%>
							<!-- 							</div> -->
							<!-- 							<div class="form-group"> -->
							<!-- 								<label for="otp">OTP</label> <input type="text" -->
							<!-- 									class="form-control" id="otp" name="otp" -->
							<!-- 									placeholder="Enter OTP Sent on your Email address" required> -->
							<!-- 							</div> -->
							<div class="form-group form-floating mb-3">
								<input type="password" class="form-control" id="user_password"
									name="user_password" placeholder="Enter your password" required>
								<label for="password">Password</label>
							</div>

							<br>
							<div class="d-grid">
								<button type="submit" name="register" class="btn btn-info">register</button>
							</div>

							<div class="text-start mt-2">
								<a href="login">Login</a>
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
							class="bi bi-instagram" width="24" height="24"> <use
									xlink:href="#instagram"></use></i></a></li>
					<li class="ms-3"><a class="link-body-emphasis" href="#"><i
							class="bi bi-facebook" width="24" height="24"> <use
									xlink:href="#facebook"></use></i></a></li>
				</ul>
			</div>
		</footer>
	</div>

	<div id="msgmodal" class="modal fade bd-example-modal-sm" tabindex="-1"
		role="dialog" aria-labelledby="OTP Sending.." aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<h5>Please Wait! OTP is sending On Your Email!</h5>
			</div>
		</div>
	</div>
 <div class="spinner-border" role="status" id="loading-spinner">
  <span class="visually-hidden">Loading...</span>
</div>
</body>
<script type="text/javascript">
	// 	function sendotp() {
	// 		$('#msgmodal').modal('show');
	// 		var email = document.getElementById("user_email").value;
	// 		var url = "sendotp?user_email="+email;
	// 		window.location.href = url;		

	// 	}

    document.querySelector('form').addEventListener('submit', function () {
        document.querySelector('#loading-spinner').style.display = 'block';
    });


</script>
<style>
#loading-spinner {
    display: none;
    border: 6px solid #f3f3f3;
    border-top: 6px solid #3498db;
    border-radius: 50%;
    width: 40px;
    height: 40px;
    animation: spin 1s linear infinite;
    position: absolute;
    top: 50%;
    left: 50%;
    margin-left: -20px;
    margin-top: -20px;
}

@keyframes spin {
    0% { transform: rotate(0deg); }
    100% { transform: rotate(360deg); }
}

</style>

</html>