<%@page import="com.morphus.user.DAO.RetriveProjectsClientWise"%>
<%@page import="com.morphus.user.DAO.RetriveClients"%>
<%

	String cid=request.getParameter("cid");


	String projects=new RetriveProjectsClientWise().getProjectName(cid);
	
	System.out.println(projects);
	
	response.setContentType("application/json");


%>
<%=projects %>