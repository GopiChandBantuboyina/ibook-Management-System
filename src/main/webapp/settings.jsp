<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.DAO.*,com.DB.*,com.entity.*,java.util.*"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Settings</title>
<%@ include file="allComponents/allCss.jsp"%>

<style>
a {
	text-decoration: none;
	color: black;
}

a:hover {
	text-decoration: none;
	color: black;
}
</style>
</head>
<body style="background-color: #eeeeee">
	<%@ include file="allComponents/navbar.jsp"%>
	<c:if test="${empty userobj}">

		<c:redirect url="login.jsp"></c:redirect>
	</c:if>
	<%
	User us = (User) session.getAttribute("userobj");
	%>
	<div class="container pb-3">

		<h4 class="text-center mt-2">
			Hello,
			<%=us.getName()%></h4>
		<div class="row pt-5 pl-5 pr-5 pb-4">
			<div class="col-md-4">
				<a href="sellOldBook.jsp">
					<div class="card border-warning ">
						<div class="card-body text-center">
							<i class="fa-solid fa-book-open fa-2x text-primary"></i>
							<h4>Sell Old Book</h4>
						</div>

					</div>
				</a>
			</div>
			<div class="col-md-4">
				<a href="userOldBooks.jsp">
					<div class="card border-danger ">
						<div class="card-body text-center">
							<i class="fa-solid fa-book-open-reader text-info fa-2x"></i>
							<h4>Old Books</h4>
						</div>

					</div>
				</a>
			</div>
			<div class="col-md-4">
				<a href="editProfile.jsp">
					<div class="card border-info ">
						<div class="card-body text-center">
							<i class="fa-solid fa-address-card fa-2x text-success"></i>
							<h5>Login & Security (Edit Profile)</h5>
						</div>

					</div>
				</a>
			</div>

		</div>
		<div class="row pl-5 pr-5">
			<div class="col-md-4">
				<a href="userAddress.jsp">
					<div class="card border-success ">
						<div class="card-body text-center">
							<i class="fa-solid fa-location-dot text-warning fa-2x"></i>
							<h4>Your Address</h4>
							<p>Edit Address</p>
						</div>

					</div>
				</a>
			</div>
			<div class="col-md-4">
				<a href="orders.jsp">
					<div class="card border-primary ">
						<div class="card-body text-center">
							<i class="fa-solid fa-box-open fa-2x text-danger"></i>
							<h4>My Orders</h4>
							<p>Track Your Order</p>
						</div>

					</div>
				</a>
			</div>
			<div class="col-md-4">
				<a href="helpline.jsp">
					<div class="card border-danger ">
						<div class="card-body text-center">
							<i class="fa-solid fa-circle-user fa-2x text-info"></i>
							<h4>Help Center</h4>
							<p>24*7 Service</p>
						</div>

					</div>
				</a>
			</div>
		</div>

	</div>
	
	<div class="mt-5 pt-5">
		<%@ include file="allComponents/footer.jsp"%>
	</div>
</body>
</html>