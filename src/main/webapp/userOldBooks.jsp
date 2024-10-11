<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.DAO.*,com.DB.*,com.entity.*,java.util.*"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User : All old Books</title>
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
	<%
	User us = (User) session.getAttribute("userobj");
	%>

	<div class="container-fluid mt-4">
		<div class="row">
			<div class="col-md-11 ml-5">
				<c:if test="${not empty sucmsg}">
					<p class="alert alert-success text-center" id="msg">${sucmsg }</p>
					<c:remove var="sucmsg" />
				</c:if>
				<c:if test="${not empty errmsg}">
					<p class="alert alert-danger" id="msg">${errmsg }</p>
					<c:remove var="errmsg" />
				</c:if>
				<%
				bookDAOimpl dao = new bookDAOimpl(DBconnect.getcon());
				List<bookdtls> book = dao.getOldBook(us.getEmail(), "Old Book");
				if (book.isEmpty()) {
				%>

				<h4 class="text-center text-danger">No Old Books Added..</h4>


				<%
				} else {
				%>

				<table class="table table-striped bg-white">
					<thead class="bg-success text-white">
						<tr>
							<th scope="col">Book Id</th>
							<th scope="col">Image</th>
							<th scope="col">Book Name</th>
							<th scope="col">Author</th>
							<th scope="col">Price</th>
							<th scope="col">Action</th>
						</tr>
					</thead>
					<tbody>







						<%
						for (bookdtls b : book) {
							
						%>
						<tr>

							<td><%=b.getBookid()%></td>
							 <td><img
								src="<%=request.getContextPath() + "/books/" + b.getPhoto()%>"
								style="height: 60px" /></td>
							
							<td><%=b.getBookname()%></td>
							<td><%=b.getAuthor()%></td>
							<td><%=b.getPrice()%></td>
							<td><a href="editOldBook.jsp?bid=<%=b.getBookid()%>"
								class="btn btn-info">Edit</a> <a
								href="deleteOldBook?email=<%=us.getEmail()%>&&bid=<%=b.getBookid()%>"
								class="btn btn-danger">Delete</a></td>
						</tr>
						<%
						}
						}
						%>
					</tbody>
				</table>
			</div>
		</div>

		<div class="text-right mt-3 mr-5">

			<a href="settings.jsp" class="btn-lg btn-info"><i
				class="fa-solid fa-arrow-left"></i> Back</a>

		</div>

	</div>


	<script type="text/javascript">
		let p2 = document.getElementById("msg");

		if (p2) {
			setTimeout(function() {
				p2.style.display = "none";
			}, 3000);
		}
	</script>
</body>
</html>