<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.DAO.*,com.DB.*,com.entity.*,java.util.*"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cart Module</title>
<%@ include file="allComponents/allCss.jsp"%>
</head>
<body style="background-color:#f3f3f2">
	
	
	<c:if test="${empty userobj}">

		<c:redirect url="login.jsp"></c:redirect>
	</c:if>

	<%@ include file="allComponents/navbar.jsp"%>

	<c:if test="${not empty sucmsg }">
		<div class="alert alert-success text-center" style="font-weight: bold"
			role="alert" id="errmsg">${sucmsg}</div>
		<c:remove var="sucmsg" />
	</c:if>
	<c:if test="${not empty errmsg }">

		<div class="alert alert-danger text-center" style="font-weight: bold"
			role="alert" id="errmsg">${errmsg}</div>
		<c:remove var="errmsg" />
	</c:if>
	<c:if test="${not empty payment}">

		<div class="alert alert-danger text-center" style="font-weight: bold"
			role="alert" id="errmsg">${payment}</div>
		<c:remove var="payment" />
	</c:if>
	<c:if test="${not empty addmsg}">

		<div class="alert alert-danger text-center" style="font-weight: bold"
			role="alert" id="errmsg">${addmsg}</div>
		<c:remove var="addmsg" />
	</c:if>
	
	
	<div class="container-fluid mb-5">
		<div class="row mt-4 g-0">
			<div class="col-md-6 m-0 p-0">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center mb-3 text-success fw-bold">Your
							Selected Items</h4>
						<table class="table table-striped">
							<thead>
								<tr>
									<th scope="col">Book Name</th>
									<th scope="col">Author</th>
									<th scope="col">Quantity</th>
									<th scope="col">Price</th>
									<th scope="col">Action</th>
									<th scope="col">TotalCost</th>
								</tr>
							</thead>
							<tbody>

								<%
								User us = (User) session.getAttribute("userobj");
								cartDAOimpl dao = new cartDAOimpl(DBconnect.getcon());
								List<cart> ct = dao.getallCart(us.getId());
								Double tp = 0.0;
								for (cart c : ct) {
									tp += c.getTotalPrice();
								%>
								<tr>
									<th scope="row"><%=c.getBookname()%></th>
									<td><%=c.getAuthor()%></td>
									<td><%=c.getQuantity()%></td>
									<td><%=c.getPrice()%></td>

									<td><a
										href="removeBook?bid=<%=c.getBid()%>&&uid=<%=c.getUid()%>"
										class="btn btn-sm btn-danger text-white"><i class="fa-solid fa-minus"></i></a> <a
										href="addQuantity?bid=<%=c.getBid()%>&&uid=<%=c.getUid()%>"
										class="btn btn-sm btn-info text-white"><i class="fa-solid fa-plus"></i></a></td>

									<td><%=c.getTotalPrice()%></td>
								</tr>

								<%
								}
								%>
								<tr>

									<td style="font-weight: bold">Total Price</td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td style="font-weight: bold"><i
										class="fa-solid fa-indian-rupee-sign"></i> <%=tp%></td>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<%
							HttpSession session1 = request.getSession();
							User u1=(User)session1.getAttribute("userobj");
								userDAOimpl u5=new userDAOimpl(DBconnect.getcon());
								User u2=u5.login(u1.getEmail(),u1.getPassword());
							
							%>
			
			<div class="col-md-6">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center mb-3 text-info fw-bold">Your Details
							For Order</h4>
						<!-- start -->
						<form action="saveOrders" method="POST" onclick="return validateForm()">
						
						<input type="hidden" name="uid" value="<%=u2.getId() %>" />
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputname">Name*</label> <input type="text"
										class="form-control" name="uname" id="inputname" required 
										 <%
										if (u2.getName()!= null) 
										{%>
										value="<%=u2.getName() %>"
										 <%}%>
										readonly style="text-transform: uppercase;" >
								</div>
								<div class="form-group col-md-6">
									<label for="inputemail">Email*</label> <input
										type="email" class="form-control" id="inputemail"
										name="email"  readonly required
										 <%
										if (u2.getEmail()!= null) 
										{%>
										value="<%=u2.getEmail() %>"
										 <%}%> >
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputphno">Mobile No*</label> <input type="number"
										class="form-control" id="inputphno" name="phno" maxlength="10"  required
										 <%
										if (u2.getPhno()!= null) 
										{%>
										value="<%=u2.getPhno() %>"
										 <%}%>  >
								</div>
								<div class="form-group col-md-6">
									<label for="inputaddress">Address*</label> <input
										type="text" class="form-control" id="inputaddress"
										name="address"  required
										 <%
										if (u2.getAddress()!= null) 
										{%>
										value="<%=u2.getAddress() %>"
										 <%}%> style="text-transform: uppercase;" >
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputlandmark">Landmark*</label> <input type="text"
										class="form-control" id="inputlandmark" name="landmark"  required
										 <%
										if (u2.getLandmark()!= null) 
										{%>
										value="<%=u2.getLandmark() %>"
										 <%}%> style="text-transform: uppercase;" >
								</div>
								<div class="form-group col-md-6">
									<label for="inputcity">City*</label> <input
										type="text" class="form-control" id="inputcity"
										name="city" required
										 <%
										if (u2.getCity()!= null) 
										{%>
										value="<%=u2.getCity() %>"
										 <%}%> style="text-transform: uppercase;" >
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputstate">State*</label> <input type="text"
										class="form-control" id="inputstate" name="state"  required
										 <%
										if (u2.getState()!= null) 
										{%>
										value="<%=u2.getState() %>"
										 <%}%> style="text-transform: uppercase;" >
								</div>
								<div class="form-group col-md-6">
									<label for="inputpincode">Pincode*</label> <input
										type="number" class="form-control" id="inputpincode"
										name="pincode" maxlength="6" required
										 <%
										if (u2.getPincode()!= null) 
										{%>
										value="<%=u2.getPincode() %>"
										 <%}%>>
								</div>
							</div>
								<div class="form-group">
									<label for="inputState">Payment Type*</label> <select id="inputpayment"
										class="form-control" name="paymentMethod" required>
										<option selected value="noselect">--select--</option>
										<option value="COD">Cash On Delivary</option>
									</select>
								</div>
								
								<div class="form-group text-center">
									<button type="submit" class="btn btn-warning">Order Now</button>
									<a href="index.jsp" class="btn btn-success">Continue Shopping</a>
								</div>
							
						</form>
					</div>

				</div>

			</div>
		</div>
	</div>

	<div class="mt-4">
		<%@ include file="allComponents/footer.jsp"%>
	</div>


	<script type="text/javascript">
	
	function validateForm()
	{
		
		var pincode=document.getElementById("pincode");
		if(pincode.length <6 && pincode.length>6)
		{
			alert("Pincode must conatins Only 6 Numbers.");
			return false;
		}
		
		return true;
	}
	
		let p2 = document.getElementById("errmsg");
	
			setTimeout(function() {
				p2.style.display = "none";
			}, 3000);
		
	</script>
</body>
</html>