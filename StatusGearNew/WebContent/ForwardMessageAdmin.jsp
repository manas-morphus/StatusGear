<%@page import="com.morphus.user.DAO.SaveProjectActivityStatus"%>
<%@page import="com.morphus.user.DAO.AddNewClient"%>
<%

			String mesgslno=request.getParameter("slno");
			String pid=request.getParameter("pid");
			String userid=request.getParameter("userid");
			String activity=request.getParameter("activity");
			
			int rows = new SaveProjectActivityStatus().ForwardMessageAdmin(pid, userid, activity, mesgslno);
			
			String status="";
			if(rows >0)
			{
				status="Messaged Forwarded  Successfully";
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