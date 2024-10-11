<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.DAO.*,com.DB.*,com.entity.*,java.util.*"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Profile</title>
<%@ include file="allComponents/allCss.jsp"%>
<style>
a{
 text-decoration: none;
 color:black;
}
a:hover{
	text-decoration: none;
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
	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">

						<h4 class="text-center text-success">Edit Profile</h4>
							
							<c:if test="${not empty sucmsg }">
							<p class="text-center text-success" id="msg">${sucmsg }</p>
							<c:remove var="sucmsg" />
						</c:if>

						<c:if test="${not empty errmsg }">
							<p class="text-center text-danger" id="msg">${errmsg }</p>
							<c:remove var="errmsg" />
						</c:if>
							
						<c:if test="${not empty failmsg }">
							<p class="text-center text-danger" id="msg">${failmsg }</p>
							<c:remove var="failmsg" />
						</c:if>


						<form action="editProfile" method="POST" onsubmit="return validateForm()">
						
						<input type="hidden" name="uid" value="<%=us.getId() %>" />
						
							<div class="form-group">
								<label for="exampleInputPassword1">Name*</label> <input
									type="text" class="form-control" id="fname"
									placeholder="name" name="fname" required value="<%=us.getName()%>">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Email*</label> <input
									type="email" class="form-control" id="email"
									placeholder="email@gmail.com" name="email" required value="<%=us.getEmail() %>">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Phone no*</label> <input
									type="text" class="form-control" id="phno"
									placeholder="phno" name="phno" maxlength="10" required value="<%=us.getPhno() %>">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password*</label> <input
									type="password" class="form-control" id="pwd"
									 name="password" required>
							</div>
							
							<div class=" mt-1">
								<button type="submit" class="btn btn-primary">Update</button><br>
								
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		
		<div class="text-center mt-3">

			<a href="settings.jsp" class="btn-lg btn-success"><i class="fa-solid fa-arrow-left"></i>  Back</a>
							
		</div>
	</div>
	
	
	
	<div style="margin-top: 20px">
		<%@ include file="allComponents/footer.jsp"%>
	</div>
	
	
	
	<script type="text/javascript">
	function validateForm()
	{
		var phno=document.getElementById("phno").value;
		var pwd=document.getElementById("pwd").value;
		if(phno.length !=10){
			alert("Phone number has length Exact 10.\n Please Check input .");
			return false;
		}
		if(pwd.length <8){
			alert("Password must conatins atleast 8 Characters.");
			return false;
		}
		return true;
	}
	
	let p2 = document.getElementById("msg");

	if (p2) {
		setTimeout(function() {
			p2.style.display = "none";
		}, 3500);
	}
	</script>
</body>
</html>