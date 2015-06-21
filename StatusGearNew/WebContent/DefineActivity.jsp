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
	String activityid=request.getParameter("id");
	String opt=request.getParameter("opt");
	
	String curdate=request.getParameter("curdate");
	String activityname=request.getParameter("activityname");
	String activitydesc=request.getParameter("activitydesc");
	String idedit=request.getParameter("idedit");
	int option=0;
	if(opt!=null)
	 option=Integer.parseInt(opt);
	ArrayList <String> activitydtl=null;
	if(option==2)
	{
		new UpdateActivity().deleteActivity(activityid);	
	}
	else if(option==1)
	{
		activitydtl=new RetriveActivities().getActivityDtl(activityid);
	}
	else if(option==3)
	{
		
		new UpdateActivity().editActivity(activityname, activitydesc, curdate, idedit);
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
						user id
					</td>
					<td>
						<input type="text" class="inputfield"  id="userid" name="userid" readonly="readonly" value=" ${userid}">
					</td>
				</tr>
				<tr>
					<td id="definetext" >
						Date
					</td>
					<td>
						<input type="text"  class="inputfield" id="curdate" name="curdate" readonly="readonly">
					</td>
				</tr>
				<tr>
					<td id="definetext">
						Activity Name<span style="color: red;">*</span>
					</td>
					<td>
						<input type="text"  class="inputfield" id="activityname" name="activityname" onFocus="return upperCaseActivity();" value="<%=(option==1)? activitydtl.get(1):"" %>">
					</td>
				</tr>
				<tr>
					<td id="definetext">
						Description
					</td>
					<td>
						<textarea rows="4" style="width: 250px" id="activitydesc"><%=(option==1)? activitydtl.get(2):"" %></textarea>
						
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
						<input type="button" class="button" value="<%=(option==1)?"Edit" :"Submit" %>" onClick="return submitActivity(this.value)">
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
								<td style="color:#000000;font-family:'Courier New', Courier, monospace;font-size:16px;font-weight:bold;width:100px">
									Edit
								</td>
								<td style="color:#000000;font-family:'Courier New', Courier, monospace; font-size:16px;font-weight:bold;width:100px">
									Delete
								</td>
							</tr>
							</table>
							<div style="height:200px;overflow:scroll;">
							<table style="border:1px solid #333333" cellspacing="10px">
							<%
							
								ArrayList <String> activity=new RetriveActivities().getActivities();
								
								int i=0;
								while(i<activity.size())
								{
								%>	
									<tr>
										<td style="width:150px"><%=activity.get(i+1) %>
										</td>
										<td style="width:100px">
											<img alt="" src="images/edit.gif"  id="<%=activity.get(i)%>" onclick="return editActivityDefined(this.id);">
										</td>
										<td style="width:100px"><img alt="" src="images/delete.gif" id="<%=activity.get(i) %>" onclick="return deleteActivityDefined(this.id);">
										</td>
									</tr>
									
								<%
								
								i+=3;
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