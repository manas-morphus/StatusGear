package com.morphus.user.DAO;

import java.sql.Connection;
import java.sql.Statement;

import com.morphus.jdbc.DBConnect;

public class EditDefinedProject 
{
	
	
	public int editActivitiesProject(String projectid,String projectactivity,String projectsdate,String projectenddate,String projectduration)
	{
		
		int rows=0;
		
		Statement stmt=null;
		Connection con=null;
		
		String sdate[]=projectsdate.split("-");
		projectsdate=sdate[2]+"/"+sdate[1]+"/"+sdate[0];
		
		String edate[]=projectenddate.split("-");
		projectenddate=edate[2]+"/"+edate[1]+"/"+edate[0];
		
		System.out.println("okk111");
			try
			{
				con=new DBConnect().connect();
				stmt=con.createStatement();
				
				
				String sql1="update defined_activities_projectwise set startdate = "+"'"+projectsdate+"'"+","+"enddate="+"'"+projectenddate+"'"+","+"duration="+"'"+projectduration+"'"+" where activityname="+"'"+projectactivity+"'"+"and project_id="+"'"+projectid+"'";
				
				 
				System.out.println("okk22");
				rows=stmt.executeUpdate(sql1);
				System.out.println("done");
				stmt.close();
			}
			catch (Exception e) {
				e.printStackTrace();
				// TODO: handle exception
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
		
		
	
					
	return rows;
					
					
	}
	
	public int addMoreActivitiesTemp(String projectid,String activityname,String activityorder,String activitystartdate,String activityenddate,String activityduration)
	{
		
		
		int rows=0;
		
		Statement stmt=null;
		Connection con=null;
		
		//String newsdate[]=activitystartdate.split("/");
		
		//activitystartdate=newsdate[2]+"/"+newsdate[0]+"/"+newsdate[1];
		//String newedate[]=activityenddate.split("/");
		
		//activityenddate=newedate[2]+"/"+newedate[0]+"/"+newedate[1];
		
		activitystartdate=GlobalFunctions.convertDateToMysqlFormat(activitystartdate);
		activityenddate=GlobalFunctions.convertDateToMysqlFormat(activityenddate);
		System.out.println(activitystartdate);
		System.out.println(activityenddate);
		
		activityorder=Integer.toString((Integer.parseInt(activityorder)+1));
		updateOrderOfActivities(projectid,activityorder);
		System.out.println("okkactivity");
			try
			{
				con=new DBConnect().connect();
				stmt=con.createStatement();
				
				int slno=AddNewProjects.serialActivity()+1;
				
				String sql="insert into mpt.defined_activities_projectwise (slno,activityname,orderofactivities,startdate,enddate,duration,project_id) values ("+slno+",'"+activityname+"','"+activityorder+"','"+activitystartdate+"','"+activityenddate+"','"+activityduration+"','"+projectid+"')";
				
				
				
				rows=stmt.executeUpdate(sql);
			
					
				
				
				
				stmt.close();
			}
			catch (Exception e) {
				e.printStackTrace();
				// TODO: handle exception
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
		
	
		
		
		
	
					
	return rows;
					
					
	}
	private static void updateOrderOfActivities(String projectid,String activityorder)
	{
		Statement stmt=null;
		Connection con=null;
		try
		{
			con=new DBConnect().connect();
			stmt=con.createStatement();
			
			
			
			String sql="update defined_activities_projectwise set orderofactivities=orderofactivities+1 where project_id="+"'"+projectid+"'"+"and orderofactivities >="+activityorder;
			
			
			
			stmt.executeUpdate(sql);
		
				
			
			
			
			stmt.close();
		}
		catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
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
	
	}
	
	public int editProjectDefined(String projectid,String dateofcomence,String proenddate,String estprjcost,String priorityprj)
	{
		
		int rows=0;
		
		Statement stmt=null;
		Connection con=null;
		dateofcomence=GlobalFunctions.convertDateToMysqlFormat(dateofcomence);
		proenddate=GlobalFunctions.convertDateToMysqlFormat(proenddate);
		System.out.println(projectid);
		System.out.println(dateofcomence);
		System.out.println(proenddate);
		System.out.println(estprjcost);
		System.out.println(priorityprj);
			try
			{
				con=new DBConnect().connect();
				stmt=con.createStatement();
				
				
				String sql1="update projectdetails set datecommencement = "+"'"+dateofcomence+"'"+","+"probableenddate="+"'"+proenddate+"'"+","+"est_pro_cost="+"'"+estprjcost+"'"+","+"project_priority="+"'"+priorityprj+"'"+" where projectid="+"'"+projectid+"'";
				
				
				System.out.println("okk22");
				rows=stmt.executeUpdate(sql1);
				System.out.println("done");
				stmt.close();
			}
			catch (Exception e) {
				e.printStackTrace();
				// TODO: handle exception
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
		
		AddNewProjects.updateProjectStatus(projectid);
	
					
	return rows;
					
					
	}
	public int deleteProject(String prjid)
	{
		
		int rows=0;
		
		Statement stmt=null;
		Connection con=null;
		
			try
			{
				con=new DBConnect().connect();
				stmt=con.createStatement();
				
				
				String sql1="delete FROM projectdetails  where projectid="+"'"+prjid+"'";
				
				
				System.out.println("okk22");
				rows=stmt.executeUpdate(sql1);
				System.out.println("done");
				stmt.close();
			}
			catch (Exception e) {
				e.printStackTrace();
				// TODO: handle exception
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
		
		
	
					
	return rows;
					
		
		
	}
	
	

}
