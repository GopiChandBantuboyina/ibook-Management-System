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

//@WebServlet("/register")

public class RegisterServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String name = req.getParameter("fname");
		String email = req.getParameter("email");
		String phno = req.getParameter("phno");
		String password = req.getParameter("password");
		String cond = req.getParameter("cond");

		User us = new User();
		us.setName(name);
		us.setEmail(email);
		us.setPhno(phno);
		us.setPassword(password);

		HttpSession session=req.getSession();


			userDAOimpl dao = new userDAOimpl(DBconnect.getcon());
			int f = dao.userRegister(us);
			if(f==1) {
				session.setAttribute("errmsg1", "Phone Number  has already taken.");
				resp.sendRedirect("register.jsp");
			}
			else if(f==2) {
				session.setAttribute("errmsg2", "EMAIL has been  already taken.");
				resp.sendRedirect("register.jsp");
			}
			else if (f==3) {
				session.setAttribute("sucmsg", "successfully Registered.");
				resp.sendRedirect("register.jsp");

			}
			else if(f==0)
			{
				session.setAttribute("errmsg3", "Some thing went Wrong....Try Again.");
				resp.sendRedirect("register.jsp");
			}


		
	}
}
