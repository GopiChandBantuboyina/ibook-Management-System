package com.admin.servlet;

import java.io.IOException;

import com.DAO.bookDAOimpl;
import com.DB.DBconnect;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/delete")
public class deleteBook extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int id=Integer.parseInt(req.getParameter("id"));
		bookDAOimpl dao=new bookDAOimpl(DBconnect.getcon());
		HttpSession session=req.getSession();
		boolean flag=dao.bookDelete(id);
		if(flag)
		{
			session.setAttribute("delmsg", "Book Deleted Successfully..");
			resp.sendRedirect("admin/allbooks.jsp");

		}
		else {
			session.setAttribute("errormsg", "Something went wrong on SERVER...");
			resp.sendRedirect("admin/allbooks.jsp");
		}
	}

}
