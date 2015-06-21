<%@page import="com.morphus.user.DAO.SaveProjectActivityStatus"%>
<%@page import="com.morphus.user.DAO.AddNewClient"%>
<%

			String mesgslno=request.getParameter("slno");
			String pid=request.getParameter("pid");
			String userid=request.getParameter("userid");
			String activity=request.getParameter("activity");
			String users[]=request.getParameterValues("usersprj");
			
			int rows = new SaveProjectActivityStatus().ForwardMessageUsers(pid, userid, activity, mesgslno, users);
			
			String status="";
			if(rows >0)
			{
				status="Messaged Forwarded  Successfully for admin approval";
			%>	
				<%= status%>
				
			<%	

			}
			else
			{
				status="Error in Forwarding";
				%>
				
				<%= status%>
				
			<%	
			}


%>