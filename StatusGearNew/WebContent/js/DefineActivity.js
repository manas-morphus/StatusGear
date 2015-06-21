function defineActivityMain() 
{
	
	$("#curdate").datepicker({dateFormat:"yy-mm-dd"}).datepicker("setDate",new Date());
	//retrivePreviousActivities();
	$("#activityname").focus();
	
	
}
var idedit;
function editActivityDefined(data) 
{
	idedit=data;
	var activityid="id="+data+"&"+"opt=1";
	$("#adminmiddlediv").load("DefineActivity.jsp",activityid,function(){
		
		defineActivityMain();
		
		
	});
		
	
}



function deleteActivityDefined(data1)
{
	
	var status=confirm("Do U Want to Delete The Activity?");
	if(status==true)
	{
		var activityid1="id="+data1+"&"+"opt=2";
		$("#adminmiddlediv").load("DefineActivity.jsp",activityid1,function(){
			
			defineActivityMain();
		});
	}
	
		
	
}
/*function retrivePreviousActivities()
{
	
	
	$.ajax({
		url:"RetriveActivities.jsp",
		dataType:"json",
		success: displayPreviousActivities,
		cache:false,
		//error :function(){alert("error");}
		
	});

}
function displayPreviousActivities(data)
{
	
	var actnames="";
	
	$.each(data.activities,function(i,activity){
		
		actnames+="<tr><td>"+activity["actname"]+"</td><td><img alt=\"\" src=\"images//edit.gif\"></td><td><img alt=\"\" src=\"images//delete.gif\"></td></tr>";
		
	});
	
	$("#activitiesprev").append(actnames);


}*/
function upperCaseActivity()
{
	
	$("#activityname").keyup(function() {
	    $(this).val($(this).val().toUpperCase());
	});
	


}
function submitActivity(data) 
{
	
	var userid=$("#userid").val();
	var curdate=$("#curdate").val();
	var activityname=$("#activityname").val();
	var activitydesc=$("#activitydesc").val();
	
	if(activityname.length==0)
	{
		alert("Enter Activity");
		$("#activityname").focus();
		return false;
	}
	
	
	if(data=="Edit")
	{
		var activitydata="userid="+userid+"&"+"curdate="+curdate+"&"+"activityname="+activityname+"&"+"activitydesc="+activitydesc+"&"+"opt=3"+"&"+"idedit="+idedit;
		$("#adminmiddlediv").load("DefineActivity.jsp",activitydata,function(){
			
			defineActivityMain();
		});
	}
	else
	{
				
			
			
			
			var activitydata="userid="+userid+"&"+"curdate="+curdate+"&"+"activityname="+activityname+"&"+"activitydesc="+activitydesc;
			
			$.ajax({
				url:"SaveActivity.jsp",
				data:activitydata,
				
				success: addActivitySuccess,
				cache:false,
				//error :function(){alert("error");}
				
			});
		
	}
		
		return true;
}
function addActivitySuccess(data)
{
	
	var msg1=data.match("added successfully");
	var msg2=data.match("activity already exists");
	
	if(msg1 != null)
	{
		alert(msg1);
		$("#adminmiddlediv").load("DefineActivity.jsp",function(){
			
			
			defineActivityMain() ;
			
		});
	}
	if(msg2 != null)
	{
			alert(msg2);
	}
	$("#activityname").val("");
	$("#activitydesc").val("");
	$("#activityname").focus();
}