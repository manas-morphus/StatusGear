package com.morphus.user.DAO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import com.morphus.jdbc.DBConnect;


public class MailManage {
	
	public int saveMessage(String fromuser,String touser,String mesgsubject,String mesgcontent,int option)
	{
		
		DateFormat df=new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		
		Calendar cal=Calendar.getInstance();
		
		String date=df.format(cal.getTime());
		
		String status="notread";
		if(option==2)
			status="draft";
		int rows=0;
		
		Statement stmt=null;
		Connection con=null;
		
		
		System.out.println("okk111");
			try
			{
				con=new DBConnect().connect();
				stmt=con.createStatement();
				
				int slno=serial()+1;
				
				
				
				
				String sql1="insert into maildetails values("+slno+","+"'"+fromuser+"'"+","+"'"+touser+"'"+","+"'"+mesgsubject+"'"+","+"'"+mesgcontent+"'"+","+"'"+status+"'"+","+"'"+date+"'"+");";
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
				
				String sql="select MAX(slno) from maildetails";
				
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
