function defineClientMain()
{
	
	$("#curdate").datepicker({dateFormat:"yy-mm-dd"}).datepicker("setDate",new Date());

	$("#clientname").focus();
	
	
}
var optionmodify=0;
function submitNewClientDetails()
{
	var userid=$("#userid").val();
	var curdate=$("#curdate").val();
	var clientname=$("#clientname").val();
	var clientoffname=$("#clientoffname").val();
	var clientcontactone=$("#clientcontactone").val();
	
	
	var clientcontacttwo=$("#clientcontacttwo").val();
	var clientcontactoff=$("#clientcontactoff").val();
	var clientemail=$("#clientemail").val();
	var resaddress=$("#resaddress").val();
	var offaddress=$("#offaddress").val();
	
	
	var state=$("#state").val();
	var dist=$("#dist").val();
	var newclientid=$("#newclientid").val();
	var aditionalinfo=$("#aditionalinfo").val();
	
	
	if(clientname.length==0)
	{
		alert("Enter Client Name");
		$("#clientname").focus();
		return false;
	}
	if(clientcontactone<10)
	{
		alert("Phone Number should be 10 Digits");
		$("#clientcontactone").focus();
		return false;
	}
	if(newclientid == 0)
	{
		alert("Assign an Id To Client");
		$("#newclientid").focus();
		return false;
	}
	
var userdata="opt="+optionmodify+"&"+"userid="+userid+"&"+"curdate="+curdate+"&"+"clientname="+clientname+"&"
				+"clientoffname="+clientoffname+"&"+"clientcontactone="+clientcontactone+"&"
				+"clientcontacttwo="+clientcontacttwo+"&"+"clientcontactoff="+clientcontactoff+"&"
				+"clientemail="+clientemail+"&"+"resaddress="+resaddress+"&"
				+"offaddress="+offaddress+"&"+"state="+state+"&"+"dist="+dist+"&"
				+"newclientid="+newclientid+"&"+"aditionalinfo="+aditionalinfo;
					
	
	$.ajax({
		url:"SaveClientData.jsp",
		data:userdata,
		
		success: addClientSuccess,
		cache:false,
		//error :function(){alert("error");}
		
	});
	
	
	
return true;	

}
function addClientSuccess(data)
{
	
	var msg1=data.match("Client Added Successfully");
	var msg2=data.match("Client Id Already Exists");
	var msg3=data.match("Updation Successful");
	if(msg1 != null)
	{
		alert(msg1);
		$("#adminmiddlediv").load("AddNewClient.jsp	",function(){
			
			
			defineClientMain();
			
		});
		
	}
	if(msg2 != null)
	{
			alert(msg2);
			
			$("#newclientid").val("");
			$("#newclientid").focus();
	}
	if(msg3 != null)
	{
		alert(msg3);
		$("#adminmiddlediv").load("AddNewClient.jsp	",function(){
			
			
			defineClientMain();
			
		});
		
	}



}
function editClientDefined(data)
{
	var clientid="clientid="+data+"&"+"opt=1";
	$("#adminmiddlediv").load("ModifyClientData.jsp",clientid,function(){
	
		
	});

}
function editClientDetails()
{
	
	optionmodify=1;
	submitNewClientDetails();

}
function onlyNumber()
{
	 $("#clientcontactone").keydown(function (e) {
	        if (e.shiftKey) e.preventDefault();
	        else {
	            var nKeyCode = e.keyCode;
	            //Ignore Backspace and Tab keys
	            if (nKeyCode == 8 || nKeyCode == 9) return;
	            if (nKeyCode < 95) {
	                if (nKeyCode < 48 || nKeyCode > 57) e.preventDefault();
	            } else {
	                if (nKeyCode < 96 || nKeyCode > 105) e.preventDefault();
	            }
	        }
	    });
	 $("#clientcontacttwo").keydown(function (e) {
	        if (e.shiftKey) e.preventDefault();
	        else {
	            var nKeyCode = e.keyCode;
	            //Ignore Backspace and Tab keys
	            if (nKeyCode == 8 || nKeyCode == 9) return;
	            if (nKeyCode < 95) {
	                if (nKeyCode < 48 || nKeyCode > 57) e.preventDefault();
	            } else {
	                if (nKeyCode < 96 || nKeyCode > 105) e.preventDefault();
	            }
	        }
	    });
	 $("#clientcontactoff").keydown(function (e) {
	        if (e.shiftKey) e.preventDefault();
	        else {
	            var nKeyCode = e.keyCode;
	            //Ignore Backspace and Tab keys
	            if (nKeyCode == 8 || nKeyCode == 9) return;
	            if (nKeyCode < 95) {
	                if (nKeyCode < 48 || nKeyCode > 57) e.preventDefault();
	            } else {
	                if (nKeyCode < 96 || nKeyCode > 105) e.preventDefault();
	            }
	        }
	    });
	 $("#estprjcost").keydown(function (e) {
	        if (e.shiftKey) e.preventDefault();
	        else {
	            var nKeyCode = e.keyCode;
	            //Ignore Backspace and Tab keys
	            if (nKeyCode == 8 || nKeyCode == 9) return;
	            if (nKeyCode < 95) {
	                if (nKeyCode < 48 || nKeyCode > 57) e.preventDefault();
	            } else {
	                if (nKeyCode < 96 || nKeyCode > 105) e.preventDefault();
	            }
	        }
	    });
	 
	 




}

function upperCase()
{
	
	$("#state").keyup(function() {
	    $(this).val($(this).val().toUpperCase());
	});
	$("#dist").keyup(function() {
	    $(this).val($(this).val().toUpperCase());
	});


}
