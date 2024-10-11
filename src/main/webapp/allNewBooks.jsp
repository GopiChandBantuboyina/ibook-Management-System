<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.DAO.*,com.DB.*,com.entity.*,java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ebook_Management System</title>
<%@ include file="allComponents/allCss.jsp"%>

<style>
.card {
    background-color: #f8f9fa; /* Light gray background for the card */
    transition: background-color 0.4s ease-in-out, box-shadow 0.4s ease-in-out; /* Smooth transition for both properties */
    box-shadow: 0 0 0 rgba(0, 0, 0, 0); /* Initial state with no shadow */
}

.crd-ho:hover {
    background-color: #e0e0e0; /* Slightly darker gray background on hover */
    box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15); /* Apply box-shadow on hover */
}
</style>
</head>
<body class="bg-light">
	<%@ include file="allComponents/navbar.jsp"%>
	<%
	User us = (User) session.getAttribute("userobj");
	//System.out.println(us);
	%>
	
	<div class="text-center mt-1">
		<c:if test="${not empty sucmsg }">
			<div class="alert alert-success" role="alert" id="errmsg" style="font-weight: bold">${sucmsg}</div>
			<c:remove var="sucmsg" />
		</c:if>
		<c:if test="${not empty incmsg }">
			<div class="alert alert-danger" role="alert" id="errmsg" style="font-weight: bold">${incmsg}</div>
			<c:remove var="incmsg" />
		</c:if>
		<c:if test="${ not empty errmsg }">
			<div class="alert alert-danger" role="alert" id="errmsg" style="font-weight: bold">${errmsg}</div>
			<c:remove var="errmsg" />
		</c:if>
	</div>
	<!-- Start New Book -->
	<div class="container">
		<h3 class="text-center pt-2 pb-1 text-info">New Books</h3>
		<div class="row">

			<%
			bookDAOimpl dao = new bookDAOimpl(DBconnect.getcon());
			List<bookdtls> book = dao.getAllNewBooks();
			for (bookdtls b : book) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho mt-2">
					<div class="card-body text-center">
						<img src="books/<%=b.getPhoto()%>"
							style="width: 150px; height: 200px">
						<p><%=b.getBookname()%></p>
						<p style="text-transform: uppercase;"><%=b.getAuthor()%></p>
						<p>
							Category :<%=b.getBookcategory()%></p>
						<div class="row d-flex justify-content-between">
						
						<%if(us==null) 
						{%>
							<a href="login.jsp" class="btn btn-danger btn-sm"><i class="fa-solid fa-cart-shopping"></i> Add Cart</a>
							
						<%}else{ %>
							<a href="cart?uid=<%=us.getId()%>&&bid=<%=b.getBookid()%>&&page=<%="allNewBooks" %>" class="btn btn-danger btn-sm"><i class="fa-solid fa-cart-shopping"></i> Add Cart</a>
							
							<%} %>
							<a href="viewDetails.jsp?id=<%=b.getBookid() %>"
								class="btn btn-success btn-sm">View Details</a> <a 
								class="btn btn-danger btn-sm text-white"><i class="fa-solid fa-indian-rupee-sign "></i> <%=b.getPrice()%></a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>


		</div>
				<%
		if (book.isEmpty()) {
		%>
			<h5 class="text-center text-danger">New Books not Available.</h5>
		<%
		}
		%>
	</div>

	<!-- End  New book -->
	<div class="mt-4">
		<%@ include file="allComponents/footer.jsp"%>
	</div>
	
	

	<script type="text/javascript">
		let p2 = document.getElementById("msg");

		if (p2) {
			setTimeout(function() {
				p2.style.display = "none";
			}, 3500);
		}
	</script>
</body>
</html>