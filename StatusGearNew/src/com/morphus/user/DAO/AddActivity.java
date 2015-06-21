package com.morphus.user.DAO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import com.morphus.jdbc.DBConnect;

public class AddActivity 
{
	int count=0;
	void checkDuplicate(String ActivityName)
	{
		Statement stmt=null;
		Connection con=null;
		try
		{
			con=new DBConnect().connect();
			stmt=con.createStatement();
			
			String sql1="select activityname from  activity_main where activityname=" +"'"+ActivityName+"'";
			
			ResultSet rs=stmt.executeQuery(sql1);
			
			while(rs.next())
			{
				count++;
			}
			
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
	
	public int saveActivityData(String userid,String ActivityName,String ActivityDesc,String AddingDate)
	{
		
		checkDuplicate(ActivityName);
		int rows=0;
		if(count==0)
		{
		Statement stmt=null;
		Connection con=null;
		
		
		System.out.println("okk111");
			try
			{
				con=new DBConnect().connect();
				stmt=con.createStatement();
				
				int slno=serial()+1;
				
				
				
				
				String sql1="insert into activity_main values("+slno+","+"'"+ActivityName+"'"+","+"'"+ActivityDesc+"'"+","+"'"+AddingDate+"'"+","+"'"+userid+"'"+");";
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
		
		}
		else
		{
			rows=-1;
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
				
				String sql="select MAX(slno) from activity_main";
				
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
