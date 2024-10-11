<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.DAO.*,com.DB.*,com.entity.*,java.util.*"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HelpLine</title>
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
	<%-- <c:if test="${empty userobj}">

		<c:redirect url="login.jsp"></c:redirect>
	</c:if> --%>

	<div class="container text-center mt-5">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<i class="fa-solid fa-square-phone text-success fa-4x"></i>
					<h3>24*7 Service</h3>
					<h4>Helpline Number</h4>
					<p>+91 9014579769</p>
					<a href="index.jsp" class="btn btn-primary">Home</a>
					
			</div>
		</div>
	</div>

</body>
</html>