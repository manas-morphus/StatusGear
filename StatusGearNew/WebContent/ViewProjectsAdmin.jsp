<%@page import="com.morphus.user.DAO.GlobalFunctions"%>
<%@page import="com.morphus.user.DAO.UpdateProjectStatus"%>
<%@page import="com.morphus.user.DAO.RetriveAllProjectsAdmin"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>MyProjectTracker</title>
<style type="text/css">
	#ViewChildDivHead
	{
	
		background-color: #005948;
		color: white;
		
	}
	.ViewChildDiv
	{
	
		cursor: pointer;
		
	}
	.ViewChildDiv :HOVER
	{
		background-color: #30D6AC;
	}

</style>

</head>
<body>

<div  id="ViewProjectsMain" >
	<div id="ViewChildDivHead">
		<table style="width:100%;">
				<tr>
				
					<td>
							<table  style="width:100%;border:1px solid #000066">
								<tr>
										<th width="100px">
					
											SLNO
										</th>
										<th width="200px">
											PROJECT NAME
										</th>
										<th width="200px">
											FOR CLIENT
										</th>
										<th width="200px">
											DATE OF COMMENCEMENT 
										</th>
										<th width="100px">
											DURATION
										</th>
										<th width="100px">
											STATUS
										</th>
						
								</tr>
							
							</table>
					</td>
				
					
				</tr>
			</table>
	
	</div>
	
<%

ArrayList <String> projects=new RetriveAllProjectsAdmin().getProjects();

int slno=1;
int j=0;
	while(j< projects.size())
	{

%>	
	
	<div class="ViewChildDiv" onclick="return ViewProjDtlAdmin(this.id);" id="<%= projects.get(j)	 %>">
		
		<table style="width:100%;">
				<tr>
					<td>
							<table style="width:100%;border:1px solid #000066">
								<tr>
										<tr>
											<th width="100px">
											
												<%= slno	 %>
											</th>
											<th width="200px">
												<%= projects.get(j+1)	 %>
											</th>
											<th width="200px">
												<%= projects.get(j+2)	 %>
											</th>
											<th width="200px">
												<%= 
													GlobalFunctions.mysqlDateToIndianFormat((String)projects.get(j+3).subSequence(0, 10))
														 %>
											</th>
											<%
											ArrayList <String> projecttotdays=new RetriveAllProjectsAdmin().getProjectsTotalDays(projects.get(j));
											
											%>
											<th width="100px">
											
												<%= projecttotdays.get(0)	 %>
											</th>
											
											<th width="100px">
											<%
												ArrayList <String> project_status=new UpdateProjectStatus().getOneProjectStatus(projects.get(j));
											
											%>
											
												<%=GlobalFunctions.fullProjectStatus(project_status.get(2))  	 %>
											</th>
													
										</tr>
							</table>
					</td>
				</tr>
			</table>
			
	</div>
	<%
	
	slno++;
	j+=4;
	}
	
	
	%>

</div>

</body>
</html>