package com.morphus.user.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.morphus.jdbc.DBConnect;

public class AddNewProjects {
	
	public int saveNewProjectData(String allclients,String projectname,String projectid,String dateofcomence,String proenddate,String estprjcost,String priorityprj,String curdate,String userid)
	{
		
		
		int rows=0;
		
		Statement stmt=null;
		Connection con=null;
		
		
		System.out.println("okk111");
			try
			{
				con=new DBConnect().connect();
				stmt=con.createStatement();
				
				int slno=serial()+1;
				
				
				
				
				String sql1="insert into projectdetails values("+slno+","+"'"+allclients+"'"+","+"'"+projectname+"'"+
				","+"'"+projectid+"'"+","+"'"+dateofcomence+"'"+","+"'"+proenddate+"'"+","+"'"+estprjcost+"'"+
				","+"'"+priorityprj+"'"+","+"'"+userid+"'"+","+"'"+curdate+"'"+");";
				System.out.println("okk22");
				 rows=stmt.executeUpdate(sql1);
				System.out.println("done");
				UpdateProjectStatus.updateNewProjects();
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
		
	
		
		
		updateProjectStatus(projectid);
	
					
	return rows;
					
					
	}	
	public static void updateProjectStatus(String pid)
	{
		
			int rows=0;
		
		Statement stmt=null;
		Connection con=null;
		
		
		System.out.println("okk111");
			try
			{
				con=new DBConnect().connect();
				stmt=con.createStatement();
				
				int slno=serial()+1;
				
				
				String sql="update defined_activities_projectwise set saved_status="+"'"+"Y"+"'";
				
				
				 rows=stmt.executeUpdate(sql);
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
		
		
	}
	
	public static int serial()
	{
		Connection con=null;
		Statement stmt=null;
		ResultSet rs=null;
		
		int slno=0;
		System.out.println("okk111");
			try
			{
				con=new DBConnect().connect();
				stmt=con.createStatement();
				
				String sql="select MAX(slno) from projectdetails";
				
				rs=stmt.executeQuery(sql);
				
				
				
				if(rs.next())
				{
					slno=rs.getInt(1);
					
				}
				
				rs.close();
				
				stmt.close();
			}
			catch (Exception e) {
				// TODO: handle exception
			}
			finally
			{
				try {
					con.close();
				} catch (Exception e2) {
					// TODO: handle exception
				}
				
			}
			
		return slno;
		
	}
	public int saveNewProjectActivities(String projectid,String activityname[],String activityorder[],String activitystartdate[],String activityenddate[],String activityduration[])
	{
		
		
		int rows[]=null;
		
		PreparedStatement pstmt=null;
		Connection con=null;
		
		//String newsdate[]=activitystartdate.split("/");
		
		//activitystartdate=newsdate[2]+"/"+newsdate[0]+"/"+newsdate[1];
		//String newedate[]=activityenddate.split("/");
		
		//activityenddate=newedate[2]+"/"+newedate[0]+"/"+newedate[1];
		System.out.println(activitystartdate);
		System.out.println(activityenddate);
		System.out.println("okkactivity");
			try
			{
				con=new DBConnect().connect();
				//stmt=con.createStatement();
				
				int slno=serialActivity()+1;
				
				
				
				
				//String sql1="insert into defined_activities_projectwise values("+slno+","+"'"+activityname+"'"+","+"'"+activityorder+"'"+
				//","+"'"+activitystartdate+"'"+","+"'"+activityenddate+"'"+","+"'"+activityduration+"'"+","+"'"+projectid+"'"+");";
				String sql1="insert into defined_activities_projectwise values(?,?,?,?,?,?,?)";
				
				
				pstmt=con.prepareStatement(sql1);
				System.out.println("okk22");
				
				for(int i=0;i<activityname.length;i++)
				{
					pstmt.setInt(1, slno);
					pstmt.setString(2,activityname[i] );
					pstmt.setString(3,activityorder[i] );
					pstmt.setString(4,activitystartdate[i] );
					pstmt.setString(5,activityenddate[i] );
					pstmt.setString(6,activityduration[i] );
					pstmt.setString(7,projectid );
					slno++;
					
					pstmt.addBatch();
					
				}
				
				rows=pstmt.executeBatch();
				System.out.println("done-activity");
				pstmt.close();
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
		
	
		
		
		
	
					
	return rows.length;
					
					
	}
	public int saveNewProjectActivitiesTemp(String projectid,String activityname,String activityorder,String activitystartdate,String activityenddate,String activityduration)
	{
		
		
		int rows=0;
		
		Statement stmt=null;
		Connection con=null;
		
		//String newsdate[]=activitystartdate.split("/");
		
		//activitystartdate=newsdate[2]+"/"+newsdate[0]+"/"+newsdate[1];
		//String newedate[]=activityenddate.split("/");
		
		//activityenddate=newedate[2]+"/"+newedate[0]+"/"+newedate[1];
		System.out.println(activitystartdate);
		System.out.println(activityenddate);
		System.out.println("okkactivity");
			try
			{
				con=new DBConnect().connect();
				stmt=con.createStatement();
				
				int slno=serialActivity()+1;
				
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
	public static int serialActivity()
	{
		Connection con=null;
		Statement stmt=null;
		ResultSet rs=null;
		
		int slno=0;
		System.out.println("okk111");
			try
			{
				con=new DBConnect().connect();
				stmt=con.createStatement();
				
				String sql="select MAX(slno) from defined_activities_projectwise";
				
				rs=stmt.executeQuery(sql);
				
				
				
				if(rs.next())
				{
					slno=rs.getInt(1);
					
				}
				
				rs.close();
				
				stmt.close();
			}
			catch (Exception e) {
				// TODO: handle exception
			}
			finally
			{
				try {
					con.close();
				} catch (Exception e2) {
					// TODO: handle exception
				}
				
			}
			
		return slno;
		
	}
	

}
