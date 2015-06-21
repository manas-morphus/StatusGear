<%@page import="java.util.ArrayList"%>
<%@page import="com.morphus.user.DAO.RetriveAllProjectsAdmin"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>mpt</title>
</head>
<body>
<%
	
	String pid=request.getParameter("pid");

ArrayList <String> projectdtls=new RetriveAllProjectsAdmin().getProjectDetails(pid);

%>

<div id="dialog" title="Write Message"></div>
</body>
<table id="tabledefineproject">
	<tr>
		<td>
			<table style="width: 100%" cellpadding="0" cellspacing="0">
				<tr>
					<td align="center">
						<span style="font-size: 20px;font-family: sans-serif;color: #060C64">Project Details</span>
					</td>
					<td align="right">
						<input type="button" value="Edit" id="<%=pid %>" onclick="return editDefinedProject(this.id)">
					</td>
					<td align="left">
						<input type="button" value="Delete" id="<%=pid %>" onclick="return deleteDefinedProject(this.id)">
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
									Client ID
								</td>
								<td>
									<span class="projdtls">
									<%= projectdtls.get(0)	 %>
									
									
									</span>
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
									Project Name
								</td>
								<td>
									<span class="projdtls">
									<%= projectdtls.get(1)	 %>
									
									
									</span>
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
									<span class="projdtls">
									
										<%String dofc=( projectdtls.get(2)).substring(0, 10) ;
										
											String arr[]=dofc.split("-");
											dofc=arr[2]+"-"+arr[1]+"-"+arr[0];
										%>
									<%=dofc	%>
									
									</span>
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
									Probable End Date
								</td>
								<td>
									<span class="projdtls">
									
									<%String enddt=( projectdtls.get(2)).substring(0, 10) ;
										
											String arr1[]=enddt.split("-");
											enddt=arr1[2]+"-"+arr1[1]+"-"+arr1[0];
										%>
									<%=enddt	%>
								
									
									</span>
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
									<span class="projdtls">
									
									<%= projectdtls.get(4)	 %>
									
									</span>
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
									Priority Of Project
								</td>
								<td>
									<span class="projdtls">
									
									<%= projectdtls.get(5)	 %>
									
									</span>
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
								
								
							</tr>
							<%
							
							ArrayList <String> activitydtls=new RetriveAllProjectsAdmin().getActivityDetails(pid);
							
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
								<!--<td  width="150px">
									<input type="button" value="Edit" style="widows: 80px;height: 25px" id="<%= (activitydtls.get(k))+"+"+pid %>" onclick="return editActivitiesAdmin(this.id);">
								</td>-->
								
							</tr>
							<%
							
								k+=5;							
							}
							
							%>
						</table>
					</td>
					
				</tr>
			<!--	<tr>
					<td id="EditActivitiesAdmin">
					
					</td>
				</tr>-->
				<tr>
					<td >
					<div style="height: 400px;width: 100%;overflow: scroll;" >
						<table>
							<tr>
								<td align="center">
									MESSAGES FROM USERS
								</td>
							</tr>
							<tr>
								<td>
									<table>
										<tr>
											<td width="200px">
												FROM USER
											</td>
											
											<td width="200px">
												MESSAGE
											</td>
											<td width="200px">
												DATE
											</td>
											<td width="200px">
												APPROVE/DENY
											</td>
											
										</tr>
									
									
									
									
									</table>
								</td>
							</tr>
							<%
										
									ArrayList <String> messagedtls=new RetriveAllProjectsAdmin().getAllMessageDetails(pid);
									int i=0;
									
									while(i<messagedtls.size())
									{
									
									%>
									<tr>
										<td>
									
												<table>
												<tr>
													<td width="200px">
														<%=messagedtls.get(i+2) %>
													</td>
													<td width="200px">
														<%=messagedtls.get(i+3) %>
													</td>
													<td width="200px">
														<%=messagedtls.get(i+4) %>
													</td>
													
													<td>
								<table>
								<%
									if((messagedtls.get(i+5).equalsIgnoreCase("pending")))
									{
								%>
									<tr>
										<td>
											<input type="button" value="Approve" id="<%= messagedtls.get(i)+"+"+messagedtls.get(i+1)+"+"+messagedtls.get(i+2) %>" onclick="return approveMessage(this.id)">
										</td>
										<td>
											<input type="button" value="Deny" id="<%= messagedtls.get(i)+"+"+messagedtls.get(i+1)+"+"+messagedtls.get(i+2) %>" onclick="return denyMessage(this.id)">
										</td>
																													
									</tr>
									<%
									
									}
									else
									{
									
										%>
										<tr>
										<td style="color: maroon;">
										<%
										if((messagedtls.get(i+5).equalsIgnoreCase("yes")))
										{
										%>
											Message Approved
										<%	
										}
										else if((messagedtls.get(i+5).equalsIgnoreCase("no")))
										{
											%>
											Message Not Approved
											<%
										}
										%>
											
										</td>
																											
										</tr>
										
										<%
									}
									
									%>
								
								</table>
								
							</td>
												</tr>
											</table>
									</td>
								</tr>
						<%
						
							i += 6;
							}
						%>
						</table>	
						</div>	
					</td>
				</tr>
				
				</table>
				
			</td>
		</tr>
</table>

</html>