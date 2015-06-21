package com.morphus.user.DAO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.morphus.jdbc.DBConnect;

public class RetriveAllMessageAdmin {
	
	public ArrayList<String> getMessages()
	{
			
		Statement stmt=null;
		ResultSet rs=null;
		Connection con=null;
		ArrayList<String> messages=new ArrayList<String>();
		try
		{
			con=new DBConnect().connect();
			stmt=con.createStatement();
			
			String sql="SELECT  slno,project_id,user_id,user_mesg,date,status_approve_admin FROM status_projectwise where status_fwd_admin != 'not forwarded' order by  date DESC ";
			rs=stmt.executeQuery(sql);
			
			
			
			
			while(rs.next())
			{
				
				messages.add(rs.getString(1));
				messages.add(rs.getString(2));
				messages.add(rs.getString(3));
				messages.add(rs.getString(4));
				messages.add(rs.getString(5));
				messages.add(rs.getString(6));
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
		
		
		
		return messages;
	}
	public ArrayList<String> getMessagesUserToUser()
	{
			
		Statement stmt=null;
		ResultSet rs=null;
		Connection con=null;
		ArrayList<String> messages=new ArrayList<String>();
		try
		{
			con=new DBConnect().connect();
			stmt=con.createStatement();
			
			String sql="SELECT  slno,proj_id,user_id,to_user,mesgslno,date,adminapproval FROM user_mesg_inbox  group by proj_id,user_id,to_user,mesgslno  order by  date DESC ";
			rs=stmt.executeQuery(sql);
			
			
			
			
			while(rs.next())
			{
				
				messages.add(rs.getString(1));
				messages.add(rs.getString(2));
				messages.add(rs.getString(3));
				messages.add(rs.getString(4));
				messages.add(rs.getString(5));
				messages.add(rs.getString(6));
				messages.add(rs.getString(7));
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
		
		
		
		return messages;
	}
	public ArrayList<String> getMessageForUser(String mesgno)
	{
			
		Statement stmt=null;
		ResultSet rs=null;
		Connection con=null;
		
		ArrayList<String> messages=new ArrayList<String>();
		try
		{
			con=new DBConnect().connect();
			stmt=con.createStatement();
			
			System.out.println("mesgslno="+mesgno);
			
			String sql="SELECT  user_mesg FROM status_projectwise where slno= "+"'"+mesgno+"'";
			rs=stmt.executeQuery(sql);
			
			
			
			
			while(rs.next())
			{
				
				messages.add(rs.getString(1));
				
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
		
		System.out.println("size="+messages.size());
		
		if(messages.size()== 0)
		{
			messages.add("No Message");
		}
		
		return messages;
	}
	
	public ArrayList<String> getSimpleMessagesForAdmin(String userid)
	{
			
		Statement stmt=null;
		ResultSet rs=null;
		Connection con=null;
		
		ArrayList<String> messages=new ArrayList<String>();
		try
		{
			con=new DBConnect().connect();
			stmt=con.createStatement();
			
			//System.out.println("mesgslno="+mesgno);
			
			String sql="SELECT  * FROM maildetails where to_user="+"'"+userid+"'";
			rs=stmt.executeQuery(sql);
			
			
			
			
			while(rs.next())
			{
				
				messages.add(rs.getString(1));
				messages.add(rs.getString(2));
				messages.add(rs.getString(3));
				messages.add(rs.getString(4));
				messages.add(rs.getString(5));
				messages.add(rs.getString(6));
				messages.add(rs.getString(7));
				
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
		
		System.out.println("size="+messages.size());
		
		if(messages.size()== 0)
		{
			messages.add("No Message");
		}
		
		return messages;
	}


}
