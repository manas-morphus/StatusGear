package com.morphus.user.DAO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.morphus.jdbc.DBConnect;

public class RetriveActivitiesProjectWise {
	
	
	public ArrayList<String> getActivitiesOfProject(String pid)
	{
			
		Statement stmt=null;
		ResultSet rs=null;
		Connection con=null;
		ArrayList<String> activitydetails=new ArrayList<String>();
		try
		{
			con=new DBConnect().connect();
			stmt=con.createStatement();
			
			String sql="SELECT * FROM defined_activities_projectwise  where project_id="+"'"+pid+"'"+" and saved_status = "+"'"+"N"+"'";
			rs=stmt.executeQuery(sql);
					
			
			while(rs.next())
			{
				
				activitydetails.add(rs.getString(1));
				activitydetails.add(rs.getString(2));
				activitydetails.add(rs.getString(3));
				activitydetails.add(rs.getString(4));
				activitydetails.add(rs.getString(5));
				activitydetails.add(rs.getString(6));
				activitydetails.add(rs.getString(7));
				activitydetails.add(rs.getString(8));
						
				
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
		
		if(activitydetails.size()==0)
		{
			activitydetails.add("No Message");
			
			
			return activitydetails;
		}
		else
		{
			return activitydetails;
		}
	}
	

}
