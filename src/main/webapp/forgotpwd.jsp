<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.DAO.*,com.DB.*,com.entity.*,java.util.*"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Change Password</title>
<%@ include file="allComponents/allCss.jsp"%>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	crossorigin="anonymous">
<style>
marquee {
	font-size: 20px;
	font-weight: bold;
	display: none;
}
</style>
</head>
<body>

	<%@ include file="allComponents/navbar.jsp"%>
	<div class="container-fluid m-5">

		<div class="text-center" style="display: none;" id="div1">
			<h5>Hello</h5>
		</div>
		<div class="container mt-4">
			<div class="row">
				<div class="col-md-6 offset-md-3">

					<div class="d-flex justify-content-center text-primary">
					<div class="spinner-border d-none" id="spinner" role="status">
						<span class="sr-only">Loading...</span>
					</div>
				</div>
				<div class="d-none text-center mt-5" id="d2">
				<i class="fa-solid fa-envelope-circle-check fa-3x text-success"></i>
					<h6 class="alert alert-success text-center d-none mt-3" id="h1"></h6>
				</div>
					<div class="card mt-5" id="card1">
						<div class="card-body">



							<h4 class="text-center text-info">Forgot Password</h4>
							<form id="form1">


								<div class="form-group">
									<label for="exampleInputEmail1">Email*</label> <input
										type="email" class="form-control" id="exampleInputEmail1"
										aria-describedby="emailHelp" placeholder="" required>

								</div>


								<button type="submit" class="btn btn-primary">Submit</button>

							</form>
						</div>
					</div>


				</div>
				
			</div>
			<div class="text-center">
				<p class="text-info"><span class="text-danger">Note*:</span>This Functionality is under Development No Real Link has been Sent to Your Email.</p>
			</div>
		</div>
		</div>
		<div class="fixed-bottom">
		<%@ include file="allComponents/footer.jsp"%>
		</div>
		<script type="text/javascript">
		let form1 = document.getElementById("form1");
		form1.addEventListener('submit', function(event) {
			event.preventDefault();

			let card1 = document.getElementById("card1");
			card1.style.display = "none";
			let exampleInputEmail1=document.getElementById("exampleInputEmail1").value;
			let spinner = document.getElementById("spinner");
			spinner.classList.toggle("d-none");
			setTimeout(function() {
				spinner.classList.toggle("d-none");
				document.getElementById("d2").classList.toggle("d-none");
				let h1=document.getElementById("h1");
				h1.classList.toggle("d-none");
	            h1.textContent="Forgot Email Link has been sent to Your "+exampleInputEmail1+" Email";
	            
            },800);
			
		});
		</script>
</body>
</html>