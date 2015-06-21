package com.morphus.user.DAO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.morphus.jdbc.DBConnect;

public class RetriveActivities {
	
	public ArrayList<String> getActivities()
	{
			
		Statement stmt=null;
		ResultSet rs=null;
		Connection con=null;
		
		ArrayList<String> activities=new ArrayList<String>();		
		//String activitydtl="{"+'"'+"activities"+'"'+":"+"[";
		
		try
		{
			con=new DBConnect().connect();
			stmt=con.createStatement();
			
			String sql="SELECT slno,activityname,description FROM activity_main ";
			rs=stmt.executeQuery(sql);
			
			/*while(rs.next())
			{
				activitydtl+="{"+'"'+"actname"+'"' + ":"+ '"'+rs.getString(1) +'"';
				
				activitydtl+="}"+",";
				
			}
			
			activitydtl=activitydtl.substring(0, (activitydtl.length())-1);
			
			activitydtl+="]"+"}" ;*/
			
			while(rs.next())
			{
				
				activities.add(rs.getString(1));
				activities.add(rs.getString(2));
				activities.add(rs.getString(3));
				
				
			}
			
			
		}
		catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		finally
		{
			try
			{
				rs.close();
				stmt.close();
				con.close();
			}
			catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			
		}
		//System.out.println(activitydtl);
		return activities;
		
	}
	public ArrayList<String> getActivityDtl(String aid)
	{
			
		Statement stmt=null;
		ResultSet rs=null;
		Connection con=null;
		
		ArrayList<String> activitydtl=new ArrayList<String>();		
		//String activitydtl="{"+'"'+"activities"+'"'+":"+"[";
		System.out.println(aid);
		try
		{
			con=new DBConnect().connect();
			stmt=con.createStatement();
			
			String sql="SELECT slno,activityname,description FROM activity_main where slno="+"'"+aid+"'";
			rs=stmt.executeQuery(sql);
		
			
			while(rs.next())
			{
				
				activitydtl.add(rs.getString(1));
				activitydtl.add(rs.getString(2));
				activitydtl.add(rs.getString(3));
				
				
			}
			
			
		}
		catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		finally
		{
			try
			{
				rs.close();
				stmt.close();
				con.close();
			}
			catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			
		}
		//System.out.println(activitydtl);
		return activitydtl;
		
	}
	public ArrayList<String> getActivitiesOfUser(String uid)
	{
			
		Statement stmt=null;
		ResultSet rs=null;
		Connection con=null;
		
		ArrayList<String> activities=new ArrayList<String>();		
		//String activitydtl="{"+'"'+"activities"+'"'+":"+"[";
		
		try
		{
			con=new DBConnect().connect();
			stmt=con.createStatement();
			
			String sql="SELECT  assignedactivity FROM usermain where userid= "+"'"+uid+"'";
			rs=stmt.executeQuery(sql);
			
			/*while(rs.next())
			{
				activitydtl+="{"+'"'+"actname"+'"' + ":"+ '"'+rs.getString(1) +'"';
				
				activitydtl+="}"+",";
				
			}
			
			activitydtl=activitydtl.substring(0, (activitydtl.length())-1);
			
			activitydtl+="]"+"}" ;*/
			
			while(rs.next())
			{
				
				activities.add(rs.getString(1));
				
				
				
			}
			
			
		}
		catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		finally
		{
			try
			{
				rs.close();
				stmt.close();
				con.close();
			}
			catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			
		}
		//System.out.println(activitydtl);
		return activities;
		
	}
	

}
