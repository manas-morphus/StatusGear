<%@page import="com.morphus.user.DAO.RetriveActivitiesProjectWise"%>
<%@page import="com.morphus.user.DAO.RetriveActivities"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.morphus.user.DAO.AddNewProjects"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>MyProjectTracker</title>
<style>
  #sortable { list-style-type: none; margin: 0; padding: 0; width: 60%; }
  #sortable li { margin: 0 3px 3px 3px; padding: 0.4em; padding-left: 1.5em; font-size: 1.0em; height: 12px; }
  #sortable li span { position: absolute; margin-left: -1.3em; }
  </style>
  <script>
  $(function() {
    $( "#sortable" ).sortable();
    $( "#sortable" ).enableSelection();
    
  });
  </script>
</head>
<%! 
int slno=1;

String pid="";


%>

 
<%

	 slno=AddNewProjects.serial();

	slno=1000000+slno+1;
	
	String spid=(Integer.toString(slno )).substring(1);
	
	
	pid="SA";
	pid=pid+spid;
	

%>


<body>
<table id="tabledefineproject">
	<tr>
		<td>
			<table style="width: 100%" cellpadding="0" cellspacing="0">
				<tr>
					<td align="center">
						<span style="font-size: 20px;font-family: sans-serif;color: #060C64">New Project Details</span>
					</td>
					
					
				</tr>
			
			</table>
		</td>
	</tr>
	<tr>
		<td>
			<table width="100%">
				<tr>
					<td width="50%">
						<table width="100%">
							<tr>
								<td id="definetextsmall">
									user id
								</td>
								<td>
									<input type="text" class="inputfield"  id="userid" name="userid" readonly="readonly" value=" ${userid}">
								</td>
							</tr>
						</table>
					</td>
					<td width="50%">
						<table width="100%">
							<tr>
								<td id="definetextsmall" >
									Date
								</td>
								<td>
									<input type="text"  class="inputfield" id="curdate" name="curdate" readonly="readonly">
								</td>
							</tr>
						</table>
					</td>
				</tr>
				
				</table>
			</td>
		</tr>
		<tr>
		<td>
			<table width="100%">
				<tr>
					<td width="50%">
						<table width="100%">
							<tr>
								<td id="definetextsmall">
									For Client <span style="color: red;">*</span>
								</td>
								<td>
									<select id="allclients" name="allclients" style="width: 250px;height: 25px" onchange="return displayClientName();">
							
						
									</select>
								</td>
							</tr>
						</table>
					</td>
					<td width="50%">
						<table width="100%">
							<tr>
								<td id="definetextsmall" >
									Client Name
								</td>
								<td>
									<input type="text"  class="inputfield" id="clientname" name="clientname" readonly="readonly">
								</td>
							</tr>
						</table>
					</td>
				</tr>
				
				</table>
			</td>
		</tr>
		<tr>
		<td>
			<table width="100%">
				<tr>
					<td width="50%">
						<table width="100%">
							<tr>
								<td id="definetextsmall">
									Project Name <span style="color: red;">*</span>
								</td>
								<td>
									<input type="text" class="inputfield"  id="projectname" name="projectname" >
								</td>
							</tr>
						</table>
					</td>
					<td width="50%">
						<table width="100%">
							<tr>
								<td id="definetextsmall" >
									Project Id
								</td>
								<td>
									<input type="text"  class="inputfield" id="projectid" name="projectid"  value="<%=pid %>" readonly="readonly">
								
									
								</td>
							</tr>
						</table>
					</td>
				</tr>
				
				</table>
			</td>
		</tr>
		<tr>
		<td>
			<table width="100%">
				<tr>
					<td width="50%">
						<table width="100%">
							<tr>
								<td id="definetextsmall">
									Date Of Commencement
								</td>
								<td>
									<input type="text" class="inputfield"  id="dateofcomence" name="dateofcomence" >
								</td>
							</tr>
						</table>
					</td>
					<td width="50%">
						<table width="100%">
							<tr>
								<td id="definetextsmall" >
									End Date
								</td>
								<td>
									<input type="text"  class="inputfield" id="proenddate" name="proenddate" >
								</td>
							</tr>
						</table>
					</td>
				</tr>
				
				</table>
			</td>
		</tr>
		
		<tr>
		<td>
			<table width="100%">
				<tr>
					<td width="50%">
						<table width="100%">
							<tr>
								<td id="definetextsmall">
									Estimated Project Cost
								</td>
								<td>
									<input type="text" class="inputfield"  id="estprjcost" name="estprjcost" onfocus="return onlyNumber();">
								</td>
							</tr>
						</table>
					</td>
					<td width="50%">
						<table width="100%">
							<tr>
								<td id="definetextsmall" >
									Priority Of Project
								</td>
								<td>
									<select id="priorityprj" name="priorityprj" style="width: 250px;height: 25px" >
									<option selected="selected" value="3">NORMAL</option>
									<option value="1">HIGH</option>
									<option value="2">MEDIUM</option>
									<option value="4">LOW</option>
									</select>
								</td>
								
							</tr>
						</table>
					</td>
				</tr>
				
				</table>
			</td>
		</tr>
		<tr>
		<td>
			<table width="100%">
				<tr>
					<td width="50%">
						<table width="100%">
							<tr>
								<td id="definetextsmall">
									Available Activities
								</td>
								<td>
									
									&nbsp;
								</td>
							</tr>
						</table>
					</td>
					<td width="50%">
						<table width="100%">
							<tr>
								<td id="definetextsmall" >
									Selected Activities
								</td>
								<td>
									&nbsp;
								</td>
							</tr>
						</table>
					</td>
				</tr>
				
				</table>
			</td>
		</tr>
		<tr>
		<td>
			<table width="100%">
				<tr>
					<td width="50%">
						<table width="100%">
							<tr>
								<td id="definetextsmall">
									<select multiple="multiple" size="10" style="width:100%;height: 150px" id="allactivities" >
									<%
						
							
							ArrayList <String> activities=new RetriveActivities().getActivities();
							int i1=0;
							
							while(i1< activities.size())
							{
								%>
								
								<option><%= activities.get(i1+1) %></option>
								
								<%
								i1+=3;
							}
						%>	
									
									</select>
								</td>
								
							</tr>
						</table>
					</td>
					<td width="50%">
						<table width="100%">
							<tr>
								<td id="definetextsmall" >
									<div style="width: 100%;height: 150px;overflow: scroll;" id="sortablediv">
									<ul id="sortable" >
									
										 
										</ul>
									</div>
								</td>
								
							</tr>
						</table>
					</td>
				</tr>
				
				</table>
			</td>
		</tr>
		<tr>
		<td>
			<table width="100%">
				<tr>
					<td width="50%">
						<table width="100%">
							<tr>
								<td  align="right">
									<input type="button" style="width: 70px;height: 25px" value="Select" onclick="return selectActivities();">
								</td>
								
							</tr>
						</table>
					</td>
					<td width="50%">
						<table width="100%">
							<tr>
								<td  align="right">
									<input type="button" style="width: 70px;height: 25px" value="Reset" onclick="return resetActivities();">
								</td>
								<td  align="right">
									<input type="button" style="width: 70px;height: 25px" value="Define" onclick="return defineActivities();">
								</td>
								
								
							</tr>
						</table>
					</td>
				</tr>
				
				</table>
			</td>
		</tr>
		<tr>
			<td>
				<table width="100%">
					<tr>
						<td width="50%">
							<div style="width: 100%;height: 300px;border: 2px solid #cccccc" id="divfinalactivities">
							
							
							
							</div>
							
						</td>
						<td width="50%">
							<div style="width: 100%;height: 300px;border: 2px solid #cccccc" id="divfinalactivitiesdef">
							
							
							
							</div>
							
						</td>
					</tr>
				
				
				</table>
			</td>
		</tr>
		<tr>
			<td id="TempActivities">
				
			</td>
		</tr>
	<tr>
		<td>
			<table style="width: 100%" cellpadding="0" cellspacing="0">
				<tr>
					<td align="right">
						<input type="button" class="button" value="Submit" onclick="return submitNewProjectDetails();">
					</td>
					<td align="left">
						<input type="button" class="button" value="Cancel" onclick="window.location='MyProjectTrackerAdmin.jsp';">
					</td>
					
				</tr>
			
			</table>
		</td>
	</tr>
</table>


</body>
</html>