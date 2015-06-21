var projid;
function ViewProjDtlAdmin(pid) {

	projid="pid="+pid;
	
	$("#adminmiddlediv").load("DisplayProjDtlAdmin.jsp",projid);
	
}
var projectid_addmore;
function editDefinedProject(pid)
{
	projectid_addmore=pid;
	projid="pid="+pid;
	
	$("#adminmiddlediv").load("EditDifinedProjectAdmin.jsp",projid);
	
}
var projidedit;
function editActivitiesAdmin(activity) {
	
	
	var data=new Array();
	
	data=activity.split("+");
	
	projidedit=data[1];
	var actname=data[0];
	
	$("#EditActivitiesAdmin").load("EditActivitiesAdmin.jsp",actname,function(){
		$("#ActivityName").val(actname);
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
function editActivityProject() 
{
	var projectid=projidedit;
	var projectactivity=$("#ActivityName").val();
	var projectsdate=$("#startdate").val();
	var projectenddate=$("#enddate").val();
	var projectduration=$("#duration").val();
	
	var status=confirm("Do U Want To Edit?");
	
	var activityedit="projectid="+projectid+"&"+"projectactivity="+projectactivity+"&"+"projectsdate="+projectsdate+"&"+"projectenddate="+projectenddate+"&"+"projectduration="+projectduration;
	if(status)
		{
		
		$.ajax({
			url:"EditActivitiesProject.jsp",
			data:activityedit,
			
			success: editActivitySuccess,
			cache:false,
			//error :function(){alert("error");}
			
		});
		
		
		}
	
}
function editActivitySuccess(data) {
	
	
	var msg1=data.match("Edited successfully");
	var msg2=data.match("Error!");
	
	if(msg1 != null)
	{
		alert(msg1);
		//$("#adminmiddlediv").load("DisplayProjDtlAdmin.jsp",projid);
		$("#adminmiddlediv").load("EditDifinedProjectAdmin.jsp",projid);
		
	}
	if(msg2 != null)
	{
			alert(msg2);
			$("#adminmiddlediv").load("EditDifinedProjectAdmin.jsp",projid);
			//$("#adminmiddlediv").load("DisplayProjDtlAdmin.jsp",projid);;
	}
	
	
}
function addMoreActivities()
{
	var activity_addmore=$("#AvailActivities").val();
	
	//$("#AddMoreActivities").load("ScheduleActivityProjects.jsp");
	$("#AddMoreActivities").load("AddMoreActivities.jsp",function(){
		//$("#ActivityName").val(actname);
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
		$("#ActivityName").val(activity_addmore);
		
		
		
	});

}
function addMoreActivity() 
{
	var activity_addmore1=$("#AvailActivities").val();
	var addafter_addmore=$("#AddAfter").val();
	var startdate_addmore=$("#startdate").val();
	var enddate_addmore=$("#enddate").val();
	var duration_addmore=$("#duration").val();
	
	
	
	var dat_addmore="projectid="+projectid_addmore+"&"+"activity="+activity_addmore1+"&"+"addafter="+addafter_addmore+"&"+"startdate="+startdate_addmore+"&"+"enddate="+enddate_addmore+"&"+"duration="+duration_addmore;
	$.ajax({
		url:"SaveAddMoreActivities.jsp",
		data:dat_addmore,
		
		success: AddMoreActivitiesSuccess,
		cache:false,
		//error :function(){alert("error");}
		
	});
	
	
}
function AddMoreActivitiesSuccess() {
	
	editDefinedProject(projectid_addmore);
}
function editProjectDetails()
{
	var projectid_editfinal = $("#projectid").val();
	var dateofcomence = $("#dateofcomence").val();
	var proenddate =$("#proenddate").val();
	var estprjcost=$("#estprjcost").val();
	var priorityprj=$("#priorityprj").val();
	
	var editproject="projectid="+projectid_editfinal+"&"+"dateofcomence="+dateofcomence+"&"+"proenddate="+proenddate+"&"+"estprjcost="+estprjcost+"&"+"priorityprj="+priorityprj;
	$.ajax({
		url:"EditDefinedProjectFinal.jsp",
		data:editproject,
		
		success: editProjectSuccess,
		cache:false,
		//error :function(){alert("error");}
		
	});

}
function editProjectSuccess(data) {
	
	alert("Project Edited Successfully");
	$("#adminmiddlediv").load("ViewProjectsAdmin.jsp",function(){
		
		
	});
	
}
function deleteDefinedProject(data)
{
	var status=confirm("Do u want to delete the project");
	if(status)
		{
			
			var deleteid="prjid="+data;
			$.ajax({
				url:"DeleteDefinedProjectFinal.jsp",
				data:deleteid,
				
				success: deleteProjectSuccess,
				cache:false,
				//error :function(){alert("error");}
				
			});
		
		
		}
	
	

}
function deleteProjectSuccess(data)
{
	
	var msg1=data.match("Deleted successfully");
	if(msg1 != null)
	{
		alert(msg1);
		$("#adminmiddlediv").load("ViewProjectsAdmin.jsp",function(){
			
			
		});
		
	}
}

function approveStatusAdmin(pid) {
	
		var status=confirm("Do U Want To Approve The Activity Status?");
		
		var projid="pid="+pid;
		if(status)
			{
			
			$.ajax({
				url:"SaveClientData.jsp",
				data:projid,
				
				success: ApproveActivitySuccess,
				cache:false,
				//error :function(){alert("error");}
				
			});
			
			
			}
	
	
}
var approvemesgdata="";
function approveMessage(data)
{
		var datanew=data.split("+");
		
		var status=confirm("Do U Want To Approve The Message Status?");
		
		approvemesgdata = "slno="+datanew[0]+"&"+"pid="+datanew[1]+"&"+"userid="+datanew[2];
		if(status)
			{
				$( "#dialog" ).dialog({
					
					modal: true, 
					width: 'auto'
					
				});
				var option="opt=1";
				$( "#dialog" ).load("ApproveMessageBox.jsp",option);
				
			
			}
	
}
function approveWithMessage() {
	var mesg=$("#newmessageuser").val();
	$( "#dialog" ).dialog( "close" );
	approvemesgdata+="&"+"mesg="+mesg+"&"+"opt=1";
	
	$.ajax({
		url:"ApproveMessageAdmin.jsp",
		data:approvemesgdata,
		
		success: ApproveSuccess,
		cache:false,
		//error :function(){alert("error");}
		
	});
	
}

function denyMessage(data)
{
	var datanew=data.split("+");
	
	var status=confirm("Don't Want To Approve The Message Status?");
	
	approvemesgdata = "slno="+datanew[0]+"&"+"pid="+datanew[1]+"&"+"userid="+datanew[2];
	if(status)
		{
			$( "#dialog" ).dialog({
				
				modal: true, 
				width: 'auto'
				
			});
			
			var option2="opt=2";
			$( "#dialog" ).load("ApproveMessageBox.jsp",option2);
			
		
		}

}
function denyWithMessage() {
	
	var mesg2=$("#newmessageuser").val();
	$( "#dialog" ).dialog( "close" );
	approvemesgdata+="&"+"mesg="+mesg2+"&"+"opt=2";
	
	$.ajax({
		url:"ApproveMessageAdmin.jsp",
		data:approvemesgdata,
		
		success: ApproveSuccess,
		cache:false,
		//error :function(){alert("error");}
		
	});
}
function ApproveSuccess(data)
{
	
	alert("Message Sent Successfully");
	$("#adminmiddlediv").load("ViewMessageInboxAdmin.jsp",function(){
		
		
	});



}
function approveMessageUToU(data)
{
		
		
		var status=confirm("Do U Want To Approve The Message ?");
		
		 data = "slno="+data;
		if(status)
			{
			
			$.ajax({
				url:"ApproveMessageUtoUAdmin.jsp",
				data:data,
				
				success: ApproveSuccess,
				cache:false,
				//error :function(){alert("error");}
				
			});
			
			
			}
	
}

