<%@page import="com.morphus.user.DAO.EditDefinedProject"%>
<%@page import="com.morphus.user.DAO.SaveProjectActivityStatus"%>
<%@page import="com.morphus.user.DAO.AddActivity"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% 

	String projectid=request.getParameter("projectid");
	String projectactivity=request.getParameter("projectactivity");
	String projectsdate=request.getParameter("projectsdate");
	String projectenddate=request.getParameter("projectenddate");
	String projectduration=request.getParameter("projectduration");
	
	
	
	int rows=new EditDefinedProject().editActivitiesProject(projectid, projectactivity, projectsdate, projectenddate, projectduration);
	
	String status="";
	if(rows >0)
	{
		status="Edited successfully";
	%>	
		<%= status%>
		
	<%	

	}
	else if(rows == -1)
	{
		status="Error!";
		%>
		
		<%= status%>
		
	<%	
	}
		


%>