<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register page</title>

<%@ include file="allComponents/allCss.jsp"%>
</head>
<body>
	<%@ include file="allComponents/navbar.jsp"%>

	<div class="container mt-4 mb-3">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h3 class="text-center">Registration Page</h3>

						<c:if test="${not empty sucmsg}">
							<p class="text-center text-success">Succesfully Registered</p>
							<c:remove var="sucmsg" />
						</c:if>


						<c:if test="${not empty errmsg1 }">
							<p class="text-center text-danger">Phone Number has already
								taken.</p>
							<c:remove var="errmsg1" />
						</c:if>
						<c:if test="${not empty errmsg2 }">
							<p class="text-center text-danger">${errmsg2}</p>
							<c:remove var="errmsg2" />
						</c:if>
						<c:if test="${not empty errmsg3 }">
							<p class="text-center text-danger">Some thing went
								Wrong....Try Again.</p>
							<c:remove var="errmsg3" />
						</c:if>
						
						<c:if test="${not empty failedmsg }">
							<p class="text-center text-danger">Please Accept terms and
								conditions...</p>
							<c:remove var="failedmsg" />
						</c:if>
						<form action="register1" method="POST" onsubmit="return validateForm()">
							<div class="form-group">
								<label for="exampleInputPassword1">Full name*</label> <input
									type="text" class="form-control" id="fname"
									placeholder="name" name="fname" required>
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Email*</label> <input
									type="email" class="form-control" id="email"
									placeholder="email@gmail.com" name="email" required>
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Phone no*</label> <input
									type="text" class="form-control" id="phno"
									placeholder="phno" name="phno" maxlength="10" required>
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password*</label> <input
									type="password" class="form-control" id="pwd"
									placeholder="Password" name="password" required>
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Confirm Password*</label> <input
									type="password" class="form-control" id="cpwd"
									placeholder="re-enter" name="con-password" required>
							</div>
							<div class="form-check">
								<input type="checkbox" class="form-check-input"
									id="exampleCheck1" name="cond" required> <label
									class="form-check-label" for="exampleCheck1">Accept
									Terms and Conditions </label>
							</div>
							<div class="text-center mt-1">
								<button type="submit" class="btn btn-primary">Submit</button><br>
								<a href="login.jsp" class="text-success">Already have Account</a>
							</div>
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
		var phno=document.getElementById("phno").value;
		var pwd=document.getElementById("pwd").value;
		var cpwd=document.getElementById("cpwd").value;
		if(phno.length !=10){
			alert("Phone number has length Exact 10.\n Please Check input .");
			return false;
		}
		if(pwd.length <8){
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