<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.DAO.*,com.DB.*,com.entity.*,java.util.*"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SearchBooks</title>
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
<body>
	<%@ include file="allComponents/navbar.jsp"%>
	<%
	User us = (User) session.getAttribute("userobj");
	//System.out.println(us);
	%>
	<!-- Start Search Book -->
	<div class="container mt-2">
		
		<div class="row mt-1">

			<%
			String ch=request.getParameter("ch");
			bookDAOimpl dao = new bookDAOimpl(DBconnect.getcon());
			List<bookdtls> book1=dao.getbookbychar(ch);
			for (bookdtls b : book1) {
				
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img src="books/<%=b.getPhoto()%>"
							style="width: 150px; height: 200px">
						<p><%=b.getBookname()%></p>
						<p><%=b.getAuthor()%></p>
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
		
	</div>
	
	
</body>
</html>