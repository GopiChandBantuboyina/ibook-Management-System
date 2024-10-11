<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.DAO.*,com.DB.*,com.entity.*,java.util.*"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User: Address</title>
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
<body style="background-color: #eeeeee">
	<%@ include file="allComponents/navbar.jsp"%>
	<c:if test="${empty userobj}">

		<c:redirect url="login.jsp"></c:redirect>
	</c:if>

	<div class="container mt-4">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card ">
					<div class="card-body">
						<h4 class="text-center text-success">Update Address</h4>



						<%
						HttpSession session1 = request.getSession();
						User u1 = (User) session1.getAttribute("userobj");
						userDAOimpl u5 = new userDAOimpl(DBconnect.getcon());
						User u2 = u5.login(u1.getEmail(), u1.getPassword());
						%>
						<c:if test="${not empty updated }">
							<h6 class="alert alert-success text-center" id="errmsg">${updated }</h6>
							<c:remove var="updated" />
						</c:if>

						<c:if test="${not empty errmsg }">
							<h6 class="alert alert-danger text-center" id="errmsg">${errmsg }</h6>
							<c:remove var="errmsg" />
						</c:if>

						<form action="updateProfile" method="POST"
							onsubmit="return validateForm()">

							<input type="hidden" name="uid" value="${userobj.id}" />

							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Address</label> <input type="text"
										class="form-control" id="inputEmail4" name="address"
										<%
										if (u2.getAddress() != null) 
										{%>
										value="<%=u2.getAddress()%>"
										 <%}%>
										style="text-transform: uppercase;" required>
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">LandMark</label> <input type="text"
										class="form-control" id="inputPassword4" name="landmark"
										<%
										if (u2.getLandmark() != null) 
										{%>
										value="<%=u2.getLandmark()%>"
										 <%}%>
										style="text-transform: uppercase;" required>
								</div>
							</div>

							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputPassword4">City</label> <input type="text"
										class="form-control" id="inputPassword4" name="city"
										<%
										if (u2.getCity() != null) 
										{%>
										value="<%=u2.getCity()%>"
										 <%}%>
										style="text-transform: uppercase;" required>
								</div>
								<div class="form-group col-md-6">
									<label for="inputCity">State</label> <input type="text"
										class="form-control" id="inputCity"
										<%
										if (u2.getState() != null) 
										{%>
										value="<%=u2.getState()%>"
										 <%}%>
										 
										name="state" style="text-transform: uppercase;" required>
								</div>

							</div>
							<div class="form-row">


								<div class="form-group col-md-6">
									<label for="pincode">Pincode</label> <input type="text"
										class="form-control" id="pincode"
										 <%
										if (u2.getPincode() != null) 
										{%>
										value="<%=u2.getPincode() %>"
										 <%}%>
										name="pincode">
								</div>
							</div>
							<div class="text-left">
								<button type="submit" class="btn btn-warning">Update
									Address</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>

		<div class="text-center mt-3">

			<a href="settings.jsp" class="btn-lg btn-success"><i
				class="fa-solid fa-arrow-left"></i> Back</a>

		</div>
	</div>



	<div style="margin-top: 50px;">
		<%@ include file="allComponents/footer.jsp"%>
	</div>



	<script type="text/javascript">
		function validateForm() {
			var pincode = document.getElementById("pincode").value;

			if (pincode.length == 6) {
				return true;
			} else {

				alert("pincode must contain only 6 Numbers.");
				return false;
			}
		}

		let p2 = document.getElementById("errmsg");

		if (p2) {
			setTimeout(function() {
				p2.style.display = "none";
			}, 3000);
		}
	</script>

</body>
</html>