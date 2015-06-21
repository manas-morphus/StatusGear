package com.morphus.user.DAO;


import java.util.ArrayList;



public class RetriveProjectsClientWise {
	
	
	public String getProjectName(String ClientId)
	{
			
		
		String clientname="{";
		
		
		ArrayList<String> allprojects=new RetriveAllProjectsAdmin().getOnlyProjectNamesForClient(ClientId);
		
		clientname+="\"prjects\""+":"+"[";

			int i=0;
		while(i<allprojects.size()-1)
		{
			clientname+="{"+"\"projectid\""+":"+"\""+allprojects.get(i)+"\""+","+"\"projectname\""+":"+"\""+allprojects.get(i+1)+"\""+"},";
		
					

			
			i+=2;
		}
		
		
		clientname = clientname.substring(0, clientname.length()-1);
		
		clientname+="]}";
		
		return clientname;
		
	} 
	
	

}
