<%@page import="com.morphus.user.DAO.RetriveClients"%>
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
	String rep_date=(request.getParameter("rep_date")!=null)?request.getParameter("rep_date"):"";
	String forproject=(request.getParameter("forproject")!=null)?request.getParameter("forproject"):"";
	String reporttype=(request.getParameter("reporttype")!=null)?request.getParameter("reporttype"):"";
	String reportcontent=(request.getParameter("reportcontent")!=null)?request.getParameter("reportcontent"):"";
	String opt=(request.getParameter("opt")!=null)?request.getParameter("opt"):"111";
	
	//out.print(rep_date);
	
	
	reportcontent=reportcontent.replace("^", "&");
	
	int option=Integer.parseInt(opt);
	
	String fromuser=(String)session.getAttribute("userid");
	int rows=0;
	//out.print(option);
	if(option == 1)
	{
		//out.print(rep_date);	
		rows=new ReportManage().saveReport(fromuser, forproject, reporttype, reportcontent, option, rep_date);
	}
	if(option == 2)
	{
			
		rows=new ReportManage().saveReport(fromuser, forproject, reporttype, reportcontent, option, rep_date);
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
					
					Calendar cal_yest=Calendar.getInstance();
					cal_yest.add(Calendar.DATE,-1);
					String date_yesterday=df.format(cal_yest.getTime());
					%>
					
						<select id="curdate">
							<option>
								<%=date%>
							</option>
							<option>
								<%=date_yesterday%>
								
							</option>
						</select>
					
						
						
					</td>
				</tr>
				<tr>
					<td id="definetext" >
						Client Name
					</td>
					<td>
						<select id="clientsreport" name="clientsreport" style="width: 250px;height: 25px" onchange="return showProjectsOfClient();">
					<option>select</option>
					<%
						ArrayList <String> clientids=new RetriveClients().getAllclients();
					
						int index1=0;
						if(clientids.size()>0)
						{
							while(index1 < clientids.size())
							{
								
								%>
								
									<option value="<%=clientids.get(index1+11) %>"><%=clientids.get(index1+11) %></option>
								<%
								index1+=15;
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
						For Project
					</td>
					<td>
					<select id="forproject" name="forproject" style="width: 250px;height: 25px" onchange="return showClient();">
				    
				     <%-- 
				     
					 <%
						ArrayList <String> prjid=new RetriveAllProjectsAdmin().getOnlyProjectNames();
					
						int index=0;
						if(prjid.size()>0)
						{
							while(index < prjid.size())
							{
								
								%>
								
									<option value="<%=prjid.get(index) %>"><%=prjid.get(index+1) %></option>
								<%
								index+=2;
							}
						}
						else
						{
							%>
							
							<option>Miscellaneous</option>
						<%	
						}
					%>
						
						--%>
					
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
						<textarea rows="10" style="width: 300px;" id="reportcontent" onkeypress="return checkTotal();"></textarea>
						
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
						<input type="button" class="buttonm" value="Send" onClick="return sendReport();" >
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