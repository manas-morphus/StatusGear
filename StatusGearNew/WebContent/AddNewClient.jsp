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
						<input type="text"  class="inputfield" id="curdate" name="curdate" readonly="readonly">
					</td>
				</tr>
				<tr>
					<td id="definetextsmall">
						Client Name<span style="color: red;">*</span>
					</td>
					<td>
						<input type="text"  class="inputfield" id="clientname" name="clientname">
					</td>
				
					<td id="definetextsmall">
						Office/Organization Name
					</td>
					<td>
						<input type="text"  class="inputfield" id="clientoffname" name="clientoffname">
					</td>
				</tr>
				<tr>
					<td id="definetextsmall">
						Contact No-1  <span style="color: red;">*</span>
					</td>
					<td>
						<input type="text"  class="inputfield" id="clientcontactone" name="clientcontactone" onfocus="return onlyNumber();">
					</td>
				
					<td id="definetextsmall">
						Contact No-2  
					</td>
					<td>
						<input type="text"  class="inputfield" id="clientcontacttwo" name="newuserid" onfocus="return onlyNumber();">
					</td>
				</tr>
				<tr>
					<td id="definetextsmall">
						Contact No Office
					</td>
					<td>
						<input type="text"  class="inputfield" id="clientcontactoff" name="clientcontactoff" onfocus="return onlyNumber();">
					</td>
				
					<td id="definetextsmall">
						Email Id
					</td>
					<td>
						<input type="text"  class="inputfield" id="clientemail" name="clientemail">
					</td>
				</tr>
				<tr>
					<td id="definetextsmall">
						Resident Address
					</td>
					<td>
						<textarea rows="4" style="width: 250px" id="resaddress"></textarea>
					</td>
				
					<td id="definetextsmall">
						Official Address
					</td>
					<td>
						<textarea rows="4" style="width: 250px" id="offaddress"></textarea>
					</td>
				</tr>
				<tr>
					<td id="definetextsmall">
						State
					</td>
					<td>
						<input type="text"  class="inputfield" id="state" name="state" onfocus="return upperCase();">
					</td>
				
					<td id="definetextsmall">
						District
					</td>
					<td>
						<input type="text"  class="inputfield" id="dist" name="dist" onfocus="return upperCase();">
					</td>
				</tr>
				<tr>
					<td id="definetextsmall">
						Assign an Unique Id<span style="color: red;">*</span>
					</td>
					<td>
						<input type="text"  class="inputfield" id="newclientid" name="newclientid">
					</td>
				
					<td id="definetextsmall">
						Addition Information
					</td>
					<td>
						<textarea rows="4" style="width: 250px" id="aditionalinfo"></textarea>
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
						<input type="button" class="button" value="Submit" onclick="return submitNewClientDetails()">
					</td>
					<td align="left">
						<input type="button" class="button" value="Cancel" onclick="window.location='MyProjectTrackerAdmin.jsp';">
					</td>
					
				</tr>
			
			</table>
		</td>
	</tr>
</table>
<div style="height: 300px;overflow: auto;width: 800px;margin-left:100px;" >
<table id="tabledefineaddclient1">
	<tr>
		<td>
			<table style="width: 100%" cellpadding="0" cellspacing="0">
				<tr>
					<td align="center">
						<span style="font-size: 15px;font-family: sans-serif;color: #060C64">Display Clients</span>
					</td>
					
					
				</tr>
				<tr>
					<td >
					
						<table width="100%">
							<tr>
								<th>Client ID</th>
								<th >Client Name</th>
								<th >Office Name</th>
								<th>Contact No</th>
								<th>Email id</th>
								<th>Office Address</th>
								<th>Edit</th>
								<th>Delete</th>
							</tr>
							
							
									<%
										ArrayList <String> savedclients=new RetriveClients().getAllclients();
									
										int i=0;
										
										while(i<savedclients.size())
										{
									 
									%>
										<tr>
										<td><%= savedclients.get(i+11)%></td>
										<td><%= savedclients.get(i+1)%></td>
										<td><%= savedclients.get(i+2)%></td>
										<td><%= savedclients.get(i+3)%></td>
										<td><%= savedclients.get(i+6)%></td>
										<td><%= savedclients.get(i+8)%></td>
										<td><img alt="" src="images/edit.gif"  id="<%=savedclients.get(i+11)%>" onclick="return editClientDefined(this.id)"></td>
										<td><img alt="" src="images/delete.gif" id="<%=savedclients.get(i+11)%>" ></td>
										</tr>
									<%
										i+=15;									
										}
									
									%>
							
							
						
						</table>
					</td>
				</tr>
			
			</table>
		</td>
	</tr>
</table>
</div>

</body>
</html>