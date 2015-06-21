<%@page import="com.morphus.user.DAO.RetriveAllProjectsAdmin"%>
<%@page import="com.morphus.user.DAO.ReportManage"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.morphus.user.DAO.RetriveActivityStatusProjects"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>MyProjectTracker</title>

</head>
<%

if((session.getAttribute("uname"))== null)
{
%>
 
<jsp:forward page="index.html"></jsp:forward>

<%

}
%>
<%

	String forproject=(request.getParameter("forproject")!=null)?request.getParameter("forproject"):"";
	String reporttype=(request.getParameter("reporttype")!=null)?request.getParameter("reporttype"):"";
	String reportcontent=(request.getParameter("reportcontent")!=null)?request.getParameter("reportcontent"):"";
	String foruser=(request.getParameter("foruser")!=null)?request.getParameter("foruser"):"";
	String opt=(request.getParameter("opt")!=null)?request.getParameter("opt"):"111";
	
	int option=Integer.parseInt(opt);
	
	String fromuser=(String)session.getAttribute("userid");
	int rows=0;
	if(option == 1)
	{
			
		rows=new ReportManage().saveReportMaster(foruser, forproject, reporttype, reportcontent, option, fromuser);
	}
	

%>
<%=(rows>0 && option==1)?"Report Submmited Successfully":((rows==0 && option==1)?"Error!!":"") %>
<body>
<table id="tabledefineproject">
	<tr>
		<td>
			<table style="width: 100%" cellpadding="0" cellspacing="0">
				<tr>
					<td align="center">
						<span style="font-size: 20px;font-family: sans-serif;color: #060C64">Write Daily Report</span>
					</td>
					
					
				</tr>
			
			</table>
		</td>
	</tr>
	<tr>
		<td>
			
			<table width="100%">
				
				<tr>
					<td id="definetext" >
						Date
					</td>
					<td>
					<%
					DateFormat df=new SimpleDateFormat("dd/MM/yyyy");
					
					Calendar cal=Calendar.getInstance();
					
					String date=df.format(cal.getTime());
					%>
						<input type="text"  class="inputfield" id="curdate" name="curdate" readonly="readonly" value="<%=date%>">
					</td>
				</tr>
				<tr>
					<td id="definetext" >
						For User
					</td>
					<td>
					<select id="foruser" name="forproject" style="width: 250px;height: 25px">
					<%
						ArrayList <String> usersformaster=new ReportManage().checkMasterReportWriter((String)session.getAttribute("userid"));
					
						int index1=0;
						if(usersformaster.size()>0)
						{
							while(index1 < usersformaster.size())
							{
								
								%>
								
									<option><%=usersformaster.get(index1) %></option>
								<%
								index1+=1;
							}
						}
						
					%>
						
						
					
						</select>
						
					</td>
				</tr>
				<tr>
					<td id="definetext" >
						For Project
					</td>
					<td>
					<select id="forproject" name="forproject" style="width: 250px;height: 25px">
					<%
						ArrayList <String> prjid=new RetriveAllProjectsAdmin().getProjects();
					
						int index=0;
						if(prjid.size()>0)
						{
							while(index < prjid.size())
							{
								
								%>
								
									<option value="<%=prjid.get(index) %>"><%=prjid.get(index+1) %></option>
								<%
								index+=4;
							}
						}
						else
						{
							%>
							
							<option>Miscellaneous</option>
						<%	
						}
					%>
						
						
					
						</select>
						
					</td>
				</tr>
				<tr>
					<td id="definetext" >
						Report Type
					</td>
					<td>
					
						<input type="text"  class="inputfield" id="reporttype" name="reporttype"  value="">
					</td>
				</tr>
				
				<tr>
					<td id="definetext">
						Write Report Here
					</td>
					<td>
						<textarea rows="10" style="width: 300px" id="reportcontent" ></textarea>
						
					</td>
				</tr>
			
			</table>
		
		</td>
	</tr>
	<tr>
		<td align="right">
			<table  cellpadding="0" cellspacing="0" style="margin-right: 150px">
				<tr>
					<td align="left">
						<input type="button" class="buttonm" value="Send" onClick="return sendReportMaster();" >
					</td>
					<td align="left">
						<input type="button" class="buttonm" value="Save" onClick="return saveReport();" >
					</td>
					<td align="left">
						<input type="Reset" class="buttonm" value="Reset" onClick="return resetMessage();">
					</td>
					
				</tr>
			
			</table>
		</td>
	</tr>
</table>

</body>
</html>