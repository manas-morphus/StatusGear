function defineUserMain() 
{
	
	$("#curdate").datepicker({dateFormat:"yy-mm-dd"}).datepicker("setDate",new Date());
	
	
	//retriveAllActivities();
	$("#username").focus();
	
	
	
}

/*function retriveAllActivities()
{
	
	
	$.ajax({
		url:"RetriveActivities.jsp",
		dataType:"json",
		success: displayAllActivities,
		cache:false,
		//error :function(){alert("error");}
		
	});

}
function displayAllActivities(data)
{
	
	var actnames="<option value=\"NOTASSIGNED\" selected=\"selected\" id=\"activityoptions\">ASSIGN</option>"+"<option value=\"ALL\"  id=\"activityoptions\">ALL</option>";
	
	$.each(data.activities,function(i,activity){
		
		actnames+="<option>"+activity["actname"]+"</option>";
		
	});
	
	$("#activities").append(actnames);


}

*/

function submitNewUserDetails()
{
	var curdate=$("#curdate").val();
	var username=$("#username").val();
	var userlastname=$("#userlastname").val();
	var newuserid=$("#newuserid").val();
	var password=$("#password").val();
	var confpassword=$("#confpassword").val();
	var usertype=$("#usertype").val();
	var activities=$("#activities").val();
	
	
	if(username.length==0)
	{
		alert("Enter User Name");
		$("#username").focus();
		return false;
	}
	if(newuserid.length==0)
	{
		alert("Assign New User ID");
		$("#newuserid").focus();
		return false;
	}
	if(password.length==0)
	{
		alert("Enter Password");
		$("#password").focus();
		return false;
	}
	if(password != confpassword)
	{
		alert("Password and conform password are not same");
		$("#confpassword").focus();
		return false;
	}
	
	
	var userdata="curdate="+curdate+"&"+"username="+username+"&"+"userlastname="+userlastname+"&"+"newuserid="+newuserid+"&"+"password="+password+"&"+"confpassword="+confpassword+"&"+"usertype="+usertype+"&"+"activities="+activities;
	
	$.ajax({
		url:"SaveUserData.jsp",
		data:userdata,
		
		success: addUserSuccess,
		cache:false,
		//error :function(){alert("error");}
		
	});
	
	
return true;
}
function addUserSuccess(data)

{
	var msg1=data.match("added successfully");
	var msg2=data.match("userid already exists");
	
	if(msg1 != null)
	{
		alert(msg1);
		$("#adminmiddlediv").load("AddNewUser.jsp",function(){
			
			
			defineUserMain();
			
		});
		
	}
	if(msg2 != null)
	{
			alert(msg2);
			
			$("#newuserid").val("");
			$("#newuserid").focus();
	}
	
	
	


}
function editUserDefined(data) 
{
	var udata="uid="+data+"&"+"opt=1";
	$("#adminmiddlediv").load("AddNewUser.jsp",udata,function(){
		
		
		defineUserMain();
		
	});
}





