<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.DAO.*,com.DB.*,com.entity.*,java.util.*"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ibook_Management System</title>
 <link href="https://fonts.googleapis.com/css2?family=Roboto&family=Lobster&family=Montserrat:wght@400;600;700&display=swap" rel="stylesheet">
<%@ include file="allComponents/allCss.jsp"%> 
<link rel="stylesheet" href="allComponents/style.css">
<style>
.bg-img {
	background-image: url("img/bg-book.jpg");
	background-repeat: no-repeat;
	background-size: cover;
	height: 50vh;
}
.card {
    background-color: #f8f9fa; /* Light gray background for the card */
    transition: background-color 0.4s ease-in-out, box-shadow 0.4s ease-in-out; /* Smooth transition for both properties */
    box-shadow: 0 0 0 rgba(0, 0, 0, 0); /* Initial state with no shadow */
}

.crd-ho:hover {
    background-color: #e0e0e0; /* Slightly darker gray background on hover */
    box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15); /* Apply box-shadow on hover */
}
.name-div {
            height: 60px; /* Height of 60px */
            display: flex; /* Use flexbox for centering */
            justify-content: center; /* Center horizontally */
            align-items: center; /* Center vertically */
            font-weight: bold; /* Make the text bold */
            color: #333; /* Dark text color for contrast */
            margin-bottom: 10px; /* Space below the name div */
            padding: 10px; /* Padding for better spacing */
            background: linear-gradient(135deg, rgba(255, 204, 204, 0.9), rgba(204, 255, 255, 0.9)); /* Bright mixed color gradient */
            border-radius: 5px; /* Slightly rounded corners */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* Soft shadow effect */
        }

#carouselExampleIndicators {
        height: 50vh;
      }

      /* Ensure that carousel items fill the height */
      #carouselExampleIndicators .carousel-item img {
        height: 50vh;
        object-fit: cover; 
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
<body class="bg-light">
	 <%@ include file="allComponents/navbar.jsp"%>
	<%
	User us = (User) session.getAttribute("userobj");
	//System.out.println(us);
	%>
	
<!-- <div class="container-fluid bg-img">
		<h2 class="text-center text-warning pt-2">
			<i class="fa-solid fa-book"></i> i-book Management System
		</h2>

	</div>  -->
	<div class="name-div">
        <h4 class="font-lobster"> <i class="fa-solid fa-info text-danger "></i>-Book Management System</h4>
    </div>
	
	
	<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
      <div class="carousel-inner">
        <div class="carousel-item active">
          <img class="d-block w-100" src="img/bg-book.jpg" alt="First slide">
          <div class="carousel-caption">
            <h4 class="font-roboto">Simple Ordering Process</h4>
            <p>"Easily add your favorite books to your cart."</p>
          </div>
        </div>
        <div class="carousel-item">
          <img class="d-block w-100" src="img/slide2.jpg" alt="Second slide">
          <div class="carousel-caption">
            <h4 class="font-roboto">Quality Assurance</h4>
            <p>"We ensure every book meets high quality standards before delivery."</p>
          </div>
        </div>
        <div class="carousel-item">
          <img class="d-block w-100" src="img/slide3.jpg" alt="Third slide">
          <div class="carousel-caption">
            <h4 class="font-roboto">Browse Our Collection</h4>
            <p>"Explore a wide range of books across all genres."</p>
          </div>
        </div>
        <!-- Additional images can be added here -->
        <div class="carousel-item">
          <img class="d-block w-100" src="img/slide6.jpg" alt="Fourth slide">
          <div class="carousel-caption">
            <h4 class="font-roboto">Fast Delivery Service</h4>
            <p>"Get your books delivered quickly and conveniently."</p>
          </div>
        </div>
        <div class="carousel-item">
          <img class="d-block w-100" src="img/slide8.jpg" alt="Fifth slide">
          <div class="carousel-caption">
            <h4 class="font-roboto">Customer Support</h4>
            <p>"We’re here to help you with your orders anytime!"</p>
          </div>
        </div>
      </div>
      <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
    </div>
	
	
	<div class="text-center mt-1">
		<c:if test="${not empty sucmsg }">
			<div class="alert alert-success" role="alert" id="errmsg" style="font-weight: bold">${sucmsg}</div>
			<c:remove var="sucmsg"/>
		</c:if>
		<c:if test="${not empty incmsg }">
			<div class="alert alert-danger" role="alert" id="errmsg" style="font-weight: bold">${incmsg}</div>
		<c:remove var="incmsg"/>
		</c:if>
		<c:if test="${ not empty errmsg }">
			<div class="alert alert-danger" role="alert" id="errmsg" style="font-weight: bold">${errmsg}</div>
			<c:remove var="errmsg"/>
		</c:if>
	</div>
	<!-- Start Recent Book -->
	<div class="container">
		<h3 class="text-center pt-2 pb-1 font-montserrat">Recent Books</h3>
		<div class="row">

			<%
			bookDAOimpl dao = new bookDAOimpl(DBconnect.getcon());
			List<bookdtls> book1 = dao.Recentbooks();
			for (bookdtls b : book1) {
				//System.out.println(b);
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img src="books/<%=b.getPhoto()%>"
							style="width: 150px; height: 200px">
						<p><%=b.getBookname()%></p>
						<p style="text-transform: uppercase;"><%=b.getAuthor()%></p>
						<p>
							Category :
							<%=b.getBookcategory()%></p>

						<%
						if (b.getBookcategory().equals("New Book")) {
						%>
						<div class="row d-flex justify-content-between">
						
							<%if(us==null) 
							{%>
							<a href="login.jsp" class="btn btn-danger btn-sm"><i
								class="fa-solid fa-cart-shopping"></i> Add Cart</a>
								 
							<%}else{ %>	
								<a href="cart?uid=<%=us.getId()%>&&bid=<%=b.getBookid()%>&&page=<%="index" %>" class="btn btn-danger btn-sm"><i
								class="fa-solid fa-cart-shopping"></i> Add Cart</a> 
								
							<%} %>
								<a
								href="viewDetails.jsp?id=<%=b.getBookid()%>"
								class="btn btn-success btn-sm">View Details</a> <a
								class="btn btn-danger btn-sm text-white"><i
								class="fa-solid fa-indian-rupee-sign"></i> <%=b.getPrice()%></a>
						</div>
						<%
						} else {
							
						%>
						<div class="row d-flex justify-content-center">
							<a href="viewDetails.jsp?id=<%=b.getBookid()%>"
								class="btn btn-success btn-sm mr-2">View Details</a> <a
								class="btn btn-danger btn-sm text-white"><i
								class="fa-solid fa-indian-rupee-sign"></i> <%=b.getPrice()%></a>
						</div>

						<%
						}
						%>
					</div>
				</div>
			</div>
			<%
			}
			%>

		</div>
		<%
		if (!book1.isEmpty()) {
		%>
		<div class="text-center p-2">
			<a href="allRecentBooks.jsp" class="btn btn-danger">View All</a>
		</div>
		<%
		} else {
		%>
		<h5 class="text-center text-danger">Recent Books not Available.</h5>

		<%
		}
		%>

	</div>

	<!-- End  Recent book -->
	<hr>
	<!-- Start New Book -->
	<div class="container">
		<h3 class="text-center pt-2 pb-1 font-montserrat">New Books</h3>


		<div class="row">

			<%
			bookDAOimpl dao2 = new bookDAOimpl(DBconnect.getcon());
			List<bookdtls> book2 = dao2.Newbooks();
			for (bookdtls b : book2) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img src="books/<%=b.getPhoto()%>"
							style="width: 150px; height: 200px">
						<p><%=b.getBookname()%></p>
						<p style="text-transform: uppercase;"><%=b.getAuthor()%></p>
						<p>
							Category :<%=b.getBookcategory()%></p>
						<div class="row d-flex justify-content-between">

							<%
							if (us == null) {
							%>
							<a href="login.jsp" class="btn btn-danger btn-sm"><i
								class="fa-solid fa-cart-shopping"></i> Add Cart</a>
							<%
							} else {
							%>

							<a href="cart?uid=<%=us.getId()%>&&bid=<%=b.getBookid()%>&&page=<%="index"%>"
								class="btn btn-danger btn-sm"><i
								class="fa-solid fa-cart-shopping"></i> Add Cart</a>
							<%
							}
							%>
							<a href="viewDetails.jsp?id=<%=b.getBookid()%>"
								class="btn btn-success btn-sm">View Details</a> <a
								class="btn btn-danger btn-sm text-white"><i
								class="fa-solid fa-indian-rupee-sign"></i> <%=b.getPrice()%></a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>


		</div>
		<%
		if (!book2.isEmpty()) {
		%>
		<div class="text-center p-2">
			<a href="allNewBooks.jsp" class="btn btn-danger font-montserrat">View All</a>
		</div>
		<%
		} else {
		%>
		<h5 class="text-center text-danger font-montserrat">New Books not Available.</h5>

		<%
		}
		%>
	</div>

	<!-- End  New book -->
	<hr>


	<!-- Start Old Book -->
	<div class="container">
		<h3 class="text-center pt-2 pb-1 font-montserrat">Old Books</h3>
		<div class="row">

			<%
			bookDAOimpl dao3 = new bookDAOimpl(DBconnect.getcon());
			List<bookdtls> book3 = dao3.Oldbooks();
			for (bookdtls b : book3) {
			%>

			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img src="books/<%=b.getPhoto()%>"
							style="width: 150px; height: 200px">
						<p><%=b.getBookname()%></p>
						<p style="text-transform: uppercase;"><%=b.getAuthor()%></p>
						<p>
							Category :
							<%=b.getBookcategory()%></p>
						<div class="row d-flex justify-content-center">
							<a href="viewDetails.jsp?id=<%=b.getBookid()%>"
								class="btn btn-success btn-sm mr-2"> View Details </a> <a
								class="btn btn-danger btn-sm text-white"><i
								class="fa-solid fa-indian-rupee-sign"></i> <%=b.getPrice()%></a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>


		</div>

		<%
		if (!book3.isEmpty()) {
		%>
		<div class="text-center p-2">
			<a href="allOldBooks.jsp" class="btn btn-danger font-montserrat">View All</a>
		</div>
		<%
		} else {
		%>
		<h5 class="text-center text-danger font-montserrat">Old Books not Available.</h5>

		<%
		}
		%>

	</div>

	<!-- End  Old book -->
	<div class="mt-4">
		<%@ include file="allComponents/footer.jsp"%>
	</div>


	<script type="text/javascript">
		let p2 = document.getElementById("errmsg");

		if (p2) {
			setTimeout(function() {
				p2.style.display = "none";
			}, 3500);
		}
	</script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>