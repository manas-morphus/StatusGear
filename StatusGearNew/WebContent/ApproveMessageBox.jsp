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
{%>
 
<jsp:forward page="index.html"></jsp:forward>

<%

}
%>
<%
	String option=request.getParameter("opt");
	int opt=Integer.parseInt(option);

%>
<body>
<table id="tabledefineproject" style="width: 300px">
	
	<tr>
		<td>
			
			<table width="100%">
				
				<tr>
					<td>
						<textarea rows="6" style="width: 300px" id="newmessageuser" ></textarea>
						
					</td>
				</tr>
				
			</table>
		
		</td>
	</tr>
	<tr>
		<td align="right">
		<form action="">
			<table  cellpadding="0" cellspacing="0" style="margin-right: 150px">
				<tr>
					<td align="left">
					<%
						if(opt==1)
						{
							%>
								<input type="button" class="buttonm" value="Send" onClick="return approveWithMessage()" >
							<%
						}
						else if(opt==2)
						{
							%>
								<input type="button" class="buttonm" value="Send" onClick="return denyWithMessage()" >
							<%
						}
					%>
						
					</td>
					<td align="left">
						<input type="Reset" class="buttonm" value="Reset" >
					</td>
					
				</tr>
			
			</table>
			</form>
		</td>
	</tr>
</table>

          
	
	<!--	<tr>
		<td>
		
		
			<table width="100%">
				<tr>
					<td width="50%">
						<table width="100%">
							<tr>
								<td id="definetextsmall">
									My Message :
								</td>
								<td>
									
									<textarea rows="6" style="width: 300px" id="prevmessageuser" readonly="readonly">
									
										
										</textarea>
									
								</td>
								<td>
									<input type="button" value="Edit" onClick="return editPrevMessageActivity();" id="messageedit">
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
									Forward To Admin :
								</td>
								<td>
									<span class="projdtls">
									
									
									
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
									Approval Status Admin
								</td>
								<td>
									<span class="projdtls">
									
								
									
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
									Message From Admin
								</td>
								<td>
									<span class="projdtls">
									
								
									
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
									Forwarded To Users :
								</td>
								<td>
									<span class="projdtls">
									
									
									</span>
								</td>
							</tr>
						</table>
					</td>
					
				</tr>
				
				</table>
			</td>
		</tr>-->
		




</body>
</html>