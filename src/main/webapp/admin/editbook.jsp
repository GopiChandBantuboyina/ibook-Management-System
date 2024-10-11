<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.DAO.*,com.DB.*,com.entity.*,java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin : Add Books</title>
<%@ include file="allCss.jsp"%>
</head>
<body style="background-color: #f0f2f2">
	<%@ include file="navbar.jsp"%>
		
	<c:if test="${empty userobj }">
		<c:redirect url="../login.jsp"></c:redirect>
	</c:if>
	<div class="container">

		<div class="row">
			<div class="col-md-4 offset-md-4">

				<div class="card mt-4">
					<h3 class="text-center text-primary">Edit Book</h3>

					<%
					bookDAOimpl dao = new bookDAOimpl(DBconnect.getcon());
					int id = Integer.parseInt(request.getParameter("id"));
					bookdtls b = dao.getbookbyid(id);
					%>
					<div class="card-body">
						<form action="../editbook" method="POST">
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
							<!--<div class="form-group">
								<label for="exampleInputPassword1">Book Categories*</label> <select
									class="form-control" name="bcategory" required>
									<option>--select--</option>
									<option>New Book</option>
								</select>
							</div>  -->
							<div class="form-group">
								<label for="exampleInputPassword1">Book Status*</label> <select
									class="form-control" name="bstatus" required>

									<%
									if ("Active".equals(b.getStatus())) {
									%>
									<option>Active</option>
									<option>Inactive</option>
									<%
									}

									else {
									%>
									<option>Inactive</option>
									<option>Active</option>
									<%
									}
									%>


								</select>
							</div>

							<button type="submit" class="btn btn-primary">Submit</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div style="margin-top: 20px">
		<%@ include file="footer.jsp"%>
	</div>
</body>
</html>