<%@page import="com.morphus.user.DAO.RetriveActivitiesProjectWise"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>mpt</title>
</head>
<body>
<%
String pid=request.getParameter("projectid");

%>

<table width="100%" style="border:1px solid #0000FF" ID="activitiesdefine">
              <tr style="color: #000099;font-size: 15px">
                <th scope="col" align="left">Activity</th>
                <th scope="col" align="left">Order</th>
                <th scope="col" align="left">Startdate</th>
                <th scope="col" align="left">Enddate</th>
                <th scope="col" align="left">duration</th>
                <th scope="col" align="left">Edit</th>
                <th scope="col" align="left">Delete</th>
              </tr>
              
              <%
              	ArrayList <String> activitiesTemp=new RetriveActivitiesProjectWise().getActivitiesOfProject(pid);
              
              	int counter=0;
              	if(!(activitiesTemp.equals("No Message")))
              	{
              	while(counter < activitiesTemp.size())
              	{
              
              %>
               <tr style="color: #000099;font-size: 15px">
                <th scope="col" align="left"><%=activitiesTemp.get(counter+1) %></th>
                <th scope="col" align="left"><%=activitiesTemp.get(counter+2)%></th>
                <th scope="col" align="left"><%=activitiesTemp.get(counter+3)%></th>
                <th scope="col" align="left"><%=activitiesTemp.get(counter+4)%></th>
                <th scope="col" align="left"><%=activitiesTemp.get(counter+5)%></th>
                <th scope="col" align="left">
					<img alt="" src="images/edit.gif"  id="<%=activitiesTemp.get(counter+6)%>" onClick="">
				</th>
				<th scope="col" align="left">
					<img alt="" src="images/delete.gif" id="<%=activitiesTemp.get(counter+6)%>" onClick="">
				</th>
                
              </tr>
              <%
              
              	counter+=8;
              	}
              	}
              
              %>
              
              
              
            </table>
</body>
</html>