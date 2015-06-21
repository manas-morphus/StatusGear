<%@page import="com.morphus.user.DAO.UpdateUsers"%>
<%@page import="com.morphus.user.DAO.RetriveUsers"%>
<%@page import="com.morphus.user.DAO.UpdateActivity"%>
<%@page import="com.morphus.user.DAO.RetriveActivities"%>
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
	String activityselected=request.getParameter("activity");
	String option=request.getParameter("opt");
	ArrayList <String> activityofuser=null;
	String uid1="NA";
	if(Integer.parseInt(option)==3)
	{
		String uid=request.getParameter("userid");
		
		new UpdateUsers().modifyActivityUser(activityselected, uid);
	}
	if(Integer.parseInt(option)==4)
	{
		uid1=request.getParameter("userid");
		
		activityofuser=new RetriveActivities().getActivitiesOfUser(uid1);
	
	}
	if(Integer.parseInt(option)==5)
	{
		uid1=request.getParameter("userid");
		
		new UpdateUsers().removeActivityUser(uid1);
	
	}

%>


<body onLoad="return defineActivityMain()">

<table id="tabledefine">
	<tr>
		<td>
			<table style="width: 100%" cellpadding="0" cellspacing="0">
				<tr>
					<td align="center">
						<span style="font-size: 20px;font-family: sans-serif;color: #060C64">Activity Details</span>
					</td>
					
					
				</tr>
			
			</table>
		</td>
	</tr>
	<tr>
		<td>
			<table width="100%">
				
				<tr>
					<td id="definetext">
						Select Activity<span style="color: red;">*</span>
					</td>
					<td>
						<select id="activityforuser" name="activities" style="width: 250px"   onchange="return showUserForActivity()">
						<%
							if(!(activityselected.equalsIgnoreCase("NA")))
							{
							%>
								<option selected="selected" ><%=activityselected %></option>
							<%	
							}
							else
							{
						
						%>
							<option selected="selected" >----Select----</option>
						<%
						
							}
							ArrayList <String> activities=new RetriveActivities().getActivities();
							int i1=0;
							
							while(i1< activities.size())
							{
								%>
								
								<option><%= activities.get(i1+1) %></option>
								
								<%
								i1+=3;
							}
						%>	
						</select>						
					</td>
				</tr>
				<tr>
					<td id="definetext">
						Select UserId<span style="color: red;">*</span>
					</td>
					<td>
						<select id="useridtoassign" name="activities" style="width: 250px" onchange="return showAssignedActivityToUser()" >
						
						<%
							if(!(uid1.equalsIgnoreCase("NA")))
							{
							%>
								<option selected="selected" ><%=uid1%></option>
							<%	
							}
							else
							{
						
						%>
							<option selected="selected" >----Select----</option>
						<%
							}
							
							ArrayList <String> users=new RetriveUsers().getUsers();
							int i2=0;
							
							while(i2< users.size())
							{
								%>
								
								<option><%= users.get(i2+1) %></option>
								
								<%
								i2+=4;
							}
						%>	
						</select>
					</td>
					
				</tr>
				<tr>
					<td id="definetext">
						ASSIGNED ACTIVITY
					</td>
					
					<td id="definetext">
						<span style="color: red;"><%=(activityofuser!=null)?activityofuser.get(0):"" %></span>
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
						<input type="button" class="button" value="Save" onClick="return assignActivityToUser()" >
					</td>
					<td align="left">
						<input type="button" class="button" value="Cancel" onClick="window.location='MyProjectTrackerAdmin.jsp';">
					</td>
					
				</tr>
			
			</table>
		</td>
	</tr>
	<tr>
		<td>
			<table style="width: 100%" cellpadding="0" cellspacing="0">
				<tr>
					<td align="center">
						<span style="font-size: 15px;font-family: sans-serif;color: #060C64">Display Activities </span>
					</td>
					
					
				</tr>
				<tr>
					<td align="center">
						
						<table  style="border:1px solid #333333;" cellspacing="10px">
							<tr >
								<td style="color:#000000;font-family:'Courier New', Courier, monospace;font-size:16px;font-weight:bold;width:150px">
									Activity Name
								</td>
								<td style="color:#000000;font-family:'Courier New', Courier, monospace;font-size:16px;font-weight:bold;width:150px">
									User Id
								</td>
								
								<td style="color:#000000;font-family:'Courier New', Courier, monospace; font-size:16px;font-weight:bold;width:100px">
									Delete
								</td>
							</tr>
							</table>
							<div style="height:200px;overflow:scroll;">
							<table style="border:1px solid #333333" cellspacing="10px">
							<%
							ArrayList <String> activity=null;
							if(activityselected.length()!=0)
							{
								activity=new RetriveUsers().getUsersActivitywise(activityselected);
							}
							else
							{
								activity.add("");	
							}
								
								
								int i=0;
								while(i<activity.size())
								{
								%>	
									<tr>
										<td style="width:150px"><%=activityselected %>
										</td>
										<td style="width:150px"><%=activity.get(i) %>
										</td>
										<td style="width:100px"><img alt="" src="images/delete.gif" id="<%=activity.get(i) %>" onclick="return removeActivityAssignedToUser(this.id);">
										</td>
									</tr>
									
								<%
								
								i+=1;
								}
								
							
							%>					
							
						</table>
						
						
						
						</div>
					<!-- 	<select id="activitiesprev" name="activities" style="width: 250px"  multiple="multiple" size="10">
							
						
						</select> -->
					</td>
				</tr>
			
			</table>
		</td>
	</tr>
</table>

</body>
</html>