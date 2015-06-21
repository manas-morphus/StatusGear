<%@page import="com.morphus.user.DAO.EditDefinedProject"%>
<%

	String projectid=request.getParameter("prjid");

	int rows=new EditDefinedProject().deleteProject(projectid);
	String status="";
	if(rows >0)
	{
		status="Deleted successfully";
	%>	
		<%= status%>
		
	<%	

	}


%>