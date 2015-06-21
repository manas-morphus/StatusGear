package com.morphus.user.DAO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.morphus.jdbc.DBConnect;

public class RetriveAllProjectsAdmin 
{
	
	//Retrive all projects admin
	public ArrayList<String> getProjects()
	{
			
		Statement stmt=null;
		ResultSet rs=null;
		Connection con=null;
		ArrayList<String> projects=new ArrayList<String>();
		try
		{
			con=new DBConnect().connect();
			stmt=con.createStatement();
			
			String sql="SELECT  projectid,projectname,forclient,datecommencement FROM projectdetails  order by  slno desc ";
			rs=stmt.executeQuery(sql);
			
			
			
			
			while(rs.next())
			{
				
				projects.add(rs.getString(1));
				projects.add(rs.getString(2));
				projects.add(rs.getString(3));
				projects.add(rs.getString(4));
				
				
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
		
		
		
		return projects;
	}
	//get only project names
	public ArrayList<String> getOnlyProjectNames()
	{
			
		Statement stmt=null;
		ResultSet rs=null;
		Connection con=null;
		ArrayList<String> projects=new ArrayList<String>();
		try
		{
			con=new DBConnect().connect();
			stmt=con.createStatement();
			
			String sql="SELECT  projectid,projectname FROM projectdetails  order by  projectname ";
			rs=stmt.executeQuery(sql);
			
			
			
			
			while(rs.next())
			{
				
				projects.add(rs.getString(1));
				projects.add(rs.getString(2));
				
				
				
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
		
		
		
		return projects;
	}
	
	//get project names for client
	public ArrayList<String> getOnlyProjectNamesForClient(String ClientId)
	{
			
		Statement stmt=null;
		ResultSet rs=null;
		Connection con=null;
		ArrayList<String> projects=new ArrayList<String>();
		try
		{
			con=new DBConnect().connect();
			stmt=con.createStatement();
			
			String sql="SELECT  projectid,projectname FROM projectdetails where forclient='" +ClientId+"'";
			rs=stmt.executeQuery(sql);
			
			
			
			
			while(rs.next())
			{
				
				projects.add(rs.getString(1));
				projects.add(rs.getString(2));
				
				
				
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
		
		
		
		return projects;
	}
	
	//Retrive newly defined projects
	public ArrayList<String> getNewProjects()
	{
			
		Statement stmt=null;
		ResultSet rs=null;
		Connection con=null;
		ArrayList<String> projects=new ArrayList<String>();
		try
		{
			con=new DBConnect().connect();
			stmt=con.createStatement();
			
			String sql="SELECT  projectid,projectname,forclient,datecommencement FROM projectdetails  where slno >(select count(*) from project_progress_ststus )";
			rs=stmt.executeQuery(sql);
			
			
			
			
			while(rs.next())
			{
				
				projects.add(rs.getString(1));
				projects.add(rs.getString(2));
				projects.add(rs.getString(3));
				projects.add(rs.getString(4));
				
				
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
		
		
		
		return projects;
	}
	
	
	
	//Single project detail 
	public ArrayList<String> getProjectDetails(String pid)
	{
			
		Statement stmt=null;
		ResultSet rs=null;
		Connection con=null;
		ArrayList<String> projectdtls=new ArrayList<String>();
		try
		{
			con=new DBConnect().connect();
			stmt=con.createStatement();
			
			String sql="SELECT  forclient,projectname,datecommencement,probableenddate,est_pro_cost,project_priority FROM projectdetails where projectid= "+"'"+pid+"'";
			rs=stmt.executeQuery(sql);
			
			
			
			
			while(rs.next())
			{
				
				projectdtls.add(rs.getString(1));
				projectdtls.add(rs.getString(2));
				projectdtls.add(rs.getString(3));
				projectdtls.add(rs.getString(4));
				projectdtls.add(rs.getString(5));
				projectdtls.add(rs.getString(6));
				
				
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
		
		
		return projectdtls;
	}
	
	//all activity details of a project
	public ArrayList<String> getActivityDetails(String pid)
	{
			
		Statement stmt=null;
		ResultSet rs=null;
		Connection con=null;
		ArrayList<String> activitydtls=new ArrayList<String>();
		try
		{
			con=new DBConnect().connect();
			stmt=con.createStatement();
			
			String sql="SELECT  activityname,orderofactivities,startdate,enddate,duration FROM defined_activities_projectwise where project_id= "+"'"+pid+"'"+"and saved_status='y'"+" order by orderofactivities";
			rs=stmt.executeQuery(sql);
			
			
			
			
			while(rs.next())
			{
				
				activitydtls.add(rs.getString(1));
				activitydtls.add(rs.getString(2));
				activitydtls.add(rs.getString(3));
				activitydtls.add(rs.getString(4));
				activitydtls.add(rs.getString(5));
				
				
				
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
		
		
		return activitydtls;
	}
	public ArrayList<String> getActivityDetailsTemp(String pid)
	{
			
		Statement stmt=null;
		ResultSet rs=null;
		Connection con=null;
		ArrayList<String> activitydtls=new ArrayList<String>();
		try
		{
			con=new DBConnect().connect();
			stmt=con.createStatement();
			
			String sql="SELECT  activityname,orderofactivities,startdate,enddate,duration FROM defined_activities_projectwise where project_id= "+"'"+pid+"'"+" order by orderofactivities";
			rs=stmt.executeQuery(sql);
			
			
			
			
			while(rs.next())
			{
				
				activitydtls.add(rs.getString(1));
				activitydtls.add(rs.getString(2));
				activitydtls.add(rs.getString(3));
				activitydtls.add(rs.getString(4));
				activitydtls.add(rs.getString(5));
				
				
				
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
		
		
		return activitydtls;
	}
	//all messages from users of a project
		public ArrayList<String> getAllMessageDetails(String pid)
		{
				
			Statement stmt=null;
			ResultSet rs=null;
			Connection con=null;
			ArrayList<String> messagedtls=new ArrayList<String>();
			try
			{
				con=new DBConnect().connect();
				stmt=con.createStatement();
				
				String sql="SELECT  slno,project_id,user_id,user_mesg,date,status_approve_admin FROM status_projectwise where status_fwd_admin != 'not forwarded' order by  date DESC ";
				rs=stmt.executeQuery(sql);
				
				
				
				
				while(rs.next())
				{
					
					messagedtls.add(rs.getString(1));
					messagedtls.add(rs.getString(2));
					messagedtls.add(rs.getString(3));
					messagedtls.add(rs.getString(4));
					messagedtls.add(rs.getString(5));
					messagedtls.add(rs.getString(6));
					
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
			
			
			return messagedtls;
		}
		//Retrive all projects admin
		public ArrayList<String> getProjectsTotalDays(String pid)
		{
				
			Statement stmt=null;
			ResultSet rs=null;
			Connection con=null;
			ArrayList<String> projectstotdays=new ArrayList<String>();
			try
			{
				con=new DBConnect().connect();
				stmt=con.createStatement();
				
				String sql="SELECT sum(duration) FROM defined_activities_projectwise d where project_id ="+ "'" +pid+ "'" ;
				rs=stmt.executeQuery(sql);
				
				
				
				
				while(rs.next())
				{
					
					projectstotdays.add(rs.getString(1));
					
					
					
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
			
			
			return projectstotdays;
		}
		public ArrayList<String> getCustomisedProjectDetails(String prjname,String activity,String userid,String clientname,String priorityprj,String usertype)
		{
				
			Statement stmt=null;
			ResultSet rs=null;
			Connection con=null;
			ArrayList<String> projects=new ArrayList<String>();
			if(prjname.equalsIgnoreCase("noselect")&& activity.equalsIgnoreCase("noselect") && userid.equalsIgnoreCase("noselect") &&  clientname.equalsIgnoreCase("noselect") )
			{
				projects=getProjects();
				
				System.out.println(projects.size());
			}
			else
			{
			
			try
			{
				con=new DBConnect().connect();
				stmt=con.createStatement();
				
				System.out.println(prjname);
				System.out.println(activity);
				System.out.println(userid);
				System.out.println(clientname);
				/*if(prjname.equalsIgnoreCase("noselect")&& activity.equalsIgnoreCase("noselect") && userid.equalsIgnoreCase("noselect") &&  clientname.equalsIgnoreCase("noselect") )
				{
					projects=getProjects();
				}*/
					
				
				
				
				
				//rs.close();
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
			return projects;
		}
		
}
