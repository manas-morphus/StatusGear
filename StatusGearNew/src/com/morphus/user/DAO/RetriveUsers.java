package com.morphus.user.DAO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.morphus.jdbc.DBConnect;

public class RetriveUsers {
	
	
	public ArrayList<String> getUsers()
	{
			
		Statement stmt=null;
		ResultSet rs=null;
		Connection con=null;
		ArrayList<String> savedusers=new ArrayList<String>();
		try
		{
			con=new DBConnect().connect();
			stmt=con.createStatement();
			
			String sql="SELECT uname,userid,usertype,assignedactivity FROM usermain";
			rs=stmt.executeQuery(sql);
			
			
			
			
			while(rs.next())
			{
				
				savedusers.add(rs.getString(1));
				savedusers.add(rs.getString(2));
				savedusers.add(rs.getString(3));
				savedusers.add(rs.getString(4));
				
			}
			
			rs.close();
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
		return savedusers;
	}
	public ArrayList<String> getUsersActivitywise(String activity)
	{
			
		Statement stmt=null;
		ResultSet rs=null;
		Connection con=null;
		ArrayList<String> usersactivitywise=new ArrayList<String>();
		try
		{
			con=new DBConnect().connect();
			stmt=con.createStatement();
			
			String sql="SELECT userid FROM mpt.usermain u where assignedactivity="+"'"+activity+"'";
			rs=stmt.executeQuery(sql);
			
			
			
			
			while(rs.next())
			{
				
				usersactivitywise.add(rs.getString(1));
				
				
			}
			
			rs.close();
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
		return usersactivitywise;
	}
	public ArrayList<String> getUsersProjectwise(String pid)
	{
			
		Statement stmt=null;
		ResultSet rs=null;
		Connection con=null;
		ArrayList<String> usersprjwise=new ArrayList<String>();
		try
		{
			con=new DBConnect().connect();
			stmt=con.createStatement();
			
			String sql="SELECT userid FROM mpt.usermain u where assignedactivity in (SELECT activityname from mpt.defined_activities_projectwise where project_id="+"'"+pid+"'"+")";
			rs=stmt.executeQuery(sql);
			
			
			
			
			while(rs.next())
			{
				
				usersprjwise.add(rs.getString(1));
				
				
			}
			
			rs.close();
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
		return usersprjwise;
	}

}
