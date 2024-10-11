<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.DAO.*,com.DB.*,com.entity.*,java.util.*"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User:Sell Old Books</title>
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

						<h4 class="text-center text-info">Sell Old Book</h4>

						<c:if test="${not empty sucmsg }">
							<p class="text-center text-success" id="msg">${sucmsg }</p>
							<c:remove var="sucmsg" />
						</c:if>

						<c:if test="${not empty errormsg }">
							<p class="text-center text-danger" id="msg">${errormsg }</p>
							<c:remove var="errormsg" />
						</c:if>


						<form action="sellOldBook" method="POST"
							enctype="multipart/form-data">

							<input type="hidden" name="email" value="<%=us.getEmail()%>" />
							<div class="form-group">
								<label for="exampleInputEmail1">Book Name*</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="name" name="bname"
									required>

							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Author Name*</label> <input
									type="text" class="form-control" id="exampleInputPassword1"
									placeholder="author" name="aname" required style="text-transform: uppercase;">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Price*</label> <input
									type="number" class="form-control" id="exampleInputPassword1"
									placeholder="Price" name="price" required>
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Upload Photo*</label> <input
									type="file" class="form-control-file" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="name" name="bimg"
									required>
							</div>

							

							<button type="submit" class="btn btn-primary">Sell</button>

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
		let p2 = document.getElementById("msg");

		if (p2) {
			setTimeout(function() {
				p2.style.display = "none";
			}, 3500);
		}
	</script>
	
</body>
</html>