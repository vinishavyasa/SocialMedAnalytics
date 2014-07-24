<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<meta charset="UTF-8">
<title>Social Media Analysis | Features Page - Report Generation</title>
<meta
	content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no'
	name='viewport'>
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

</head>
<body class="skin-blue">

	<!-- header logo: style can be found in header.less -->
	<header class="header">
		<a href="Analysis.jsp" class="logo"> <!-- Add the class icon to your logo image or logo icon to add the margining -->
			Social Media Analytics
		</a>
		<!-- Header Navbar: style can be found in header.less -->
		<nav class="navbar navbar-static-top" role="navigation">
			<!-- Sidebar toggle button-->
			<a href="#" class="navbar-btn sidebar-toggle" data-toggle="offcanvas"
				role="button"> <span class="sr-only">Toggle navigation</span> <span
				class="icon-bar"></span> <span class="icon-bar"></span> <span
				class="icon-bar"></span>
			</a>

		</nav>
	</header>

	<div class="wrapper row-offcanvas row-offcanvas-left">
		<!-- Left side column. contains the logo and sidebar -->
		<aside class="left-side sidebar-offcanvas">
			<!-- sidebar: style can be found in sidebar.less -->
			<section class="sidebar">
				<!-- Sidebar user panel -->
				<div class="user-panel">
					<div class="pull-left image">
						<img src="img/avatar3.png" class="img-circle" alt="User Image" />
					</div>
					<div class="pull-left info">
						<p>
							Hello, <label id="customerNameId"> Walmart</label>
						</p>

						<a href="#"><i class="fa fa-circle text-success"></i> Online</a>
					</div>
				</div>
				<!-- search form -->
				<form action="#" method="get" class="sidebar-form">
					<div class="input-group">
						<input type="text" name="q" class="form-control"
							placeholder="Search..." /> <span class="input-group-btn">
							<button type='submit' name='seach' id='search-btn'
								class="btn btn-flat">
								<i class="fa fa-search"></i>
							</button>
						</span>
					</div>
				</form>
				<!-- /.search form -->
				<!-- sidebar menu: : style can be found in sidebar.less -->
				<ul class="sidebar-menu">
					<li><a href="Features.jsp"> <i
							class="fa fa-dashboard"></i> <span>Data Collection</span>
					</a></li>
					<li><a href="Features-Analysis.jsp" id="analysisId"> <i class="fa fa-th"></i>
							<span>Analysis</span>
					</a></li>
					<li><a href="Features-Results.jsp" id="resultsId"> <i
							class="fa fa-bar-chart-o"></i> <span>Results</span>
					</a></li>
					<li class="active"><a href="Features-ReportGeneration.jsp" id="reportId"> <i class="fa fa-laptop"></i>
							<span>Report Generation</span>
					</a></li>
				</ul>
			</section>
			<!-- /.sidebar -->
		</aside>

		<aside class="right-side">
			<br>
			<nav class="navbar navbar-default" role="navigation">
				<!--   <div class="container-fluid"> -->
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target="#bs-example-navbar-collapse-1">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<!--  <a class="navbar-brand" href="#">Social Media Analytics</a> -->
				</div>
				<div class="collapse navbar-collapse"
					id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li><a href="Home.jsp">Home</a></li>
						<li class="active"><a href="Features.jsp">Features</a></li>
						<li><a href="Analysis.jsp">Analyze</a></li>
						<li><a href="About.jsp">About Us</a></li>
					</ul>
					<ul class="nav navbar-nav" style="padding-left: 900px">
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown">Walmart <b class="caret"></b></a>
							<ul class="dropdown-menu">
								<li><a href="#">Settings</a></li>
								<li class="divider"></li>
								<li><a href="#">Logout</a></li>
							</ul></li>
					</ul>
				</div>
				<!-- /.navbar-collapse -->
			</nav>

			<section class="content-header">
				<h1>Features Page</h1>

			</section>

			<section class="content">
				<div class="row">
					<div class="col-md-6">
						<div class="box box-primary">
							<div class="box-header">
								<h3 class="box-title">Report Generation</h3>
							</div>
							
							<div class="box-body">
									<div class="input-group">
									This feature allows this tool to generate different reports based on social media. This feature provides leverage to the retailer to store the analysis as a PDF.
									</div>
							</div>
						</div>
					</div>
				</div>
			</section>

		</aside>
	</div>

	<script src="js/jquery-2.0.2.js" type="text/javascript"></script>

	<!-- Bootstrap -->
	<script src="js/bootstrap.min.js" type="text/javascript"></script>
</body>
</html>