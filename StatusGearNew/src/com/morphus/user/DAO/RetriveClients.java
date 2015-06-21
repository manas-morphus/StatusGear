package com.morphus.user.DAO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.morphus.jdbc.DBConnect;

public class RetriveClients {
	
	
	public String getClients()
	{
			
		Statement stmt=null;
		ResultSet rs=null;
		Connection con=null;
		String clientdtl="{"+'"'+"allclient"+'"'+":"+"[";
		
		try
		{
			con=new DBConnect().connect();
			stmt=con.createStatement();
			
			String sql="SELECT assigned_client_id FROM clients_main ";
			rs=stmt.executeQuery(sql);
			
			while(rs.next())
			{
				clientdtl+="{"+'"'+"clientname"+'"' + ":"+ '"'+rs.getString(1) +'"';
				
				clientdtl+="}"+",";
				
			}
			
			clientdtl=clientdtl.substring(0, (clientdtl.length())-1);
			
			clientdtl+="]"+"}" ;
			
		}
		catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		finally
		{
			try {
				rs.close();
				stmt.close();
				con.close();
				
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		System.out.println(clientdtl);
		return clientdtl;
		
	}
	
	public String getClientName(String clientid,int option)
	{
			
		Statement stmt=null;
		ResultSet rs=null;
		Connection con=null;
		String clientname="";
		
		try
		{
			con=new DBConnect().connect();
			stmt=con.createStatement();
			String sql="";
			if(option==1)
			{
				sql="SELECT cname  FROM clients_main where assigned_client_id="+"'"+clientid+"'";
			}
			else if(option==2)
			{
				sql="select cname from clients_main where assigned_client_id=(SELECT forclient  FROM projectdetails where projectid="+"'"+clientid+"'"+")";
			}
			rs=stmt.executeQuery(sql);
			
			while(rs.next())
			{
				clientname=rs.getString(1);
				
			}
			
		}
		catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		finally
		{
			try {
				rs.close();
				stmt.close();
				con.close();
				
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		System.out.println(clientname);
		return clientname;
		
	}
	public ArrayList<String> getAllclients()
	{
			
		Statement stmt=null;
		ResultSet rs=null;
		Connection con=null;
		ArrayList<String> savedclients=new ArrayList<String>();
		try
		{
			con=new DBConnect().connect();
			stmt=con.createStatement();
			
			String sql="SELECT * FROM clients_main";
			rs=stmt.executeQuery(sql);
			
			
			
			
			while(rs.next())
			{
				
				savedclients.add(rs.getString(1));
				savedclients.add(rs.getString(2));
				savedclients.add(rs.getString(3));
				savedclients.add(rs.getString(4));
				savedclients.add(rs.getString(5));
				savedclients.add(rs.getString(6));
				savedclients.add(rs.getString(7));
				savedclients.add(rs.getString(8));
				savedclients.add(rs.getString(9));
				savedclients.add(rs.getString(10));
				savedclients.add(rs.getString(11));
				savedclients.add(rs.getString(12));
				savedclients.add(rs.getString(13));
				savedclients.add(rs.getString(14));
				savedclients.add(rs.getString(15));
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
			try {
				
				con.close();
				
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return savedclients;
	}
	public ArrayList<String> getSpecficClient(String clientid)
	{
			
		Statement stmt=null;
		ResultSet rs=null;
		Connection con=null;
		ArrayList<String> savedclients=new ArrayList<String>();
		try
		{
			con=new DBConnect().connect();
			stmt=con.createStatement();
			
			String sql="SELECT * FROM clients_main where assigned_client_id ="+"'"+clientid+"'";
			rs=stmt.executeQuery(sql);
			
			
			
			
			while(rs.next())
			{
				
				savedclients.add(rs.getString(1));
				savedclients.add(rs.getString(2));
				savedclients.add(rs.getString(3));
				savedclients.add(rs.getString(4));
				savedclients.add(rs.getString(5));
				savedclients.add(rs.getString(6));
				savedclients.add(rs.getString(7));
				savedclients.add(rs.getString(8));
				savedclients.add(rs.getString(9));
				savedclients.add(rs.getString(10));
				savedclients.add(rs.getString(11));
				savedclients.add(rs.getString(12));
				savedclients.add(rs.getString(13));
				savedclients.add(rs.getString(14));
				savedclients.add(rs.getString(15));
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
			try {
				
				con.close();
				
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return savedclients;
	}

}
