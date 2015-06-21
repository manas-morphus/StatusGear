package com.morphus.user.DAO;

import java.sql.Connection;

import java.sql.Statement;


import com.morphus.jdbc.DBConnect;

public class UpdateUsers {
	
	public  void modifyActivityUser(String activity,String userid)
	{
			
		Statement stmt=null;
		
		Connection con=null;
		
		try
		{
			con=new DBConnect().connect();
			stmt=con.createStatement();
			
			String sql="update usermain set assignedactivity="+"'"+activity+"'"+"where userid="+"'"+userid+"'";
			
			stmt.executeUpdate(sql);
			
			stmt.close();
			
		}
		catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		finally
		{
			try {
				
				con.close();
				
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		
	}
	
	public  void removeActivityUser(String userid)
	{
			
		Statement stmt=null;
		
		Connection con=null;
		
		try
		{
			con=new DBConnect().connect();
			stmt=con.createStatement();
			
			String sql="update usermain set assignedactivity="+"'"+"NOTASSIGNED"+"'"+"where userid="+"'"+userid+"'";
			
			stmt.executeUpdate(sql);
			
			stmt.close();
			
		}
		catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		finally
		{
			try {
				
				con.close();
				
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		
	}

}
