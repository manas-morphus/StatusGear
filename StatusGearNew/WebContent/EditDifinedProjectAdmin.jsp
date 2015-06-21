<%@page import="com.morphus.user.DAO.RetriveClients"%>
<%@page import="com.morphus.user.DAO.GlobalFunctions"%>
<%@page import="com.morphus.user.DAO.RetriveAllProjectsAdmin"%>
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
<%

	String pid=request.getParameter("pid");


	ArrayList <String> projectdtl=new RetriveAllProjectsAdmin().getProjectDetails(pid);

%>

<body>
<table id="tabledefineproject">
	<tr>
		<td>
			<table style="width: 100%" cellpadding="0" cellspacing="0">
				<tr>
					<td align="center">
						<span style="font-size: 20px;font-family: sans-serif;color: #060C64">Project Details</span>
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
									<input type="text"  class="inputfield" id="curdate" name="curdate" readonly="readonly" value="<%=GlobalFunctions.getCurDate() %>">
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
									<input type="text" class="inputfield" id="forclient"  value="<%=projectdtl.get(0) %>" readonly="readonly">
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
								<%
									String clientname=new RetriveClients().getClientName(projectdtl.get(0));
								
								%>
									<input type="text"  class="inputfield" id="clientname" name="clientname" readonly="readonly" value="<%=clientname%>"/>
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
									<input type="text" class="inputfield"  id="projectname" name="projectname" value="<%=projectdtl.get(1) %>" readonly="readonly">
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
									<input type="text" class="inputfield"  id="dateofcomence" name="dateofcomence" value="<%=GlobalFunctions.mysqlDateToIndianFormat(projectdtl.get(2)) %>">
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
									<input type="text"  class="inputfield" id="proenddate" name="proenddate"  value="<%=GlobalFunctions.mysqlDateToIndianFormat(projectdtl.get(3)) %>">
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
									<input type="text" class="inputfield"  id="estprjcost" name="estprjcost" onkeypress="return onlyNumber();" value="<%=projectdtl.get(4) %>">
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
					<td >
						<table width="100%">
							<tr>
								<td id="definetextsmall">
									ADD More Activities
								</td>
								
							</tr>
							<tr>
							<td>
									Available Activities 
								</td>
								<td>
									<%
										ArrayList <String> AvlActivities=new RetriveActivities().getActivities();
										ArrayList <String> activitydtls=new RetriveAllProjectsAdmin().getActivityDetailsTemp(pid);
										
										ArrayList <String> DefinedActivities=new ArrayList<String>(); 
										ArrayList <String> NotDefinedActivities=new ArrayList<String>();
										
										int counter3=0;
										
										while(counter3 < (activitydtls.size()))
										{
											DefinedActivities.add(activitydtls.get(counter3));
											
										
											counter3+=5;
										}
										
										System.out.println(DefinedActivities.size());
										//System.out.println(DefinedActivities.size());
										int counter5=0;
										while(counter5<(AvlActivities.size()))
										{
											String searchelement=AvlActivities.get(counter5+1);
											
											
												if(!(DefinedActivities.contains(searchelement)))
												{
													NotDefinedActivities.add(searchelement);
												}
											
											counter5+=3;
										}
										%>
										<select id="AvailActivities" name="AvailActivities" style="width: 150px;height: 25px" >
										<%
											int counter6=0;
										while(counter6 < (NotDefinedActivities.size()))
										{
										%>
										
									 	<option  ><%=NotDefinedActivities.get(counter6) %></option> 
									
										
									<%
										counter6++;
										}
									%>
									</select>
								</td>
								<td>
									ADD After 
								</td>
								<td>
									
										
										<select id="AddAfter" name="AddAfter" style="width: 150px;height: 25px" >
										<option selected="selected" value="0"><%=0 %></option>
										<%
											int counter7=0;
										while(counter7 < (activitydtls.size()))
										{
										%>
										
									 	<option ><%=activitydtls.get(counter7+1) %></option> 
									
										
									<%
										counter7+=5;
										}
										
									%>
									</select>
								</td>
								<td>
									<input type="button" value="ADD" height="20px" width="20px" onclick="return addMoreActivities();">
								</td>
							</tr>
							
						</table>
					</td>
					
				</tr>
				<tr>
						<td id="AddMoreActivities" align="center">
									
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
									Activities
								</td>
								
							</tr>
						</table>
					</td>
					
				</tr>
				
				</table>
				<table width="100%">
				<tr>
					<td width="50%">
						<table width="100%">
							<tr>
								<td id="definetextsmall" width="150px">
									Activities Name
								</td>
								<td id="definetextsmall" width="150px">
									Activities Order
								</td>
								<td id="definetextsmall" width="150px">
									Start Date
								</td>
								<td id="definetextsmall" width="150px">
									End Date
								</td>
								<td id="definetextsmall" width="150px">
									Duration
								</td>
								<td id="definetextsmall" width="150px">
									Updation
								</td>
								
							</tr>
							<%
							
							int k=0;
							while(k<activitydtls.size())
							{
							
							%>
							
							<tr >
								<td  width="150px">
									<%= activitydtls.get(k)%>
								</td>
								<td  width="150px">
									<%= activitydtls.get(k+1)%>
								</td>
								<td  width="150px">
								
									<%String startdt= (activitydtls.get(k+2)).substring(0, 10) ;
										
											String arr2[]=startdt.split("-");
											startdt=arr2[2]+"-"+arr2[1]+"-"+arr2[0];
										%>
									<%=startdt	%>
									
								</td>
								<td  width="150px">
								
									<%String edt= (activitydtls.get(k+3)).substring(0, 10) ;
										
											String arr3[]=edt.split("-");
											edt=arr3[2]+"-"+arr3[1]+"-"+arr3[0];
										%>
									<%=edt%>
									
								</td>
								<td  width="150px">
									<%=activitydtls.get(k+4)%>
								</td>
								<td  width="150px">
									<input type="button" value="Edit" style="widows: 80px;height: 25px" id="<%= (activitydtls.get(k))+"+"+pid %>" onclick="return editActivitiesAdmin(this.id);">
								</td>
								
							</tr>
							<%
							
								k+=5;							
							}
							
							%>
						</table>
					</td>
					
				</tr>
				<tr>
					<td id="EditActivitiesAdmin">
					
					</td>
				</tr>
	<tr>
		<td>
			<table style="width: 100%" cellpadding="0" cellspacing="0">
				<tr>
					<td align="right">
						<input type="button" class="button" value="Submit" onclick="return editProjectDetails();">
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