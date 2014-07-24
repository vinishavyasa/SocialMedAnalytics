<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Social Media Analysis | Demographics Page</title>
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
					<li>
                            <a href="Analysis.jsp" id="analyzeId">
                                <i class="fa fa-dashboard"></i> <span>Analysis</span>
                            </a>
                        </li>
                        <li class="active">
                            <a href="#" id="heatmapId">
                                <i class="fa fa-th"></i> <span>Heat Map</span> 
                            </a>
                        </li>
                        <li >
                            <a href="#" id="chartsId">
                                <i class="fa fa-bar-chart-o"></i>
                                <span>Charts</span>                             
                            </a>
                         
                        </li>
                        <li >
                            <a href="#" id="wordCloudId">
                                <i class="fa fa-laptop"></i>
                                <span>Word Cloud</span>                               
                            </a>                           
                        </li>
                       
                          <li>
                            <a href="StackedBarChart?view=stackbar">
                                <i class="fa fa-bar-chart-o"></i> <span>StackedChart</span>                                
                            </a>
                        </li>               
                        
                        <li>
                            <a href="StackedBarChart?view=gauge">
                                <i class="fa fa-compass"></i> <span>Gauge</span>                                
                            </a>
                        </li> 
                        <li class="active"><a href="AreaChartYelp.jsp" id="AreaChartYelpId"> <i
							class="fa fa-calendar"></i> <span>AreaChart</span>
					</a></li> 
                        <li>
                            <a href="BubbleChartYelp.jsp}" id="BubbleChartYelpId">
                                <i class="fa fa-calendar"></i> <span>BubbleChart</span>                                
                            </a>
                        </li> 
				</ul>
			</section>
			<!-- /.sidebar -->
		</aside>
		<aside class="right-side">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>Area Charts</h1>

			</section>

			<!-- Main content -->
			<aside class="right-side">

				<!-- Main content -->
				<section class="content">

					<div class="row">
						<div class="col-md-4" id="chart_div"
							style="width: 900px; height: 500px;">
							<h3 class="box-title">Area Chart</h3>
						</div>


					</div>
					<!-- /.row -->

				</section>
				<!-- /.content -->
			</aside>
			<!-- /.right-side -->
	</div>
	<!-- ./wrapper -->


	<!-- jQuery 2.0.2 -->
	<script src="js/jquery-2.0.2.js" type="text/javascript"></script>
	<script
		src="//cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
	<!-- <script src="js/jquery-1.10.2.js"></script> -->
	<!-- Bootstrap -->
	<script src="js/bootstrap.min.js" type="text/javascript"></script>
	<!-- AdminLTE App -->

	<script type='text/javascript' src='https://www.google.com/jsapi'></script>
	<script type="text/javascript">
		$('#printId').click(function(e) {
			window.print();

		});
	</script>
	
	<script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script type="text/javascript">
      function drawChart() {
    	var countArrayPos = [];
    	var countArrayNeg = [];
        var i;
        countArrayPos = JSON.parse('${AreaChartPos}');
        countArrayNeg = JSON.parse('${AreaChartNeg}'); 
        //countArrayNeu = JSON.parse('${AreaChartNeu}'); 
    	  //alert("in chart Year: " + countArrayNeu[0].year + ", count:" + countArrayNeu[0].count);
        var dataPos = new google.visualization.DataTable();
        dataPos.addColumn('number','year');
		dataPos.addColumn('number','pos');
		dataPos.addColumn('number','neg');
               
        
        for(i=0; i < countArrayPos.length; i++){
            dataPos.addRow([parseInt(countArrayPos[i].year), parseInt(countArrayPos[i].count),parseInt(countArrayNeg[i].count)]);
        }   

        var options = {
				title : 'Area Chart Yelp',
				hAxis : {
					title : 'Year',
					titleTextStyle : {
						color : '#333'
					}
				},
				vAxis : {
					minValue : 0
				}
			};

			var chart = new google.visualization.AreaChart(
					document
							.getElementById('chart_div'));
			chart
					.draw(dataPos,
							options);
      }
      google.load("visualization", "1", {'packages':["corechart"]});
      google.setOnLoadCallback(drawChart);
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
$("#heatmapId").click(function(e){
	
	var analysisId=localStorage.getItem("aId");
	
	var analysisIdInt = parseInt(analysisId, 10);
	
	document.location.href="HeatMapServlet?analysisId="+analysisIdInt;    	
	
	
});
  
  
$("#wordCloudId").click(function(e){	      	
    	var analysisId=localStorage.getItem("aId");  
    	var analysisIdInt = parseInt(analysisId, 10);
    	document.location.href="WordCloudServlet?analysisId="+analysisIdInt;	      	
    	
    });

$("#analyzeId").click(function(e){	           	
    	
  	var dateRange = localStorage.getItem("time");
  	var vendorName =localStorage.getItem("vendorName");
  	var sN =localStorage.getItem("sn");
			
		document.location.href="AnalyzeVendorServlet?vendorName="+vendorName+"&dateRange="+dateRange+"&sN="+sN;    
    	
    });

$("#chartsId").click(function(e){	      	
    	var analysisId=localStorage.getItem("aId");  
    	var analysisIdInt = parseInt(analysisId, 10);
    	document.location.href="BarChartServlet?analysisId="+analysisIdInt;	      	
    	
    });
</script>

</body>
</html>