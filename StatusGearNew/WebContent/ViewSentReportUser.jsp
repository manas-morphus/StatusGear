<%@page import="com.morphus.user.DAO.ReportManage"%>
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
    <li><a href="#tabs-1">REPORTS</a></li>
    
  </ul>
  <div id="tabs-1">
  <div id="accordion" style="height: 400px;overflow: scroll;">
  <%
  	
  	ArrayList <String> ReportsToAdmin=new ReportManage().viewReportsUserWise((String)session.getAttribute("userid"));
  	int slno=1;
  	int i=0;
  	while( i< ReportsToAdmin.size())//slno,project_id,user_id,user_mesg,date
  	{
  
  %>
  
  	
  <h6><table  style="width:100%;font-size:12px">
								<tr>
										<th width="100px">
					
											<%= slno %>
										</th>
										<th width="200px">
											PROJECT NAME &nbsp; :&nbsp; <%
											
											ArrayList<String>	prjName=new RetriveAllProjectsAdmin().getProjectDetails(ReportsToAdmin.get(i+7));
											%>
											<%=prjName.get(1) %>
										</th>
										
										<th width="200px">
											REPORT TYPE &nbsp; :&nbsp; <%=ReportsToAdmin.get(i+2) %>
										</th>
										<th width="200px">
											DATE &nbsp; :&nbsp; <%=ReportsToAdmin.get(i+5) %>
										</th>
										<th style="width:100px"><img alt="" src="images/delete.gif" id="<%=ReportsToAdmin.get(i) %>" onclick="">
										</th>
						
								</tr>
							
							</table>
				</h6>
			  <div style="height:100px;padding:0px;margin:0px">
			    <p style="margin:0px;padding:0px" >
					
						<table style="width:600px;height:70px;vertical-align:top;margin:0px;padding:0px">
							
							
							
							<tr>
									<td style="font-size: 14px" >
									<span style="width:590px;height:60px" >	
										<%= ReportsToAdmin.get(i+3).trim() %>	
									</span>
									</td>
									</tr>
									
									<%
									
										String opt=request.getParameter("option");
										int option=Integer.parseInt(opt);
										if(option==1)
										{
									
									
									%>
									<tr>
									<td style="font-size: 14px" >
									comments from admin
									<span style="color: blue;" >	
										<%= ReportsToAdmin.get(i+8).trim() %>	
									</span>
									</td>
									</tr>
									<%
										}
									
									%>
									
						</table>
				</p>
			  </div>
 		 
 		 <%
 			slno++;
 		 	i+=10;
  			}
 		 
 		 
 		 %>
 		 </div> 
	</div>
	
	
	</div>


</body>
</html>