<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>MyProjectTracker</title>
</head>
<%

if((session.getAttribute("uname")==null))
{%>
 
<jsp:forward page="index.html"></jsp:forward>

<%
	
}
%>
<body>
<table >
	
	<tr>
		<td>
			<table width="100%">
				<tr>
					<td id="definetextsmall">
						Activity Name
					</td>
					<td>
						<input type="text" class="inputfield"  id="ActivityName" name="ActivityName" readonly="readonly">
					</td>
					
				</tr>
				<tr>
					<td id="definetextsmall">
						Activity Order
					</td>
					<td>
						<input type="text" class="inputfield"  id="ActivityOrder" name="ActivityOrder" readonly="readonly">
					</td>
					
				</tr>
				<tr>
					<td id="definetextsmall">
						Start Date
					</td>
					<td>
						<input type="text" class="inputfield"  id="startdate" name="startdate" >
					</td>
				</tr>
				<tr>
					<td id="definetextsmall" >
						End Date
					</td>
					<td>
						<input type="text"  class="inputfield" id="enddate" name="enddate" onChange="return duration();">
					</td>
				</tr>
				<tr>
					<td id="definetextsmall">
						Duration
					</td>
					<td>
						<input type="text"  class="inputfield" id="duration" name="duration" >
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
						<input type="button" class="button" value="Save" onclick="return saveDefinedActivity();">
					</td>
					
					
				</tr>
			
			</table>
		</td>
	</tr>
</table>



</body>
</html>