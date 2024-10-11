<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.DAO.*,com.DB.*,com.entity.*,java.util.*"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Old Book</title>
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
	
	<div class="container">

		<div class="row">
			<div class="col-md-4 offset-md-4">

				<div class="card mt-4">
					<h3 class="text-center text-primary">Edit Book</h3>
					
					
					<%
					bookDAOimpl dao = new bookDAOimpl(DBconnect.getcon());
					int id = Integer.parseInt(request.getParameter("bid"));
					bookdtls b = dao.getbookbyid(id);
					%>
					<div class="card-body">
						<form action="editOldBook" method="POST">
							<div class="form-group">

								<input type="hidden" name="id" value="<%=b.getBookid()%>" />
								
								
									 <label for="exampleInputEmail1">Book Name*</label> <input type="text"
									class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="name" name="bname"
									required value="<%=b.getBookname()%>">

							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Author Name*</label> <input
									type="text" class="form-control" id="exampleInputPassword1"
									placeholder="author" name="aname" required
									value="<%=b.getAuthor()%>">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Price*</label> <input
									type="number" class="form-control" id="exampleInputPassword1"
									placeholder="Price" name="price" required
									value="<%=b.getPrice()%>">
							</div>

							<button type="submit" class="btn btn-primary">Update</button>
						</form>
					</div>
				</div>
			</div>
		</div>
		
		<div class="text-center mt-3">

			<a href="userOldBooks.jsp" class="btn-lg btn-success"><i class="fa-solid fa-arrow-left"></i>  Back</a>
							
		</div>
	</div>
	
</body>
</html>