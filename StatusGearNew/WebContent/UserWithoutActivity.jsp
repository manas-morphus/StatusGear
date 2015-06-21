<%@page import="com.morphus.user.DAO.ReportManage"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>MyProjectTracker</title>
<script type="text/javascript" src="js/jquery-1.10.0.js"></script>
<script type="text/javascript" src="js/jquery-ui-1.10.3.custom.js"></script>
<script type="text/javascript" src="js/mptuser.js"></script>
<script type="text/javascript" src="js/messageuser.js"></script>


<link  type="text/css" rel="stylesheet"  href="css/style.css">
<link  type="text/css" rel="stylesheet"  href="css/jquery-ui-1.10.3.custom.css">
<style type="text/css">
                 
              
                #menu {
							width:150px;
							font-size:14px;
							font-weight:300;
							font-family:Arial, Helvetica, sans-serif;
							background-color:#FFFFFF;
							                           
                            position:left;
                      }
                #menu li a
				{
					
					color:#000080;
				}
				#menu li a:hover
				{
				
					color:#FF0000;
				}
				#menu li ul
				{
					width:150px;
					background-color:#FFFFFF;
				}
</style>
</head>
<%

if((session.getAttribute("uname")==null))
{%>
 
<jsp:forward page="index.html"></jsp:forward>

<%
	
}
%>



<body id="mptadmin" onload="return displaymenu()">
<table id="tableindex1" width="100%">
<tr>
	<td>
		<table id="tableadmintop" width="100%">
			<tr>
				<td>
					<span >WELCOME  ${ uname}</span>
					
				</td>
				<td>
					<span > type of user ${ utype}</span>
					
				</td>
				<td>
					<span > Assigned Activity ${uactivity}</span>
					
				</td>
				<td align="right">
					<img alt="" src="images/logout.jpg" onclick="window.location='index.html';">
					
				</td>
			</tr>
		</table>
	</td>
</tr>
	
<tr>
	<td>
		<table width="100%" id="tableadminmid" border="1px solid #560739">
			<tr>
				<td  id="adminleftdiv" valign="top">
				
					<ul id="menu">
								  <li><a href="#" >Report Main</a>
								  		<ul>
								  		<li><a href="#" onclick="return writeReportUser();">Write Report</a></li>
								  		<%
								  			
								  			ArrayList <String> status=new ReportManage().checkMasterReportWriter((String)session.getAttribute("userid"));
								  			
								  			if(status.size()>0)
								  			{
								  		%>
								  		
								  		<li><a href="#" onclick="return writeReportUserOthers();">Write Report(Other)</a></li>
							          	<%
								  			}
							          	%>
							          	<li><a href="#" >Draft Report</a></li>
							          	<li><a href="#" onclick="return viewSentReportUser();">Sent Report</a></li>
							          	<li><a href="#" onclick="return viewReportUserWithComments();">Remark</a></li>
							        </ul>
								  					  
								  
								  </li>
								  <li>-</li>
								  <li><a href="#" >Mail</a>
								  		
								  	<ul>
								  		<li><a href="#" onclick="return loadCreateMessageAdmin();">Write Message</a></li>
							          	<li><a href="#" onclick="return loadSimpleMessageInboxAdmin();">Inbox</a></li>
								  		<li><a href="#" >Sent</a></li>
										<li><a href="#" >Draft</a></li>
								  		
							        </ul>				  
								  
								  </li>
								  <li>-</li>
								  
								 <li><a href="#" >Utilities</a>
								  		<ul>
								  		<li><a href="#" onClick="return loadViewReportsAdmin();">Change Password</a></li>
							          	
								  		
							        </ul>
								  					  
								  
								  </li>
								  <li>-</li>
								</ul>
					
				</td>
				<td  id="usermiddlediv" valign="top">
					
				</td>
				
			</tr>
		</table>
	</td>
</tr>
<tr>
	<td>
		<table width="100%">
			<tr>
				<td>
					<div id="div1111">&copy;www.markelinfotech.com all rights reserved</div>
				</td>
			</tr>
		</table>
	</td>
</tr>


</table>




</body>
</html>