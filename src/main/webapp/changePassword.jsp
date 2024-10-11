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
</head>
<body>
	<c:if test="${empty userobj}">

		<c:redirect url="login.jsp"></c:redirect>
	</c:if>

	<%@ include file="allComponents/navbar.jsp"%>
	<%
	User us = (User) session.getAttribute("userobj");
	%>

	<div class="container mt-4">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-body">
					<h4 class="text-center text-info">Change Password</h4>
					
					<c:if test="${not empty failmsg }">
					<h6 class="text-center alert alert-success">${failmsg }</h6>
					<c:remove var="failmsg"/>
					</c:if>
					
					<c:if test="${not empty errmsg }">
					<h6 class=" text-center alert alert-success">${errmsg }</h6>
					<c:remove var="errmsg"/>
					</c:if>
						<form action="changePassword" method="POST" onsubmit="return validateForm()">
						
						<input type="hidden" name="id" value="<%=us.getId() %>" />
							<div class="form-group">
								<label for="exampleInputEmail1">Old Password*</label> <input
									type="password" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="old Password" name="old" required>
							
							</div>
							<div class="form-group">
								<label for="pwd">New Password*</label> <input
									type="password" class="form-control" id="pwd"
									placeholder="Password" required id="newpwd" name="newpwd">
							</div>
							<div class="form-group">
								<label for="cpwd">Confirm Password*</label> <input
									type="password" class="form-control" id="cpwd"
									placeholder="Password" required>
							</div>
							<div class="form-check">
								<input type="checkbox" class="form-check-input"
									id="exampleCheck1" required> <label class="form-check-label"
									for="exampleCheck1">Check me out</label>
							</div>
							<button type="submit" class="btn btn-primary">Change</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<%@ include file="allComponents/footer.jsp"%>
	<script type="text/javascript">
	function validateForm()
	{
		
		var pwd=document.getElementById("pwd").value;
		var cpwd=document.getElementById("cpwd").value;
		
		if(pwd.length <8 || cpwd.length<8){
			alert("Password must conatins atleast 8 Characters.");
			return false;
		}
		if(cpwd!==pwd)
		{
			alert("Password Miss Match..");
			return false;
		}
		return true;
	}
	</script>
</body>
</html>