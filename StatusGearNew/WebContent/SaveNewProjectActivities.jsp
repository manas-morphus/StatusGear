<%@page import="com.morphus.user.DAO.AddNewProjects"%>
<%@page import="com.morphus.user.DAO.AddNewClient"%>
<%


			/*String projectid=request.getParameter("projectid");
			String activityname[]=request.getParameterValues("activityname");
			String activityorder[]=request.getParameterValues("activityorder");
			String activitystartdate[]=request.getParameterValues("activitystartdate");
			String activityenddate[]=request.getParameterValues("activityenddate");
			String activityduration[]=request.getParameterValues("activityduration");*/
			
			
			String projectid=request.getParameter("projectid");
			String activityname=request.getParameter("activityname");
			String activityorder=request.getParameter("activityorder");
			String activitystartdate=request.getParameter("activitystartdate");
			String activityenddate=request.getParameter("activityenddate");
			String activityduration=request.getParameter("activityduration");
			
			System.out.println();
			
			//int rows = new AddNewProjects().saveNewProjectActivities(projectid, activityname, activityorder, activitystartdate, activityenddate, activityduration);
			
			new AddNewProjects().saveNewProjectActivitiesTemp(projectid, activityname, activityorder, activitystartdate, activityenddate, activityduration);
			

%>


