<%@page import="com.morphus.user.DAO.MailManage"%>
<%@page import="com.morphus.user.DAO.RetriveUsers"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>mpt</title>
</head>
<%
	String touser=(request.getParameter("touser")!=null)?request.getParameter("touser"):"";
	String mesgsubject=(request.getParameter("mesgsubject")!=null)?request.getParameter("mesgsubject"):"";
	String mesgcontent=(request.getParameter("mesgcontent")!=null)?request.getParameter("mesgcontent"):"";
	
	String option=(request.getParameter("opt")!=null)?request.getParameter("opt"):"NA";
	
	String fromuser=(String)session.getAttribute("userid");
	
	
	int opt=0;
	if(!option.equalsIgnoreCase("NA"))
	{
		opt=Integer.parseInt(option);	
	}
	int rows=0;
	if(opt==1)
	{
		rows=new MailManage().saveMessage(fromuser, touser, mesgsubject, mesgcontent, opt)	;
	}
	if(opt==2)
	{
		rows=new MailManage().saveMessage(fromuser, touser, mesgsubject, mesgcontent, opt)	;
	}

%>
<%=(rows>0 && opt==1)?"Message sent successfully to User-->"+touser:((rows==0 && opt==1)?"Error!!":"") %>

<body>

<table width="50%" height="425" border="0" style="background-color:#66CCCC">
  <tr>
    <td width="26%" scope="col">TO</td>
    <td width="74%" scope="col">
    	<select style="width:300px;height:35px" name="touser" id="touser">
    	<%
    	ArrayList <String> users=new RetriveUsers().getUsers();
		int i2=0;
		
		while(i2< users.size())
		{
			%>
			
			<option><%= users.get(i2+1) %></option>
			
			<%
			i2+=4;
		}
    	
    	%>
    	
    	</select>
    	
    </td>
  </tr>
  <tr>
    <td height="36" valign="top">Subject</td>
    <td valign="top"><input name="mesgsubject" type="text" style="width:300px;height:30px" id="mesgsubject"/></td>
  </tr>
  <tr>
    <td height="255" valign="top">Write Message</td>
    <td valign="top"><textarea name="mesgcontent" cols="" rows="" style="width:350px;height:300px;" id="mesgcontent"></textarea></td>
  </tr>
  <tr>
    <td height="35">&nbsp;</td>
    <td><input name="Send" type="button" style="width:70px;" value="Send" onclick="return sendMessage();"/>
    <input name="Save" type="button" style="width:70px;" value="Save" onclick="return saveMessage();"/></td>
  </tr>
</table>

</body>
</html>