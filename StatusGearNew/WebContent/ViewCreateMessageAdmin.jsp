<%@page import="com.morphus.user.DAO.RetriveActivityStatusProjects"%>
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
<body>
<table id="tabledefineproject">
	<tr>
		<td>
			<table style="width: 100%" cellpadding="0" cellspacing="0">
				<tr>
					<td align="center">
						<span style="font-size: 20px;font-family: sans-serif;color: #060C64">Create Message</span>
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
						TO
					</td>
					<td>
						<select id="allclients" name="allclients" style="width: 250px;height: 25px" onchange="return displayClientName();">
							
						
						</select>
					</td>
				</tr>
				<tr>
					<td id="definetext" >
						SUBJECT
					</td>
					<td>
						<input type="text"  class="inputfield" id="curdate" name="curdate" readonly="readonly">
					</td>
				</tr>
				<tr>
					<td id="definetext" >
						REPLY TIME(In Days)
					</td>
					<td>
						<input type="text"  class="inputfield" id="curdate" name="curdate" readonly="readonly">
					</td>
				</tr>
				
				<tr>
					<td id="definetext">
						Write Message Here
					</td>
					<td>
						<textarea rows="6" style="width: 300px" id="newmessageuser" ></textarea>
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
						<input type="button" class="buttonm" value="SEND" onClick="return submitActivity()" >
					</td>
					<td align="left">
						<input type="Reset" class="buttonm" value="CANCEL" onClick="return resetMessage();">
					</td>
					
				</tr>
			
			</table>
		</td>
	</tr>
</table>




</body>
</html>