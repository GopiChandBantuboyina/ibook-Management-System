<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.DAO.*,com.DB.*,com.entity.*,java.util.*"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Orders</title>
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

	<div class="container-fluid mt-4">
		<div class="row">
			<div class="col-md-11 ml-5">
			<h4 class="text-center text-success">My Orders</h4>
			
			<%
				HttpSession session1 = request.getSession();
				User u1=(User)session1.getAttribute("userobj");
				bookOrderDAOimpl dao=new bookOrderDAOimpl(DBconnect.getcon());
				List<bookOrders> books=dao.getAllOrders(u1.getEmail());
				
				if(books.isEmpty())
				{
			%>
				<div class="text-center text-danger">
				<h4>No Order Placed...</h4>
				<a href="allNewBooks.jsp"  class="btn btn-primary">Order Now</a> 
				</div>
			<%}
				else{
					
				%>
			
				<table class="table table-striped">
					<thead class="bg-primary text-white">
						<tr>
							<th scope="col">Order Id</th>
							<th scope="col">Name</th>
							<th scope="col">Book Name</th>
							<th scope="col">Author</th>
							<th scope="col">Price</th>
							<th scope="col">Quantity</th>
							<th scope="col">Total Price</th>
							<th scope="col">Payment Type</th>
							<th scope="col">Address</th>
							<th scope="col">Contact For More Details</th>
						</tr>
					</thead>
					<tbody>
					<%
					for(bookOrders b:books)
					{
					%>
						<tr>
							<th scope="row"><%=b.getOrderId() %></th>
							<td><%=b.getUser_name() %></td>
							<td><%=b.getBookname() %></td>
							<td><%=b.getAuthor() %></td>
							<td><%=b.getPrice() %></td>
							<td><%=b.getQuantity() %></td>
							<td><%=b.getTotalPrice() %></td>
							<td><%=b.getPaymenttype() %></td>
							<td><%=b.getFulladdress()%></td>
							<td>+91 9014579769</td>
						</tr>
			
				
				<%}
					} %>
								
					</tbody>
				</table>
			</div>
		</div>

		<div class="text-right mt-3 mr-5">

			<a href="settings.jsp" class="btn-lg btn-success"><i
				class="fa-solid fa-arrow-left"></i> Back</a>

		</div>

	</div>


	<div style="margin-top: 50px;">
		<%@ include file="allComponents/footer.jsp"%>
	</div>
</body>
</html>