<%@page import="com.morphus.user.DAO.RetriveActivityStatusProjects"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>MyProjectTracker</title>

</head>
<%

if((session.getAttribute("uname"))== null)
{%>
 
<jsp:forward page="index.html"></jsp:forward>

<%

}
%>
<body>
<table id="tabledefineproject">
	<tr>
		<td>
			<table style="width: 100%" cellpadding="0" cellspacing="0">
				<tr>
					<td align="center">
						<span style="font-size: 20px;font-family: sans-serif;color: #060C64">Update Activity Status</span>
					</td>
					
					
				</tr>
			
			</table>
		</td>
	</tr>
	<tr>
		<td>
			
			<table width="100%">
				
				<tr>
					<td id="definetext" >
						Date
					</td>
					<td>
						<input type="text"  class="inputfield" id="curdate" name="curdate" readonly="readonly">
					</td>
				</tr>
				
				<tr>
					<td id="definetext">
						Write Message Here
					</td>
					<td>
						<textarea rows="6" style="width: 300px" id="newmessageuser" ></textarea>
						
					</td>
				</tr>
				
			</table>
		
		</td>
	</tr>
	<tr>
		<td align="right">
			<table  cellpadding="0" cellspacing="0" style="margin-right: 150px">
				<tr>
					<td align="left">
						<input type="button" class="buttonm" value="Save" onClick="return submitActivity()" >
					</td>
					<td align="left">
						<input type="Reset" class="buttonm" value="Reset" onClick="return resetMessage();">
					</td>
					
				</tr>
			
			</table>
		</td>
	</tr>
</table>
<table id="tabledefineproject">
	<tr>
		<td>
			<table style="width: 700px" cellpadding="0" cellspacing="0">
				<tr>
					<td align="center">
						<span style="font-size: 20px;font-family: sans-serif;color: #060C64">Activity Outbox</span>
					</td>
					
					
				</tr>
			
			</table>
		</td>
	</tr>
	<tr>
           <td>
           <div style="width:720px;height: 300px;overflow: scroll;">
           
           	<table style="width:700px">
              <tr>
                	<td>
		                <table style="width: 100%;border-bottom: 1px solid #CCCCCC" cellpadding="0" cellspacing="0">
						<tr>
							<th width="20%" align="center">
								SLNO							</th>
							<th width="53%" align="center">
								MESSAGE							</th>
							<th width="27%" align="center">
								DATE							</th>
						</tr>
					</table>
                
               	 </td>
                
              </tr>
              <%
		
			String pid=request.getParameter("pid");
			String userid=request.getParameter("userid");
			String activity=request.getParameter("activity");
			
		
			ArrayList <String> activitystatus=new RetriveActivityStatusProjects().getActivityStatus(pid,userid,activity);
		
			ArrayList <String> forwardtousers=new RetriveActivityStatusProjects().getForwardToOtherUser(pid, userid, activity);
			
			int slmesg=1;
			int count=0;
			String mesgshort="";
			
				while(count < activitystatus.size())
				{
			%>
              
              <tr>
                	<td>
		                <table style="width: 100%;border-bottom: 1px solid #CCCCCC" cellpadding="0" cellspacing="0" onclick="return displayMesgDetailsUser(this.id)" id="<%=activitystatus.get(count)%>">
						<tr>
							<td width="20%" align="center">
							
								<%= slmesg %>						</td>
							<td width="53%" >
								<%	if((activitystatus.get(count+1)).length() > 30)
									{
									mesgshort=(activitystatus.get(count+1)).substring(0, 30);	
									}
									else
									{
										mesgshort=(activitystatus.get(count+1));	
									}
								
								%>
								<%=mesgshort%>						</td>
							<td width="27%" align="center">
							
								<%=(activitystatus.get(count+2)).substring(0, 10)%>						</td>
						</tr>
					</table>
                
               	 </td>
                
              </tr>
              <%
              	
              		count+=3;
              	slmesg++;
				}
              
              %>
            </table>
           </div>
			
			</td>
			
           
     </tr>
	
	<!--	<tr>
		<td>
		
		
			<table width="100%">
				<tr>
					<td width="50%">
						<table width="100%">
							<tr>
								<td id="definetextsmall">
									My Message :
								</td>
								<td>
									
									<textarea rows="6" style="width: 300px" id="prevmessageuser" readonly="readonly">
									
										
										</textarea>
									
								</td>
								<td>
									<input type="button" value="Edit" onClick="return editPrevMessageActivity();" id="messageedit">
								</td>
							</tr>
						</table>
					</td>
					
				</tr>
				
				</table>
			</td>
		</tr>
		<tr>
		<td>
			<table width="100%">
				<tr>
					<td width="50%">
						<table width="100%">
							<tr>
								<td id="definetextsmall">
									Forward To Admin :
								</td>
								<td>
									<span class="projdtls">
									
									
									
									</span>
								</td>
							</tr>
						</table>
					</td>
					
				</tr>
				
				</table>
			</td>
		</tr>
		
		
		<tr>
		<td>
			<table width="100%">
				<tr>
					<td width="50%">
						<table width="100%">
							<tr>
								<td id="definetextsmall">
									Approval Status Admin
								</td>
								<td>
									<span class="projdtls">
									
								
									
									</span>
								</td>
							</tr>
						</table>
					</td>
					
				</tr>
				
				</table>
			</td>
		</tr>
		
		<tr>
		<td>
			<table width="100%">
				<tr>
					<td width="50%">
						<table width="100%">
							<tr>
								<td id="definetextsmall">
									Message From Admin
								</td>
								<td>
									<span class="projdtls">
									
								
									
									</span>
								</td>
							</tr>
						</table>
					</td>
					
				</tr>
				
				</table>
			</td>
		</tr>
		<tr>
		<td>
			<table width="100%">
				<tr>
					<td width="50%">
						<table width="100%">
							<tr>
								<td id="definetextsmall">
									Forwarded To Users :
								</td>
								<td>
									<span class="projdtls">
									
									
									</span>
								</td>
							</tr>
						</table>
					</td>
					
				</tr>
				
				</table>
			</td>
		</tr>-->
		
</table>



</body>
</html>