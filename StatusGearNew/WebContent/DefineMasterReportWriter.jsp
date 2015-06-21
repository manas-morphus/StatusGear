<%@page import="com.morphus.user.DAO.ReportManage"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="com.morphus.user.DAO.RetriveActivities"%>
<%@page import="com.morphus.user.DAO.RetriveUsers"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>MyProjectTracker</title>

</head>

<%

if((session.getAttribute("uname"))== null)
{%>
 
<jsp:forward page="index.html"></jsp:forward>

<%
	
}
%>
<%
DateFormat df=new SimpleDateFormat("dd/MM/yyyy ");

Calendar cal=Calendar.getInstance();

String date=df.format(cal.getTime());

String option=request.getParameter("option");

int opt=Integer.parseInt(option);
String mesg="";
if(opt==2)
{
	String masteruser=request.getParameter("masteruser");
	String foruser=request.getParameter("foruser");
	
	int rows=new ReportManage().saveMasterReportWriter(masteruser, foruser, opt);
	
	if(rows>0)
	{
		mesg="Saveded Successfully";
	}
}


%>


<body >

<table id="tabledefine">
	<tr>
		<td>
			<span style="font-family: sans-serif;font-size: 10px;color: maroon;"><%=mesg %></span>
		</td>
	</tr>
	<tr>
		<td>
			<table style="width: 100%" cellpadding="0" cellspacing="0">
				<tr>
					<td align="center">
						<span style="font-size: 20px;font-family: sans-serif;color: #060C64">Define Master Report Writer</span>
					</td>
				</tr>
			
			</table>
		</td>
	</tr>
	<tr>
		<td>
			<table width="100%">
				
				<tr>
					<td id="definetext" >
						Date
					</td>
					<td>
						<input type="text"  class="inputfield"  name="curdate" readonly="readonly" value="<%= date%>">
					</td>
				</tr>
				
				
				<tr>
					<td id="definetext">
						Master User 
					</td>
					<td>
						<%
							ArrayList <String> users=new RetriveUsers().getUsers();
							int count=0;
							
							
						
						%>
						<select id="masteruser" name="usertype" style="width: 250px;height: 25px">
							
						<% 
							while(count<users.size())
							{
						
						%>	
							<option><%=users.get(count+1) %></option>
							
							<%
								count+=4;
							}
							%>
							
						</select>
						
					</td>
				</tr>
				<tr>
					<td id="definetext">
						Assign Users 
					</td>
					<td>
						<select id="foruser" name="usertype" style="width: 250px;height: 25px">
							<% 
							count=0;
							while(count<users.size())
							{
						
						%>	
							<option><%=users.get(count+1) %></option>
							
							<%
								count+=4;
							}
							%>
						
						</select>
						
					</td>
				</tr>
				
				
				
			</table>
			
		</td>
	</tr>
	<tr>
		<td>
			<table style="width: 100%" cellpadding="0" cellspacing="0">
				<tr>
					<td align="right">
						<input type="button" class="button" value="Submit" onclick="return submitMasterReportWriterData();">
					</td>
					<td align="left">
						<input type="button" class="button" value="Cancel" onclick="window.location='MyProjectTrackerAdmin.jsp';">
					</td>
					
				</tr>
			
			</table>
		</td>
	</tr>
	
</table>
<div style="height: 300px;overflow: scroll;width: 800px">

<table id="tabledefine">
	<tr>
		<td>
			<table style="width: 100%" cellpadding="0" cellspacing="0">
				<tr>
					<td align="center">
						<span style="font-size: 15px;font-family: sans-serif;color: #060C64">Display All Masters</span>
					</td>
					
					
				</tr>
				<tr>
					<td >
					
						<table style="height: 100px">
							<tr>
								<th >slno</th>
								<th>Master Writer</th>
								<th>For Users</th>
								<th>Date</th>
								<th>Edit</th>
								<th>Delete</th>
							</tr>
							
							
									<%
										ArrayList <String> savedusers=new ReportManage().getAllMasterReportWriterData();
									
										int i=0;
										int serial=1;
										
										while(i<savedusers.size())
										{
									 
									%>
										<tr>
										<td><%= serial %></td>
										<td><%= savedusers.get(i+1)%></td>
										<td><%= savedusers.get(i+2)%></td>
										<td><%= savedusers.get(i+3)%></td>
										<td><img alt="" src="images/edit.gif"  id="<%=savedusers.get(i+1)%>" onclick="return editUserDefined(this.id)"></td>
										<td><img alt="" src="images/delete.gif" id="<%=savedusers.get(i+1)%>" ></td>
										</tr>
									<%
										i+=4;			
										serial++;
										}
									
									%>
							
							
						
						</table>
					</td>
				</tr>
			
			</table>
		</td>
	</tr>
</table>
</div>
</body>
</html>