<%@page import="java.util.ArrayList"%>
<%@page import="com.morphus.user.DAO.RetriveActivityStatusProjects"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>MPT</title>
</head>
<%
	String mesgslno=request.getParameter("slno");
	String pid=request.getParameter("pid");
	String userid=request.getParameter("userid");
	String activity=request.getParameter("activity");

%>
<body>
<table id="tabledefineproject">
	<tr>
		<td>
			<table style="width: 100%" cellpadding="0" cellspacing="0">
				<tr>
					<td align="center">
						<span style="font-size: 20px;font-family: sans-serif;color: #060C64">Message Details</span>
					</td>
					
					
				</tr>
			
			</table>
		</td>
	</tr>
	<tr>
		<td>
			
			<table width="100%">
				
				<%
				ArrayList <String> mesgdetails = new RetriveActivityStatusProjects().getMessageDetails(pid, userid, activity, mesgslno);	
				
				
				%>
				
				<tr>
					<td id="definetext">
						Message
					</td>
					<td>
						<textarea rows="8" style="width: 400px" id="newmessageuser" >
						
							<%= (mesgdetails.get(0)).trim() %>
						
						</textarea>
						
					</td>
				</tr>
				
			</table>
		
		</td>
	</tr>
	<tr>
		<td align="right">
			<table  cellpadding="0" cellspacing="0" style="margin-right: 150px">
				<tr>
					<td align="left">
						<input type="button" class="buttonm" value="Edit" onClick="" >
					</td>
					<td align="left">
					<%
						if(((mesgdetails.get(1)).trim().equalsIgnoreCase("not forwarded")))
						{
					
					%>
							<input type="button" class="buttonm" value="ForwardAdmin" onClick="return forwordMessageAdmin(this.id);" id="<%=mesgslno%>">
					<%
					
						}
						else if(((mesgdetails.get(2)).trim().equalsIgnoreCase("yes")))
						{
							
							%>
							
							<input type="button" class="buttonm" value="ForwardUsers" onClick="return forwordMessageUsers(this.id);" id="<%=mesgslno%>">
							<%
							
						}
					%>
					
					</td>
					
					
				</tr>
				
			
			</table>
		</td>
	</tr>
	<tr>
					<td id="forwardmesgusers">
						
					</td>
				</tr>
</table>
</body>
</html>