<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<meta charset="UTF-8">
<title>Social Media Analysis | Analysis Page</title>
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
							Hello, <label id="customerNameId"> {$userName} </label>
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
					<li class="active"><a href="Analysis.jsp"> <i
							class="fa fa-dashboard"></i> <span>Analysis</span>
					</a></li>
					<li><a href="#" id="heatmapId"> <i class="fa fa-th"></i> <span>Heat
								Map</span>
					</a></li>
					<li><a href="#" id="chartsId"> <i
							class="fa fa-bar-chart-o"></i> <span>Charts</span>
					</a></li>
					<li><a href="#" id="wordCloudId"> <i class="fa fa-laptop"></i>
							<span>Word Cloud</span>
					</a></li>


					<li><a href="StackedBarChart?view=stackbar"> <i
							class="fa fa-bar-chart-o"></i> <span>StackedChart</span>
					</a></li>

					<li><a href="StackedBarChart?view=gauge"> <i
							class="fa fa-compass"></i> <span>Gauge</span>
					</a></li>

					<li class="active"><a href="AreaChartYelp.jsp"
						id="AreaChartYelpId"> <i class="fa fa-calendar"></i> <span>AreaChart</span>
					</a></li>
					<li><a href="BubbleChartYelp.jsp}" id="BubbleChartYelpId">
							<i class="fa fa-calendar"></i> <span>BubbleChart</span>
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
						<li><a href="Features.jsp">Features</a></li>
						<li class="active"><a href="Analysis.jsp">Analyze</a></li>
						<li><a href="About.jsp">About Us</a></li>
						<!--  <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown <b class="caret"></b></a>
          <ul class="dropdown-menu">
            <li><a href="#">Action</a></li>
            <li><a href="#">Another action</a></li>
            <li><a href="#">Something else here</a></li>
            <li class="divider"></li>
            <li><a href="#">Separated link</a></li>
            <li class="divider"></li>
            <li><a href="#">One more separated link</a></li>
          </ul>
        </li> -->
					</ul>

					<ul class="nav navbar-nav" style="padding-left: 900px">
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown">${vendorName} <b class="caret"></b></a>
							<ul class="dropdown-menu">
								<li><a href="History.jsp">History</a></li>
								<li class="divider"></li>
								<li><a href="Settings.jsp">Settings</a></li>
								<li class="divider"></li>
								<li><a href="Home.jsp">Logout</a></li>

							</ul></li>
					</ul>
				</div>
				<!-- /.navbar-collapse -->
				<!--     </div> -->
			</nav>
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>Analysis Page</h1>

			</section>

			<!-- Main content -->
			<section class="content">
				<div class="row">
					<div class="col-md-6">
						<div class="box box-primary">
							<div class="box-header">
								<h3 class="box-title">Select Date and Social Media</h3>
							</div>
							<!-- /.box-header -->
							<!-- form start -->
							<form role="form">
								<div class="box-body">
									<!-- <div class="form-group">
                                            <label for="exampleInputEmail1">Question 1</label>
                                            <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Some Answer">
                                        </div>  -->
									<div class="form-group">
										<label>Date and time range:</label>
										<div class="input-group">
											<div class="input-group-addon">
												<i class="fa fa-clock-o"></i>
											</div>
											<input type="text" class="form-control pull-right"
												id="reservationtime" placeholder="Select A Date Range"
												required="required">
										</div>
										<!-- /.input group -->
									</div>
									<div class="form-group">
										<label for="exampleInputPassword1">Choose Social Media</label>
										<br>
										<div class="form-group">
											<label class=""> <input type="radio" name="r3"
												class="flat-red" checked=""
												style="position: absolute; opacity: 0;" value="Twitter">
												<a class="btn btn-social-icon btn-twitter"><i
													class="fa fa-twitter"></i></a>
											</label> <label class=""> <input type="radio" name="r3"
												class="flat-red" style="position: absolute; opacity: 0;"
												value="Yelp"> <a
												class="btn btn-social-icon btn-google-plus"><i
													class="fa fa-google-plus"></i></a>
											</label> <label class=""> <input type="radio" name="r3"
												class="flat-red" style="position: absolute; opacity: 0;"
												value="Facebook"> <a
												class="btn btn-social-icon btn-facebook"><i
													class="fa fa-facebook"></i></a>
											</label>

										</div>
									</div>

								</div>
								<!-- /.box-body -->

								<div class="box-footer">
									<button type="button" class="btn btn-primary" id="analyzeId">
										<i class="fa   fa-check-square-o"> Analyze</i>
									</button>
									<button class="btn btn-primary" id="generateId">
										<i class="fa fa-cloud-download"></i> Generate PDF
									</button>
									<button class="btn btn-primary" id="showId">
										<i class="fa fa-cloud-download"></i> Show PDF
									</button>
								</div>
							</form>
						</div>
					</div>



					<c:choose>
						<c:when test="${fn:length(percentageArray) gt 0 }">
							<!-- Setting Analysis ID in a hidden Element - will be stored in local storage -->
							<input type="hidden" value="${percentageArray[3]}" id="aIdHidden">
							<div class="col-md-6">
								<div class="box box-primary">
									<div class="box-header">
										<h3 class="box-title">Analysis Summary</h3>
									</div>
									<!-- /.box-header -->
									<div class="box-body">
										<label>Vendor Name: </label><label id="vnameId"></label><br>
										<label>Date Range: </label><label id="dRangeId"></label> <br>
										<label>Social Media: </label><label id="sMediaId"></label> <br>

										<table class="table table-bordered">
											<tbody>
												<tr>
													<th style="width: 10px">S.No</th>
													<th>Sentiment Category</th>
													<th>Meter</th>
													<th style="width: 40px">Percentage</th>
												</tr>
												<tr>
													<td>1.</td>
													<td>Good Stuff</td>
													<td>
														<div class="progress xs progress-striped active">
															<div class="progress-bar progress-bar-success"
																style="width: ${percentageArray[0]}%"></div>
														</div>
													</td>
													<td><span class="badge bg-green" id="posId">${percentageArray[0]}
															%</span></td>
												</tr>
												<tr>
													<td>2.</td>
													<td>Bad Stuff</td>
													<td>
														<div class="progress xs progress-striped active">
															<div class="progress-bar progress-bar-danger"
																style="width: ${percentageArray[1]}%"></div>
														</div>
													</td>
													<td><span class="badge bg-red" id="negId">${percentageArray[1]}
															%</span></td>
												</tr>
												<tr>
													<td>3.</td>
													<td>Neutral Stuff</td>
													<td>
														<div class="progress xs progress-striped active">
															<div class="progress-bar progress-bar-yellow"
																style="width: ${percentageArray[2]}%"></div>
														</div>
													</td>
													<td><span class="badge bg-yellow" id="neuId">${percentageArray[2]}
															%</span></td>
												</tr>
											</tbody>
										</table>

									</div>
									<!-- /.box-body -->
								</div>
								<!-- /.box -->
							</div>
						</c:when>
						<c:otherwise></c:otherwise>
					</c:choose>
				</div>
				<!-- End of first Row -->
				<c:choose>
					<c:when test="${fn:length(percentageArray) gt 0 }">
						<div class="row">
							<div class="col-md-6">
								<!-- Bar chart -->
								<div class="box box-primary">
									<div class="box-header">
										<i class="fa fa-bar-chart-o"></i>
										<h3 class="box-title">Donut Chart Analysis for
											${vendorName}</h3>
									</div>

									<div class="box-body">
										<div id="donut-chart" style="height: 300px;"></div>

										<div class="btn-group" style="float: right; top: -200px">
											<button type="button" class="btn btn-info">Compare
												With</button>
											<button type="button" class="btn btn-info dropdown-toggle"
												data-toggle="dropdown">
												<span class="caret"></span> <span class="sr-only">Toggle
													Dropdown</span>
											</button>
											<ul class="dropdown-menu" role="menu">
												<%
													String vendorName = (String) request.getSession()
																	.getAttribute("vendorName");
															String[] comps = {"BJS", "Costco", "Target", "Walmart"};
															for (int i = 0; i < comps.length; i++) {
																if (!comps[i].equalsIgnoreCase(vendorName)) {
												%>
												<li><a href="#" id="<%=comps[i]%>Id"><%=comps[i]%></a></li>
												<%
													}
															}
												%>
											</ul>
										</div>
									</div>
									<!-- /.box-body-->

								</div>
								<!-- /.box -->

							</div>
							<!-- /.col -->

							<!--Comparison Pie Chart  -->
							<div class="col-md-6" id="compareDiv">
								<div class="box box-primary">
									<div class="box-header">
										<i class="fa fa-bar-chart-o"></i>
										<h3 class="box-title">Donut Chart Analysis for Costco</h3>
									</div>

									<div class="box-body">
										<div id="donut-chart-comp" style="height: 300px;"></div>


									</div>
									<!-- /.box-body-->

								</div>
								<!-- /.box -->


							</div>
						</div>
						<!-- /.row -->

					</c:when>
					<c:otherwise></c:otherwise>
				</c:choose>
			</section>
			<!-- /.content -->
		</aside>
		<!-- /.right-side -->





	</div>
	<!-- ./wrapper -->


	<!-- jQuery 2.0.2 -->
	<!--    <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script> -->
	<script src="js/jquery-2.0.2.js" type="text/javascript"></script>
	<!-- Bootstrap -->
	<script src="js/bootstrap.min.js" type="text/javascript"></script>
	<!-- AdminLTE App -->
	<script src="js/jquery.flot.min.js" type="text/javascript"></script>
	<!-- FLOT RESIZE PLUGIN - allows the chart to redraw when the window is resized -->
	<script src="js/jquery.flot.resize.min.js" type="text/javascript"></script>
	<!-- FLOT PIE PLUGIN - also used to draw donut charts -->
	<script src="js/jquery.flot.pie.min.js" type="text/javascript"></script>
	<!-- FLOT CATEGORIES PLUGIN - Used to draw bar charts -->
	<script src="js/jquery.flot.categories.min.js" type="text/javascript"></script>
	<script src="js/daterangepicker.js" type="text/javascript"></script>
	<!-- Page script -->
	<script src="js/app.js" type="text/javascript"></script>
	<!--  <script src="js/analyzeVendor.js" type="text/javascript"></script> -->
	<script>
		$(document)
				.ready(
						function() {

							$('input[id="reservationtime"]').daterangepicker();
							console.log("document ready");
							$('#compareDiv').hide();
							/* Setting AnalysisID in local storage */
							var aId = $('#aIdHidden').val();
							window.localStorage.setItem("aId", aId);

							var datetime = localStorage.getItem("time");
							var socMed = localStorage.getItem("sN");
							var venName = localStorage.getItem("vendorName");

							//alert("socMed and venName are " + socMed + " " + venName);

							$('#vnameId').text(" " + venName);
							$('#dRangeId').text(" " + datetime);
							$('#sMediaId').text(" " + socMed);

							var posPer = $('#posId').text();
							posPer = posPer.replace('%', '');
							var negPer = $('#negId').text();
							negPer = negPer.replace('%', '');
							var neuPer = $('#neuId').text();
							neuPer = neuPer.replace('%', '');

							var donutData = [ {
								label : "Negative",
								data : negPer,
								color : "#CC3333",
								title : "Negative"
							}, {
								label : "Positive",
								data : posPer,
								color : "#009933",
								title : "Positive"
							}, {
								label : "Neutral",
								data : neuPer,
								color : "#FFCC33",
								title : "Neutral"
							} ];
							$.plot("#donut-chart", donutData, {
								series : {
									pie : {
										show : true,
										radius : 1,
										innerRadius : 0.5,
										label : {
											show : true,
											radius : 2 / 3,
											formatter : labelFormatter,
											threshold : 0.1
										}

									}
								},
								legend : {
									show : true
								}

							});
							/*
							 * Custom Label formatter
							 * ----------------------
							 */
							function labelFormatter(label, series) {
								return "<div style='font-size:13px; text-align:center; padding:2px; color: #fff; font-weight: 600;'>"
										+ label
										+ "<br/>"
										+ Math.round(series.percent)
										+ "%</div>";
							}

						});
	</script>

	<script type='text/javascript' src='https://www.google.com/jsapi'></script>
	<script type="text/javascript">
		$("#heatmapId").click(
				function(e) {

					var analysisId = localStorage.getItem("aId");
					var analysisIdInt = parseInt(analysisId, 10);
					/* alert("Heatmap " +analysisIdInt); */
					document.location.href = "HeatMapServlet?analysisId="
							+ analysisIdInt;

				});
		$("#AreaChartYelpId")
				.click(
						function(e) {
							var analysisId = localStorage.getItem("aId");
							var analysisIdInt = parseInt(analysisId, 10);
							document.getElementById("AreaChartYelpId").href = "AreaChartYelpServlet?analysisId="
									+ analysisIdInt;
						});

		$("#BubbleChartYelpId")
				.click(
						function(e) {
							var analysisId = localStorage.getItem("aId");
							var analysisIdInt = parseInt(analysisId, 10);
							document.getElementById("BubbleChartYelpId").href = "BubbleChartYelpServlet?analysisId="
									+ analysisIdInt;

						});

		$("#chartsId").click(
				function(e) {
					var analysisId = localStorage.getItem("aId");
					var analysisIdInt = parseInt(analysisId, 10);
					document.location.href = "BarChartServlet?analysisId="
							+ analysisIdInt;

				});

		$("#stackedBarChartsId").click(
				function(e) {
					var analysisId = localStorage.getItem("aId");
					var analysisIdInt = parseInt(analysisId, 10);
					document.location.href = "StackedBarChart?analysisId="
							+ analysisIdInt;

				});

		$("#GaugeChartsId").click(function(e) {
			var analysisId = localStorage.getItem("aId");
			var analysisIdInt = parseInt(analysisId, 10);
			document.location.href = "GaugeChart?analysisId=" + analysisIdInt;

		});

		$("#CostcoId")
				.click(
						function(e) {
							var date = localStorage.getItem("time");
							var retailer = "Costco";
							var sN = $("input[type='radio']:checked").val();
							/* 	var retailer=this.html();
							alert(retailer); */

							$
									.ajax({
										url : "CompareRetailerServlet?date="
												+ date + "&retailer="
												+ retailer + "&sN=" + sN,
										type : "POST",
										async : true,

										success : function(data) {
											$('#compareDiv').show();
											//alert(data[0]);
											var donutData = [ {
												label : "Negative",
												data : data[1],
												color : "#CC3333",
												title : "Negative"
											}, {
												label : "Positive",
												data : data[0],
												color : "#009933",
												title : "Positive"
											}, {
												label : "Neutral",
												data : data[2],
												color : "#FFCC33",
												title : "Neutral"
											} ];
											$
													.plot(
															"#donut-chart-comp",
															donutData,
															{
																series : {
																	pie : {
																		show : true,
																		radius : 1,
																		innerRadius : 0.5,
																		label : {
																			show : true,
																			radius : 2 / 3,
																			formatter : labelFormatter,
																			threshold : 0.1
																		}

																	}
																},
																legend : {
																	show : true
																}

															});
											/*
											 * Custom Label formatter
											 * ----------------------
											 */
											function labelFormatter(label,
													series) {
												return "<div style='font-size:13px; text-align:center; padding:2px; color: #fff; font-weight: 600;'>"
														+ label
														+ "<br/>"
														+ Math
																.round(series.percent)
														+ "%</div>";
											}

										},
										error : function() {

										}

									});

						});

		$("#TargetId")
				.click(
						function(e) {

							var retailer = "Target";
							var date = localStorage.getItem("time");
							var sN = $("input[type='radio']:checked").val();

							$
									.ajax({
										url : "CompareRetailerServlet?date="
												+ date + "&retailer="
												+ retailer + "&sN=" + sN,
										type : "POST",
										async : true,

										success : function(data) {
											$('#compareDiv').show();
											//alert(data[0]);
											var donutData = [ {
												label : "Negative",
												data : data[1],
												color : "#CC3333",
												title : "Negative"
											}, {
												label : "Positive",
												data : data[0],
												color : "#009933",
												title : "Positive"
											}, {
												label : "Neutral",
												data : data[2],
												color : "#FFCC33",
												title : "Neutral"
											} ];
											$
													.plot(
															"#donut-chart-comp",
															donutData,
															{
																series : {
																	pie : {
																		show : true,
																		radius : 1,
																		innerRadius : 0.5,
																		label : {
																			show : true,
																			radius : 2 / 3,
																			formatter : labelFormatter,
																			threshold : 0.1
																		}

																	}
																},
																legend : {
																	show : true
																}

															});
											/*
											 * Custom Label formatter
											 * ----------------------
											 */
											function labelFormatter(label,
													series) {
												return "<div style='font-size:13px; text-align:center; padding:2px; color: #fff; font-weight: 600;'>"
														+ label
														+ "<br/>"
														+ Math
																.round(series.percent)
														+ "%</div>";
											}

										},
										error : function() {

										}

									});

						});

		
		$('#generateId').click(
				function(e) {
					var vendorName = $
					{
						vendorName
					}
					;
					var vendorName = localStorage.getItem("vendorName");
					var sN = localStorage.getItem("sN", sN);
					var analysisId = localStorage.getItem("aId");
					var analysisIdInt = parseInt(analysisId, 10);
					/* alert("Heatmap " +analysisIdInt); */
					document.location.href = "PrintPDFServlet?analysisId="+ analysisIdInt + "&vendorName="+ vendorName+"&sN="+ sN;
				});
		
		$('#showId').click(
				function(e) {
					var vendorName = $
					{
						vendorName
					}
					;
					var vendorName = localStorage.getItem("vendorName");
					var sN = localStorage.getItem("sN", sN);
					var analysisId = localStorage.getItem("aId");
					var analysisIdInt = parseInt(analysisId, 10);
					/* alert("Heatmap " +analysisIdInt); */
					document.location.href = "ShowPDFServlet?analysisId="+ analysisIdInt + "&vendorName="+ vendorName+"&sN="+ sN;
				});
		
		$('#analyzeId').click(
				function(e) {
					var vendorName = $('#customerNameId').text();
					var dateRange = $('#reservationtime').val();
					var sN = $("input[type='radio']:checked").val();
					localStorage.setItem("time", dateRange);
					localStorage.setItem("vendorName", vendorName);
					localStorage.setItem("sN", sN);
					//alert(vendorName);

					document.location.href = "AnalyzeVendorServlet?vendorName="
							+ vendorName + "&dateRange=" + dateRange + "&sN="
							+ sN;

				});
	</script>


</body>
</html>