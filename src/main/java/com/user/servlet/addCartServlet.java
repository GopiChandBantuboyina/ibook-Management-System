package com.user.servlet;

import java.io.IOException;

import com.DAO.bookDAOimpl;
import com.DAO.cartDAOimpl;
import com.DB.DBconnect;
import com.entity.bookdtls;
import com.entity.cart;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/cart")

public class addCartServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


		int uid=Integer.parseInt(req.getParameter("uid"));
		int bid=Integer.parseInt(req.getParameter("bid"));

		bookDAOimpl dao=new bookDAOimpl(DBconnect.getcon());
		bookdtls b=dao.getbookbyid(bid);

		cart c=new cart();
		c.setBid(bid);
		c.setUid(uid);
		c.setBookname(b.getBookname());
		c.setAuthor(b.getAuthor());
		c.setPrice(b.getPrice());
		double tp=b.getPrice();
		c.setTotalPrice(tp);

		cartDAOimpl cdao=new cartDAOimpl(DBconnect.getcon());
		int flag=cdao.addCart(c);


		HttpSession session=req.getSession();
		String page=req.getParameter("page");

		if(flag==1)
		{

			session.setAttribute("sucmsg",b.getBookname() +"Book is Added to Cart Successfully...");
			if("viewDetails".equals(page))
			{
				resp.sendRedirect("index.jsp");
			}
			else {
			resp.sendRedirect(page+".jsp");
			}
		}
		else if(flag==2){

			session.setAttribute("incmsg",b.getBookname()+"Book is Already Added to Cart.. GOto cart Section to Increment Quantity...");

			if("viewDetails".equals(page))
			{
				resp.sendRedirect("index.jsp");
			}
			else {
			resp.sendRedirect(page+".jsp");
			}
		}
		else {
			session.setAttribute("errmsg","Something Went Wrong on Server...");
			if("viewDetails".equals(page))
			{
				resp.sendRedirect("index.jsp");
			}
			else {
			resp.sendRedirect(page+".jsp");
			}
		}

	}


}
