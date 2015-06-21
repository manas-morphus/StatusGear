<%@page import="com.morphus.user.DAO.LoginValid"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% 

String userid=request.getParameter("userid");

String userpw=request.getParameter("userpw");

String status=new LoginValid().loginUser(userid, userpw);

System.out.println(userid);
System.out.println(userpw);
System.out.println(status);

if(status.equalsIgnoreCase("invaliduser"))
{
	
	
%>

<jsp:forward page="invalidlogin.jsp"></jsp:forward> 	
<% 
}
else
{
	String arr[]=status.split(",");
	String uname=arr[0];
	String utype=arr[1];
	String uactivity=arr[2];
	
	session.setAttribute("userid", userid);
	session.setAttribute("uname",uname);
	session.setAttribute("utype",utype);
	session.setAttribute("uactivity",uactivity);
	
	
	session.setMaxInactiveInterval(-1);
	if(uactivity.equalsIgnoreCase("all"))
	{
		%>
		
		<jsp:forward page="MyProjectTrackerAdmin.jsp"></jsp:forward>		
		<%
		
	}
	else 
	{
		if(uactivity.equalsIgnoreCase("NOTASSIGNED"))
		{
			%>
				<jsp:forward page="UserWithoutActivity.jsp"></jsp:forward>
			<%
		}
		%>
			<jsp:forward page="MyProjectTrackerUser.jsp"></jsp:forward>
		
		<%
	}
	
	
	
	
	
}
%>


