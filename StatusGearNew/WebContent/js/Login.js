function validate() 
{
		var uid=$("#userid").val();
		var upw=$("#userpw").val();
		
		if(uid.length==0)
			{
			
				alert("enter user id");
				return false;
			
			}
		if(upw.length==0)
		{
		
			alert("enter user password");
			return false;
		
		}
		
		formSubmit();
	return true;
}
function formSubmit() {
	
	$("#Login").submit();
	
}