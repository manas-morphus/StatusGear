package com.morphus.user.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import com.morphus.jdbc.DBConnect;

public class SaveProjectActivityStatus {

	
	public int saveProjectActivityData(String pid,String userid,String activity,String newmessage,String dateactivity)
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
				String sql1;
				String statusfwd="not forwarded";
				String approveadmin="pending";
				String adminmesg="NA";
				DateFormat df=new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
				
				Calendar cal=Calendar.getInstance();
				
				dateactivity=df.format(cal.getTime());
				//System.out.println(prevmessage.trim());
			
				
					 sql1="insert into status_projectwise values("+slno+","+"'"+pid+"'"+","+"'"+userid+"'"+","+"'"+activity+"'"+","+"'"+newmessage+"'"+","+"'"+statusfwd+"'"+","+"'"+approveadmin+"'"+","+"'"+adminmesg+"'"+","+"'"+dateactivity+"'"+");";
				
				
			
					//sql1="update status_projectwise set user_mesg = "+"'"+newmessage+"'"+" where project_id="+"'"+pid+"'"+"and user_id="+"'"+userid+"'"+"and proj_activity="+"'"+activity+"'";
				 
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
	public int ForwardMessageAdmin(String pid,String userid,String activity,String mesgno)
	{
		
		
		int rows=0;
		
		Statement stmt=null;
		Connection con=null;
		
		
		System.out.println("okk111");
			try
			{
				con=new DBConnect().connect();
				stmt=con.createStatement();
				
				
				String sql1="update status_projectwise set status_fwd_admin = "+"'"+"pending"+"'"+" where project_id="+"'"+pid+"'"+"and user_id="+"'"+userid+"'"+"and proj_activity="+"'"+activity+"'"+"and slno="+"'"+mesgno+"'";
				
				 
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
	public int ForwardMessageUsers(String pid,String userid,String activity,String mesgno,String users [])
	{
		
		
		int rows[]=null;
		
		int slno=serialuserinbox()+1;
		Connection con=null;
		PreparedStatement pstmt=null;
		DateFormat df=new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		
		Calendar cal=Calendar.getInstance();
		
		String date=df.format(cal.getTime());
		
		
		System.out.println("okk111");
			try
			{
				con=new DBConnect().connect();
				
				
				
				String sql1="insert into user_mesg_inbox values (?,?,?,?,?,?,?,?,?)";
				
				 pstmt=con.prepareStatement(sql1);
				System.out.println("okk22");
				
				for(int i=0;i<users.length;i++)
				{
					
					pstmt.setInt(1, slno);
					pstmt.setString(2, pid);
					pstmt.setString(3, userid);
					pstmt.setString(4, activity);
					pstmt.setString(5, users[i]);
					pstmt.setString(6, mesgno);
					pstmt.setString(7, date);
					pstmt.setString(8, "pending");
					pstmt.setString(8, "NA");
					slno++;
					
					pstmt.addBatch();
				}
				
				rows=pstmt.executeBatch();
				
				
				
				System.out.println("done");
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
	public int updateMessageAdmin(String pid,String userid,String slno,String mesg,int opt)
	{
		
		int rows=0;
		
		Statement stmt=null;
		Connection con=null;
		
		
		System.out.println("okk111");
			try
			{
				con=new DBConnect().connect();
				stmt=con.createStatement();
				String sql1="";
				if(opt==1)
				{
					sql1="update status_projectwise set status_fwd_admin = "+"'"+"verified"+"'"+","+"status_approve_admin =" +"'"+"yes"+"'"+","+"admin_mesg =" +"'"+mesg+"'"+" where project_id="+"'"+pid+"'"+"and user_id="+"'"+userid+"'"+"and slno="+"'"+slno+"'";
				}
				else if(opt==2)
				{
					sql1="update status_projectwise set status_fwd_admin = "+"'"+"verified"+"'"+","+"status_approve_admin =" +"'"+"no"+"'"+","+"admin_mesg =" +"'"+mesg+"'"+" where project_id="+"'"+pid+"'"+"and user_id="+"'"+userid+"'"+"and slno="+"'"+slno+"'";
				}
				
				
				 
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
	public int updateMessageUToU(String slno)
	{
		
		int rows=0;
		
		Statement stmt=null;
		Connection con=null;
		
		
		System.out.println("okk111");
			try
			{
				con=new DBConnect().connect();
				stmt=con.createStatement();
				
				
				String sql1="update user_mesg_inbox set adminapproval = "+"'"+"approved"+"'"+" where slno="+"'"+slno+"'";
				
				 
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
				
				String sql="select MAX(slno) from status_projectwise";
				
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
	public static int serialuserinbox()
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
				
				String sql="select MAX(slno) from user_mesg_inbox";
				
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
