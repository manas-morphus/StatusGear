function defineProjectMain()
{
	
	$("#curdate").datepicker({dateFormat:"dd-mm-yy"}).datepicker("setDate",new Date());
	$("#dateofcomence").datepicker({dateFormat:"dd-mm-yy"}).datepicker("setDate",new Date());
	$("#proenddate").datepicker({dateFormat:"dd-mm-yy"}).datepicker("setDate",new Date());
	
	$("#clientname").focus();
	
	$("#projsuccessmesg").hide();
	
	retriveAllClients();
	retriveActivitiesprj();
}
function retriveAllClients()
{
	
	$.ajax({
		url:"RetriveAllClients.jsp",
		dataType:"json",
		success: displayAllClients,
		cache:false,
		//error :function(){alert("error");}
		
	});



}
function displayAllClients(data)
{
	
	var clientnames="<option value=\"select\" selected=\"selected\" id=\"clientoptions\">select</option>";
	
	$.each(data.allclient,function(i,clients){
		
		clientnames+="<option>"+clients["clientname"]+"</option>";
		
	});
	
	$("#allclients").html("");
	$("#allclients").append(clientnames);


}
function displayClientName()
{
	
	var selectedclientid=$("#allclients").val();
	
	var clientid="clientid="+selectedclientid+"&"+"option=1";
	$.ajax({
		url:"RetriveClientName.jsp",
		data:clientid,
		
		success: displayName,
		cache:false,
		//error :function(){alert("error");}
		
	});
	


}
function displayName(data)
{
	
	$("#clientname").val(data);



}
function retriveActivitiesprj()
{
	
	
	$.ajax({
		url:"RetriveActivities.jsp",
		dataType:"json",
		success: displayActivitiesprj,
		cache:false,
		//error :function(){alert("error");}
		
	});

}
function displayActivitiesprj(data)
{
	
	var actnames="";
	
	$.each(data.activities,function(i,activity){
		
		actnames+="<option>"+activity["actname"]+"</option>";
		
	});
	$("#allactivities").html("");
	$("#allactivities").append(actnames);


}

var Already_Sel_Activity=new Array();
var actcounter=0;
var activities="";
function selectActivities()
{
	
var selectedActivities=$("#allactivities").val();



	/*var button1="<table width=\"100%\">"+
					"<tr>"+
					"<td  align=\"right\">";


	var button2="</td>"+		
					"<td  align=\"right\">"+
							"<input type=\"button\" style=\"width: 70px;height: 25px\" value=\"Define\" onclick=\"return defineActivity();\">"+
						"</td>"+
						"<td  align=\"right\">"+
							"<input type=\"button\" style=\"width: 70px;height: 25px\" value=\"Edit\">"+
						"</td>"+
						"<td  align=\"right\">"+
							"<input type=\"button\" style=\"width: 70px;height: 25px\" value=\"Delete\">"+
						"</td>"+
	
						"</tr>"+
						"</table>";*/
	
		actcounter=Already_Sel_Activity.length;
		
		if(actcounter==0)
		{
		
			for(var i=0; i < selectedActivities.length ;i++ )
			{
				var search_activity=selectedActivities[i];
				
				Already_Sel_Activity[actcounter]=search_activity;
				actcounter=actcounter+1;
			}
		}
		else
		{
		
				for(var i=0; i < selectedActivities.length ;i++ )
				{
					var search_activity=selectedActivities[i];
					var status_duplicate=false;
					for(var i1=0; i1 < Already_Sel_Activity.length ;i1++ )
					{
					
						if(search_activity == Already_Sel_Activity[i1])
						{
							status_duplicate=true;
							break;
							
						}
					}
					
					if(status_duplicate == false)
						{
						
							Already_Sel_Activity[actcounter]=search_activity;
							actcounter=actcounter+1;
						
						}
				
				}
		
		}

	
	
		activities="";
	
		for(var i=0; i < Already_Sel_Activity.length ;i++ )
		{
		
			 activities+=" <li class=\"ui-state-default\" ><span class=\"ui-icon ui-icon-arrowthick-2-n-s\"></span>"+Already_Sel_Activity[i]+"</li>";
			
		}
		
		$("#sortable").html("");
	
	$("#sortable").append(activities);

}
function resetActivities()
{
	
	$("#sortable").html("");
	activities="";
	Already_Sel_Activity=[];
}
var activityorder=new Array();;
function defineActivities()
{
	
	var defineActivity ="";
	
	var activityButtons="";
	
	$("#sortable").children().each(function (i) {
        var li = $(this);
        defineActivity=li.text();
        
        activityorder[i]=defineActivity;
        activityButtons +="<input type=\"button\" value=\""+defineActivity+"\" style=\"width :130px;height :20px;font-size:9px\" onclick=\"return loadpageDefine(value)\">"
        +"<br>";
        
        
        
    
         
    });
	
	$("#divfinalactivities").html(activityButtons);


}
function loadpageDefine(data)
{
	
	$("#divfinalactivitiesdef").load("ScheduleActivityProjects.jsp",data,function(){
		
		
		$("#ActivityName").val(data);
		
		var order=-1;
		 for (var j=0; j<activityorder.length; j++) {
		        if (activityorder[j].match(data))
		        	{
		        	
		        	order= j;
		        	break;
		        	}
		        	
		    }
		 $("#ActivityOrder").val(order+1);
	
		 if( (order+1) == 1 || alldefactivity.length == 0)	
			{
						 $( "#startdate" ).datepicker({
								dateFormat:"dd-mm-yy",
							      showOn: "button",
							      buttonImage: "images/calendar.gif",
							      buttonImageOnly: true
						    });
							$( "#enddate" ).datepicker({
									dateFormat:"dd-mm-yy",
								      showOn: "button",
								      buttonImage: "images/calendar.gif",
								      buttonImageOnly: true
							  });
		
			}
			else if((order+1) > 1 && ((order+1)-alldefactivity.length) <=1 )
			{
			
								
							var preenddate=alldefactivity[order-1][3];
							
							$("#startdate").val(preenddate);
							$( "#startdate" ).datepicker({
										dateFormat:"dd-mm-yy",
								      showOn: "button",
								      buttonImage: "images/calendar.gif",
								      buttonImageOnly: true
							    });
							$( "#enddate" ).datepicker({
								  dateFormat:"dd-mm-yy",
							      showOn: "button",
							      buttonImage: "images/calendar.gif",
							      buttonImageOnly: true
						    });
			
			}
	});

}
var alldefactivity=new Array();
var serialno=0;

function saveDefinedActivity()
{
	
	
		
		var actname=$("#ActivityName").val();
		var actorder=$("#ActivityOrder").val();
		var startdate=$("#startdate").val();
		var enddate=$("#enddate").val();
		var duration=$("#duration").val();
		var prjid_temp=$("#projectid").val();
		
		if(startdate.length == 0)
		{
			
			alert("enter Start Date");
			return false;
			
		}
		if(enddate.length == 0)
		{
			
			alert("enter End Date");
			return false;
			
		}
		
		
		var startdatenew=startdate.split("-");
		startdate=startdatenew[2]+"-"+startdatenew[1]+"-"+startdatenew[0];
		
		var enddatenew=enddate.split("-");
		enddate=enddatenew[2]+"-"+enddatenew[1]+"-"+enddatenew[0];
		
		var activitiestemp="projectid="+prjid_temp+"&"+"activityname="+actname+"&"+"activityorder="+actorder+"&"+"activitystartdate="+startdate+"&"+"activityenddate="+enddate+"&"+"activityduration="+duration;
		
		$.ajax({
			url:"SaveNewProjectActivities.jsp",
			data:activitiestemp,
			success:loadTempActivitiesOfProject,
			cache:false,
			//error :function(){alert("error");}
			
		});
		
		$("#divfinalactivitiesdef").html("");
		
		
		
		
		
		
		//check initial activity
		/*if(alldefactivity.length == 0 )
		{
			
			if(actorder != 1)
			{
				alert("Define 1st Activity");
				return false;
			}
			
			alldefactivity[serialno]=new Array(actname,actorder,startdate,enddate,duration);
			
			
			
			serialno ++;
			
			alert("activity Saveed");
			
			var button="<input type=\"button\" value=\"Edit\" id="+actorder+" onclick=\"return editActivity(this.id)\">";
			var displayactivity="<tr style=\"color: #000000;font-size: 15px\">"+
                "<td>"+actname+"</td>"+
                "<td>"+actorder+"</td>"+
                "<td>"+startdate+"</td>"+
                "<td>"+enddate+"</td>"+
                "<td>"+duration+"</td>"+
                "<td>"+button+"</td>"+
              "</tr>";
			
			
			$("#divfinalactivitiesdef").html("");
			
			$("#activitiesdefine").append(displayactivity);
			//$("#startdate").val("");
			//$("#enddate").val("");
			//$("#duration").val("");
			//$("#startdate").focus();
			
		}
		else
		{
			//check next activity serially
			var highest=alldefactivity[0][1];
			for(var m=0; m <alldefactivity.length; m++)
			{
					
				if(alldefactivity[m][1] > highest)	
				{
					
					highest=alldefactivity[m][1];
				}
				
			}
			var orderstatus=actorder - highest;
			if(orderstatus <= 0)
			{
				
				alert("Activity already defined");
				$("#divfinalactivitiesdef").html("");
				//$("#startdate").val("");
				//$("#enddate").val("");
				//$("#duration").val("");
				//$("#startdate").focus();
				
				return false;
				
			}
			if(orderstatus >= 2)
			{
				
				var suggestorder=parseInt(highest) + 1;
				alert("Plz Define  "+ suggestorder + " activity");
				$("#divfinalactivitiesdef").html("");
				//$("#startdate").val("");
				//$("#enddate").val("");
				//$("#duration").val("");
				//$("#startdate").focus();
				
				return false;
				
			}
			if(orderstatus == 1)
			{
				
				alldefactivity[serialno]=new Array(actname,actorder,startdate,enddate,duration);
			
			
			
				serialno ++;
			
				alert("activity Saveed");
				
				var button="<input type=\"button\" value=\"Edit\" id="+actorder+" onclick=\"return editActivity(this.id)\">";
				var displayactivity="<tr style=\"color: #000000;font-size: 15px\">"+
	                "<td>"+actname+"</td>"+
	                "<td>"+actorder+"</td>"+
	                "<td>"+startdate+"</td>"+
	                "<td>"+enddate+"</td>"+
	                "<td>"+duration+"</td>"+
	                "<td>"+button+"</td>"+
	              "</tr>";
				
				
				$("#divfinalactivitiesdef").html("");
				
				$("#activitiesdefine").append(displayactivity);
				//$("#startdate").val("");
				//$("#enddate").val("");
				//$("#duration").val("");
				//$("#startdate").focus();
				
			}
			
			
			
			
		}
		
		
		
		return true;
	*/

}
function loadTempActivitiesOfProject(data) {
	
		var prjid_temp=$("#projectid").val();
	
	proj_id_temp="projectid="+prjid_temp;
	
	$("#TempActivities").load("TempActivitiesOfProject.jsp",proj_id_temp);
	
}
function editActivity(activityid)
{
	
	//alert(activityid);
	
	var aid=parseInt(activityid);
	var confstatus=confirm("Do u want to edit the activity?");
	aid=aid-1;
	var actdataedit=alldefactivity[aid][0]+"%"+alldefactivity[aid][1]+"%"+alldefactivity[aid][2]+"%"+alldefactivity[aid][3]+"%"+alldefactivity[aid][4];
	
	if(confstatus)
		{
			$("#divfinalactivitiesdef").load("EditScheduleActivityProjects.jsp",actdataedit,function(){
				
				var datatoedit=new Array();
				datatoedit=actdataedit.split("%");
				$("#ActivityName").val(datatoedit[0]);
				$("#ActivityOrder").val(datatoedit[1]);
				$("#startdate").val(datatoedit[2]);
				$("#enddate").val(datatoedit[3]);
				$("#duration").val(datatoedit[4]);
				
				$( "#startdate" ).datepicker({
										dateFormat:"dd-mm-yy",
								      showOn: "button",
								      buttonImage: "images/calendar.gif",
								      buttonImageOnly: true
							    });
							$( "#enddate" ).datepicker({
								  dateFormat:"dd-mm-yy",
							      showOn: "button",
							      buttonImage: "images/calendar.gif",
							      buttonImageOnly: true
						    });
				
			});
	
		}

}
function saveEditedActivity() {
	
alert("Activity Edited");	
	
}

function formatenddate()
{
	//var startdate=$("#startdate").val();
	//$("#enddate").datepicker({dateFormat:"dd-mm-yy"}).datepicker("option",'minDate', new Date(startdate) );;	

}
function duration()
{
	
	var startdate=$("#startdate").val();
	var enddate=$("#enddate").val();
	
	var startdatenew=startdate.split("-");
	startdatenew=startdatenew[1]+"/"+startdatenew[0]+"/"+startdatenew[2];
	
	var enddatenew=enddate.split("-");
	enddatenew=enddatenew[1]+"/"+enddatenew[0]+"/"+enddatenew[2];
	
	var msecPerMinute = 1000 * 60;
	var msecPerHour = msecPerMinute * 60;
	var msecPerDay = msecPerHour * 24;

	// *****Setting dates*****

	var startDate = new Date(startdatenew);
	var endDate = new Date(enddatenew);


	// *****Calculate time elapsed, in MS*****
	var interval = endDate.getTime()-startDate.getTime();

	var days = (Math.floor(interval / msecPerDay ))+1;
	
	if(days<0)
	{
		alert("End date cant be less than start date");
		$("#enddate").val("");
		$("#enddate").focus();
		return false;
	}
	$("#duration").val(days);
return true;
}
var projectid;
function submitNewProjectDetails()
{
	
	var userid=$("#userid").val();
	var curdate=$("#curdate").val();
	var allclients=$("#allclients").val();
	//var clientname=$("#clientname").val();
	var projectname=$("#projectname").val();
	
	
	 projectid=$("#projectid").val();
	var dateofcomence=$("#dateofcomence").val();
	
	//end date is the last activity end date
	//$("#proenddate").val(alldefactivity[(alldefactivity.length)-1][3]);
	var proenddate=$("#proenddate").val();
	var estprjcost=$("#estprjcost").val();
	
	//replace & with ^ otherwise after & will not sent to server
	projectname=projectname.replace("&","^");
	
	var curdatenew=curdate.split("-");
	curdate=curdatenew[2]+"/"+curdatenew[1]+"/"+curdatenew[0];
	
	var dateofcomencenew=dateofcomence.split("-");
	dateofcomence=dateofcomencenew[2]+"/"+dateofcomencenew[1]+"/"+dateofcomencenew[0];
	
	var proenddatenew=proenddate.split("-");
	proenddate=proenddatenew[2]+"/"+proenddatenew[1]+"/"+proenddatenew[0];
	
	
	
	var priorityprj=$("#priorityprj").val();
	
	
	if(projectname.length==0)
		{
			alert("Enter Project Name");
			return false;
		}
	
/*	if(activityorder.length != alldefactivity.length )
		{
		
			alert("PLZ Define All The Activities");
			return false;
		
		
		}
	
	*/
	var projectdata="userid="+userid+"&"+"curdate="+curdate+"&"+"allclients="+allclients+"&"
	+"projectname="+projectname+"&"+"projectid="+projectid+"&"
	+"dateofcomence="+dateofcomence+"&"+"proenddate="+proenddate+"&"
	+"estprjcost="+estprjcost+"&"+"priorityprj="+priorityprj;
	
	
	$.ajax({
		url:"SaveNewProjectData.jsp",
		data:projectdata,
		
		success: addProjectSuccessFinal,
		cache:false,
		//error :function(){alert("error");}
		
	});
	


}
var counter=0;
function addProjectSuccess(data)
{
	var activitiesdata="projectid="+projectid;
	var activitydefined="";
	for( ; counter< alldefactivity.length ; counter++)
		{
		
		var activitystartdatenew=alldefactivity[counter][2].split("-");
		activitystartdate=activitystartdatenew[2]+"/"+activitystartdatenew[1]+"/"+activitystartdatenew[0];
		
		var activityenddatenew=alldefactivity[counter][3].split("-");
		activityenddate=activityenddatenew[2]+"/"+activityenddatenew[1]+"/"+activityenddatenew[0];
		
		activitydefined+="&"+"activityname="+alldefactivity[counter][0]+"&"
			+"activityorder="+alldefactivity[counter][1]+"&"+"activitystartdate="+activitystartdate+"&"
			+"activityenddate="+activityenddate+"&"+"activityduration="+alldefactivity[counter][4];
		
		}
			var allactivitydata=activitiesdata+activitydefined;
				$.ajax({
					url:"SaveNewProjectActivities.jsp",
					data:allactivitydata,
					
					success: addProjectSuccessFinal,
					cache:false,
					//error :function(){alert("error");}
					
				});
				
}
function addProjectSuccessFinal(data)
{
	var msg1=data.match("project Saved Successfully");
		alert(msg1);
		$("#adminmiddlediv").load("AddNewProject.jsp",function(){
			
			defineProjectMain();
	
		});
	
}

