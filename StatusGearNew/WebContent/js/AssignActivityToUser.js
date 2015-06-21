function assignActivityToUser()
{
	var activity=$("#activityforuser").val();
	var userid =$("#useridtoassign").val();
	var data="activity="+activity+"&"+"opt=3"+"&"+"userid="+userid;
	$("#adminmiddlediv").load("AssignActivityToUser.jsp",data,function(){
		
		
	});



}
function showAssignedActivityToUser()
{
	var activity=$("#activityforuser").val();
	var userid =$("#useridtoassign").val();
	var data="activity="+activity+"&"+"opt=4"+"&"+"userid="+userid;
	$("#adminmiddlediv").load("AssignActivityToUser.jsp",data,function(){
		
		
	});
	
	
}
function removeActivityAssignedToUser(data1) 
{
	var activity=$("#activityforuser").val();
	var userid =data1;
	var data="activity="+activity+"&"+"opt=5"+"&"+"userid="+userid;
	$("#adminmiddlediv").load("AssignActivityToUser.jsp",data,function(){
		
		
	});	
	
}