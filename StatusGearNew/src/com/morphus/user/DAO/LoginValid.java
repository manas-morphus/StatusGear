package com.morphus.user.DAO;

import java.sql.Connection;
import java.sql.ResultSet;

import com.morphus.jdbc.DBConnect;

public class LoginValid {
	
	String status;
	public String loginUser(String userid,String password)
	{
		UpdateProjectStatus.updateNewProjects();
		
		java.sql.Statement stmt=null;
		ResultSet rs=null;
		Connection con=null;
		try
		{
			con=new DBConnect().connect();
			stmt=con.createStatement();
			System.out.println(userid);
			System.out.println(password);
			System.out.println(status);
			
			String sql="SELECT * FROM usermain where userid="+"'"+userid+"'"+"and password="+"'"+password+"'";
			rs=stmt.executeQuery(sql);
			
			if(!rs.next())
			{
				status="invaliduser";
			}
			else
			{
				String uname=rs.getString("uname");
				
				String utype=rs.getString("usertype");
				String uactivity=rs.getString("assignedactivity");
				status=uname+","+utype+","+uactivity;
			}
		}
		catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		finally
		{
			try{
				rs.close();
				stmt.close();
				con.close();
			}
			catch (Exception e) {
				// TODO: handle exception
			}
			
		}
		
		System.out.println(status);
		return status;
	}
	

}
