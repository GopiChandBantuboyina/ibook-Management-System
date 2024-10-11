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

@WebServlet("/updateProfile")
public class updateAddress extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int uid=Integer.parseInt(req.getParameter("uid"));


		String address=req.getParameter("address");
		String landmark=req.getParameter("landmark");
		String city=req.getParameter("city");
		String state=req.getParameter("state");
		String pincode=req.getParameter("pincode");

		User us=new User();
		us.setAddress(address);
		us.setLandmark(landmark);
		us.setCity(city);
		us.setState(state);
		us.setPincode(pincode);

		userDAOimpl dao=new userDAOimpl(DBconnect.getcon());
		HttpSession session=req.getSession();
		boolean flag=dao.updateAddress(us,uid);

		if(flag)
		{
			session.setAttribute("updated", "Address updated Successfully");

			resp.sendRedirect("userAddress.jsp");
		}
		else {
			session.setAttribute("errmsg", "Something went Wrong on Server");
			resp.sendRedirect("userAddress.jsp");
		}
	}

}
