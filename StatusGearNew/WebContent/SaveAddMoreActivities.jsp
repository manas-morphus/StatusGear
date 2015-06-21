<%@page import="com.morphus.user.DAO.EditDefinedProject"%>
<%
	String projectid=request.getParameter("projectid"); 
	String activityname=request.getParameter("activity"); 
	String activityorder=request.getParameter("addafter");
	String activitystartdate=request.getParameter("startdate"); 
	String activityenddate=request.getParameter("enddate"); 
	String activityduration=request.getParameter("duration"); 

	int rows=new EditDefinedProject().addMoreActivitiesTemp(projectid, activityname, activityorder, activitystartdate, activityenddate, activityduration);
	

%>