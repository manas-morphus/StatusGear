<%@page import="com.morphus.user.DAO.RetriveProjectsUserwise"%>
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
<body>
<div id="tabs" style="margin-left:30px">
  <ul>
    <li><a href="#tabs-1">Messages</a></li>

  </ul>
 
	<div id="tabs-1">
		  <div id="accordion1" style="height: 400px;overflow: scroll;">
  <%

  	ArrayList <String> MessagesUserToUser=new RetriveProjectsUserwise().getMessagesFromAdmin((String)session.getAttribute("userid"));
  	int slno1=1;
  	int i1=0;
  	while( i1< MessagesUserToUser.size())//proj_id,user_id,mesgslno,date
  	{
  
  %>
  
  	
  <h6><table  style="width:100%;font-size:12px">
								<tr>
										<th width="100px">
					
											<%= slno1 %>
										</th>
										<th width="200px">
											FROM USER &nbsp; :&nbsp; <%="admin" %>
										</th>
										<th width="200px">
											Project ID &nbsp; :&nbsp; <%=MessagesUserToUser.get(i1+1) %>
										</th>
										<th width="200px">
											Approval Status &nbsp; :&nbsp; <%=MessagesUserToUser.get(i1+3) %>
										</th>
										
										<th width="200px">
											DATE &nbsp; :&nbsp; <%=MessagesUserToUser.get(i1+4) %>
										</th>
										
						
								</tr>
							
							</table>
							</h6>
			  <div>
			    <p>
					<table>
						<tr>
							<td >
								<table style="width:300px;height:150px">
									
									
									<tr>
										<td style="font-size: 14px" >
										<textarea style="width:290px;height:140px" readonly="readonly">	
										<%=MessagesUserToUser.get(i1+2) %>	
										</textarea>
										</td>
									</tr>
								
								</table>
							
								
							</td>
						</tr>
					
					</table>
					
				</p>
			  </div>
 		 
 		 <%
 			slno1++;
 		 	i1+=5;
  			}
 		 
 		 
 		 %>
 		 </div>
	
	</div>
</div>

</body>
</html>