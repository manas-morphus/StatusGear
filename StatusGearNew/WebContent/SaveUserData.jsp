<%@page import="com.morphus.user.DAO.AddNewUser"%>
<%

	
	String curdate=request.getParameter("curdate");
	String username=request.getParameter("username");
	String userlastname=request.getParameter("userlastname");
	String newuserid=request.getParameter("newuserid");
	String password=request.getParameter("password");
	String usertype=request.getParameter("usertype");
	String activities=request.getParameter("activities");
	
	
	int rows = new AddNewUser().saveNewUserData(curdate, username, userlastname, newuserid, password, usertype, activities);

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
		status="userid already exists";
		%>
		
		<%= status%>
		
	<%	
	}

%>