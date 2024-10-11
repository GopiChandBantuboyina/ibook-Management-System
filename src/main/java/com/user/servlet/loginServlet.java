package com.user.servlet;



import java.io.IOException;

import com.DAO.userDAOimpl;
import com.DB.DBconnect;
import com.entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class loginServlet extends HttpServlet {
	@Override

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String email = req.getParameter("email");
		String pwd = req.getParameter("pwd");
		try {
			userDAOimpl dao = new userDAOimpl(DBconnect.getcon());
			HttpSession session = req.getSession();
			if ("admin@gmail.com".equals(email) && ("admin123".equals(pwd))) {
				User us = new User();
				us.setName("Admin");
				session.setAttribute("userobj", us);
				resp.sendRedirect("admin/adminhome.jsp");
			}
			else {

				User us = dao.login(email, pwd);
				if (us != null)
				{
					session.setAttribute("userobj", us);
					resp.sendRedirect("index.jsp");
				}
				else
				{
					session.setAttribute("failedmsg", "Email & Password are Invalid");
					resp.sendRedirect("login.jsp");
				}



			}
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
	}
}
