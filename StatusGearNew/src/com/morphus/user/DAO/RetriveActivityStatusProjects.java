package com.morphus.user.DAO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;

import com.morphus.jdbc.DBConnect;

public class RetriveActivityStatusProjects {
	
	public ArrayList<String> getActivityStatus(String pid,String userid,String activity)
	{
			
		Statement stmt=null;
		ResultSet rs=null;
		Connection con=null;
		ArrayList<String> activitystatus=new ArrayList<String>();
		try
		{
			con=new DBConnect().connect();
			stmt=con.createStatement();
			
			System.out.println(pid);
			System.out.println(userid);
			System.out.println(activity);
			
			String sql="SELECT slno,user_mesg,date  FROM status_projectwise  where project_id="+"'"+pid+"'"+" and  user_id ="+"'"+userid+"'"+" and  proj_activity ="+"'"+activity+"'"+"order by slno DESC";
			rs=stmt.executeQuery(sql);
			
			
			
			
			while(rs.next())
			{
				
				activitystatus.add(rs.getString(1));
				activitystatus.add(rs.getString(2));
				activitystatus.add(rs.getString(3));
				
				
				
				
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
			try
			{
				con.close();
			}
			catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			
		}
		
		System.out.println(activitystatus.size());
		DateFormat df=new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		
		Calendar cal=Calendar.getInstance();
		
		String date=df.format(cal.getTime());
		
		if(activitystatus.size()==0)
		{
			activitystatus.add("1");
			activitystatus.add("No Message");
			activitystatus.add(date);
			
			
			
			return activitystatus;
		}
		else
		{
			return activitystatus;
		}
	}
	public ArrayList<String> getMessageDetails(String pid,String userid,String activity,String mesgno)
	{
			
		Statement stmt=null;
		ResultSet rs=null;
		Connection con=null;
		ArrayList<String> mesgdetails=new ArrayList<String>();
		try
		{
			con=new DBConnect().connect();
			stmt=con.createStatement();
			System.out.println("----------");
			System.out.println(pid);
			System.out.println(userid);
			System.out.println(activity);
			System.out.println(mesgno);
			System.out.println("----------");
			String sql="SELECT user_mesg,status_fwd_admin,status_approve_admin  FROM status_projectwise  where project_id="+"'"+pid+"'"+" and  user_id ="+"'"+userid+"'"+" and  proj_activity ="+"'"+activity+"'"+" and  slno ="+"'"+mesgno+"'" ;
			rs=stmt.executeQuery(sql);
					
			
			while(rs.next())
			{
				
				mesgdetails.add(rs.getString(1));
				mesgdetails.add(rs.getString(2));
				mesgdetails.add(rs.getString(3));		
				
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
			try
			{
				con.close();
			}
			catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			
		}
		
		if(mesgdetails.size()==0)
		{
			mesgdetails.add("No Message");
			
			
			return mesgdetails;
		}
		else
		{
			return mesgdetails;
		}
	}
	public ArrayList<String> getForwardToOtherUser(String pid,String userid,String activity)
	{
			
		Statement stmt=null;
		ResultSet rs=null;
		Connection con=null;
		ArrayList<String> forworstousers=new ArrayList<String>();
		try
		{
			con=new DBConnect().connect();
			stmt=con.createStatement();
			
			String sql="SELECT activity  FROM user_mesg_inbox  where proj_id="+"'"+pid+"'"+" and  user_id ="+"'"+userid+"'"+" and  activity ="+"'"+activity+"'";
			rs=stmt.executeQuery(sql);
			
			
			
			
			while(rs.next())
			{
				
				forworstousers.add(rs.getString(1));
				
				
				
				
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
			try
			{
				con.close();
			}
			catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			
		}
		
		if(forworstousers.size()==0)
		{
			forworstousers.add("No User Available");
			
			
			return forworstousers;
		}
		else
		{
			return forworstousers;
		}
	}

}
