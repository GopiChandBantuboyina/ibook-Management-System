package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.cart;

public class cartDAOimpl implements cartDAO {
	private Connection con;

	public cartDAOimpl(Connection con) {
		super();
		this.con = con;
	}

	@Override
	public int addCart(cart c) {
		int b = 0;

		try {

			String s = "select * from cart where bid=? and uid=?";
			PreparedStatement p = con.prepareStatement(s);
			p.setInt(1, c.getBid());
			p.setInt(2, c.getUid());

			ResultSet rs = p.executeQuery();
			while (rs.next()) {

				b = 2;
				return b;
			}
			String sql = "insert into cart (bid,uid,bookname,author,price,totalPrice,quantity) values(?,?,?,?,?,?,?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, c.getBid());
			ps.setInt(2, c.getUid());
			ps.setString(3, c.getBookname());
			ps.setString(4, c.getAuthor());
			ps.setInt(5, c.getPrice());
			ps.setDouble(6, c.getTotalPrice());
			ps.setInt(7, 1);
			int i = ps.executeUpdate();
			if (i > 0) {

				b = 1;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return b;
	}

	@Override
	public List<cart> getallCart(int uid) {
		List<cart> list = new ArrayList<>();
		double totalprice = 0.0;
		cart c = null;
		try {
			String sql = "select * from cart where uid=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, uid);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				c = new cart();
				c.setCid(rs.getInt(1));
				c.setBid(rs.getInt(2));
				c.setUid(rs.getInt(3));
				c.setBookname(rs.getString(4));
				c.setAuthor(rs.getString(5));
				c.setPrice(rs.getInt(6));
				totalprice = rs.getDouble(7);

				c.setQuantity(rs.getInt(8));
				c.setTotalPrice(totalprice);
				list.add(c);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public boolean deleteBook(int bid, int uid) {
		boolean f = false;
		try {

			String sql = "select quantity,price,totalPrice from cart where bid=? and uid=?";
			PreparedStatement ps = con.prepareStatement(sql);

			ps.setInt(1, bid);
			ps.setInt(2, uid);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				if (rs.getInt(1) == 1) {
					String s = "delete from cart where bid=? and uid=?";
					PreparedStatement p = con.prepareStatement(s);
					p.setInt(1, bid);
					p.setInt(2, uid);
					int i = p.executeUpdate();
					if (i > 0) {
						f = true;
					}
				}

				else if (rs.getInt(1) > 1) {

					String st = "update cart set quantity=?,totalPrice=? where bid=? and uid=?";
					PreparedStatement psmt = con.prepareStatement(st);
					int quantity = rs.getInt(1);
					quantity=quantity-1;
					int price=rs.getInt(2);

					double totalPrice=rs.getDouble(3);
					totalPrice-=price;

					psmt.setInt(1, quantity);
					psmt.setDouble(2, totalPrice);
					psmt.setInt(3, bid);
					psmt.setInt(4, uid);

					int i = psmt.executeUpdate();
					if (i > 0) {
						f = true;
					}
				}
			}
		} catch (

		Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	@Override
	public boolean addQuantity(int bid,int uid)
	{
		boolean f=false;
		try {
			String sql="select price,totalprice,quantity from cart where bid=? and uid=?";
			PreparedStatement ps = con.prepareStatement(sql);

			ps.setInt(1, bid);
			ps.setInt(2, uid);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				int price=rs.getInt(1);
				int totalprice=rs.getInt(2);
				int quantity=rs.getInt(3);
				totalprice+=price;
				quantity+=1;
				String s="update cart set quantity=?,totalPrice=? where bid=? and uid=?";
				PreparedStatement p= con.prepareStatement(s);


				p.setInt(1, quantity);
				p.setDouble(2, totalprice);
				p.setInt(3, bid);
				p.setInt(4, uid);
				int i=p.executeUpdate();
				if(i>0)
				{
					f=true;

				}
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}

		return f;
	}


	@Override
	public boolean deleteallCartBooks(int uid)
	{
		boolean b=false;
		try {
			String sql="delete from cart where uid=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setInt(1, uid);
			int i=ps.executeUpdate();
			if(i>0)
			{
				b=true;
			}


		} catch (Exception e) {
			e.printStackTrace();
		}

		return b;
	}
}
