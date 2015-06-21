package com.morphus.user.DAO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.morphus.jdbc.DBConnect;

public class RetriveProjectsUserwise 
{
	
	public ArrayList<String> getProjectsUser(String activity)
	{
			
		Statement stmt=null;
		ResultSet rs=null;
		Connection con=null;
		ArrayList<String> projectsuser=new ArrayList<String>();
		try
		{
			con=new DBConnect().connect();
			stmt=con.createStatement();
			
			String sql="SELECT projectname,projectid,startdate,enddate,duration FROM defined_activities_projectwise t1 inner join projectdetails t2 on t1.project_id=t2.projectid where activityname="+"'"+activity+"'" +"group by projectid ;";
			rs=stmt.executeQuery(sql);
			
			
			
			
			while(rs.next())
			{
				
				projectsuser.add(rs.getString(1));
				projectsuser.add(rs.getString(2));
				projectsuser.add(rs.getString(3));
				projectsuser.add(rs.getString(4));
				projectsuser.add(rs.getString(5));
				
				
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
		return projectsuser;

	}
	public ArrayList<String> getMessagesUser(String uid)
	{
			
		Statement stmt=null;
		ResultSet rs=null;
		Connection con=null;
		ArrayList<String> messagesuser=new ArrayList<String>();
		try
		{
			con=new DBConnect().connect();
			stmt=con.createStatement();
			
			String sql="SELECT proj_id,user_id,mesgslno,date FROM user_mesg_inbox where to_user="+"'"+uid+"'"+"and adminapproval="+"'"+"approved"+"'"+"order by date DESC ;";
			rs=stmt.executeQuery(sql);
			
			
			
			
			while(rs.next())
			{
				
				messagesuser.add(rs.getString(1));
				messagesuser.add(rs.getString(2));
				messagesuser.add(rs.getString(3));
				messagesuser.add(rs.getString(4));
			
				
				
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
		return messagesuser;

	}
	public ArrayList<String> getMessagesFromAdmin(String uid)
	{
			
		Statement stmt=null;
		ResultSet rs=null;
		Connection con=null;
		ArrayList<String> messagesuser=new ArrayList<String>();
		try
		{
			con=new DBConnect().connect();
			stmt=con.createStatement();
			
			String sql="SELECT slno,project_id,admin_mesg,status_approve_admin,date FROM status_projectwise where user_id="+"'"+uid+"'"+"and status_fwd_admin="+"'"+"verified"+"'"+"order by date DESC ;";
			rs=stmt.executeQuery(sql);
			
			
			
			
			while(rs.next())
			{
				
				messagesuser.add(rs.getString(1));
				messagesuser.add(rs.getString(2));
				messagesuser.add(rs.getString(3));
				messagesuser.add(rs.getString(4));
				messagesuser.add(rs.getString(5));
				
				
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
		return messagesuser;

	}
}