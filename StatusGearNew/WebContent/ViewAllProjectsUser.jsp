<%@page import="com.morphus.user.DAO.RetriveProjectsUserwise"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>MyProjectTracker</title>
</head>
<body>
<div  id="ViewProjectsMain">
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
											PROJECT ID
										</th>
										<th width="200px">
											START DATE
										</th>
										<th width="200px">
											END DATE
										</th>
										<th width="100px">
											DURATION
										</th>
						
								</tr>
							
							</table>
					</td>
				
					
				</tr>
			</table>

	</div>
	<%
		ArrayList <String> projectsuser=new RetriveProjectsUserwise().getProjectsUser((String)session.getAttribute("uactivity"));
	int slno=1;	
	int i=0;
	
	while(i<projectsuser.size())
	{
	
	%>
	<div class="ViewChildDiv" onclick="return DisplayMessageUser(this.id)" id="<%= projectsuser.get(i+1)+"+"+(String)session.getAttribute("userid")+"+"+(String)session.getAttribute("uactivity") %>">
		
	
		<table style="width:100%;">
				<tr>
					<td>
							<table style="width:100%;border:1px solid #000066">
								<tr>
										<tr>
											<th width="100px">
											
												<%= slno %>
											</th>
											<th width="200px">
												<%=projectsuser.get(i) %>
											</th>
											<th width="200px">
												<%=projectsuser.get(i+1) %>
											</th>
											<th width="200px">
												<%=(projectsuser.get(i+2)).substring(0, 10) %>
											</th>
											<th width="200px">
												<%=(projectsuser.get(i+3)).substring(0, 10) %>
											</th>
											<th width="100px">
												<%=projectsuser.get(i+4) %>
											</th>
													
										</tr>
							</table>
					</td>
				</tr>
			</table>
	
	
	</div>
	<%
	slno++;
	i+=5;
	}
	
	%>
</div>
</body>
</html>