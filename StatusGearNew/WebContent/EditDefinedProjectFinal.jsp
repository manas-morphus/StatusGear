<%@page import="com.morphus.user.DAO.EditDefinedProject"%>
<%



	String projectid=request.getParameter("projectid");
	String dateofcomence=request.getParameter("dateofcomence");
	String proenddate=request.getParameter("proenddate");
	String estprjcost=request.getParameter("estprjcost");
	String priorityprj=request.getParameter("priorityprj");
	
	int rows=new EditDefinedProject().editProjectDefined(projectid, dateofcomence, proenddate, estprjcost, priorityprj);
	System.out.println(rows);
%>