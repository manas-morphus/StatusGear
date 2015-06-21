<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>MyProjectTracker</title>
<script type="text/javascript" src="js/jquery-1.10.0.js"></script>
<script type="text/javascript" src="js/jquery-ui-1.10.3.custom.js"></script>
<script type="text/javascript" src="js/Login.js"></script>

<link  type="text/css" rel="stylesheet"  href="css/style.css">
<link  type="text/css" rel="stylesheet"  href="css/jquery-ui-1.10.3.custom.css">


</head>
<body id="indexbody">
<table id="tableindex1" width="100%">
<tr>
	<td>
		<table id="tableindextop" width="100%">
			<tr>
				<td>
									<center><span id="indexwelcometext" style="font-family:'Monotype Corsiva';color:#FFFFFF"> WELCOME TO SUBUDHI ASSOCIATES</span></center>
					
				</td>
			</tr>
		</table>
	</td>
</tr>
	
<tr>
	<td>
		<table width="100%" align="center" id="tableindexmid">
			<tr>
				<td style="width: 30%">
				&nbsp;
				</td>
				<td style="width: 40%">
					<form action="LoginUser.jsp" method="post" id="Login">
					<table id="logintable">
						<tr>
							<td>
								
								<table cellpadding="0" cellspacing="0" style="width: 100%">
									<tr>
										<td width="30%" style="font-family: Arial, Helvetica, sans-serif;font-size: 15px;font-weight: bold; ">
											User Id
											
										</td>
										<td>
											<input type="text" style="width: 200px;height: 25px" id="userid" name="userid">
											
										</td>
									</tr>
									</table>
								
							</td>
						</tr>
						<tr>
							<td>
								
								<table cellpadding="0" cellspacing="0" width="100%">
									<tr>
										<td width="30%" style="font-family: Arial, Helvetica, sans-serif;font-size: 15px;font-weight: bold; ">
											Password
											
										</td>
										<td>
											<input type="password" style="width: 200px;height: 25px" id="userpw" name="userpw">
											
										</td>
									</tr>
								</table>
							</td>
							</tr>	
							<tr>
							<td>
								
								<table cellpadding="0" cellspacing="0" width="100%" >
									<tr>
										<td  style="font-family: Arial, Helvetica, sans-serif;font-size: 20px;font-weight: bold;color: red; ">
											invalid username/password
											
										</td>
										
									</tr>
								</table>
							</td>
							</tr>	
						
						<tr>
							<td >
								<table cellpadding="0" cellspacing="0" width="100%">
									<tr>
										<td width="30%" style="font-family: Arial, Helvetica, sans-serif;font-size: 15px;font-weight: bold; ">
											&nbsp;
											
										</td>
										<td>
											<input type="button" value="Submit" style="width: 65px;height: 25px;" onclick="return validate();">
											
										</td>
									</tr>
								</table>
								
								
							</td>
						</tr>
					</table>
					</form>
				</td>
				<td style="width: 40%">
				&nbsp;
				</td>
			</tr>
		</table>
	</td>
</tr>
<tr>
	<td>
		<table width="100%">
			<tr>
				<td>
					<div id="div1111">&copy;www.morphustechnology.com all rights reserved,cont#9439493434</div>
				</td>
			</tr>
		</table>
	</td>
</tr>


</table>

</body>
</html>