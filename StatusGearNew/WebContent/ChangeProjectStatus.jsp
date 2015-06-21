<%@page import="com.morphus.user.DAO.GlobalFunctions"%>
<%@page import="com.morphus.user.DAO.RetriveAllProjectsAdmin"%>
<%@page import="com.morphus.user.DAO.UpdateProjectStatus"%>
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

UpdateProjectStatus.updateNewProjects();

String option=(request.getParameter("option")!= null)?request.getParameter("option"):"";
//out.print(option);
int opt=0;
if(!option.equalsIgnoreCase(""))
	opt=Integer.parseInt(option);
//out.print(opt);

String mesg="";
if(opt==1)
{
	String project_id=request.getParameter("project_status_id");
	String update_status=request.getParameter("update_status");
	
	int rows=new UpdateProjectStatus().updateprojectStatus(project_id, update_status, opt);
	
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
			<span style="font-family: sans-serif;font-size: 10px;color: maroon;"></span>
		</td>
	</tr>
	<tr>
		<td>
			<table style="width: 100%" cellpadding="0" cellspacing="0">
				<tr>
					<td align="center">
						<span style="font-size: 20px;font-family: sans-serif;color: #060C64">Change Status Of The Project</span>
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
						Project Name 
					</td>
					<td>
						<%
						ArrayList <String> ProjectId=new RetriveAllProjectsAdmin().getProjects();
							
						
						
						int count=0;
							
							
						
						%>
						<select id="project-id" name="usertype" style="width: 250px;height: 25px">
							
						<% 
							while(count<ProjectId.size())
							{
						
						%>	
							<option value="<%=ProjectId.get(count) %>"><%=ProjectId.get(count+1) %></option>
							
							<%
								count+=4;
							}
							%>
							
						</select>
						
					</td>
				</tr>
				<tr>
					<td id="definetext">
						Change Status To
					</td>
					<td>
						<select id="update-status" name="usertype" style="width: 250px;height: 25px">
							<option value="sta">Started</option>
							<option value="onp">On Progress</option>
							<option value="hal">Halted</option>
							<option value="com">Completed</option>
							
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
						<input type="button" class="button" value="Submit" onclick="return submitChangeProjectStatus();">
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
								<th>Project Name</th>
								<th>Current status</th>
								<th>Date</th>
								<th>Edit</th>
								<th>Delete</th>
							</tr>
							
							
									<%
										ArrayList <String> statusall=new UpdateProjectStatus().getAllProjectStatus();
									
										int i=0;
										int serial=1;
										
										while(i<statusall.size())
										{
									 
									%>
										<tr>
										<td><%= serial %></td>
										<td>
										<%
											ArrayList<String> projectname=new RetriveAllProjectsAdmin().getProjectDetails(statusall.get(i+1));
										%>
										
										
										
										
										<%=projectname.get(1) %></td>
										<td>
											<%String statusFULL=GlobalFunctions.fullProjectStatus(statusall.get(i+2)) ;%>
										
										<%= statusFULL%></td>
										
										<td><%= statusall.get(i+3)%></td>
										
										
										
										<td><img alt="" src="images/edit.gif"  id="<%=statusall.get(i+1)%>" onclick="return editUserDefined(this.id)"></td>
										<td><img alt="" src="images/delete.gif" id="<%=statusall.get(i+1)%>" ></td>
										</tr>
									<%
										i+=5;			
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