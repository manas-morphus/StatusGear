package com.morphus.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {
	
	public Connection connect()
	{
		String dbUrl = "jdbc:mysql://localhost:3306/mpt";
	
		//String dbUrl = "jdbc:mysql://localhost:3306/mpt";
		String dbClass = "com.mysql.jdbc.Driver";
		String un="root";
		String pw="";
		
		//String pw="MYSQL123";
		Connection con=null;
		
		try {
			
			Class.forName(dbClass).newInstance();
			 con=DriverManager.getConnection(dbUrl,un,pw);
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		return con;
		
		
		
		
	}

}
