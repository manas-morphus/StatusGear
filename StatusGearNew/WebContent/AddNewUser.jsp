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
	String uid=request.getParameter("uid");
	String opt=request.getParameter("opt");
	int option=0;
	if(opt!=null)
	{
		option=Integer.parseInt(opt);
	}
	if(option == 1)
	{
		
	}

%>

<body >

<table id="tabledefine">
	<tr>
		<td>
			<table style="width: 100%" cellpadding="0" cellspacing="0">
				<tr>
					<td align="center">
						<span style="font-size: 20px;font-family: sans-serif;color: #060C64">New User Details</span>
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
						User Name<span style="color: red;">*</span>
					</td>
					<td>
						<input type="text"  class="inputfield" id="username" name="username">
					</td>
				</tr>
				<tr>
					<td id="definetext">
						User Last Name
					</td>
					<td>
						<input type="text"  class="inputfield" id="userlastname" name="userlastname">
					</td>
				</tr>
				<tr>
					<td id="definetext">
						Assign New User Id<span style="color: red;">*</span>
					</td>
					<td>
						<input type="text"  class="inputfield" id="newuserid" name="newuserid">
					</td>
				</tr>
				<tr>
					<td id="definetext">
						Password<span style="color: red;">*</span>
					</td>
					<td>
						<input type="password"  class="inputfield" id="password" name="password">
					</td>
				</tr>
				<tr>
					<td id="definetext">
						Confirm Password<span style="color: red;">*</span>
					</td>
					<td>
						<input type="password"  class="inputfield" id="confpassword" name="confpassword">
					</td>
				</tr>
				<tr>
					<td id="definetext">
						User Type
					</td>
					<td>
						<select id="usertype" name="usertype" style="width: 250px;height: 25px">
							<option>ADMIN</option>
							<option selected="selected">USER</option>
						</select>
						
					</td>
				</tr>
				<tr>
					<td id="definetext">
						Assign To Activity
					</td>
					<td>
						<select id="activities" name="activities" style="width: 250px;height: 25px">
						<option selected="selected">NOTASSIGNED</option>
						<%
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
				
				
				
			</table>
			
		</td>
	</tr>
	<tr>
		<td>
			<table style="width: 100%" cellpadding="0" cellspacing="0">
				<tr>
					<td align="right">
						<input type="button" class="button" value="Submit" onclick="return submitNewUserDetails()">
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
						<span style="font-size: 15px;font-family: sans-serif;color: #060C64">Display Users</span>
					</td>
					
					
				</tr>
				<tr>
					<td >
					
						<table>
							<tr>
								<th >User Name</th>
								<th>User ID</th>
								<th>User Type</th>
								<th>Assigned Activity</th>
								<th>Edit</th>
								<th>Delete</th>
							</tr>
							
							
									<%
										ArrayList <String> savedusers=new RetriveUsers().getUsers();
									
										int i=0;
										
										while(i<savedusers.size())
										{
									 
									%>
										<tr>
										<td><%= savedusers.get(i)%></td>
										<td><%= savedusers.get(i+1)%></td>
										<td><%= savedusers.get(i+2)%></td>
										<td><%= savedusers.get(i+3)%></td>
										<td><img alt="" src="images/edit.gif"  id="<%=savedusers.get(i+1)%>" onclick="return editUserDefined(this.id)"></td>
										<td><img alt="" src="images/delete.gif" id="<%=savedusers.get(i+1)%>" ></td>
										</tr>
									<%
										i+=4;									
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