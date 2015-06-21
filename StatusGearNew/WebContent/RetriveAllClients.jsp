<%@page import="com.morphus.user.DAO.RetriveClients"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="com.morphus.user.DAO.RetriveActivities"%>
<%

String clients=new RetriveClients().getClients();


System.out.println(clients);
response.setContentType("application/json");



%>
<%=clients %>