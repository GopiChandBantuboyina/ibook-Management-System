<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container-fluid " style="background-color:#303f9f;height:10px;"></div>
<div class="container-fluid pt-2 bg-white">
	<div class="row">
		<div class="col-md-3 text-success">
			<h3>
				<i class="fa-solid fa-book"></i> i-book
			</h3>
		</div>

		<c:if test="${ not empty userobj }">
		<div class="col-md-8 d-flex justify-content-end">
			<a class="btn btn-success text-white mr-2"><i class="fa-solid fa-user-tie"></i>
			${userobj.name}
			</a>
			
			<a data-toggle="modal" data-target="#exampleModalCenter" class="btn btn-primary text-white"> <i
				class="fa-solid fa-right-to-bracket"></i> Logout
			</a>
		</div>
		</c:if>
		<c:if test="${empty userobj }">
			<div class="col-md-8 d-flex justify-content-end">
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
<nav class="navbar navbar-expand-lg navbar-dark bg-custom mt-2">

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto ml-3">
			<li class="nav-item active"><a class="nav-link"
				href="adminhome.jsp"><i class="fa-solid fa-house-user"></i>Admin Home
					<span class="sr-only">(current)</span> </a></li>

		</ul>

	</div>
</nav>