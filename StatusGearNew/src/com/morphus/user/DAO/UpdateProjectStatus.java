package com.morphus.user.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.morphus.jdbc.DBConnect;


public class UpdateProjectStatus {
	
	public static void updateNewProjects()
	{
		String date=GlobalFunctions.getCurDate();
		
		int rows=serial();
		int rowstotal=serialTotalProjects();
		if(rows<rowstotal)
		{
			
				ArrayList <String> ProjectId=new RetriveAllProjectsAdmin().getNewProjects();
				Connection con=null;
				PreparedStatement pstmt=null;
				 try {
					 con=new DBConnect().connect();
					 String sql="insert into  project_progress_ststus values(?,?,?,?,?)";
					pstmt=con.prepareStatement(sql);
					
					for(int i=0;i<ProjectId.size();i+=4)
					{
						pstmt.setInt(1, ++rows);
						pstmt.setString(2, ProjectId.get(i));
						pstmt.setString(3, "sta");
						pstmt.setString(4, date);
						pstmt.setString(5, date);
						
						pstmt.addBatch();
					}
					
					pstmt.executeBatch();
				} 
				 catch (Exception e) 
				{
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
		
	}
	public ArrayList<String> getAllProjectStatus()
	{
		Connection con=null;
		Statement stmt=null;
		ArrayList<String> status=new ArrayList<String>();
		
		try {
			
			con=new DBConnect().connect();
			stmt=con.createStatement();
			
			String sql="select *from project_progress_ststus";
			
			ResultSet rs=stmt.executeQuery(sql) ;
			
			while(rs.next())
			{
				status.add(rs.getString(1));
				status.add(rs.getString(2));
				status.add(rs.getString(3));
				status.add(rs.getString(4));
				status.add(rs.getString(5));
			}
			
			
		} catch (Exception e) {
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
		return status;
	}
	public ArrayList<String> getOneProjectStatus(String pid)
	{
		Connection con=null;
		Statement stmt=null;
		ArrayList<String> status=new ArrayList<String>();
		
		try {
			
			con=new DBConnect().connect();
			stmt=con.createStatement();
			
			String sql="select *from project_progress_ststus where project_id="+"'"+pid+"'";
			
			ResultSet rs=stmt.executeQuery(sql) ;
			
			while(rs.next())
			{
				status.add(rs.getString(1));
				status.add(rs.getString(2));
				status.add(rs.getString(3));
				status.add(rs.getString(4));
				status.add(rs.getString(5));
			}
			
			
		} catch (Exception e) {
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
		return status;
	}
	public int updateprojectStatus(String project_id,String update_status,int option)
	{
			Statement stmt=null;
		
		Connection con=null;
		int rows=0;
		System.out.println(project_id+"status");
		try
		{
			con=new DBConnect().connect();
			stmt=con.createStatement();
			
			String sql="update project_progress_ststus set cur_status="+"'"+update_status+"'"+"where project_id="+"'"+project_id+"'";
			
			rows=stmt.executeUpdate(sql);
			
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
		return rows;
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
				
				String sql="select MAX(slno) from project_progress_ststus";
				
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
	public static int serialTotalProjects()
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
}

