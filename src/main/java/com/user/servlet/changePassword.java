package com.user.servlet;

import java.io.IOException;

import com.DAO.userDAOimpl;
import com.DB.DBconnect;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/changePassword")
public class changePassword extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			int id=Integer.parseInt(req.getParameter("id"));

			String old=req.getParameter("old");
			String newpwd=req.getParameter("newpwd");

			userDAOimpl dao=new userDAOimpl(DBconnect.getcon());
			int i=dao.changepwd(id, newpwd, old);

			HttpSession session=req.getSession();

			if(i==1)
			{
				session.setAttribute("pwdmsg", "Password Changed Successfully..");
				resp.sendRedirect("login.jsp");

			}
			else if(i==2)
			{
				session.setAttribute("failmsg", "Passwords Invalid");
				resp.sendRedirect("changePassword.jsp");
			}
			else {
				session.setAttribute("errmsg", "Something went Wrong on Server..");
				resp.sendRedirect("changePassword.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
