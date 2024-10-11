package com.user.servlet;

import java.io.IOException;

import com.DAO.bookDAOimpl;
import com.DB.DBconnect;
import com.entity.bookdtls;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/editOldBook")
public class editOldBook extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int id = Integer.parseInt(req.getParameter("id"));
		String bookname = req.getParameter("bname");
		String author = req.getParameter("aname");
		int price = Integer.parseInt(req.getParameter("price"));


		bookdtls b = new bookdtls();
		b.setBookid(id);
		b.setBookname(bookname);
		b.setAuthor(author);
		b.setPrice(price);


		bookDAOimpl dao = new bookDAOimpl(DBconnect.getcon());

		HttpSession session = req.getSession();
		boolean flag = dao.updateOldbookdtls(b);

		if (flag) {
			session.setAttribute("sucmsg", "Book Updated Successfully..");
			resp.sendRedirect("userOldBooks.jsp");

		} else {
			session.setAttribute("errormsg", "Something went wrong on SERVER...");
			resp.sendRedirect("userOldBooks.jsp");
		}
	}

}
