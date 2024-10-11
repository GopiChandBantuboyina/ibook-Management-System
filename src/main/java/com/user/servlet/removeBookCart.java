package com.user.servlet;

import java.io.IOException;

import com.DAO.cartDAOimpl;
import com.DB.DBconnect;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/removeBook")
public class removeBookCart extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int bid=Integer.parseInt(req.getParameter("bid"));
		int uid=Integer.parseInt(req.getParameter("uid"));

		try {
			cartDAOimpl dao=new cartDAOimpl(DBconnect.getcon());

			boolean flag=dao.deleteBook(bid, uid);

			HttpSession session=req.getSession();
			if(flag)
			{
				session.setAttribute("sucmsg", "Book is Removed From cart");
				resp.sendRedirect("checkout.jsp");
			}
			else {
				session.setAttribute("errmsg", "Something went Wrong on Server....");
				resp.sendRedirect("checkout.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}


}
