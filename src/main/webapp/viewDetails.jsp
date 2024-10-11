<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.DAO.*,com.DB.*,com.entity.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Details</title>
<%@ include file="allComponents/allCss.jsp"%>
</head>
<body style="background-color: #fcf7f7">
	<%@ include file="allComponents/navbar.jsp"%>
	
	<%
		User us=(User)session.getAttribute("userobj");
	%>
	<%
	int id = Integer.parseInt(request.getParameter("id"));
	bookDAOimpl dao = new bookDAOimpl(DBconnect.getcon());
	bookdtls b = dao.getbookbyid(id);
	%>
	
	
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
	
	
	<div class="container p-3 mt-5 mb-5">
		<div class="row">
			<div class="col-md-6 text-center p-3 border bg-white">
				<img src="books/<%=b.getPhoto()%>"
					style="width: 190px; height: 225px" class="shadow-lg" /><br>
				<br>

				<h5>
					Book Name:<span class="text-success"> <%=b.getBookname()%></span>
				</h5>
				<h5>
					Author: <span class="text-success"><%=b.getAuthor()%></span>
				</h5>
				<h5>
					Category: <span class="text-success"><%=b.getBookcategory()%></span>
				</h5>
			</div>
			<div class="col-md-6 text-center p-5 border bg-white">
				<h2 class="text-info"><%=b.getBookname()%></h2>
				
				<%
				if (b.getBookcategory().equals("Old Book")) {
				%>
				<h5 class="text-primary"><i class="fa-solid fa-envelope text-success "></i>  <%=b.getEmail()%></h5>

				<%
				}
				%>

				<div class="row mt-3">
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fa-solid fa-money-bill-wave fa-2x"></i><br>
						<p>Cash On Delivary</p>
					</div>
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fa-solid fa-arrow-rotate-left fa-2x"></i><br>
						<p>Return Available</p>
					</div>
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fa-solid fa-truck fa-2x"></i><br>
						<p>Free Delivary</p>
					</div>
				</div>
				<%if(b.getBookcategory().equals("Old Book"))
					
				{%>
				
				<div class="row mt-3 flex-row justify-content-center">
					<div class="mr-3">
						<a href="index.jsp" class="btn btn-success">Continue Shopping</a>
					</div>
					<a  class="btn btn-primary text-white"><i class="fa-solid fa-indian-rupee-sign"></i>  <%=b.getPrice()%></a>
				</div>
				
				<%} 
				else {%>
					<div class="row mt-3 flex-row justify-content-center">
					<div class="mr-3">
						<%if(us==null) 
							{%>
							<a href="login.jsp" class="btn btn-danger btn"><i
								class="fa-solid fa-cart-shopping "></i> Add Cart</a>
								 
							<%}else{ %>	
								<a href="cart?uid=<%=us.getId()%>&&bid=<%=b.getBookid()%>&&page=<%="viewDetails"%>" class="btn btn-danger "><i
								class="fa-solid fa-cart-shopping "></i> Add Cart</a> 
								
							<%} %>
					</div>
					<a  class="btn btn-warning text-black"><i class="fa-solid fa-indian-rupee-sign"></i>  <%=b.getPrice()%></a>
				</div>
				<%} %>
			</div>
		</div>

	</div>




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
</body>
</html>