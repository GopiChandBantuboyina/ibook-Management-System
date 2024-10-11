package com.user.servlet;

import java.io.IOException;

import com.DAO.userDAOimpl;
import com.DB.DBconnect;
import com.entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/editProfile")
public class editUserProfile extends HttpServlet{


	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int uid=Integer.parseInt(req.getParameter("uid"));

		String name=req.getParameter("fname");

		String email=req.getParameter("email");

		String phno=req.getParameter("phno");

		String password=req.getParameter("password");
		HttpSession session=req.getSession();
		userDAOimpl dao=new userDAOimpl(DBconnect.getcon());
		boolean b=dao.checkPassword(password, uid);
		if(b)
		{
			User us=new User();
			us.setId(uid);
			us.setName(name);
			us.setEmail(email);
			us.setPhno(phno);
			us.setPassword(password);

			boolean flag=dao.updateUser(us);

			if(flag)
			{
				session.setAttribute("updatemsg", "Profile Updated Successfully...Re-Login");

				resp.sendRedirect("logout");
			}
			else {
				session.setAttribute("errmsg", "Something Went Wrong on Server");
				resp.sendRedirect("editProfile.jsp");
			}
		}
		else {
			session.setAttribute("failmsg", "Password is Invalid");
			resp.sendRedirect("editProfile.jsp");
		}

	}
}
