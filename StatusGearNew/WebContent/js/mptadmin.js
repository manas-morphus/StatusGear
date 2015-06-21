function displaymenu()
{
	
	$(function() {
	    $( "#menu" ).menu();
	    $( "#tabs" ).tabs();
	  });

}

function loadDefineActivity() {
	
	$("#adminmiddlediv").load("DefineActivity.jsp",function(){
		
		
		defineActivityMain() ;
		
	});
	
}
function loadAddNewUser() {
	
	$("#adminmiddlediv").load("AddNewUser.jsp	",function(){
		
		
		defineUserMain();
		
	});
	
}

function loadAddNewClient()
{
	
$("#adminmiddlediv").load("AddNewClient.jsp	",function(){
		
		
		defineClientMain();
		
	});


}
function loadAddNewProject()
{
	
$("#adminmiddlediv").load("AddNewProject.jsp",function(){
		
		
	defineProjectMain();
		
	});


}
//change the status of defined project like completed or ongoing etc
function loadChangeProjectStatus()
{
	$("#adminmiddlediv").load("ChangeProjectStatus.jsp",function(){
			
		});

}

function loadViewProjectsAdmin() {
	
	$("#adminmiddlediv").load("ViewProjectsAdmin.jsp",function(){
		
			
		});
	
	/*$("#adminmiddlediv").load("CustomisedProjectReportsAdmin.jsp",function(){
		
		
	});*/
	
}

function loadMessageInboxAdminProjects() {
	
	$("#adminmiddlediv").load("ViewMessageInboxAdmin.jsp",function(){
		
			
		});
	
}



function loadAssignActivityToUser() 
{
	
	var data="activity="+"NA"+"&"+"opt=1";
	$("#adminmiddlediv").load("AssignActivityToUser.jsp",data,function(){
	});
	
}
function showUserForActivity() {
	
	var activity=$("#activityforuser").val();
	activity="activity="+activity+"&"+"opt=2";
	$("#adminmiddlediv").load("AssignActivityToUser.jsp",activity,function(){
	});
}
function loadCreateMessageAdmin() 
{
	$("#adminmiddlediv").load("CreateMessageAdmin.jsp",function(){
	});
}
function loadSimpleMessageInboxAdmin() 
{
	$("#adminmiddlediv").load("SimpleMessageInboxAdmin.jsp",function(){
	});
}
function loadMessageOutboxAdmin() 
{
	$("#adminmiddlediv").load("ViewMessageDraftAdmin.jsp",function(){
	});
}
function loadViewReportsAdmin()
{
	var data="opt=0";
	$("#adminmiddlediv").load("ViewReportAdmin.jsp",data,function(){
	});
}
function loadViewReportsAdminVerified()
{
	var data="opt=0";
	$("#adminmiddlediv").load("ViewReportAdminVerified.jsp",data,function(){
	});
}
var MasterReptData;
function loadMasterReportWriter() {
	
	MasterReptData="option=1";
	$("#adminmiddlediv").load("DefineMasterReportWriter.jsp",MasterReptData,function(){
	});
}

function submitMasterReportWriterData() {
	
	var master_id=$("#masteruser").val();
	var foruser_id=$("#foruser").val();
	
	MasterReptData="option=2"+"&"+"masteruser="+master_id+"&"+"foruser="+foruser_id;
	$("#adminmiddlediv").load("DefineMasterReportWriter.jsp",MasterReptData,function(){
	});
}

function loadSearchReportAdmin() {
	$("#adminmiddlediv").load("SearchReportsAdmin.jsp",data,function(){
	});
}
function savePointReport(rid)
{
	
	var point=$('select[id='+rid+']').val();
	var comment=$("#coment"+rid).val();
	var datereporting=$("#date"+rid).val();
	//alert(comment);
	
	
	var data="opt=1"+"&"+"point="+point+"&"+"reportid="+rid+"&"+"comment="+comment+"&"+"datereporting="+datereporting;
	$("#adminmiddlediv").load("ViewReportAdmin.jsp",data,function(){
	});
}
function savePointReportVerified(rid)
{
	
	var point=$('select[id='+rid+']').val();
	var comment=$("#coment"+rid).val();
	var datereporting=$("#date"+rid).val();
	//alert(comment);
	
	
	var data="opt=1"+"&"+"point="+point+"&"+"reportid="+rid+"&"+"comment="+comment+"&"+"datereporting="+datereporting;
	$("#adminmiddlediv").load("ViewReportAdminVerified.jsp",data,function(){
	});
}
function submitChangeProjectStatus()
{
	
	
	var project_status_id=$("#project-id").val();
	var update_status=$("#update-status").val();
	
	var UpdateStatus="option=1"+"&"+"project_status_id="+project_status_id+"&"+"update_status="+update_status;
	$("#adminmiddlediv").load("ChangeProjectStatus.jsp",UpdateStatus,function(){
	});

}
function searchCustomisedProjectReports()
{
	//alert("OKK");
	var prjname=$( "#prjname" ).val();
	var activity=$( "#activity" ).val();
	var userid=$( "#userid" ).val();
	var clientname=$( "#clientname" ).val();
	var priorityprj=$( "#priorityprj" ).val();
	var usertype=$( "#usertype" ).val();
	
	
	
	var SearchParameters="prjname="+prjname+"&"+"activity="+activity+"&"+"userid="+userid+"&"+"clientname="+clientname+"&"+"priorityprj="+priorityprj+"&"+"usertype="+usertype;
	
	$("#adminmiddlediv").load("CustomisedProjectReportsAdmin.jsp",SearchParameters,function(){
	});


}




