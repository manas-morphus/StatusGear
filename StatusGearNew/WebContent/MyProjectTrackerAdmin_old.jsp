<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>MyProjectTracker</title>
<script type="text/javascript" src="js/jquery-1.10.0.js"></script>
<script type="text/javascript" src="js/jquery-ui-1.10.3.custom.js"></script>
<script type="text/javascript" src="js/mptadmin.js"></script>
<script type="text/javascript" src="js/DefineActivity.js"></script>
<script type="text/javascript" src="js/AddNewUser.js"></script>
<script type="text/javascript" src="js/AssignActivityToUser.js"></script>
<script type="text/javascript" src="js/AddNewClient.js"></script>
<script type="text/javascript" src="js/AddNewProject.js"></script>
<script type="text/javascript" src="js/ViewProjectsAdmin.js"></script>
<script type="text/javascript" src="js/messageadmin.js"></script>
<script type="text/javascript" src="js/SearchProjectAdmin.js"></script>





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



<body id="mptadmin" onLoad="return displaymenu()">
<table class="roundborder" width="100%">
<tr>
	<td>
		<table id="tableadmintop" width="100%" class="roundborder">
			<tr>
				<td>
					<span class="textheader">WELCOME #</span><span class="textheader1"> ${uname}</span>
					
				</td>
				<td>
					<span class="textheader">User Type #</span><span class="textheader1">  ${utype}</span>
					
				</td>
				<td align="right">
					<img alt="" src="images/logout.jpg" onClick="window.location='index.html';">
					
				</td>
			</tr>
		</table>
	</td>
</tr>
	
<tr>
	<td>
		<table width="100%" id="tableadminmid" >
			<tr>
				<td  id="adminleftdiv" valign="top" class="roundborder">
				
					<ul id="menu">
								 
								  <li><a href="#" >Define Main</a>
								  		<ul>
								  		<li><a href="#" onClick="return loadDefineActivity();">Define Activities</a></li>
							          	<li><a href="#" onClick="return loadAddNewUser();">Add New Users</a></li>
								  		<li><a href="#" onClick="return loadAssignActivityToUser();">Assign Activity to User</a></li>
								  		<li><a href="#" onClick="return loadAddNewClient();">Add New Clients</a></li>
								  		<li><a href="#" onClick="return loadMasterReportWriter();">MasterReportWriter</a></li>
							        </ul>
								  					  
								  
								  </li>
								  <li>-</li>
								   <li><a href="#" >Project Main</a>
								  		<ul>
								  		<li><a href="#" onClick="return loadAddNewProject();">Add New Projects</a></li>
								  		<li><a href="#" onClick="return loadChangeProjectStatus();">Change Project Status</a></li>
							          	<li><a href="#" onClick="return loadViewProjectsAdmin();">Project Reports</a></li>
								  		<li><a href="#" onClick="return loadMessageInboxAdminProjects();">Messages</a></li>
								  		
							        </ul>
								  					  
								  
								  </li>
								  <li>-</li>
								 	 <li><a href="#" >Mail</a>
								  		<ul>
								  		<li><a href="#" onClick="return loadCreateMessageAdmin();">Write Message</a></li>
							          	<li><a href="#" onClick="return loadSimpleMessageInboxAdmin();">Inbox</a></li>
								  		<li><a href="#" onClick="return loadMessageOutboxAdmin();">Sent</a></li>
										<li><a href="#" onClick="return loadMessageDraftAdmin();">Draft</a></li>
								  		
							        </ul>
								  					  
								  
								  </li>
								  <li>-</li>		  
								  
								 <li><a href="#" >General Reports </a>
								  		<ul>
								  											
								  		<li><a href="#" onClick="return loadViewReportsAdmin();">NotVerified</a></li>
							          	<li><a href="#" onClick="return loadViewReportsAdminVerified();">Verivied</a></li>
								  		<li><a href="#" onClick="return loadSearchReportAdmin();">Search</a></li>
								  		
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
				<td  id="adminmiddlediv" valign="top" class="roundborder">
					
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
					<div id="div1111">&copy;www.morphustechnology.com all rights reserved,cont#9439493434</div>
					</td>
			</tr>
		</table>
	</td>
</tr>


</table>




</body>
</html>