<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<meta charset="UTF-8">
<title>Registration Page</title>
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
<link rel="stylesheet" href="css/register.css" />
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="js/jquery.min.js" type="text/javascript"></script>
<style>
.checkboxes label {
	display: block;
	float: left;
	padding-right: 10px;
	
}

.radioboxes label {
	display: block;
	float: left;
	padding-right: 10px;
	
}
</style>


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
				<li><a href="Signup.jsp">Sign Up</a></li>
			</ul>
		</div>
		<!-- /.navbar-collapse --> </nav>


		<!-- Content Header (Page header) -->
		<!--  	<section class="content-header"  >
			<h1>Sign Up</h1>
		</section> -->





		<div id=wrapper>
			<div id=lbl></div>
			<form  method="post" action="SignUpServlet" >
				<fieldset id=user>
					<legend>User Details</legend>
					<div id=left>
						<label for=firstname>First Name:</label> <input id=username
							class=textbox type=text name=firstName required
							placeholder="Firstname" />
					</div>
					<div id=right>
						<label for=lastname>Last Name:</label> <input id=username
							class=textbox type=text name=lastName required
							placeholder="Lastname" />
					</div>
					<div id=left>
						<label for=username>User Name:</label> <input id=username
							class=textbox type=text name=userName required
							placeholder="username" />
					</div>
					<div id=right>
						<label for=email>E-mail</label> <input id=email class=textbox
							type=text name=email required placeholder="E-mail" />
					</div>
					<div id=left>
						<label for=password1>Password</label> <input id=password1
							class=textbox type=password name=password1 required
							placeholder="Password" oninput="checkPasswords();" />

					</div>
					<div id=right>
						<label for=password2>Re-type Password:</label> <input id=password2
							class=textbox type=password name=password2 required
							placeholder="Re-type password" oninput="checkPasswords();" />

					</div>

					<div id=left>
						<label for=vendorName>Vendor Name</label> <input id=vendorName
							class=textbox type=textbox name=vendorName required
							placeholder="Vendor Name" />
					</div>
					<div id=right>
						<label for=competitor>Competitors you want to analyze</label>

						<div class="checkboxes">


							<label for=target> <input type="checkbox"
								name="competitor" id=target value="Target"> <span>Target</span></label> <label
								for=walmart> <input type="checkbox" name="competitor"
								id=walmart value="Walmart"> <span>Walmart</span></label> <label for=costco>
								<input type="checkbox" name="competitor" id=costco value="Costco"> <span>Costco</span>
							</label> <label for=BJS> <input type="checkbox" name="competitor"
								id=BJS value="BJS"> <span>BJ'S</span></label>


						</div>
					</div>

					<div id=left>
						<label for=competitor>Social media coverage</label>

						<div class="checkboxes">
							<label for=Twitter> <input type="checkbox" name="socMed" id=twitter> <span>Twitter</span></label> 
							<label for=Facebook> <input type="checkbox" name="socMed" id=facebook> <span>Facebook</span>
							</label> <label for=Yelp> <input type="checkbox" name="socMed" id=yelp> <span>Yelp</span></label>
							 
						</div>
					</div>



					<div id=right>

						<label for=format>Select the expected result format</label>
						<div class="radioboxes">
							<label for=tableformat><input type="radio" name="result" value="Table Format"><span>Table Format</span> </label> 
							<label for=charts><input type="radio" name="result"  value="Charts" checked> <span>Charts</span> </label>
						</div>


					</div>

					<script>
						function checkPasswords() {
							var password1 = document
									.getElementById('password1');
							var password2 = document
									.getElementById('password2');
							if (password1.value != password2.value) {
								password2
										.setCustomValidity('Passwords not match');
							} else {
								password2.setCustomValidity('');
							}
						}
					</script>
				</fieldset>

				<fieldset id=confirm>
					<input id=tnc type=checkbox name=tnc required /> <label for=tnc>I
						agree to the <a href="#">Terms and Conditions</a> and <a href="#">Privacy
							Policy</a>.
					</label> <input class="btn btn-primary" type=submit value="Submit" />
					
					<br>
					<div class="clearfix"></div>
				</fieldset>
				<br>
			</form>
			<br>
		
		</div>

		<footer class="navbar navbar-default" style="text-color:white"><span> © 2014 Social Media Analytics Inc. All Rights Reserved.</span> </footer>

		
		


		
	</div>

	<!-- End of first Row -->
	<!-- 	</section>-->
	<!-- /.content -->


	<script src="js/jquery-2.0.2.js" type="text/javascript"></script>

	<script src="js/bootstrap.min.js" type="text/javascript"></script>
	
</body>
</html>