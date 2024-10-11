<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.DAO.*,com.DB.*,com.entity.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Books</title>
<link href="https://fonts.googleapis.com/css2?family=Roboto&family=Lobster&family=Montserrat:wght@400;600;700&display=swap" rel="stylesheet">
<%@ include file="allCss.jsp"%>

<style>
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
	<h3 class="text-center text-success font-lobster">Hello Admin</h3>
	<div class="container-fluid mt-3 pl-5 pr-5">

		
		<c:if test="${not empty delmsg }">
			<h5 id="successmsg" class="text-center text-danger">${delmsg }</h5>
			<c:remove var="delmsg" />
		</c:if>
		<c:if test="${not empty sucmsg }">
			<h5 id="successmsg" class="text-center text-success">${sucmsg }</h5>
			<c:remove var="sucmsg" />
		</c:if>
		
		<c:if test="${not empty errormsg }">
			<h5 id="errmsg" class="text-center text-danger">${errormsg }</h5>
			<c:remove var="errormsg" />
		</c:if>

		<%
		bookDAOimpl dao = new bookDAOimpl(DBconnect.getcon());
		List<bookdtls> book = dao.getallbooks();
		//System.out.println(book);
		
		if(book.isEmpty())
		{
		%>
		
			<h5 class="text-primary text-center">No Books added..pls<a href="addbooks.jsp" class="text-info">  Add Book</a></h5>
			
		<% 
		}
		else
		{
			%>
			
			<h4 class="text-center ita">All books</h4>
		<table class="table table-striped">
			<thead class="bg-info text-white">
				<tr>
					<th scope="col">Id</th>
					<th scope="col">Book Image</th>
					<th scope="col">Book Name</th>
					<th scope="col">Author Name</th>
					<th scope="col">Price</th>
					<th scope="col">Book Categories</th>
					<th scope="col">Status</th>
					<th scope="col">Action</th>
				</tr>
			</thead>
			<tbody>

				<%
				for (bookdtls b : book) {
				%>

				<tr>
					<th scope="row"><%=b.getBookid()%></th>
					<td><img src="../books/<%=b.getPhoto()%>"
						style="height: 60px"></td>
					<td><%=b.getBookname()%>
					<td><%=b.getAuthor()%></td>
					<td><%=b.getPrice()%></td>
					<td><%=b.getBookcategory()%></td>
					<td><%=b.getStatus()%></td>
					<td><a href="editbook.jsp?id=<%=b.getBookid()%>"
						class="btn btn-sm btn-primary"><i class="fa-solid fa-pen-to-square"></i> Edit</a> <a href="../delete?id=<%=b.getBookid()%>"
						class="btn btn-sm btn-danger ml-2"><i class="fa-solid fa-trash"></i> Delete</a></td>
				</tr>
				<%
				}}
				%>



			</tbody>
		</table>

	</div>

	<div style="margin-top: 20px">
		<%@ include file="footer.jsp"%>
	</div>
	
	<script type="text/javascript">
	
	let p1=document.getElementById("successmsg");
	let p2=document.getElementById("errmsg");
	
	if(p1)
		{
		setTimeout(function() {
			p1.style.display="none";
		}, 3000);
		}
	
	if(p2)
	{
	setTimeout(function() {
		p2.style.display="none";
	}, 3000);
	}
	</script>
</body>
</html>