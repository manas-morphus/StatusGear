function displaymenu()
{
	
	$(function() {
	    $( "#menu" ).menu();
	  });

}
function loadViewProjectsUser() {
	
	$("#usermiddlediv").load("ViewAllProjectsUser.jsp",function(){
		
		
		
	});
	
}

var actdtl=new Array();
var senddata;
function  DisplayMessageUser(data) 
{
	
	
	

	actdtl=data.split("+");
	 
	senddata="pid="+actdtl[0]+"&"+"userid="+actdtl[1]+"&"+"activity="+actdtl[2];
	$("#usermiddlediv").load("ViewMessageboxUser.jsp",senddata,function(){
		$("#curdate").datepicker({dateFormat:"yy-mm-dd"}).datepicker("setDate",new Date());
		
		$("#newmessageuser").focus();
		
	});
	
}
var slnomesg="";
function displayMesgDetailsUser(data) 
{

	slnomesg="slno="+data+"&"+"pid="+actdtl[0]+"&"+"userid="+actdtl[1]+"&"+"activity="+actdtl[2];
	$("#usermiddlediv").load("ViewMessageDetailUser.jsp",slnomesg,function(){
		
		
	});
	
}

function editPrevMessageActivity(){
	
	var prevmesg=$("#prevmessageuser").val();
	
	$("#newmessageuser").val(prevmesg);
	$("#newmessageuser").focus();
	
	
	
}
function submitActivity() 
{
	var pid=actdtl[0];
	var userid=actdtl[1];
	var activity=actdtl[2];
	//var prevmessage=$("#prevmessageuser").val();
	var newmessage=$("#newmessageuser").val();
	var dateactivity=$("#curdate").val();
	
	
	if(newmessage.length==0)
	{
		alert("Write Message");
		$("#newmessage").focus();
		return false;
	}
	
	var updateactivity="pid="+pid+"&"+"userid="+userid+"&"+"activity="+activity+"&"
	+"newmessage="+newmessage+"&"
	+"dateactivity="+dateactivity;
	
	
	
	$.ajax({
		url:"SaveProjectActivityStatus.jsp",
		data:updateactivity,
		
		success: updateMessageSuccess,
		cache:false,
		//error :function(){alert("error");}
		
	});
	
	
	
}
function updateMessageSuccess(datamesg) {
	
	//alert(datamesg);
	$("#usermiddlediv").load("ViewMessageboxUser.jsp",senddata,function(){
		$("#curdate").datepicker({dateFormat:"yy-mm-dd"}).datepicker("setDate",new Date());
		
		
		
		
		
		
		
		$("#newmessageuser").focus();
		
	});
	
}

function showProjectsOfClient()
{
	
	var clientid=$("#clientsreport").val();
	
	if(clientid  != "select")
		{
		
			var clientdata="cid="+clientid;
		
			
				$.ajax({
					url:"AjaxRetriveProjectsForClient.jsp",
					data:clientdata,
					dataType:"json",
					
					success: showProjectsForClient,
					cache:false,
					//error :function(){alert("error");}
					
				});
				
		}
	

}
function showProjectsForClient(data)
{
	
	
	
	
	
	//alert(data.prjects[1].projectid);
	var options= "<option >select</option>";
	
	$.each(data.prjects, function(i, obj) {
		
		options+="<option value=\""+obj.projectid+"\">"+obj.projectname+"</option>";
		
		
	});
	
	$("#forproject").html(options);
	
	

}


function resetMessage() {
	
	
	$("#newmessageuser").val("");
	
}
function forwordMessageAdmin(data)
{
	
		var fwdconform=confirm("Do You Want To Forward the the Message To Admin ?");
		
		if(fwdconform)
			{
			
				$.ajax({
					url:"ForwardMessageAdmin.jsp",
					data:slnomesg,
					
					success: ForwardMessageSuccess,
					cache:false,
					//error :function(){alert("error");}
					
				});
				
			}
		else 
		{
			return false;
		}


}
function ForwardMessageSuccess(mesg) {
	
	//alert(mesg);
	$("#usermiddlediv").load("ViewMessageboxUser.jsp",senddata,function(){
		$("#curdate").datepicker({dateFormat:"yy-mm-dd"}).datepicker("setDate",new Date());
		
		$("#newmessageuser").focus();
		
	});
	
}
function forwordMessageUsers(data)
{
	
		var fwdconform=confirm("Do You Want To Forward the the Message To Users ?");
		
		
		if(fwdconform)
			{
			
				$("#forwardmesgusers").load("ForwardMessageUser.jsp",slnomesg,function(){
					
					
				});
			
			}
		

}
function sendMessageToUsers() 
{
	var users=$("#allusersprjectwise").val();
	
	var conf=confirm("Do u want to send the message to --> "+users);
	
		
		
		
	
		
		alluser="";
		for(var i=0;i<users.length;i++)
		{
			alluser+="&"+"usersprj="+users[i];
		}
		
	
		var mesgtousers=slnomesg+alluser;
		
		
	
		if(conf)
		{
			
			$.ajax({
				url:"ForwardMessageUsersProjectwise.jsp",
				data:mesgtousers,
				
				success: ForwardMessageUserSuccess,
				cache:false,
				//error :function(){alert("error");}
				
			});
		
		}
	
	
	
	
}
function ForwardMessageUserSuccess(mesg) {
	
	alert(mesg);
	$("#usermiddlediv").load("ViewMessageboxUser.jsp",senddata,function(){
		$("#curdate").datepicker({dateFormat:"yy-mm-dd"}).datepicker("setDate",new Date());
		
		$("#newmessageuser").focus();
		
	});
	
}
function messageInboxUser(){
	
$("#usermiddlediv").load("ViewMessageInboxUser.jsp",function(){
		
		
		
	});
	
}
function writeReportUser() {
	
	var time=new Date();
	
	var hours=time.getHours();
	var minute=time.getMinutes();
	$("#usermiddlediv").load("ReportWrite.jsp",function(){
	});
	
	/* if( hours <=17  && hours >=10)
		{
		 
		 $("#usermiddlediv").load("ReportRestriction.jsp",function(){
			});
		}
	else
		{
		$("#usermiddlediv").load("ReportWrite.jsp",function(){
		});
		}
	*/

}
function showClient()
{
	
	
	var selectedclientid=$("#forproject").val();
	
	var projectid="clientid="+selectedclientid+"&"+"option=2";;
	$.ajax({
		url:"RetriveClientName.jsp",
		data:projectid,
		
		success: displayNameClient,
		cache:false,
		//error :function(){alert("error");}
		
	});
	


}
function displayNameClient(data)
{
	
	$("#clientnamereport").html(data);



}
function checkTotal() {
	
	var totalwords=$("#reportcontent").val();
	
	if(totalwords.length>300)
		alert("Report content can't exceed to 300 characters");
	
}
function sendReport() {
	
	
	var forproject=$("#forproject").val();
	var reporttype=$("#reporttype").val();
	var reportcontent=$("#reportcontent").val();
	var date_reportwriting=$("#curdate").val();
	
	
	if(forproject=="select")
		{
			
			alert("Select the Project");
			return false;
		}
	if(reporttype.length==0)
	{
		alert("Enter the report type");
		return false;
	}
	if(reportcontent.length==0)
	{
		alert("Enter the Content of report");
		return false;
	}
	//alert(date_reportwriting);
	
	//alert(reportcontent);
	
	reportcontent=reportcontent.replace("&","^");
	var datasendreport="forproject="+forproject+"&"+"reporttype="+reporttype+"&"+"reportcontent="+reportcontent+"&"+"opt=1"+"&"+"rep_date="+date_reportwriting;
	
	$("#usermiddlediv").load("ReportWrite.jsp",datasendreport,function(){
		});
}
function saveReport() {
	var reporttype=$("#reporttype").val();
	var reportcontent=$("#reportcontent").val();
	
	reportcontent=reportcontent.replace("&","^");
	
	var datasendreport="reporttype="+reporttype+"&"+"reportcontent="+reportcontent+"&"+"opt=2";
	
	$("#usermiddlediv").load("ReportWrite.jsp",datasendreport,function(){
		});
}

function writeReportUserOthers() {
	
$("#usermiddlediv").load("ReportWriterMaster.jsp",function(){
		
		
	});
}
function viewSentReportUser() {
	
	var data_option="option=0";
$("#usermiddlediv").load("ViewSentReportUser.jsp",data_option,function(){
		
		
	});
	
}
function viewReportUserWithComments() {
	
	var data_option="option=1";
$("#usermiddlediv").load("ViewSentReportUser.jsp",data_option,function(){
		
		
	});
	
}
function sendReportMaster() {
	
	var forproject=$("#forproject").val();
	var reporttype=$("#reporttype").val();
	var reportcontent=$("#reportcontent").val();
	var foruser=$("#foruser").val();
	
	
	var datasendreport="forproject="+forproject+"&"+"reporttype="+reporttype+"&"+"reportcontent="+reportcontent+"&"+"foruser="+foruser+"&"+"opt=1";
	
	$("#usermiddlediv").load("ReportWriterMaster.jsp",datasendreport,function(){
		});
}


function loadCreateMessageAdmin() 
{
	$("#usermiddlediv").load("CreateMessageAdmin.jsp",function(){
	});
}
function loadSimpleMessageInboxAdmin() 
{
	$("#usermiddlediv").load("SimpleMessageInboxAdmin.jsp",function(){
	});
}