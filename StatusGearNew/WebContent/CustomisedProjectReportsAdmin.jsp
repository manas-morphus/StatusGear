<%@page import="com.morphus.user.DAO.UpdateProjectStatus"%>
<%@page import="com.morphus.user.DAO.GlobalFunctions"%>
<%@page import="com.morphus.user.DAO.RetriveClients"%>
<%@page import="com.morphus.user.DAO.RetriveUsers"%>
<%@page import="com.morphus.user.DAO.RetriveActivities"%>
<%@page import="com.morphus.user.DAO.RetriveAllProjectsAdmin"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>mpt</title>

<style type="text/css">  
   .custom-combobox {
position: relative;
display: inline-block;

}
.custom-combobox-toggle {
position: absolute;
top: 0;
bottom: 0;
margin-left: -1px;
padding: 0;
/* support: IE7 */
*height: 1.7em;
*top: 0.1em;
font-size: 15px;

}
.custom-combobox-input {
margin: 0;
padding: 0.1em;
font-size: 15px;
font-family: monospace;
width: 120px
}

   </style>  
   <script>  
   (function( $ ) {
	   $.widget( "custom.combobox", {
	   _create: function() {
	   this.wrapper = $( "<span>" )
	   .addClass( "custom-combobox" )
	   .insertAfter( this.element );
	   this.element.hide();
	   this._createAutocomplete();
	   this._createShowAllButton();
	   },
	   _createAutocomplete: function() {
	   var selected = this.element.children( ":selected" ),
	   value = selected.val() ? selected.text() : "";
	   this.input = $( "<input>" )
	   .appendTo( this.wrapper )
	   .val( value )
	   .attr( "title", "" )
	   .addClass( "custom-combobox-input   ui-corner-left" )
	   .autocomplete({
	   delay: 0,
	   minLength: 0,
	   source: $.proxy( this, "_source" )
	   })
	   .tooltip({
	   tooltipClass: "ui-state-highlight"
	   });
	   this._on( this.input, {
	   autocompleteselect: function( event, ui ) {
	   ui.item.option.selected = true;
	   this._trigger( "select", event, {
	   item: ui.item.option
	   });
	   },
	   autocompletechange: "_removeIfInvalid"
	   });
	   },
	   _createShowAllButton: function() {
	   var input = this.input,
	   wasOpen = false;
	   $( "<a>" )
	   .attr( "tabIndex", -1 )
	   .attr( "title", "Show All Items" )
	   .tooltip()
	   .appendTo( this.wrapper )
	   .button({
	   icons: {
	   primary: "ui-icon-triangle-1-s"
	   },
	   text: false
	   })
	   .removeClass( "ui-corner-all" )
	   .addClass( "custom-combobox-toggle ui-corner-right" )
	   .mousedown(function() {
	   wasOpen = input.autocomplete( "widget" ).is( ":visible" );
	   })
	   .click(function() {
	   input.focus();
	   // Close if already visible
	   if ( wasOpen ) {
	   return;
	   }
	   // Pass empty string as value to search for, displaying all results
	   input.autocomplete( "search", "" );
	   });
	   },
	   _source: function( request, response ) {
	   var matcher = new RegExp( $.ui.autocomplete.escapeRegex(request.term), "i" );
	   response( this.element.children( "option" ).map(function() {
	   var text = $( this ).text();
	   if ( this.value && ( !request.term || matcher.test(text) ) )
	   return {
	   label: text,
	   value: text,
	   option: this
	   };
	   }) );
	   },
	   _removeIfInvalid: function( event, ui ) {
	   // Selected an item, nothing to do
	   if ( ui.item ) {
	   return;
	   }
	   // Search for a match (case-insensitive)
	   var value = this.input.val(),
	   valueLowerCase = value.toLowerCase(),
	   valid = false;
	   this.element.children( "option" ).each(function() {
	   if ( $( this ).text().toLowerCase() === valueLowerCase ) {
	   this.selected = valid = true;
	   return false;
	   }
	   });
	   // Found a match, nothing to do
	   if ( valid ) {
	   return;
	   }
	   // Remove invalid value
	   this.input
	   .val( "" )
	   .attr( "title", value + " didn't match any item" )
	   .tooltip( "open" );
	   this.element.val( "" );
	   this._delay(function() {
	   this.input.tooltip( "close" ).attr( "title", "" );
	   }, 2500 );
	   this.input.data( "ui-autocomplete" ).term = "";
	   },
	   _destroy: function() {
	   this.wrapper.remove();
	   this.element.show();
	   }
	   });
	   })( jQuery );
	   $(function() {
	   $( ".select-report" ).combobox();
	   $( "#toggle" ).click(function() {
	   $( ".select-report" ).toggle();
	   });
	   });
   </script>
</head>
<%
	String prjname=((request.getParameter("prjname"))!=null)?(request.getParameter("prjname")):"";
	String activity=((request.getParameter("activity"))!=null)?(request.getParameter("activity")):"";
	String userid=((request.getParameter("userid"))!=null)?(request.getParameter("userid")):"";
	String clientname=((request.getParameter("clientname"))!=null)?(request.getParameter("clientname")):"";
	String priorityprj=((request.getParameter("priorityprj"))!=null)?(request.getParameter("priorityprj")):"";
	String usertype=((request.getParameter("usertype"))!=null)?(request.getParameter("usertype")):"";

	//out.print(prjname);out.print(activity);out.print(userid);out.print(clientname);out.print(priorityprj);out.print(usertype);


%>

<body>
	
	<table class="roundborder"  id="table-prjrpt-1">
		<tr>
			<td colspan="6">
				Select Options
			</td>
		</tr>
		<tr>
			<td align="left">
				Project Name
			</td>
			<td align="left">
				Activity
			</td>
			<td align="left">
				Staff/User
			</td>
			<td align="left">
				Client Name
			</td>
			<td align="left">
				Priority
			</td>
			<td align="left">
				Status
			</td>
		</tr>
		<tr>
			<td colspan="6">
				
				<table width="100%" cellspacing="5" >
					<tr>
						<td align="left">
						<%
						ArrayList <String> ProjectId=new RetriveAllProjectsAdmin().getProjects();
						int count=0;
						%>
						<select  id="prjname" class="select-report" >
						<option value="noselect">----Select----</option>
						<% 
							while(count<ProjectId.size())
							{
						%>	
							<option value="<%=ProjectId.get(count) %>"><%=ProjectId.get(count+1) %></option>
							<%
								count+=4;
							}
							%>
						</select>
					</td>
			<td align="left">
						<select  id="activity" class="select-report">
						<option value="noselect">----Select----</option>
						<%
							ArrayList <String> activities=new RetriveActivities().getActivities();
							int i1=0;
							while(i1< activities.size())
							{
								%>
								<option><%= activities.get(i1+1) %></option>
								<%
								i1+=3;
							}
						%> 	
						</select>
					
					</td>
			
			<td align="left">
				<select class="select-report "  id="userid">
					<option selected="selected" value="noselect">----Select----</option>
						<%
							
							
							ArrayList <String> users=new RetriveUsers().getUsers();
							int i2=0;
							
							while(i2< users.size())
							{
								%>
								
								<option value="<%= users.get(i2+1) %>"><%= users.get(i2) %></option>
								
								<%
								i2+=4;
							}
						%>	
				</select>
			</td>
			<td align="left">
				<select   class="select-report" id="clientname">
					<option selected="selected" value="noselect">----Select----</option>
						<%
							
							
							ArrayList <String> clients=new RetriveClients().getAllclients();
							int i3=0;
							
							while(i3< clients.size())
							{
								%>
								
								<option value="<%= clients.get(i3+11) %>"><%= clients.get(i3+1) %></option>
								
								<%
								i3+=15;
							}
						%>	
				</select>
			</td>
			<td align="left" >
					<select  id="priorityprj" class="select-report" >
					<option selected="selected" value="3">NORMAL</option>
					<option value="1">HIGH</option>
					<option value="2">MEDIUM</option>
					<option value="4">LOW</option>
					</select>
			</td>
			<td align="left">
						<select  id="usertype" class="select-report ">
							<option value="sta">Started</option>
							<option value="onp">On Progress</option>
							<option value="hal">Halted</option>
							<option value="com">Completed</option>
							
						</select>
					</td>
					</tr>
					<tr>
						<td colspan="6" align="center">
							<input type="button" value="Search" onclick="return searchCustomisedProjectReports();">
						</td>
					</tr>
							
				</table>
				
				
				</td>
				
		</tr>
		
	</table>
	<table class="roundborder"  id="table-prjrpt-2">
		<tr>
			<td valign="top">
			<div  style="overflow: auto;height: 100%;left: 30px;vertical-align: top;" class="roundborder">
			<div  id="ViewProjectsMain">
	<div id="ViewChildDivHead">
		<table style="width:100%;">
				<tr>
				
					<td>
							<table  style="width:100%;border:1px solid #000066">
								<tr>
										<th width="100px">
					
											SLNO
										</th>
										<th width="200px">
											PROJECT NAME
										</th>
										<th width="200px">
											FOR CLIENT
										</th>
										<th width="200px">
											DATE OF COMMENCEMENT 
										</th>
										<th width="100px">
											DURATION
										</th>
										<th width="100px">
											STATUS
										</th>
						
								</tr>
							
							</table>
					</td>
				
					
				</tr>
			</table>
	
	</div>
	
<%

ArrayList <String> projects=new RetriveAllProjectsAdmin().getCustomisedProjectDetails(prjname, activity, userid, clientname, priorityprj, usertype);

int slno=1;
int j=0;

	while(j< projects.size())
	{
	
%>	
	
	<div class="ViewChildDiv" onclick="return ViewProjDtlAdmin(this.id);" id="<%= projects.get(j)	 %>">
		
		<table style="width:100%;">
				<tr>
					<td>
							<table style="width:100%;border:1px solid #000066">
								<tr>
										<tr>
											<th width="100px">
											
												<%= slno	 %>
											</th>
											<th width="200px">
												<%= projects.get(j+1)	 %>
											</th>
											<th width="200px">
												<%= projects.get(j+2)	 %>
											</th>
											<th width="200px">
												<%= 
													GlobalFunctions.mysqlDateToIndianFormat((String)projects.get(j+3).subSequence(0, 10))
														 %>
											</th>
											<%
											ArrayList <String> projecttotdays=new RetriveAllProjectsAdmin().getProjectsTotalDays(projects.get(j));
											
											%>
											<th width="100px">
											
												<%= projecttotdays.get(0)	 %>
											</th>
											
											<th width="100px">
											<%
												ArrayList <String> project_status=new UpdateProjectStatus().getOneProjectStatus(projects.get(j));
												
												String project_status_short="";
												if(project_status.size()== 0)
													project_status_short="NA";
												else
													project_status_short=project_status.get(2);
											%>
											
												<%=GlobalFunctions.fullProjectStatus(project_status_short)  	 %>
											</th>
													
										</tr>
							</table>
					</td>
				</tr>
			</table>
			
	</div>
	<%
	
	slno++;
	j+=4;
	}
	
	
	%>

</div>
			
			
			</div>
			</td>
		</tr>
	
	</table>

</body>
</html>