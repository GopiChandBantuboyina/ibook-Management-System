package com.user.servlet;

import java.io.IOException;

import com.DAO.bookDAOimpl;
import com.DB.DBconnect;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet("/deleteOldBook")
public class deleteOldBook extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String useremail=req.getParameter("email");
		int bid=Integer.parseInt(req.getParameter("bid"));
		bookDAOimpl dao=new bookDAOimpl(DBconnect.getcon());

		boolean flag=dao.deleteOldBook(bid, useremail, "Old Book");
		HttpSession session=req.getSession();
		if(flag)
		{
			session.setAttribute("sucmsg","Book Deleted Successfully");
			resp.sendRedirect("userOldBooks.jsp");
		}
		else {
			session.setAttribute("errmsg","Something went wrong on Server");
			resp.sendRedirect("userOldBooks.jsp");
		}
	}

}
