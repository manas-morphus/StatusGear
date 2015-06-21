<%@page import="com.morphus.user.DAO.RetriveUsers"%>
<%@page import="com.morphus.user.DAO.RetriveAllProjectsAdmin"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>My Project Tracker</title>
</head>
<body onload="return hideDateSearch()">
<table style="background-color: #E5FFF9;width: 100%" >
	<tr>
		<td>
			without date<input type="radio" name="datesearch" onclick="return hideDateSearch()" value="without" class="datesearch">
		</td>
		<td>
			with date<input type="radio" name="datesearch" onclick="return showDateSearch()" value="with" class="datesearch">
		</td>
	</tr>
	

</table>
<table  style="background-color: #E5FFF9;width: 100%">
	<tr>
		<td>
			<table id="searchdates">
				<tr>
					<td>
						Start date<input type="text" name="startdateser" id="startdateser">
					</td>
					<td>
						End date<input type="text" name="enddateser"  id="enddateser">
					</td>
				
				</tr>
			
			</table>
		</td>
	</tr>
	<tr>
		<td>
			<table >
				<tr>
					<td>
						Select Project<select id="projectidser">
										<option value="select" selected="selected">--select--</option>
										<%
										
											ArrayList <String> projects=new RetriveAllProjectsAdmin().getProjects();
										
											int i=0;
											
											while(i<projects.size())
											{
												%>
												
												<option value="<%=projects.get(i) %>"><%=projects.get(i+1) %></option>
												
												<%
												i+=4;
											}
										
										%>
										
									</select>
					</td>
					<td>
						select user<select id="useridser">
										<option value="select" selected="selected">--select--</option>
										
										<%
											ArrayList <String>userids=new RetriveUsers().getUsers();
										
											int j=0;
											while(j<userids.size())
											{
												%>
												<option ><%= userids.get(j+1) %></option>
												
												<%
												j+=4;
											}
										
										%>
									</select>
					</td>
				
				</tr>
			
			</table>
		</td>
	</tr>
	<tr>
		<td align="center">
			<input type="button" value="Search" style="width: 80px;height: 25px" onclick="return loadReports()">
		</td>
	</tr>
	

</table>

<div id="searchedreports"></div>









</body>
</html>