<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
					<h3 class="text-center text-primary">Add Book</h3>
					
					<c:if test="${not empty sucmsg }">
					<p class="text-center text-success">${sucmsg }</p>
					<c:remove var="sucmsg" />
					</c:if>
					
					<c:if test="${not empty errormsg }">
					<p class="text-center text-danger">${errormsg }</p>
					<c:remove var="errormsg"/>
					</c:if>
					<div class="card-body">
						<form action="../addbooks" method="POST" enctype="multipart/form-data">
							<div class="form-group">
								<label for="exampleInputEmail1">Book Name*</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="name" name="bname" required>

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
								<label for="exampleInputPassword1">Book Categories*</label> <select
									class="form-control" name="bcategory" required>
									<option>--select--</option>
									<option>New Book</option>
								</select>
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Book Status*</label> <select
									class="form-control" name="bstatus" required>
									<option>--select--</option>
									<option>Active</option>
									<option>Inactive</option>
								</select>
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Upload Photo*</label> <input
									type="file" class="form-control-file" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="name" name="bimg" required>
							</div>



							<button type="submit" class="btn btn-primary">Add</button>
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