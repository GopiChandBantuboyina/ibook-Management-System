<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.DAO.*,com.DB.*,com.entity.*,java.util.*"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order Successfull</title>
<%@ include file="allComponents/allCss.jsp"%>
<style>
a {
	text-decoration: none;
	color: black;
}

a:hover {
	text-decoration: none;
}
</style>
</head>
<body>
	<%@ include file="allComponents/navbar.jsp"%>
	<c:if test="${empty userobj}">

		<c:redirect url="login.jsp"></c:redirect>
	</c:if>

	<div class="container mt-3 ">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card border  border-success">
					<div class="card-body text-center">
					<i class="fa-solid fa-circle-check fa-3x text-success"></i>
					<h2>Thank You</h2>
					<h4>Your Order Placed Successfully</h4>
					<p>With in 7 days Your Product will be Delivered in your Address</p>
					
					<a href="index.jsp" class="btn btn-primary">Home</a> 
					<a href="orders.jsp" class="btn btn-danger">View Order</a> 
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>