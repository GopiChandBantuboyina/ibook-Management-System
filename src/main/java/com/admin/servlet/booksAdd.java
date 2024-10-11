package com.admin.servlet;

import java.io.File;
import java.io.IOException;

import com.DAO.bookDAOimpl;
import com.DB.DBconnect;
import com.entity.bookdtls;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

@MultipartConfig

public class booksAdd extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String bookname = req.getParameter("bname");
			String author = req.getParameter("aname");
			int price = Integer.parseInt(req.getParameter("price"));
			String category = req.getParameter("bcategory");
			Part part = req.getPart("bimg");
			String bstatus = req.getParameter("bstatus");

			String filename = part.getSubmittedFileName();

			String path=getServletContext().getRealPath("")+"books";



			File file=new File(path);

			part.write(path+File.separator+filename);


			HttpSession session = req.getSession();

			bookdtls b = new bookdtls(bookname, author, price, category,  bstatus,filename, "admin@gmail.com");

			bookDAOimpl dao = new bookDAOimpl(DBconnect.getcon());

			boolean f = dao.addbook(b);

			if (f) {
				session.setAttribute("sucmsg", "Book Add Successfully");
				resp.sendRedirect("admin/addbooks.jsp");
			}
			else {
				session.setAttribute("errormsg", "Something went wrong on server");
				resp.sendRedirect("admin/addbooks.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
