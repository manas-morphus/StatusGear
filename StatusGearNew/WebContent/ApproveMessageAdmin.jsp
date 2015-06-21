<%@page import="com.morphus.user.DAO.SaveProjectActivityStatus"%>
<%@page import="com.morphus.user.DAO.AddActivity"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% 

	String slno=request.getParameter("slno");
	String pid=request.getParameter("pid");
	String userid=request.getParameter("userid");
	String message=request.getParameter("mesg");
	String option=request.getParameter("opt");
	
	int opt=Integer.parseInt(option);
	
	int rows=new SaveProjectActivityStatus().updateMessageAdmin(pid, userid, slno, message, opt);
	
	String status="";
	if(rows >0)
	{
		status="Approved successfully";
	%>	
		<%= status%>
		
	<%	

	}
	else if(rows == -1)
	{
		status="Already Approved";
		%>
		
		<%= status%>
		
	<%	
	}
		


%>