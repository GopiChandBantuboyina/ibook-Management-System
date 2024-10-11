package com.user.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import com.DAO.bookOrderDAOimpl;
import com.DAO.cartDAOimpl;
import com.DB.DBconnect;
import com.entity.bookOrders;
import com.entity.cart;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/saveOrders")
public class saveOrders extends HttpServlet{


		@Override
		protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

			int uid=Integer.parseInt(req.getParameter("uid"));

			String name=req.getParameter("uname");
			String email=req.getParameter("email");
			String phno=req.getParameter("phno");
			String address=req.getParameter("address");
			String landmark=req.getParameter("landmark");
			String city=req.getParameter("city");
			String state=req.getParameter("state");
			String pincode=req.getParameter("pincode");
			String paymentMethod=req.getParameter("paymentMethod");

			String fulladdress=address+","+landmark+","+city+","+state+","+pincode;
			HttpSession session=req.getSession();

			if(("noselect").equals(paymentMethod))
			{

				session.setAttribute("payment", "Please choose method Method");
				resp.sendRedirect("checkout.jsp");
			}
			else {
				cartDAOimpl dao=new cartDAOimpl(DBconnect.getcon());

				List<cart> ct=dao.getallCart(uid);

				bookOrders b=null;

				Random r=new Random();

				List<bookOrders> list=new ArrayList<>();

				if(ct.isEmpty())
				{
					session.setAttribute("addmsg", "PLEASE ADD BOOKS TO CART...");
					resp.sendRedirect("checkout.jsp");
				}
				else {
					for(cart c:ct)
					{
						String orderId="BOOK-ORD-"+r.nextInt(1000);
						b=new bookOrders();
						b.setOrderId(orderId);
						b.setUser_name(name);
						b.setEmail(email);
						b.setFulladdress(fulladdress);
						b.setPhno(phno);
						b.setBookname(c.getBookname());
						b.setAuthor(c.getAuthor());
						b.setPrice(c.getPrice());
						b.setPaymenttype(paymentMethod);
						b.setQuantity(c.getQuantity());
						b.setTotalPrice(c.getTotalPrice());

						list.add(b);
					}

					bookOrderDAOimpl d=new bookOrderDAOimpl(DBconnect.getcon());
					boolean flag=d.saveOrders(list);
					if(flag)
					{
						//Order Successfull
						cartDAOimpl del=new cartDAOimpl(DBconnect.getcon());
						boolean fg=del.deleteallCartBooks(uid);
						if(fg)
						{
						resp.sendRedirect("orderSuccess.jsp");
						}
					}
					else {
						session.setAttribute("errmsg", "Something went Wrong on Server.");
						resp.sendRedirect("checkout.jsp");
					}
				}

			}

		}
}
