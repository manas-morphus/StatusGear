<%@page import="com.morphus.user.DAO.RetriveAllMessageAdmin"%>
<%@page import="com.morphus.user.DAO.RetriveAllProjectsAdmin"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>MyProjectTracker</title>
<style type="text/css" >
#accordion .ui-accordion-header {  
    color: #FFFFFF;  
    line-height: 15px;  
    display: block;  
    font-size: 12px;  
    width: 100%;  
    text-indent: 0px; 
	background-color:#485043 ;
} 
#accordion .ui-accordion-content > * {  
    margin: 0;  
    padding: 20px;  
	color:#000000;
	font-size:14px;

}
</style>
 
<script>
  $(function() {
    $( "#tabs" ).tabs();
  });
  
  </script>
   <script>
  $(function() {
    $( "#accordion" ).accordion({
      heightStyle: "content",
	   header: "h6",
	 collapsible: true
    });
  });
  $(function() {
	    $( "#accordion1" ).accordion({
	      heightStyle: "content",
		   header: "h6",
		 collapsible: true
	    });
	  });
  </script>
 
</head>

<div id="dialog" title="Write Message"></div>
<body style="margin-left: 30px">
<div id="tabs" style="margin-left:30px">
  <ul>
    <li><a href="#tabs-1">UserToAdmin</a></li>
    <li><a href="#tabs-2">UserToUser</a></li>
  </ul>
  <div id="tabs-1">
  <div id="accordion" style="height: 400px;overflow: scroll;">
  <%
  
  	ArrayList <String> MessagesToAdmin=new RetriveAllMessageAdmin().getMessages();
  	int slno=1;
  	int i=0;
  	while( i< MessagesToAdmin.size())//slno,project_id,user_id,user_mesg,date
  	{
  
  %>
  
  	
  <h6><table  style="width:100%;font-size:12px">
								<tr>
										<th width="100px">
					
											<%= slno %>
										</th>
										<th width="200px">
											FROM &nbsp; :&nbsp; <%=MessagesToAdmin.get(i+2) %>
										</th>
										
										<th width="200px">
											DATE &nbsp; :&nbsp; <%=MessagesToAdmin.get(i+4) %>
										</th>
										<th style="width:100px"><img alt="" src="images/delete.gif" id="<%=MessagesToAdmin.get(i) %>" onclick="">
										</th>
						
								</tr>
							
							</table>
							</h6>
			  <div style="height:200px;padding:0px;margin:0px">
			    <p style="margin:0px;padding:0px" >
					<table>
						<tr>
							<td >
								<table style="width:600px;height:110px;padding: 0px;margin: 0px">
									<tr>
										<td style="font-size: 14px" >
										<span style="width:590px;height:100px" readonly="readonly">	
										<%= MessagesToAdmin.get(i+3).trim() %>	
										</span>
										</td>
									</tr>
								
								</table>
							
								
							</td>
						</tr>
						<tr>
							<td>
								<table>
								<%
									if((MessagesToAdmin.get(i+5).equalsIgnoreCase("pending")))
									{
								%>
									<tr>
										<td>
											<input type="button" value="Approve" id="<%= MessagesToAdmin.get(i)+"+"+MessagesToAdmin.get(i+1)+"+"+MessagesToAdmin.get(i+2) %>" onclick="return approveMessage(this.id)">
										</td>
										<td>
											<input type="button" value="Deny" id="<%= MessagesToAdmin.get(i)+"+"+MessagesToAdmin.get(i+1)+"+"+MessagesToAdmin.get(i+2) %>" onclick="return denyMessage(this.id)">
										</td>
																													
									</tr>
									<%
									
									}
									else
									{
									
										%>
										<tr>
										<td style="color: maroon;">
										<%
										if((MessagesToAdmin.get(i+5).equalsIgnoreCase("yes")))
										{
										%>
											Message Approved
										<%	
										}
										else if((MessagesToAdmin.get(i+5).equalsIgnoreCase("no")))
										{
											%>
											Message Not Approved
											<%
										}
										%>
											
										</td>
																											
										</tr>
										
										<%
									}
									
									%>
								
								</table>
								
							</td>
							
						</tr>
					</table>
					
				</p>
			  </div>
 		 
 		 <%
 			slno++;
 		 	i+=6;
  			}
 		 
 		 
 		 %>
 		 </div> 
	</div>
	<div id="tabs-2">
		  <div id="accordion1" style="height: 400px;overflow: scroll;">
  <%
  
  	ArrayList <String> MessagesUserToUser=new RetriveAllMessageAdmin().getMessagesUserToUser();
  	int slno1=1;
  	int i1=0;
  	while( i1< MessagesUserToUser.size())//slno,proj_id,user_id,to_user,mesgslno,date,adminapproval
  	{
  
  %>
  
  	
  <h6><table  style="width:100%;font-size:12px">
								<tr>
										<th width="100px">
					
											<%= slno1 %>
										</th>
										<th width="200px">
											FROM USER &nbsp; :&nbsp; <%=MessagesUserToUser.get(i1+2) %>
										</th>
										<th width="200px">
											TO USER &nbsp; :&nbsp; <%=MessagesUserToUser.get(i1+3) %>
										</th>
										
										<th width="200px">
											DATE &nbsp; :&nbsp; <%=MessagesUserToUser.get(i1+5) %>
										</th>
										
						
								</tr>
							
							</table>
							</h6>
			  <div style="height:200px;padding:0px;margin:0px">
			    <p style="margin:0px;padding:0px" >
					<table>
						<tr>
							<td >
								<table style="width:600px;height:110px;margin: 0px;padding: 0px">
									<%
									ArrayList <String> MessageUser=new RetriveAllMessageAdmin().getMessageForUser(MessagesUserToUser.get(i1+4));
									
									%>
									
									<tr>
										<td style="font-size: 14px" >
										<span style="width:590px;height:100px" readonly="readonly">	
										<%= MessageUser.get(0).trim() %>	
										</span>
										</td>
									</tr>
								
								</table>
							
								
							</td>
						</tr>
						<tr>
							<td>
								<table>
								<%
									if((MessagesUserToUser.get(i1+6).equalsIgnoreCase("pending")))
									{
								%>
									<tr>
										<td>
											<input type="button" value="Approve" id="<%= MessagesUserToUser.get(i1) %>" onclick="return approveMessageUToU(this.id)">
										</td>
										<td>
											<input type="button" value="Deny" id="<%= MessagesUserToUser.get(i1) %>" onclick="return denyMessageUToU(this.id)">
										</td>
																													
									</tr>
									<%
									
									}
									else
									{
									
										%>
										<tr>
										<td style="color: maroon;">
											<%= MessagesUserToUser.get(i1+6) %>
										</td>
																											
										</tr>
										
										<%
									}
									
									%>
								
								</table>
								
							</td>
							
						</tr>
					</table>
					
				</p>
			  </div>
 		 
 		 <%
 			slno1++;
 		 	i1+=7;
  			}
 		 
 		 
 		 %>
 		 </div>
	
	</div>
</div>

</body>
</html>