var touser="";
var mesgsubject="";
var mesgcontent="";

var data="";


function sendMessage() {
	 touser=$("#touser").val();
	 mesgsubject=$("#mesgsubject").val();
	 mesgcontent=$("#mesgcontent").val();

	 data="touser="+touser+"&"+"mesgsubject="+mesgsubject+"&"+"mesgcontent="+mesgcontent+"&";
	
	var senddata=data+"&"+"opt=1";
	$("#usermiddlediv").load("CreateMessageAdmin.jsp",senddata);
	
}
function saveMessage() {
	 touser=$("#touser").val();
	 mesgsubject=$("#mesgsubject").val();
	 mesgcontent=$("#mesgcontent").val();

	 data="touser="+touser+"&"+"mesgsubject="+mesgsubject+"&"+"mesgcontent="+mesgcontent+"&";
	var savedata=data+"&"+"opt=2";
	$("#usermiddlediv").load("CreateMessageAdmin.jsp",savedata);
}