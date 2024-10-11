<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="com.DAO.*,com.DB.*,com.entity.*,java.util.*,com.user.servlet.*"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="container-fluid "
	style="background-color: #303f9f; height: 10px;"></div>

<div class="container-fluid pt-2 bg-white">
	<div class="row">
		<div class="col-md-4 text-success">
			<h3>
				<i class="fa-solid fa-book"></i> <i class="fa-solid fa-info text-danger"></i>-book
			</h3>
		</div>

		<div class="col-md-3">
			<form class="form-inline my-2 my-lg-0" action="searchBooks.jsp" method="POST">
				<input class="form-control mr-sm-2" type="search"
					placeholder="Search" aria-label="Search" name="ch">
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
			</form>
		</div>
		<c:if test="${not empty userobj }">


			<div class="col-md-5 text-right ">

				<a href="checkout.jsp" class="btn btn-danger text-white"><i
					class="fa-solid fa-cart-shopping"></i> Cart</a>
				<!-- Example single danger button -->
				
				<div class="btn-group text-white">
					<a class="btn btn-success dropdown-toggle"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fa-solid fa-user"></i>
						${userobj.name}</a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="editProfile.jsp" >Profile</a> <a
						
							class="dropdown-item" href="userAddress.jsp">Address</a> <a
							class="dropdown-item" href="orders.jsp">My Orders</a> <a
							class="dropdown-item" href="changePassword.jsp">Change Password</a>
						
					</div>
				</div>
				
				
				<a data-toggle="modal" data-target="#exampleModalCenter"
					class="btn btn-primary text-white"> <i
					class="fa-solid fa-right-to-bracket"></i> Logout
				</a>
			</div>
		</c:if>
		<c:if test="${empty userobj }">
			<div class="col-md-4 text-right">
				<a href="register.jsp" class="btn btn-success"><i
					class="fa-solid fa-user-plus"></i> Register</a> <a href="login.jsp"
					class="btn btn-primary"> <i
					class="fa-solid fa-right-to-bracket"></i> Login
				</a>
			</div>
		</c:if>

	</div>
</div>

<!-- Start modal -->

<div class="modal fade" id="exampleModalCenter" tabindex="-1"
	role="dialog" aria-labelledby="exampleModalCenterTitle"
	aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title text-danger" id="exampleModalLongTitle">Logout</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<h5 class="text-center">Do You want to Logout..</h5>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
				<a href="logout" class="btn btn-primary">Logout</a>
			</div>
		</div>
	</div>
</div>

<!-- end modal -->



<nav class="navbar navbar-expand-lg navbar-dark bg-custom mt-2">

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="index.jsp"><i
					class="fa-solid fa-house-chimney"></i> Home <span class="sr-only">(current)</span>
			</a></li>
			<li class="nav-item active"><a class="nav-link"
				href="allRecentBooks.jsp"><i class="fa-solid fa-book-open"></i>
					Recent Book</a></li>
			<li class="nav-item active"><a class="nav-link"
				href="allNewBooks.jsp"> <i class="fa-solid fa-book-open"></i>
					New Book
			</a></li>

			<li class="nav-item active"><a class="nav-link disabled"
				href="allOldBooks.jsp"><i class="fa-solid fa-book"></i> Old Book</a></li>
		</ul>
		<form class="form-inline my-2 my-lg-0">
			<a href="settings.jsp" class="btn btn-light my-2 my-sm-0 mr-2"
				type="submit"> <i class="fa-solid fa-gear"></i> Settings
			</a> <a href="helpline.jsp" class="btn btn-light my-2 my-sm-0" type="submit"> <i
				class="fa-solid fa-address-book"></i> Contact Us
			</a>
		</form>
	</div>
</nav>