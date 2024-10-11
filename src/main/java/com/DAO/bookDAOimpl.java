package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.bookdtls;

public class bookDAOimpl implements bookDAO {
	private Connection con;

	public bookDAOimpl(Connection con) {
		super();
		this.con = con;
	}

	@Override
	public boolean addbook(bookdtls b) {
		boolean f = false;

		try {
			String sql = "insert into bookdtls(bookname,author,price,bookcategory,status,photo,email) values(?,?,?,?,?,?,?)";

			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, b.getBookname());
			ps.setString(2, b.getAuthor());
			ps.setInt(3, b.getPrice());
			ps.setString(4, b.getBookcategory());
			ps.setString(5, b.getStatus());
			ps.setString(6, b.getPhoto());
			ps.setString(7, b.getEmail());

			int i = ps.executeUpdate();
			if (i != 0) {

				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	@Override
	public List<bookdtls> getallbooks() {

		List<bookdtls> list = new ArrayList<>();
		bookdtls b = null;
		try {
			String sql = "select * from bookdtls";
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next())
			{
				b=new bookdtls();
				b.setBookid(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getInt(4));
				b.setBookcategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setEmail(rs.getString(8));

				list.add(b);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}


	@Override
	public bookdtls getbookbyid(int id) {
		bookdtls b=null;
		try {


			b=new bookdtls();
			String sql="select * from bookdtls where bookid=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs=ps.executeQuery();
			while (rs.next())
			{
				b=new bookdtls();
				b.setBookid(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getInt(4));
				b.setBookcategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setEmail(rs.getString(8));


			}

		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return b;
	}


	@Override
	public boolean updatebookdtls(bookdtls b)
	{
		boolean f=false;

		try {

			String sql="update bookdtls set bookname=?,author=?,price=?,status=? where bookid=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1,b.getBookname());
			ps.setString(2, b.getAuthor());
			ps.setInt(3, b.getPrice());
			ps.setString(4,b.getStatus());
			ps.setInt(5, b.getBookid());

			int i=ps.executeUpdate();
			if(i!=0)
			{
				f=true;
			}

		}
		catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}



	@Override
	public boolean bookDelete(int id)
	{
		boolean f=false;
		try {

			String sql="delete from bookdtls where bookid=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setInt(1, id);
			int i=ps.executeUpdate();
			if(i!=0)
			{
				f=true;
			}

		}
		catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}


	@Override
	public List<bookdtls> Newbooks()
	{

		List<bookdtls> list=new ArrayList<>();
		bookdtls b=null;
		try {
			String sql="select * from bookdtls where bookcategory=? and status=? order by bookid DESC";

			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, "New Book");
			ps.setString(2, "Active");

			ResultSet rs=ps.executeQuery();
			int i=1;
			while(rs.next() && i<=4)
			{

				b=new bookdtls();
				b.setBookid(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getInt(4));
				b.setBookcategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setEmail(rs.getString(8));

				list.add(b);
				i++;
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}


	@Override
	public List<bookdtls> Recentbooks()
	{

		List<bookdtls> list=new ArrayList<>();
		bookdtls b=null;
		try {
			String sql="select * from bookdtls where status=? order by bookid DESC";

			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, "Active");

			ResultSet rs=ps.executeQuery();
			int i=1;
			while(rs.next() && i<=4)
			{

				b=new bookdtls();
				b.setBookid(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getInt(4));
				b.setBookcategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setEmail(rs.getString(8));

				list.add(b);
				i++;
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return list;

	}


	@Override
	public List<bookdtls> Oldbooks()
	{
		List<bookdtls> list=new ArrayList<>();
		bookdtls b=null;
		try {
			String sql="select * from bookdtls where bookcategory=? and status=? order by bookid DESC";

			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, "Old Book");
			ps.setString(2, "Active");

			ResultSet rs=ps.executeQuery();
			int i=1;
			while(rs.next() && i<=4)
			{

				b=new bookdtls();
				b.setBookid(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getInt(4));
				b.setBookcategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setEmail(rs.getString(8));

				list.add(b);
				i++;
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}



	@Override
	public List<bookdtls> getAllRecentBooks()
	{
		List<bookdtls> list=new ArrayList<>();
		bookdtls b=null;
		try {
			String sql="select * from bookdtls where status=? order by bookid DESC";

			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, "Active");

			ResultSet rs=ps.executeQuery();

			while(rs.next())
			{

				b=new bookdtls();
				b.setBookid(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getInt(4));
				b.setBookcategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setEmail(rs.getString(8));

				list.add(b);

			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}


	@Override
	public List<bookdtls> getAllNewBooks()
	{
		List<bookdtls> list=new ArrayList<>();
		bookdtls b=null;
		try {
			String sql="select * from bookdtls where bookcategory=? and status=? order by bookid DESC";

			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, "New Book");
			ps.setString(2, "Active");

			ResultSet rs=ps.executeQuery();

			while(rs.next())
			{

				b=new bookdtls();
				b.setBookid(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getInt(4));
				b.setBookcategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setEmail(rs.getString(8));

				list.add(b);

			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}


	@Override
	public List<bookdtls> getAllOldBooks()
	{
		List<bookdtls> list=new ArrayList<>();
		bookdtls b=null;
		try {
			String sql="select * from bookdtls where bookcategory=? and status=? order by bookid DESC";

			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, "Old Book");
			ps.setString(2, "Active");

			ResultSet rs=ps.executeQuery();

			while(rs.next())
			{

				b=new bookdtls();
				b.setBookid(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getInt(4));
				b.setBookcategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setEmail(rs.getString(8));

				list.add(b);

			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}


	@Override
	public List<bookdtls> getOldBook(String email,String bcategory)
	{
		List<bookdtls> list=new ArrayList<>();
		bookdtls b=null;
		try {
			String sql="select * from bookdtls where email=? and bookcategory=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, bcategory);
			ResultSet rs=ps.executeQuery();

			while(rs.next())
			{
				b=new bookdtls();
				b.setBookid(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getInt(4));
				b.setPhoto(rs.getString(7));
				list.add(b);


			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public boolean deleteOldBook(int bid,String email,String bcategory)
	{
		boolean b=false;
		try {
			String sql="delete from bookdtls where bookid=? and email=? and bookcategory=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setInt(1, bid);
			ps.setString(2, email);
			ps.setString(3, bcategory);
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



	@Override
	public boolean updateOldbookdtls(bookdtls b)
	{
		boolean f=false;

		try {

			String sql="update bookdtls set bookname=?,author=?,price=? where bookid=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1,b.getBookname());
			ps.setString(2, b.getAuthor());
			ps.setInt(3, b.getPrice());

			ps.setInt(4, b.getBookid());

			int i=ps.executeUpdate();
			if(i!=0)
			{
				f=true;
			}

		}
		catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	@Override
	public List<bookdtls> getbookbychar(String ch)
	{

		List<bookdtls> list=new ArrayList<>();
		bookdtls b=null;
		try {
			String sql="select * from bookdtls where bookname like ? or author like ? or bookcategory like ? or status like ?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, "%"+ch+"%");
			ps.setString(2, "%"+ch+"%");
			ps.setString(3, "%"+ch+"%");
			ps.setString(4, "%"+ch+"%");

			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				b=new bookdtls();
				b.setBookid(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getInt(4));
				b.setBookcategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setEmail(rs.getString(8));

				list.add(b);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

}
