package com.morphus.user.DAO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;

import com.morphus.jdbc.DBConnect;

public class ReportManage {
	
	public int saveReport(String fromuser,String forproject,String reporttype,String reportcontent,int option,String rep_date)
	{
		
		DateFormat df=new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		
		Calendar cal=Calendar.getInstance();
		
		String date=df.format(cal.getTime());
		
		System.out.println("date="+rep_date);
		
		
		
		String datetemp[]=rep_date.split("/");
		
		
		rep_date=datetemp[2]+"/"+datetemp[1]+"/"+datetemp[0];
		
		int point_id=-100;
		String comment_id="-100";
		String writtenby="self";
		String status="sent";
		if(option==2)
			status="saved";
		int rows=0;
		
		Statement stmt=null;
		Connection con=null;
		
		
		System.out.println("okk111");
			try
			{
				con=new DBConnect().connect();
				stmt=con.createStatement();
				
				int slno=serial()+1;
				
				
				
				
				String sql1="insert into dailyreport values("+slno+","+"'"+fromuser+"'"+","+"'"+reporttype+"'"+","+"'"+reportcontent+"'"+","+"'"+status+"'"+","+"'"+rep_date+"'"+","+"'"+point_id+"'"+","+"'"+forproject+"'"+","+"'"+comment_id+"'"+","+"'"+writtenby+"'"+");";
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
	
	public int updateReportPoint(String point,String rid,String comment,String datereporting)
	{
		
		
		int rows=0;
		
		Statement stmt=null;
		Connection con=null;
		
		System.out.println(point);
		System.out.println(comment);
		System.out.println("okk111");
			try
			{
				con=new DBConnect().connect();
				stmt=con.createStatement();
				int slno=serialFeedback()+1;
				DateFormat df=new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
				
				Calendar cal=Calendar.getInstance();
				
				String date=df.format(cal.getTime());
				
				String sqlfeedback="insert into admin_feedback_reports values("+slno+",'"+rid+"','"+point+"','"+comment+"','"+date+"')";
				rows=stmt.executeUpdate(sqlfeedback);
				
				
			System.out.println(datereporting);
			
				String sql1="update dailyreport set point_gain_id="+"'"+slno+"'"+","+"comments_id="+"'"+slno+"'"+"where userid="+"'"+rid+"'"+"and date(date)='"+datereporting+"'";
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
	
	//display reports after admin verification
	public ArrayList<String> viewReportsVerified()
	{
		
		

		Statement stmt=null;
		Connection con=null;
		ResultSet rs=null;
		ArrayList<String> reports=new ArrayList<String>();
		System.out.println("okk111");
			try
			{
				con=new DBConnect().connect();
				stmt=con.createStatement();
				
				//String sql1="select *from dailyreport where status="+"'"+"sent"+"'"+" and point_gain ="+"'"+ "111"+"'"+"order by date DESC ";
				
				String sql1="SELECT userid,date_format(date,'%Y-%m-%d'),point_gain_id,comments_id FROM dailyreport "+"where status="+"'"+"sent"+"'"+" and point_gain_id !="+"'"+ "-100"+"'"+"group by userid,date_format(date,'%Y-%m-%d') order by date DESC ";
				System.out.println("okk22");
		
				rs=stmt.executeQuery(sql1);
				
				while(rs.next())
				{
					reports.add(rs.getString(1));
					reports.add(rs.getString(2));
					reports.add(rs.getString(3));
					reports.add(rs.getString(4));
					/*reports.add(rs.getString(5));
					reports.add(rs.getString(6));
					reports.add(rs.getString(7));
					reports.add(rs.getString(8));
					reports.add(rs.getString(9));
					reports.add(rs.getString(10));*/
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
		
		
	return reports;
					
					
	}
	public ArrayList<String> retriveFeedbackDetails(String pointId)
	{
		
		

		Statement stmt=null;
		Connection con=null;
		ResultSet rs=null;
		ArrayList<String> reports=new ArrayList<String>();
		System.out.println("okk111");
			try
			{
				con=new DBConnect().connect();
				stmt=con.createStatement();
				System.out.println(pointId);
				
				String sql1="SELECT PointGain,Remarks from admin_feedback_reports where slno= "+pointId;
				System.out.println("okk22");
		
				rs=stmt.executeQuery(sql1);
				
				while(rs.next())
				{
					reports.add(rs.getString(1));
					reports.add(rs.getString(2));
					
					
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
		
		
	return reports;
					
					
	}
	public ArrayList<String> viewReportsUserWise(String userid)
	{
		
		
		
		Statement stmt=null;
		Connection con=null;
		ResultSet rs=null;
		ArrayList<String> reports=new ArrayList<String>();
		System.out.println("okk111");
			try
			{
				con=new DBConnect().connect();
				stmt=con.createStatement();
				
				String sql1="select *from dailyreport where status= "+"'"+"sent"+"'"+" and userid = "+"'"+userid+"'"+" order by date DESC";
				System.out.println("okk22");
		
				rs=stmt.executeQuery(sql1);
				
				while(rs.next())
				{
					reports.add(rs.getString(1));
					reports.add(rs.getString(2));
					reports.add(rs.getString(3));
					reports.add(rs.getString(4));
					reports.add(rs.getString(5));
					reports.add(rs.getString(6));
					reports.add(rs.getString(7));
					reports.add(rs.getString(8));
					reports.add(rs.getString(9));
					reports.add(rs.getString(10));
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
		
		
	return reports;
					
					
	}
	public ArrayList<String> viewReportsNotVerified()
	{
		
		
		
		Statement stmt=null;
		Connection con=null;
		ResultSet rs=null;
		ArrayList<String> reports=new ArrayList<String>();
		System.out.println("okk111");
			try
			{
				con=new DBConnect().connect();
				stmt=con.createStatement();
				
				//String sql1="select *from dailyreport where status="+"'"+"sent"+"'"+" and point_gain ="+"'"+ "111"+"'"+"order by date DESC ";
				
				String sql1="SELECT userid,date_format(date,'%Y-%m-%d'),point_gain_id,comments_id FROM dailyreport "+"where status="+"'"+"sent"+"'"+" and point_gain_id ="+"'"+ "-100"+"'"+"group by userid,date_format(date,'%Y-%m-%d') order by date DESC ";
				System.out.println("okk22");
		
				rs=stmt.executeQuery(sql1);
				
				while(rs.next())
				{
					reports.add(rs.getString(1));
					reports.add(rs.getString(2));
					reports.add(rs.getString(3));
					reports.add(rs.getString(4));
					/*reports.add(rs.getString(5));
					reports.add(rs.getString(6));
					reports.add(rs.getString(7));
					reports.add(rs.getString(8));
					reports.add(rs.getString(9));
					reports.add(rs.getString(10));*/
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
		
		
	return reports;
					
					
	}	
	public ArrayList<String> viewReportsVerifiedDetails(String userid,String date)
	{
		
		
		
		Statement stmt=null;
		Connection con=null;
		ResultSet rs=null;
		ArrayList<String> reports=new ArrayList<String>();
		System.out.println("okk111");
			try
			{
				con=new DBConnect().connect();
				stmt=con.createStatement();
				
				//String sql1="select *from dailyreport where status="+"'"+"sent"+"'"+" and point_gain ="+"'"+ "111"+"'"+"order by date DESC ";
				
				String sql1="SELECT * FROM dailyreport "+"where status="+"'"+"sent"+"'"+" and point_gain_id !="+"'"+ "-100"+"'"+"and userid="+"'"+userid+"'"+"and date_format(date,'%Y-%m-%d')='"+date+"'";
				System.out.println("okk22");
		
				rs=stmt.executeQuery(sql1);
				                       
				while(rs.next())
				{
					reports.add(rs.getString(1));
					reports.add(rs.getString(2));
					reports.add(rs.getString(3));
					reports.add(rs.getString(4));
					reports.add(rs.getString(5));
					reports.add(rs.getString(6));
					reports.add(rs.getString(7));
					reports.add(rs.getString(8));
					reports.add(rs.getString(9));
					reports.add(rs.getString(10));
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
		
		
	return reports;
					
					
	}	
	public ArrayList<String> viewReportsNotVerifiedDetails(String userid,String date)
	{
		
		
		
		Statement stmt=null;
		Connection con=null;
		ResultSet rs=null;
		ArrayList<String> reports=new ArrayList<String>();
		System.out.println("okk111");
			try
			{
				con=new DBConnect().connect();
				stmt=con.createStatement();
				
				//String sql1="select *from dailyreport where status="+"'"+"sent"+"'"+" and point_gain ="+"'"+ "111"+"'"+"order by date DESC ";
				
				String sql1="SELECT * FROM dailyreport "+"where status="+"'"+"sent"+"'"+" and point_gain_id ="+"'"+ "-100"+"'"+"and userid="+"'"+userid+"'"+"and date_format(date,'%Y-%m-%d')='"+date+"'";
				System.out.println("okk22");
		
				rs=stmt.executeQuery(sql1);
				                       
				while(rs.next())
				{
					reports.add(rs.getString(1));
					reports.add(rs.getString(2));
					reports.add(rs.getString(3));
					reports.add(rs.getString(4));
					reports.add(rs.getString(5));
					reports.add(rs.getString(6));
					reports.add(rs.getString(7));
					reports.add(rs.getString(8));
					reports.add(rs.getString(9));
					reports.add(rs.getString(10));
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
		
		
	return reports;
					
					
	}	
	
	public ArrayList<String> searchViewReportsNotVerified(String sdate,String edate,String pid,String uid,String opt)
	{
		
		
		
		Statement stmt=null;
		Connection con=null;
		ResultSet rs=null;
		ArrayList<String> reports=new ArrayList<String>();
		int option=Integer.parseInt(opt);
		System.out.println("okk111");
			try
			{
				con=new DBConnect().connect();
				stmt=con.createStatement();
				String sql1="";
				
				//String sql1="select *from dailyreport where status="+"'"+"sent"+"'"+" and point_gain ="+"'"+ "111"+"'"+"order by date DESC ";
				
				if(option==0)
				{
						
					
					if(pid.equalsIgnoreCase("select") && uid.equalsIgnoreCase("select"))
					{
						sql1="SELECT userid,date_format(date,'%Y-%m-%d'),point_gain_id,comments_id FROM dailyreport "+"where status="+"'"+"sent"+"'"+" and point_gain_id ="+"'"+ "-100"+"'"+"group by userid,date_format(date,'%Y-%m-%d') order by date DESC ";
					}
					else if(pid.equalsIgnoreCase("select") && !(uid.equalsIgnoreCase("select")))
					{
						//System.out.println("uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu");
						sql1="SELECT userid,date_format(date,'%Y-%m-%d'),point_gain_id,comments_id FROM dailyreport "+"where userid="+"'"+uid+"'"+"and status="+"'"+"sent"+"'"+" and point_gain_id ="+"'"+ "-100"+"'"+"group by userid,date_format(date,'%Y-%m-%d') order by date DESC ";
						//sql1="select *from dailyreport where userid="+"'"+uid+"'"+" order by date DESC";
					}
					else if(!(pid.equalsIgnoreCase("select")) && (uid.equalsIgnoreCase("select")))
					{
						sql1="SELECT userid,date_format(date,'%Y-%m-%d'),point_gain_id,comments_id FROM dailyreport "+"where project_id="+"'"+pid+"'"+"and status="+"'"+"sent"+"'"+" and point_gain_id ="+"'"+ "-100"+"'"+"group by userid,date_format(date,'%Y-%m-%d') order by date DESC ";
						//sql1="select *from dailyreport where project_id="+"'"+pid+"'"+" order by date DESC";
					}
					else
					{
						sql1="SELECT userid,date_format(date,'%Y-%m-%d'),point_gain_id,comments_id FROM dailyreport "+"where project_id="+"'"+pid+"'"+"and userid="+"'"+uid+"'"+"and status="+"'"+"sent"+"'"+" and point_gain_id ="+"'"+ "-100"+"'"+"group by userid,date_format(date,'%Y-%m-%d') order by date DESC ";
						//sql1="select *from dailyreport where project_id="+"'"+pid+"'"+"and userid="+"'"+uid+"'"+" order by date DESC";
					}
					
					
					
				}
				if(option==1)
				{
					String sdate1[]=sdate.split("-");
					String edate1[]=edate.split("-");
					
					sdate=sdate1[2]+"-"+sdate1[1]+"-"+sdate1[0];
					edate=edate1[2]+"-"+edate1[1]+"-"+edate1[0];	
					
					if(pid.equalsIgnoreCase("select") && uid.equalsIgnoreCase("select"))
					{
						sql1="SELECT userid,date_format(date,'%Y-%m-%d'),point_gain_id,comments_id FROM dailyreport "+"where"+" date >="+"'"+sdate+"'"+"and date <="+"'"+edate+"'"+"and status="+"'"+"sent"+"'"+" and point_gain_id ="+"'"+ "-100"+"'"+"group by userid,date_format(date,'%Y-%m-%d') order by date DESC ";
						//sql1="select *from dailyreport where date >="+"'"+sdate+"'"+"and date <="+"'"+edate+"'"+" order by date DESC";
					}
					else if(pid.equalsIgnoreCase("select") && !(uid.equalsIgnoreCase("select")))
					{
						sql1="SELECT userid,date_format(date,'%Y-%m-%d'),point_gain_id,comments_id FROM dailyreport "+"where userid="+"'"+uid+"'"+"and date >="+"'"+sdate+"'"+"and date <="+"'"+edate+"'"+"and status="+"'"+"sent"+"'"+" and point_gain_id ="+"'"+ "-100"+"'"+"group by userid,date_format(date,'%Y-%m-%d') order by date DESC ";
						//sql1="select *from dailyreport where userid="+"'"+uid+"'"+"and date >="+"'"+sdate+"'"+"and date <="+"'"+edate+"'"+" order by date DESC";
					}
					else if(!(pid.equalsIgnoreCase("select")) && (uid.equalsIgnoreCase("select")))
					{
						sql1="SELECT userid,date_format(date,'%Y-%m-%d'),point_gain_id,comments_id FROM dailyreport "+"where project_id="+"'"+pid+"'"+"and date >="+"'"+sdate+"'"+"and date <="+"'"+edate+"'"+"and status="+"'"+"sent"+"'"+" and point_gain_id ="+"'"+ "-100"+"'"+"group by userid,date_format(date,'%Y-%m-%d') order by date DESC ";
						//sql1="select *from dailyreport where project_id="+"'"+pid+"'"+"and date >="+"'"+sdate+"'"+"and date <="+"'"+edate+"'"+" order by date DESC";
					}
					else
					{
						sql1="SELECT userid,date_format(date,'%Y-%m-%d'),point_gain_id,comments_id FROM dailyreport "+"where project_id="+"'"+pid+"'"+"and userid="+"'"+uid+"'"+"and date >="+"'"+sdate+"'"+"and date <="+"'"+edate+"'"+"and status="+"'"+"sent"+"'"+" and point_gain_id ="+"'"+ "-100"+"'"+"group by userid,date_format(date,'%Y-%m-%d') order by date DESC ";
						//sql1="select *from dailyreport where project_id="+"'"+pid+"'"+"and userid="+"'"+uid+"'"+"and date >="+"'"+sdate+"'"+"and date <="+"'"+edate+"'"+" order by date DESC";
					}
					
					
					
				}
				
				
				//sql1="SELECT userid,date_format(date,'%Y-%m-%d'),point_gain_id,comments_id FROM dailyreport "+"where status="+"'"+"sent"+"'"+" and point_gain_id ="+"'"+ "-100"+"'"+"group by userid,date_format(date,'%Y-%m-%d') order by date DESC ";
				System.out.println("okk22");
		
				rs=stmt.executeQuery(sql1);
				
				while(rs.next())
				{
					reports.add(rs.getString(1));
					reports.add(rs.getString(2));
					reports.add(rs.getString(3));
					reports.add(rs.getString(4));
					/*reports.add(rs.getString(5));
					reports.add(rs.getString(6));
					reports.add(rs.getString(7));
					reports.add(rs.getString(8));
					reports.add(rs.getString(9));
					reports.add(rs.getString(10));*/
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
		
		
	return reports;
					
					
	}	
	
	public ArrayList<String> getAllMasterReportWriterData()
	{
		
		
		
		Statement stmt=null;
		Connection con=null;
		ResultSet rs=null;
		ArrayList<String> reports=new ArrayList<String>();
		System.out.println("okk111");
			try
			{
				con=new DBConnect().connect();
				stmt=con.createStatement();
				
				String sql1="select *from master_report_writer";
				System.out.println("okk22");
		
				rs=stmt.executeQuery(sql1);
				
				while(rs.next())
				{
					reports.add(rs.getString(1));
					reports.add(rs.getString(2));
					reports.add(rs.getString(3));
					reports.add(rs.getString(4));
					
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
		
		
	return reports;
					
					
	}
	public int saveMasterReportWriter(String masteruser,String foruser,int option)
	{
		
		DateFormat df=new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		
		Calendar cal=Calendar.getInstance();
		
		String date=df.format(cal.getTime());
		int rows=0;
		
		Statement stmt=null;
		Connection con=null;
		
		
		System.out.println("okk111");
			try
			{
				con=new DBConnect().connect();
				stmt=con.createStatement();
				
				int slno=serialMasterRept()+1;
				
				
				
				
				String sql1="insert into master_report_writer values("+slno+","+"'"+masteruser+"'"+","+"'"+foruser+"'"+","+"'"+date+"'"+");";
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
	public ArrayList<String> checkMasterReportWriter(String user)
	{
		
		
		
		Statement stmt=null;
		Connection con=null;
		ResultSet rs=null;
		ArrayList<String> reports=new ArrayList<String>();
		System.out.println("okk111");
			try
			{
				con=new DBConnect().connect();
				stmt=con.createStatement();
				
				String sql1="select for_uid from master_report_writer where master_uid = "+"'"+user+"'";
				System.out.println("okk22");
		
				rs=stmt.executeQuery(sql1);
				
				while(rs.next())
				{
					reports.add(rs.getString(1));
					
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
		
		
	return reports;
					
					
	}
	public int saveReportMaster(String fromuser,String forproject,String reporttype,String reportcontent,int option,String writtenby)
	{
		
		DateFormat df=new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		
		Calendar cal=Calendar.getInstance();
		
		String date=df.format(cal.getTime());
		int point=111;
		String comment="nocom";
		
		String status="sent";
		if(option==2)
			status="saved";
		int rows=0;
		
		Statement stmt=null;
		Connection con=null;
		
		
		System.out.println("okk111");
			try
			{
				con=new DBConnect().connect();
				stmt=con.createStatement();
				
				int slno=serial()+1;
				
				
				
				
				String sql1="insert into dailyreport values("+slno+","+"'"+fromuser+"'"+","+"'"+reporttype+"'"+","+"'"+reportcontent+"'"+","+"'"+status+"'"+","+"'"+date+"'"+","+"'"+point+"'"+","+"'"+forproject+"'"+","+"'"+comment+"'"+","+"'"+writtenby+"'"+");";
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
	public ArrayList<String> getAllSerchedReport(String sdate,String edate,String pid,String uid,String opt)
	{
		
		
		int option=Integer.parseInt(opt);
		
		
		Statement stmt=null;
		Connection con=null;
		ResultSet rs=null;
		ArrayList<String> reports=new ArrayList<String>();
		System.out.println("okk111223344");
			try
			{
				con=new DBConnect().connect();
				stmt=con.createStatement();
				String sql1="";
				if(option==0)
				{
						
					
					if(pid.equalsIgnoreCase("select") && uid.equalsIgnoreCase("select"))
					{
						sql1="select *from dailyreport "+"order by date DESC";
					}
					else if(pid.equalsIgnoreCase("select") && !(uid.equalsIgnoreCase("select")))
					{
						sql1="select *from dailyreport where userid="+"'"+uid+"'"+" order by date DESC";
					}
					else if(!(pid.equalsIgnoreCase("select")) && (uid.equalsIgnoreCase("select")))
					{
						sql1="select *from dailyreport where project_id="+"'"+pid+"'"+" order by date DESC";
					}
					else
					{
						sql1="select *from dailyreport where project_id="+"'"+pid+"'"+"and userid="+"'"+uid+"'"+" order by date DESC";
					}
					
					
					
				}
				System.out.println(sdate);
				System.out.println(edate);
				
				
				if(option==1)
				{
					String sdate1[]=sdate.split("-");
					String edate1[]=edate.split("-");
					
					sdate=sdate1[2]+"-"+sdate1[1]+"-"+sdate1[0];
					edate=edate1[2]+"-"+edate1[1]+"-"+edate1[0];	
					
					if(pid.equalsIgnoreCase("select") && uid.equalsIgnoreCase("select"))
					{
						sql1="select *from dailyreport where date >="+"'"+sdate+"'"+"and date <="+"'"+edate+"'"+" order by date DESC";
					}
					else if(pid.equalsIgnoreCase("select") && !(uid.equalsIgnoreCase("select")))
					{
						sql1="select *from dailyreport where userid="+"'"+uid+"'"+"and date >="+"'"+sdate+"'"+"and date <="+"'"+edate+"'"+" order by date DESC";
					}
					else if(!(pid.equalsIgnoreCase("select")) && (uid.equalsIgnoreCase("select")))
					{
						sql1="select *from dailyreport where project_id="+"'"+pid+"'"+"and date >="+"'"+sdate+"'"+"and date <="+"'"+edate+"'"+" order by date DESC";
					}
					else
					{
						sql1="select *from dailyreport where project_id="+"'"+pid+"'"+"and userid="+"'"+uid+"'"+"and date >="+"'"+sdate+"'"+"and date <="+"'"+edate+"'"+" order by date DESC";
					}
					
					
					
				}
				
				 
				System.out.println("okk22");
		
				rs=stmt.executeQuery(sql1);
				
				while(rs.next())
				{
					reports.add(rs.getString(1));
					reports.add(rs.getString(2));
					reports.add(rs.getString(3));
					reports.add(rs.getString(4));
					reports.add(rs.getString(5));
					reports.add(rs.getString(6));
					reports.add(rs.getString(7));
					reports.add(rs.getString(8));
					reports.add(rs.getString(9));
					reports.add(rs.getString(10));
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
		
		
	return reports;
					
					
	}
	
	
	
	
	
	public static int serialMasterRept()
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
				
				String sql="select MAX(slno) from master_report_writer";
				
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
				
				String sql="select MAX(slno) from dailyreport";
				
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
	
	public static int serialFeedback()
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
				
				String sql="select MAX(slno) from admin_feedback_reports";
				
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
