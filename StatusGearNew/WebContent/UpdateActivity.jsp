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
	
		ArrayList <String> activitydtl=new RetriveActivities().getActivityDtl(activityid);


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
						<input type="text"  class="inputfield" id="activityname" name="activityname" onFocus="return upperCaseActivity();" value="<%=activitydtl.get(1) %>">
					</td>
				</tr>
				<tr>
					<td id="definetext">
						Description
					</td>
					<td>
						<textarea rows="4" style="width: 250px" id="activitydesc" ><%=activitydtl.get(2) %></textarea>
						
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
						<input type="button" class="button" value="Edit" onClick="return submitActivity()">
					</td>
					<td align="left">
						<input type="button" class="button" value="Cancel" onClick="window.location='MyProjectTrackerAdmin.jsp';">
					</td>
					
				</tr>
			
			</table>
		</td>
	</tr>
</table>

</body>
</html>