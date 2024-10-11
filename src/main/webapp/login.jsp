<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>

<%@ include file="allComponents/allCss.jsp"%>
</head>
<body>
	<%@include file="allComponents/navbar.jsp"%>

	<div class="container-fluid m-4">
		<div class="row">
			<div class="col-md-3 offset-md-4">
				<div class="card">
					<h4 class="text-center">Login Page</h4>
					<c:if test="${not empty pwdmsg }">
					<h5 class="alert alert-success" id="errmsg">${pwdmsg }</h5>
					<c:remove var="pwdmsg"/>
					</c:if>
					<c:if test="${not empty sucmsg }">
					<h5 class="text-info text-center" id="errmsg">${sucmsg}</h5>
					<c:remove var="sucmsg"/>
					</c:if>
					<c:if test="${not empty updatemsg }">
					<h5 class="text-info text-center" id="errmsg">${updatemsg}</h5>
					<c:remove var="updatemsg"/>
					</c:if>
					<c:if test="${not empty failedmsg }">
					<h5 class="text-danger text-center" id="errmsg">${failedmsg}</h5>
					<c:remove var="failedmsg"/>
					</c:if>
					
					
					<div class="card-body">
						<form action="login" method="POST">
						
							<div class="form-group">
								<label for="exampleInputPassword1">Email</label> <input
									type="email" class="form-control" id="exampleInputPassword1"
									placeholder="email" name="email" required>
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									placeholder="Password" name="pwd" required>
							</div>
							<div class="text-center">
								<button type="submit" class="btn btn-primary">Submit</button><br>
								<a href="register.jsp" class="text-success">Create Account</a><br>
								<a href="forgotpwd.jsp" class="text-danger">Forgot Password</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

<div class="fixed-bottom">
		<%@ include file="allComponents/footer.jsp"%>
		</div>
	
	<script type="text/javascript">
	

	let p2=document.getElementById("errmsg");

	if(p2)
	{
	setTimeout(function() {
		p2.style.display="none";
	}, 3000);
	}
	</script>
</body>
</html>