package com.movies;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class DBCon 
{
	Connection con;
	private String db_url="jdbc:mysql://localhost:3306/movies";
	private String db_user="root";
	private String db_password="";
	public DBCon()
	{
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
		}
		catch(ClassNotFoundException e)
		{
			e.printStackTrace();
		}
		
	}
	public Connection dbCon()
	{
		try {
				con=DriverManager.getConnection(db_url,db_user,db_password);
			} 
			catch (SQLException e)
			{
				e.printStackTrace();
			}
		return con;
	}
}
