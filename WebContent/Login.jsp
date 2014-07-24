<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<meta charset="UTF-8">

<!-- bootstrap 3.0.2 -->
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<!-- font Awesome -->
<link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<!-- Ionicons -->
<link href="css/ionicons.min.css" rel="stylesheet" type="text/css" />
<!-- Theme style -->
<link href="css/AdminLTE.css" rel="stylesheet" type="text/css" />
<link href="css/daterangepicker-bs3.css" rel="stylesheet"
	type="text/css" />
<link rel="stylesheet" href="css/login.css" />

<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="js/jquery.min.js" type="text/javascript"></script>

	
<title>Login Page</title>



</head>
<body class="skin-blue">
	<div class="container" style="margin-top: 20px">
		<nav class="navbar navbar-default" role="navigation">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" style="color: white" href="Home.jsp">Social
				Media Analytics</a>
		</div>
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active"><a href="Home.jsp">Home</a></li>
				<li><a href="Features.jsp">Features</a></li>
				<li><a href="Analysis.jsp">Analyze</a></li>
				<li><a href="About.jsp">About Us</a></li>
			</ul>

			<ul class="nav navbar-nav navbar-right">
				<li><a href="Login.jsp">Login</a></li>
				<li><a id="logout-user" href="logOut.jsp" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only" 
				style="font-size:14px;color: #561243;display:none; " data-inline="true"; ><span class="ui-button-text">LogOut</span></a></li>
				<li><a href="Signup.jsp">Sign Up</a></li>
			</ul>
		</div>
		</nav>
			


		<div id=wrapper>
			<div id=lbl></div>
			<form id="login_form" method="post" action="AnalyzeVendorServlet" >
				<fieldset id=user>
					<legend>Login </legend>
					
						<label for=email_login>E-Mail:</label> <input id="email_login"  class=textbox name="email_login" required
							placeholder="e-mail" />
					
						<label for="password_login">Password:</label> <input type="password"
							name="password_login" id="password_login" 
							class=textbox  required
							placeholder="password" />
							
							</fieldset>
							
							<fieldset id=confirm>
					
						<input class="btn btn-primary" type=submit value="Login" />
						<input type="hidden" name="fromPage" value="loginPage"/>
					<div class="clearfix"></div>
				</fieldset>
				<br>
							
							</form>
					</div>
			
			<br>
			<br>
			<br>
			<br>
			
			<br>
			<br>
			<br>
			<br>
			
			<br>
			<br>
			
			
			
			
			
			
			
			
			
			
			<footer class="navbar navbar-default" style="text-color:white"><span> © 2014 Social Media Analytics Inc. All Rights Reserved.</span> </footer>

		
			
			
			</div>			
			
</body>
</html>