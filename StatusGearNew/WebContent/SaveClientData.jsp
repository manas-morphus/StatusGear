<%@page import="com.morphus.user.DAO.AddNewClient"%>
<%

			String userid=request.getParameter("userid");
			String curdate=request.getParameter("curdate");
			String clientname=request.getParameter("clientname");
			String clientoffname=request.getParameter("clientoffname");
			String clientcontactone=request.getParameter("clientcontactone");
			String clientcontacttwo=request.getParameter("clientcontacttwo");
			String clientcontactoff=request.getParameter("clientcontactoff");
			
			String clientemail=request.getParameter("clientemail");
			String resaddress=request.getParameter("resaddress");
			String offaddress=request.getParameter("offaddress");
			String state=request.getParameter("state");
			String dist=request.getParameter("dist");
			String newclientid=request.getParameter("newclientid");
			String aditionalinfo=request.getParameter("aditionalinfo");
			
			String option=request.getParameter("opt");
			
			System.out.println(clientcontactoff);
			System.out.println(state);
			System.out.println(dist);
			System.out.println(newclientid);
			System.out.println(aditionalinfo);
			int rows=0;
			if(Integer.parseInt(option)==0)
			{
				 rows = new AddNewClient().saveNewClientData( clientname, clientoffname, clientcontactone, clientcontacttwo, clientcontactoff, clientemail, resaddress, offaddress, state, dist, newclientid, aditionalinfo, curdate, userid);
			}
			else if(Integer.parseInt(option)==1)
			{
				rows=new AddNewClient().updateClientData(clientname, clientoffname, clientcontactone, clientcontacttwo, clientcontactoff, clientemail, resaddress, offaddress, state, dist, newclientid, aditionalinfo, curdate, userid);
			}
			String status="";
			if(rows >0)
			{
				status="Client Added Successfully";
			%>	
				<%= status%>
				
			<%	

			}
			else if(rows == -1)
			{
				status="Client Id Already Exists";
				%>
				
				<%= status%>
				
			<%	
			}
			else if(rows == -2)
			{
				status="Updation Successful";
				%>
				
				<%= status%>
				
			<%	
			}


%>

