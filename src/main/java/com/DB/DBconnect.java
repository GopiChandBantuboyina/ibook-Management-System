package com.DB;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBconnect {
	private static Connection con;
	public static Connection getcon()
	{
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ibook-app","root","gopi");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}

		return con;
	}


}
