<%@page import="com.morphus.user.DAO.RetriveUsers"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>mpt</title>
</head>
<body>
<table >
	<tr>
		<td>
			<table style="width: 50%" cellpadding="0" cellspacing="0">
				<tr>
					<td align="center">
						<span style="font-size: 20px;font-family: sans-serif;color: #060C64">Select Users</span>
					</td>
					
					
				</tr>
				
			
			</table>
		</td>
	</tr>
	<tr>
					<td width="50%">
							<table width="50%">
								<tr>
									<td id="definetextsmall">
										<select multiple="multiple" size="10" style="width:100%;height: 150px" id="allusersprjectwise" >
										<%
										
											String pid=request.getParameter("pid");
											String uid=request.getParameter("userid");
										
											ArrayList <String> users=new RetriveUsers().getUsersProjectwise(pid);
											int i=0;										
											for(;i<users.size();i++)
											{
												if(users.get(i).equalsIgnoreCase(uid))
												{
													continue;
												}
												
												%>
												
												<option><%= users.get(i) %></option>
											
												<%
												
											}
										%>
										</select>
									</td>
									
								</tr>
							</table>
						</td>
						<td align="left">
						<span style="color: red;font-size: 10px">Message will be forwarded to users after admin approval</span>
						<input type="button" class="buttonm" value="Send" onClick="return sendMessageToUsers();">
						</td>
					</tr>
	</table>

</body>
</html>