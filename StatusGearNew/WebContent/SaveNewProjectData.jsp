<%@page import="com.morphus.user.DAO.AddNewProjects"%>
<%@page import="com.morphus.user.DAO.AddNewClient"%>
<%

			String userid=request.getParameter("userid");
			String curdate=request.getParameter("curdate");
			String allclients=request.getParameter("allclients");
			String projectname=request.getParameter("projectname");
			String projectid=request.getParameter("projectid");
			String dateofcomence=request.getParameter("dateofcomence");
			String proenddate=request.getParameter("proenddate");
			
			String estprjcost=request.getParameter("estprjcost");
			String priorityprj=request.getParameter("priorityprj");
			
			projectname=projectname.replace("^", "&");
			
			int rows = new AddNewProjects().saveNewProjectData(allclients, projectname, projectid, dateofcomence, proenddate, estprjcost, priorityprj, curdate, userid);
			
			
			if(rows>0)
			{
				%>
					<%= "project Saved Successfully"%>
				
				<%
			}

%>
