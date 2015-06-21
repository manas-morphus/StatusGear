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
	ArrayList <String> allreports=null;
	if(option==0)
	{
		String pid=request.getParameter("pid");
		String uid=request.getParameter("uid");
		
		String sdate="";
		String edate="";
		allreports=new  ReportManage().getAllSerchedReport(sdate, edate, pid, uid, opt);
		
	}
	if(option==1)
	{
		String pid=request.getParameter("pid");
		String uid=request.getParameter("uid");
		
		String sdate=request.getParameter("sdate");
		String edate=request.getParameter("edate");
		 allreports=new  ReportManage().getAllSerchedReport(sdate, edate, pid, uid, opt);
		
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
  	
  	
  	int slno=1;
  	int i=0;
  	while( i< allreports.size())//slno,project_id,user_id,user_mesg,date
  	{
  
  %>
  
  	
  <h6><table  style="width:100%;font-size:12px">
								<tr>
										<th width="100px">
					
											<%= slno %>
										</th>
										<th width="200px">
											FROM &nbsp; :&nbsp; <%=allreports.get(i+1) %>
										</th>
										<th width="200px">
											REPORT TYPE &nbsp; :&nbsp; <%=allreports.get(i+2) %>
										</th>
										<th width="200px">
											DATE &nbsp; :&nbsp; <%=allreports.get(i+5) %>
										</th>
										<th style="width:100px"><img alt="" src="images/delete.gif" id="<%=allreports.get(i) %>" onclick="">
										</th>
						
								</tr>
							
							</table>
				</h6>
			  <div style="height:100px;padding:0px;margin:0px">
			    <p style="margin:0px;padding:0px" >
					
						<table style="width:600px;height:70px;vertical-align:top;margin:0px;padding:0px">
							
							<tr>
									<td style="font-size: 14px" >
									Written By
									<span style="color: blue;" >	
										<%= allreports.get(i+9).trim() %>	
									</span>
									</td>
								</tr>
							
							<tr>
									<td style="font-size: 14px" >
									<span style="width:590px;height:60px" readonly="readonly">	
										<%= allreports.get(i+3).trim() %>	
									</span>
									</td>
									</tr>
									<tr >
										<td>
											<%
												if((Integer.parseInt(allreports.get(i+6))>=-10) &&(Integer.parseInt(allreports.get(i+6))<=10))
												{
													%>
														previous point&gt;&gt; <%=allreports.get(i+6) %>
													<%
												}
											%>
											
										</td>
										<td width="100px">
											<select id="<%=allreports.get(i) %>">
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
											Write Comment<textarea rows="2" cols="20" id="<%="coment"+allreports.get(i) %>"></textarea>
										</td>
										<td>
											<input type="button" value="Save" onclick="return savePointReport(this.id);" id="<%=allreports.get(i) %>">
										</td>
									</tr>
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