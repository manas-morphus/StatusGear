<%@page import="com.morphus.user.DAO.GlobalFunctions"%>
<%@page import="com.morphus.user.DAO.RetriveClients"%>
<%@page import="com.morphus.user.DAO.RetriveUsers"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>My Project Tracker</title>
</head>
<%

if((session.getAttribute("uname"))== null)
{%>																				
 
<jsp:forward page="index.html"></jsp:forward>

<%
	
}
%>
<%

	String option=request.getParameter("opt");
	String clientid=request.getParameter("clientid");
	ArrayList <String> clientdetails=null;
	if(Integer.parseInt(option)==1)
	{
		clientdetails=new RetriveClients().getSpecficClient(clientid);
		
		
		
	}

%>
<body>
<table id="tabledefineaddclient">
	<tr>
		<td>
			<table style="width: 100%" cellpadding="0" cellspacing="0">
				<tr>
					<td align="center">
						<span style="font-size: 20px;font-family: sans-serif;color: #060C64">New Client Details</span>
					</td>
					
					
				</tr>
			
			</table>
		</td>
	</tr>
	<tr>
		<td>
			<table width="100%">
				<tr>
					<td id="definetextsmall">
						user id
					</td>
					<td>
						<input type="text" class="inputfield"  id="userid" name="userid" readonly="readonly" value=" ${userid}">
					</td>
				
					<td id="definetextsmall" >
						Date
					</td>
					<td>
						<input type="text"  class="inputfield" id="curdate" name="curdate" readonly="readonly" value="<%=GlobalFunctions.getCurDate() %>">
					</td>
				</tr>
				<tr>
					<td id="definetextsmall">
						Client Name<span style="color: red;">*</span>
					</td>
					<td>
						<input type="text"  class="inputfield" id="clientname" name="clientname" value="<%=clientdetails.get(1) %>">
					</td>
				
					<td id="definetextsmall">
						Office/Organization Name
					</td>
					<td>
						<input type="text"  class="inputfield" id="clientoffname" name="clientoffname" value="<%=clientdetails.get(2) %>">
					</td>
				</tr>
				<tr>
					<td id="definetextsmall">
						Contact No-1  <span style="color: red;">*</span>
					</td>
					<td>
						<input type="text"  class="inputfield" id="clientcontactone" name="clientcontactone" onfocus="return onlyNumber();" value="<%=clientdetails.get(3) %>">
					</td>
				
					<td id="definetextsmall">
						Contact No-2  
					</td>
					<td>
						<input type="text"  class="inputfield" id="clientcontacttwo" name="newuserid" onfocus="return onlyNumber();" value="<%=clientdetails.get(4) %>">
					</td>
				</tr>
				<tr>
					<td id="definetextsmall">
						Contact No Office
					</td>
					<td>
						<input type="text"  class="inputfield" id="clientcontactoff" name="clientcontactoff" onfocus="return onlyNumber();" value="<%=clientdetails.get(5) %>">
					</td>
				
					<td id="definetextsmall">
						Email Id
					</td>
					<td>
						<input type="text"  class="inputfield" id="clientemail" name="clientemail" value="<%=clientdetails.get(6) %>">
					</td>
				</tr>
				<tr>
					<td id="definetextsmall">
						Resident Address
					</td>
					<td>
						<textarea rows="4" style="width: 250px" id="resaddress"><%=clientdetails.get(7) %></textarea>
					</td>
				
					<td id="definetextsmall">
						Official Address
					</td>
					<td>
						<textarea rows="4" style="width: 250px" id="offaddress"><%=clientdetails.get(8) %></textarea>
					</td>
				</tr>
				<tr>
					<td id="definetextsmall">
						State
					</td>
					<td>
						<input type="text"  class="inputfield" id="state" name="state" onfocus="return upperCase();" value="<%=clientdetails.get(9) %>">
					</td>
				
					<td id="definetextsmall">
						District
					</td>
					<td>
						<input type="text"  class="inputfield" id="dist" name="dist" onfocus="return upperCase();" value="<%=clientdetails.get(10) %>">
					</td>
				</tr>
				<tr>
					<td id="definetextsmall">
						Assign an Unique Id<span style="color: red;">*</span>
					</td>
					<td>
						<input type="text"  class="inputfield" id="newclientid" name="newclientid" value="<%=clientdetails.get(11) %>" readonly="readonly">
					</td>
				
					<td id="definetextsmall">
						Addition Information
					</td>
					<td>
						<textarea rows="4" style="width: 250px" id="aditionalinfo"><%=clientdetails.get(12) %></textarea>
					</td>
				</tr>
							
				
			</table>
			
		</td>
	</tr>
	<tr>
		<td>
			<table style="width: 100%" cellpadding="0" cellspacing="0">
				<tr>
					<td align="right">
						<input type="button" class="button" value="Submit" onclick="return editClientDetails();">
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
