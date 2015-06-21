<%@page import="com.morphus.user.DAO.AddActivity"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% 

	String userid=request.getParameter("userid");
	String AddingDate=request.getParameter("curdate");
	String ActivityName=request.getParameter("activityname");
	String ActivityDesc=request.getParameter("activitydesc");
	
	
	int rows=new AddActivity().saveActivityData(userid, ActivityName, ActivityDesc, AddingDate);
	
	String status="";
	if(rows >0)
	{
		status="added successfully";
	%>	
		<%= status%>
		
	<%	

	}
	else if(rows == -1)
	{
		status="activity already exists";
		%>
		
		<%= status%>
		
	<%	
	}
		


%>