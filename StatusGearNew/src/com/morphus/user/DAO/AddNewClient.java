package com.morphus.user.DAO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import com.morphus.jdbc.DBConnect;

public class AddNewClient {
	
	int count=0;
	void checkDuplicate(String newclientid)
	{
		Statement stmt=null;
		Connection con=null;
		try
		{
			con=new DBConnect().connect();
			stmt=con.createStatement();
			
			String sql1="select assigned_client_id from  clients_main where assigned_client_id=" +"'"+newclientid+"'";
			
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
	
	public int saveNewClientData(String clientname,String clientoffname,String clientcontactone,String clientcontacttwo,String clientcontactoff,String clientemail,String resaddress,String offaddress,String state,String dist,String newclientid,String aditionalinfo,String curdate,String userid)
	{
		
		checkDuplicate(newclientid);
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
				
				String sql1="insert into clients_main values("+slno+","+"'"+clientname+"'"+","+"'"+clientoffname+"'"+
				","+"'"+clientcontactone+"'"+","+"'"+clientcontacttwo+"'"+","+"'"+clientcontactoff+"'"+","+"'"+clientemail+"'"+
				","+"'"+resaddress+"'"+","+"'"+offaddress+"'"+","+"'"+state+"'"+
				","+"'"+dist+"'"+","+"'"+newclientid+"'"+","+"'"+aditionalinfo+"'"+","+"'"+curdate+"'"+","+"'"+userid+"'"+");";
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
	public int updateClientData(String clientname,String clientoffname,String clientcontactone,String clientcontacttwo,String clientcontactoff,String clientemail,String resaddress,String offaddress,String state,String dist,String newclientid,String aditionalinfo,String curdate,String userid)
	{
		
		checkDuplicate(newclientid);
		int rows=0;
		
		Statement stmt=null;
		Connection con=null;
		
		
		System.out.println("okk111");
			try
			{
				con=new DBConnect().connect();
				stmt=con.createStatement();
				
				//int slno=serial()+1;
				
			/*	String sql1="insert into clients_main values("+slno+","+"'"+clientname+"'"+","+"'"+clientoffname+"'"+
				","+"'"+clientcontactone+"'"+","+"'"+clientcontacttwo+"'"+","+"'"+clientcontactoff+"'"+","+"'"+clientemail+"'"+
				","+"'"+resaddress+"'"+","+"'"+offaddress+"'"+","+"'"+state+"'"+
				","+"'"+dist+"'"+","+"'"+newclientid+"'"+","+"'"+aditionalinfo+"'"+","+"'"+curdate+"'"+","+"'"+userid+"'"+");";
				*/
				
				curdate=GlobalFunctions.convertDateToMysqlFormat(curdate);
				
				String sql2="update clients_main set "+"cname="+"'"+clientname+"'"
				+","+"officename="+"'"+clientoffname+"'"+","+"contactone="+"'"
				+clientcontactone+"'"+","+"contacttwo="+"'"+clientcontacttwo+"'"
				+","+"contactoff="+"'"+clientcontactoff+"'"+","+"emailid="+"'"+clientemail+"'"
				+","+"resaddress="+"'"+resaddress+"'"+","+"offaddress="+"'"+offaddress+"'"
				+","+"state="+"'"+state+"'"+","+"district="+"'"+dist+"'"+","+"aditional_info="+"'"
				+aditionalinfo+"'"+","+"date="+"'"+curdate+"'"+","+"createdby="+"'"
				+userid+"'"+"where assigned_client_id="+"'"+newclientid+"'";
				
				
				
				System.out.println("okk22");
				 rows=stmt.executeUpdate(sql2);
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
		
			if(rows>0)
					rows=-2;
					
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
				
				String sql="select MAX(slno) from clients_main";
				
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
