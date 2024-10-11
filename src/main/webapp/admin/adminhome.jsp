<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin:Home</title>
<link href="https://fonts.googleapis.com/css2?family=Roboto&family=Lobster&family=Montserrat:wght@400;600;700&display=swap" rel="stylesheet">
<%@ include file="allCss.jsp"%>

<style>
a {
	text-decoration: none;
	color: black;
}

a:hover {
	text-decoration: none;
	cursor: pointer;
	color: black;
	cursor: pointer;
}
.font-roboto{
	font-family: 'Roboto',sans-serif;
}
.font-montserrat{
	font-family:'Montserrat,sans-serif';
}
.font-lobster{
	font-family: 'Lobster',cursive;
}
 
 .ita{
 font-family: italic;
 }
</style>
</head>
<body>
	<%@ include file="navbar.jsp"%>
	<c:if test="${empty userobj }">
		<c:redirect url="../login.jsp"></c:redirect>
	</c:if>
	
	<div class="container mt-5">
		<h3 class="text-center text-success font-lobster">Hello Admin</h3>
		<div class="row mt-5">

			<div class="col-md-3">

				<a href="addbooks.jsp">
					<div class="card text-center">
						<div class="card-body">
							<i class="fa-solid fa-square-plus fa-3x text-primary"></i><br>
							<h3 class="font-montserrat">Add Books</h3>
							.................
						</div>
					</div>
				</a>
			</div>

			<div class="col-md-3 ">

				<a href="allbooks.jsp">
					<div class="card text-center">
						<div class="card-body">
							<i class="fa-solid fa-book-open fa-3x text-danger"></i><br>
							<h3 class="font-montserrat">All Books</h3>
							.................
						</div>
					</div>
				</a>
			</div>

			<div class="col-md-3 ">
				<a href="orders.jsp">
					<div class="card text-center">
						<div class="card-body">
							<i class="fa-solid fa-box-open fa-3x text-warning"></i><br>
							<h3 class="font-montserrat">Orders</h3>
							.................
						</div>
					</div>
				</a>
			</div>
			
			<div class="col-md-3 ">
				<a data-toggle="modal" data-target="#exampleModalCenter"  >
					<div class="card text-center">
						<div class="card-body">
							<i class="fa-solid fa-right-from-bracket fa-3x text-primary"></i><br>
							<h3 class="font-montserrat">Logout</h3>
							.................
						</div>
					</div>
				</a>
			</div>
			
		</div>
	</div>

<!-- Start modal -->

<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title text-danger" id="exampleModalLongTitle">Logout</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <h5 class="text-center">Do You want to Logout..</h5>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
        <a href="../logout" class="btn btn-primary">Logout</a>
      </div>
    </div>
  </div>
</div>

<!-- end modal -->
	<div style="margin-top: 100px">
		<%@ include file="footer.jsp"%>
	</div>
</body>
</html>