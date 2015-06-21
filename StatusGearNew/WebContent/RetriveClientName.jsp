<%@page import="com.morphus.user.DAO.RetriveClients"%>
<%@page import="com.morphus.user.DAO.AddActivity"%>

<% 

	String clientid=request.getParameter("clientid");

	String option=request.getParameter("option");
	int opt=Integer.parseInt(option);
	
	String status="";
	if(opt==1)
		status=new RetriveClients().getClientName(clientid, opt);
	else if(opt==2)
		status=new RetriveClients().getClientName(clientid, opt);


%>
<%= status%>