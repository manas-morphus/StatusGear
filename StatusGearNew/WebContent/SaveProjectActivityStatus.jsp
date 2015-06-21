<%@page import="com.morphus.user.DAO.SaveProjectActivityStatus"%>
<%@page import="com.morphus.user.DAO.AddNewClient"%>
<%


			String pid=request.getParameter("pid");
			String userid=request.getParameter("userid");
			String activity=request.getParameter("activity");
			//String prevmessage=request.getParameter("prevmessage");
			String newmessage=request.getParameter("newmessage");
			String dateactivity=request.getParameter("dateactivity");
			
			
			
			int rows = new SaveProjectActivityStatus().saveProjectActivityData(pid, userid, activity, newmessage, dateactivity);
			
			String status="";
			if(rows >0)
			{
				status="Messaged Saved Successfully";
			%>	
				<%= status%>
				
			<%	

			}
			else
			{
				status="Error in Saving";
				%>
				
				<%= status%>
				
			<%	
			}



%>

