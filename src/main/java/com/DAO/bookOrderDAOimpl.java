package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.bookOrders;

public class bookOrderDAOimpl {

	private Connection con;

	public bookOrderDAOimpl(Connection con) {
		super();
		this.con = con;
	}




	public boolean saveOrders(List<bookOrders> b)
	{

		boolean flag=false;

		try {
			String sql="insert into bookorder (orderId,user_name,email,address,phno,book_name,author,price,payment,quantity,totalPrice) values (?,?,?,?,?,?,?,?,?,?,?)";

			con.setAutoCommit(false);

			PreparedStatement ps=con.prepareStatement(sql);
			for(bookOrders bk:b)
			{
				ps.setString(1, bk.getOrderId());
				ps.setString(2, bk.getUser_name());
				ps.setString(3, bk.getEmail());
				ps.setString(4, bk.getFulladdress());
				ps.setString(5, bk.getPhno());
				ps.setString(6, bk.getBookname());
				ps.setString(7, bk.getAuthor());
				ps.setInt(8, bk.getPrice());
				ps.setString(9, bk.getPaymenttype());
				ps.setInt(10, bk.getQuantity());
				ps.setDouble(11, bk.getTotalPrice());

				ps.addBatch();

			}

			int[] i=ps.executeBatch();
			con.commit();
			flag=true;
			con.setAutoCommit(true);

		} catch (Exception e) {
			e.printStackTrace();
		}


		return flag;
	}


	public List<bookOrders> getAllOrders(String email)
	{
		List<bookOrders> list=new ArrayList<>();
		bookOrders b=null;
		try {
			String sql="select * from bookorder where email=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, email);

			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				b=new bookOrders();
				b.setOrderId(rs.getString(2));
				b.setUser_name(rs.getString(3));
				b.setEmail(rs.getString(4));
				b.setFulladdress(rs.getString(5));
				b.setPhno(rs.getString(6));
				b.setBookname(rs.getString(7));
				b.setAuthor(rs.getString(8));
				b.setPrice(rs.getInt(9));
				b.setPaymenttype(rs.getString(10));
				b.setQuantity(rs.getInt(11));
				b.setTotalPrice(rs.getDouble(12));

				list.add(b);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public List<bookOrders> AllOrders()
	{
		List<bookOrders> list=new ArrayList<>();
		bookOrders b=null;
		try {
			String sql="select * from bookorder";
			PreparedStatement ps=con.prepareStatement(sql);


			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				b=new bookOrders();
				b.setOrderId(rs.getString(2));
				b.setUser_name(rs.getString(3));
				b.setEmail(rs.getString(4));
				b.setFulladdress(rs.getString(5));
				b.setPhno(rs.getString(6));
				b.setBookname(rs.getString(7));
				b.setAuthor(rs.getString(8));
				b.setPrice(rs.getInt(9));
				b.setPaymenttype(rs.getString(10));
				b.setQuantity(rs.getInt(11));
				b.setTotalPrice(rs.getDouble(12));

				list.add(b);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
}
