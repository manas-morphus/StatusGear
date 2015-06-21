function hideDateSearch()
{

	$("#searchdates").hide();

}
function showDateSearch()
{
	$("#searchdates").show();
	$( "#startdateser" ).datepicker({
		dateFormat:"dd-mm-yy",
	      showOn: "button",
	      buttonImage: "images/calendar.gif",
	      buttonImageOnly: true
	});
	$( "#enddateser" ).datepicker({
		dateFormat:"dd-mm-yy",
	      showOn: "button",
	      buttonImage: "images/calendar.gif",
	      buttonImageOnly: true
	});

}
function loadReports() {
	
	//var datetype=$('input[name="datesearch"]').val();
	var datetype=$(".datesearch:checked").val();

	
	//alert(datetype);
	
	var data="";
	
	if(datetype=="without")
		{
			var pid=$("#projectidser").val();
			var uid=$("#useridser").val();
			
			
			 data="pid="+pid+"&"+"uid="+uid+"&"+"opt_ser=0"+"&"+"opt=0";
			 
			 //alert(data);
			 
			// $("#searchedreports").load("SearchedReports.jsp",data,function(){
			//	});
			 $("#searchedreports").load("SearchViewReportAdmin.jsp",data,function(){
				});
		
		}
	
	if(datetype=="with")
	{
		
		var sdate=$("#startdateser").val();
		var edate=$("#enddateser").val();
		var pid=$("#projectidser").val();
		var uid=$("#useridser").val();
		
		
		
		data="sdate="+sdate+"&"+"edate="+edate+"&"+"pid="+pid+"&"+"uid="+uid+"&"+"opt_ser=1"+"&"+"opt=0";
		$("#searchedreports").load("SearchViewReportAdmin.jsp",data,function(){
		});
		 
		 //alert(data);
		// $("#searchedreports").load("SearchedReports.jsp",data,function(){
		//	});
	
	}
	
	
	
}
function searchProjectReport()
{
	var prjname=$( "input[value='prjname']" ).val();
	var activity=$( "input[value='activity']" ).val();
	var userid=$( "input[value='userid']" ).val();
	var clientname=$( "input[value='clientname']" ).val();
	var priorityprj=$( "input[value='priorityprj']" ).val();
	var usertype=$( "input[value='usertype']" ).val();
	


}





