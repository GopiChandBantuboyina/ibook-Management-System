package com.DAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.entity.User;

public class userDAOimpl implements userDAO {
	private Connection con;

	public userDAOimpl(Connection con) {
		super();
		this.con = con;
	}

	@Override
	public int userRegister(User us) {
		int flag=0;
		try {
			String name=us.getName();

			String email = us.getEmail();

			String phno = us.getPhno();
			String password=us.getPassword();
			String quary1 = "select name from user where phno=(?)";
			String quary2 = "select name from user where email=(?)";
			PreparedStatement ps1 = con.prepareStatement(quary1);
			ps1.setString(1, phno);
			PreparedStatement ps2 = con.prepareStatement(quary2);
			ps2.setString(1,email );
			ResultSet rs1 = ps1.executeQuery();
			ResultSet rs2 = ps2.executeQuery();
	        if(rs1.next())
	        {
	        	flag=1;
	        }else if(rs2.next())
	        {
	        	flag=2;
	        }else {

	        	String quary = "insert into user(name,email,phno,password) values(?,?,?,?)";
	        	PreparedStatement stm = con.prepareStatement(quary);
	        	stm.setString(1, name);
				stm.setString(2, email);
				stm.setString(3, phno);
				stm.setString(4, password);
				int i = stm.executeUpdate();
				if (i != 0) {
					flag = 3;
				}
	        }
	        con.close();
			return flag;



		} catch (Exception e) {
			e.printStackTrace();
		}

		return flag;
	}

	@Override
	public User login(String email,String pwd) {
		User us=null;
		try {
			
			String sql="select * from user where email=? and password=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, pwd);
			ResultSet rs=ps.executeQuery();
			if(rs.next())
			{
				us=new User();
				us.setId(rs.getInt(1));

				us.setName(rs.getString("name"));
				us.setEmail(rs.getString(3));
				us.setPhno(rs.getString(4));
				us.setPassword(rs.getString(5));
				us.setAddress(rs.getString(6));
				us.setLandmark(rs.getString(7));
				us.setCity(rs.getString(8));
				us.setState(rs.getString(9));
				us.setPincode(rs.getString(10));



			}
		}
		catch(Exception e)
		{

			e.printStackTrace();
		}
		return us;
	}


	@Override
	public boolean checkPassword(String password,int uid)
	{
		boolean b=false;
		try {
			String sql="select password from user where id=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setInt(1,uid);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				if(rs.getString(1).equals(password))
				{
					b=true;
				}


			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return b;
	}

	@Override
	public boolean updateUser(User us)
	{
		boolean b=false;
		try {

			String sql="update user set name=?,email=?,phno=? where id=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, us.getName());
			ps.setString(2, us.getEmail());
			ps.setString(3, us.getPhno());
			ps.setInt(4, us.getId());

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
	public boolean updateAddress(User u,int uid)
	{
		boolean flag=false;
		try {

			String sql="select address,landmark,city,state,pincode from user where id=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setInt(1, uid);

			ResultSet rs=ps.executeQuery();
			while(!rs.next())
			{
				String s="insert into user (address,landmark,city,state,pincode) values (?,?,?,?,?) where id=?";
				PreparedStatement p=con.prepareStatement(s);
				p.setString(1, u.getAddress());
				p.setString(2, u.getLandmark());
				p.setString(3, u.getCity());
				p.setString(4, u.getState());
				p.setString(5, u.getPincode());
				p.setInt(6, uid);
				int i=p.executeUpdate();
				if(i>0)
				{
					return true;
				}
			}

				String s1="update user set address=?,landmark=?,city=?,state=?,pincode=? where id=?";
				PreparedStatement p2=con.prepareStatement(s1);
				p2.setString(1, u.getAddress());
				p2.setString(2, u.getLandmark());
				p2.setString(3, u.getCity());
				p2.setString(4, u.getState());
				p2.setString(5, u.getPincode());
				p2.setInt(6, uid);

				int i=p2.executeUpdate();
				if(i>0)
				{
					flag=true;
				}


		} catch (Exception e) {
			e.printStackTrace();
		}


		return flag;
	}

	@Override
	public int changepwd(int id,String newpwd,String old)
	{
		int falg=0;
		try {

			String sql="select password from user where id=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				String pre=rs.getString(1);
				if(old.equals(pre))
				{
					String s="update user set password=? where id=?";

					PreparedStatement p=con.prepareStatement(s);
					p.setString(1, newpwd);
					p.setInt(2, id);
					int i=p.executeUpdate();
					if(i>0)
					{
						return 1;
					}
				}
				else {
					return 2;
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return falg;
	}
}
