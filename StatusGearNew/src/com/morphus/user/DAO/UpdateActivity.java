package com.morphus.user.DAO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.morphus.jdbc.DBConnect;

public class UpdateActivity {
	
	public void deleteActivity(String aid)
	{
			
		Statement stmt=null;
		
		Connection con=null;
	
		System.out.println(aid);
		try
		{
			con=new DBConnect().connect();
			stmt=con.createStatement();
			
			String sql="DELETE FROM activity_main where slno="+"'"+aid+"'";
			stmt.executeUpdate(sql);
		
			
			
			
		}
		catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		finally
		{
			try
			{
				
				stmt.close();
				con.close();
			}
			catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			
		}
		//System.out.println(activitydtl);
		
		
	}
	public void editActivity(String activityname,String activitydesc,String curdate,String id)
	{
			
		Statement stmt=null;
		
		Connection con=null;
	
		//System.out.println(aid);
		try
		{
			con=new DBConnect().connect();
			stmt=con.createStatement();
			
			
			
			//update activity_main am,usermain um set am.activityname='designnew' ,um.assignedactivity='designnew' where am.activityname='design' and um.assignedactivity='design';
			String sql="UPDATE activity_main  am ,usermain um ,defined_activities_projectwise dap , status_projectwise sp SET am.activityname='"+activityname+"', am.description='"+activitydesc+"',am.date='"+curdate+"',um.assignedactivity='"+activityname+"',dap.activityname='"+activityname+"',sp.proj_activity ='"+activityname+"' WHERE am.slno='"+id+"'"+"and um.assignedactivity=(select *from(select activityname from activity_main  where slno='"+id+"')as t )"+"and dap.activityname=(select *from(select activityname from activity_main  where slno='"+id+"')as t1)"+"and sp.proj_activity =(select *from(select activityname from activity_main  where slno='"+id+"') as t2 )";
			int rows=stmt.executeUpdate(sql);
		
			System.out.println(rows);
			
			
		}
		catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		finally
		{
			try
			{
				
				stmt.close();
				con.close();
			}
			catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			
		}
		//System.out.println(activitydtl);
		
		
	}

}
