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



<a href="css/jquery.min.js"></a>
<link rel="stylesheet" type="text/css" href="css/input.css">
<link rel="stylesheet" type="text/css" href="css/styles.css">
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



<body  background="images/bgimage.jpg" id="mptadmin" onLoad="return displaymenu()">
<table align="center" class="roundborder" width="92%">
<tr>
	<td>
      <div align="center">
        <table id="tableadmintop" width="100%" class="roundborder">
          <tr>
            <td width="41%" height="48">
              <span class="textheader"> Welcome #</span><span class="textheader1"> ${uname}</span>
              
              </td>
            <td width="31%">
              <span class="textheader">User Type #</span><span class="textheader1">  ${utype}</span>
              
            </td>
            <td width="28%" align="right">
              <input type="button"   value="Logout" class="myButton"  onClick="window.location='index.html';"></td>
            </tr>
          </table>
    </div></td>
</tr>
	
<tr>
	<td>
		<div align="center">
		  <table width="97%" id="tableadminmid" >
		    <tr>
		      <td width="17%" height="549" valign="top">
		        
		        <div id='cssmenu' class="sidebar_section">
		          
		          <ul>
		            
		            <li class='has-sub'>
		              <a href='#'>
	                  <span>Define main</span>
	                  </a>
		              <ul>
		                <li class='active'>
		                  <a href='#' onClick="return loadDefineActivity()";>
		                    <samp>Define Activities</samp>
                          </a>
		                  </li>
		                
		                <li class='active'>
		                  <a href="#" onClick="return loadAddNewUser()";>
		                    <samp>Add New User</samp>
	                      </a>
		                  </li>
		                
		                <li class='active'>
		                  <a href="#" onClick="return loadAssignActivityToUser();">
		                    <samp>Assign Activity to User</samp>
	                      </a>
		                  </li>
		                
		                <li class='active'>
		                  <a href="#" onClick="return loadAddNewClient();">
		                    <samp>Add New Client</samp>
	                      </a>
		                  </li>
		                
		                <li class='active'>
		                  <a href="#" onClick="return loadMasterReportWriter();">
		                    <samp>Master Report Write</samp>
	                      </a>
		                  </li>
		                
		                </ul>
	                 </li>
		            
		            <li class='has-sub'>
		              <a href='#'>
	                  <span>Project main</span>
	                  </a>
		              
		              <ul>
		                
		                <li class='active'>
		                  <a href="#" onClick="return loadAddNewProject();">
		                    <samp>Add new Project</samp>
	                      </a>	
		                  </li>
		                
		                <li class='active'>
		                  <a href="#" onClick="return loadChangeProjectStatus();">
		                    <samp>Change Project Status</samp>
	                      </a>
		                  </li>
		                
		                <li class='active'>
		                  <a href='#' onClick="return loadViewProjectsAdmin();" >
		                    <samp>Project report</samp>
	                      </a>
		                  </li>
		                
		                <li class='active'>
		                  <a href='#' onClick="return loadMessageInboxAdminProjects();">
		                    <samp>Message</samp>
	                      </a> 
		                  </li>   
		                </ul>
		              
	                 </li>
		            
		            <li class='has-sub'>
		              <a href='#'>
  <span>Mail</span>
  </a>
		              <ul>
		                
		                <li class='active'>
		                  <a href="#" onClick="return loadCreateMessageAdmin();">
	                      <samp>Write Message</samp>
	                      </a>
	                    </li>
		                
		                <li class='active'>
		                  <a href="#" onClick="return loadSimpleMessageInboxAdmin();">
	                      <samp>Inbox</samp>
	                      </a>
	                    </li>
		                
		                <li class='active'>
		                  <a href="#" onClick="return loadMessageOutboxAdmin();">
	                      <samp>Sent</samp>
	                      </a>
	                    </li>
		                
		                <li class='active'>
		                  <a href="#" onClick="return loadMessageDraftAdmin();">
	                      <samp>Draft</samp>
	                      </a>
	                    </li>
		                
	                  </ul>
  </li>
		            
  <li class='has-sub'>
  <a href='#'>
  <span>General Report</span>
  </a>
    <ul>
      
      <li class='active'>
        <a href='#' onClick="return loadViewReportsAdmin();">
          <samp>Not Verified</samp>
          </a>
        </li>
      
      <li class='active'>
        <a href='#' onClick="return loadViewReportsAdminVerified();">
          <samp>Varified</samp>
          </a>
        </li>
      
      <li class='active'>
        <a href="#" onClick="return loadSearchReportAdmin();">
          <samp>Search</samp>
          </a>
        </li>
      
      </ul>
  </li>
		            
  <li class='has-sub'>
  <a href='#'>
  <span>utilities</span>
  </a>
    <ul>
      <li class='active'>
        <a href="#" onClick="return loadViewReportsAdmin();">
          <samp>Change Password</samp>
          </a>
        </li>
      
      </ul>
  </li>
  </ul>
  </div>
		        </td>
		      <td width="83%" valign="top" class="roundborder"  id="adminmiddlediv"><div align="center">
		        <p>&nbsp;</p>
		        <p><img src="images/gear.png" width="310" height="277" alt="gr"></p>
				<p><img src="images/cooltext1393779817.png" width="441" height="78" alt="cp"></p>
		        <p class="textheader"><strong><u><h3>Construction Work Status Traker</h3></u></strong></p>
		        <p class="textheader">&nbsp;</p>
		      </div>
		        
	          </td>
		      
		      </tr>
		    </table>
    </div></td>
</tr>
<tr>
	<td>
		<div align="center">
		  <table width="100%">
		    <tr>
		      <td>
		        <div id="div1111">&copy;www.markelinfotech.com ,cont#9439493434</div>
		        </td>
		      </tr>
		    </table>
    </div></td>
</tr>


</table>




</body>
</html>