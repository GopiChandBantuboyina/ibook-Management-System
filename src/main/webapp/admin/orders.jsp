<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page import="com.DAO.*,com.DB.*,com.entity.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Orders</title>
<%@ include file="allCss.jsp"%>
</head>
<body>
	<%@ include file="navbar.jsp"%>


	<c:if test="${empty userobj }">
		<c:redirect url="../login.jsp"></c:redirect>
	</c:if>

	<div class="container-fluid mt-3 pl-5 pr-5">

		<h4 class="text-center">Orders Details</h4>
		<%
				bookOrderDAOimpl dao=new bookOrderDAOimpl(DBconnect.getcon());
				List<bookOrders> books=dao.AllOrders();
				
				if(books.isEmpty())
				{
			%>
		<div class="text-center text-danger">
			<h4>No Order Placed...</h4>
			<a href="checkout.jsp" class="btn btn-primary">Order Now</a>
		</div>
		<%}
				else{
					
				%>

		<table class="table table-striped">
			<thead class="bg-info text-white">
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
				<%} }%>
			</tbody>
		</table>

	</div>


	<div style="margin-top: 20px">
		<%@ include file="footer.jsp"%>
	</div>
</body>
</html>