package com.morphus.user.DAO;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

public class GlobalFunctions {
	
	public static String getCurDate()
	{
			DateFormat df=new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
		
		Calendar cal=Calendar.getInstance();
		
		String date=df.format(cal.getTime());
		
		return date;
	}
	
	public static String convertDateToMysqlFormat(String dateformat)
	{
		dateformat=dateformat.substring(0,10);	
		String datetemp[]=dateformat.split("-");
		
		
		String date=datetemp[2]+"/"+datetemp[1]+"/"+datetemp[0];
		
		return date;
	}
	public static String mysqlDateToIndianFormat(String dateformat)
	{
		
		dateformat=dateformat.substring(0,10);
		String datetemp[]=dateformat.split("-");
		
		
		String date=datetemp[2]+"-"+datetemp[1]+"-"+datetemp[0];
		
		return date;
	}
	public static String fullProjectStatus(String statusFULL)
	{
		if(statusFULL.trim().equalsIgnoreCase("sta"))
		{
			statusFULL="STARTED";
		}
		
		else if(statusFULL.trim().equalsIgnoreCase("onp"))
		{
			statusFULL="ON PROGRESS";
		}
		else if(statusFULL.trim().equalsIgnoreCase("hal"))
		{
			statusFULL="HALTED";
		}
		else if(statusFULL.trim().equalsIgnoreCase("com"))
		{
			statusFULL="COMPLETED";
		}
		else if(statusFULL.trim().equalsIgnoreCase("NA"))
		{
			statusFULL="NOT AVAILABLE";
		}
		
		return statusFULL;
	}
	
	

}
