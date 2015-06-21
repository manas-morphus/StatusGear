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
<%
	String opt=request.getParameter("opt");

	int option=Integer.parseInt(opt);
	int rows=0;
	if(option==1)
	{
		String rid=request.getParameter("reportid");
		String point=request.getParameter("point");
		String comment=request.getParameter("comment");
		String datereporting=request.getParameter("datereporting");
		
		
		
		rows=new ReportManage().updateReportPoint(point, rid, comment, datereporting);
		
	}


%>

<div id="dialog" title="Write Message"></div>
<body style="margin-left: 30px">
<div id="tabs" style="margin-left:30px">
  <ul>
    <li><a href="#tabs-1">REPORTS</a></li>
    
  </ul>
  <div id="tabs-1">
  <div id="accordion" style="height: 400px;overflow: scroll;">
  <%
  	
  	ArrayList <String> ReportsToAdmin=new ReportManage().viewReportsNotVerified();
  	int slno=1;
  	int i=0;
  	while( i< ReportsToAdmin.size())//useris,date,point_gain_id.comment_id
  	{
  
  %>
<h6 style="background-color: #4AB5A0"><table  style="width:100%;font-size:12px;" cellpadding="0" cellspacing="0">
								<tr>
										<th width="100px">
					
											<%= slno %>
										</th>
										<th width="200px">
											FROM &nbsp; :&nbsp; <%=ReportsToAdmin.get(i) %>
										</th>
										
										
										<th width="200px">
											DATE &nbsp; :&nbsp; <%=ReportsToAdmin.get(i+1) %>
										</th>
										<th style="width:100px"><img alt="" src="images/delete.gif" id="<%=ReportsToAdmin.get(i) %>" onclick="">
										</th>
						
								</tr>
							
							</table>
				</h6>
			  <div style="overflow:auto; padding:0px;margin:0px">
			    <p style="margin:0px;padding:0px" >
			    
			    	 <%
  	
					  	ArrayList <String> ReportsToAdminDetails=new ReportManage().viewReportsNotVerifiedDetails(ReportsToAdmin.get(i),ReportsToAdmin.get(i+1));
					  	
					  	int counter_prjdtl=0;
					  	while( counter_prjdtl< ReportsToAdminDetails.size())//slno,project_id,user_id,user_mesg,date
					  	{
					  
					  %>
					
					<table style="width:100%;height:70px;vertical-align:top;margin:0px;padding:0px;background-color: #FFF7BF;border: 1px solid #0204A1" border="1" >
					<tr>
								<th width="200px" colspan="2">
											PROJECT NAME &nbsp; :&nbsp; <%
											
											ArrayList<String>	prjName=new RetriveAllProjectsAdmin().getProjectDetails(ReportsToAdminDetails.get(counter_prjdtl+7));
											%>
											<%=prjName.get(1) %>
										</th>
						</tr>
							<tr>
									<td style="font-size: 14px" align="left">
									Written By
									<span style="color: blue;" >	
										<u> <%= ReportsToAdminDetails.get(counter_prjdtl+9).trim() %></u>
									</span>
									</td>
									<td align="right">
										Report Type
									</td>
								</tr>
							
							<tr>
									<td style="font-size: 14px" colspan="2">
									<span style="width:590px;height:60px" readonly="readonly">	
										<%= ReportsToAdminDetails.get(counter_prjdtl+3).trim() %>	
									</span>
									</td>
									</tr>
									
						</table>	
						<%
 								
								counter_prjdtl+=10;
  							}
 		 
 					 %>
 					  <table style="width: 100%;background-color: #CAF1F1;border: 1px solid #06144C" border="1" cellpadding="0" cellspacing="0">
 					 	<tr>
 					 		<td colspan="2" align="center" valign="top" >
 					 			<span style="font-family: Arial;font-weight: bold;font-size: 15px">FEEDBACK FORM</span>
 					 		</td>
 					 	</tr>
 					 	
									<tr>
										<td>
											Update Feedback
										</td>
										<td>
										<table>
										<tr>
										<td width="100px">
											<select id="<%=ReportsToAdmin.get(i) %>" >
												<option>10</option>
												<option>9</option>
												<option>8</option>
												<option>7</option>
												<option>6</option>
												<option>5</option>
												<option>4</option>
												<option>3</option>
												<option>2</option>
												<option>1</option>
												<option>0</option>
												<option>-1</option>
												<option>-2</option>
												<option>-3</option>
												<option>-4</option>
												<option>-5</option>
												<option>-6</option>
												<option>-7</option>
												<option>-8</option>
												<option>-9</option>
												<option>-10</option>
											</select>
										</td>
										<td>
											Write Comment<textarea rows="2" cols="20" id="<%="coment"+ReportsToAdmin.get(i)%>"></textarea>
										</td>
										<td>
											<input type="hidden" id="<%="date"+ReportsToAdmin.get(i)%>" value="<%=ReportsToAdmin.get(i+1)%>">
											<input type="button" value="Save" onclick="return savePointReport(this.id);" id="<%=ReportsToAdmin.get(i) %>">
										</td>
									</tr>
									</table>
 					 
 					 </table> 
				</p>
			  </div>
 		 
 		 <%
 			slno++;
 		 	i+=4;
  			}
 		 
 		 
 		 %>
 		 </div> 
	</div>
	
	
	</div>


</body>
</html>