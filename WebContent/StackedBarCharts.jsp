<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
    <%@ taglib  prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
	<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
        <meta charset="UTF-8">
        <title>Social Media Analysis | Analysis Page</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <!-- bootstrap 3.0.2 -->
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- font Awesome -->
        <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <!-- Ionicons -->
        <link href="css/ionicons.min.css" rel="stylesheet" type="text/css" />
        <!-- Theme style -->
        <link href="css/AdminLTE.css" rel="stylesheet" type="text/css" />
           <link href="css/daterangepicker-bs3.css" rel="stylesheet" type="text/css" />

    </head>
    <body class="skin-blue">
        <!-- header logo: style can be found in header.less -->
        <header class="header">
            <a href="Analysis.jsp" class="logo">
                <!-- Add the class icon to your logo image or logo icon to add the margining -->
                Social Media Analytics
            </a>
            <!-- Header Navbar: style can be found in header.less -->
            <nav class="navbar navbar-static-top" role="navigation">
                <!-- Sidebar toggle button-->
                <a href="#" class="navbar-btn sidebar-toggle" data-toggle="offcanvas" role="button">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
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
                            <p>Hello, <label id="customerNameId"> ${userName} </label></p>

                            <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
                        </div>
                    </div>
                    <!-- search form -->
                    <form action="#" method="get" class="sidebar-form">
                        <div class="input-group">
                            <input type="text" name="q" class="form-control" placeholder="Search..."/>
                            <span class="input-group-btn">
                                <button type='submit' name='seach' id='search-btn' class="btn btn-flat"><i class="fa fa-search"></i></button>
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
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
     <!--  <a class="navbar-brand" href="#">Social Media Analytics</a> -->
    </div> 
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      	<ul class="nav navbar-nav">
        <li><a href="Home.jsp">Home</a></li>
        <li><a href="Features.jsp">Features</a></li>
         <li  class="active"><a href="Analysis.jsp">Analyze</a></li>
          <li><a href="About.jsp">About Us</a></li>
      
      </ul>
    
      <ul class="nav navbar-nav" style="padding-left: 900px">       
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown">${vendorName} <b class="caret"></b></a>
          <ul class="dropdown-menu">
          	<li><a href="History.jsp">History</a></li>
          	 <li class="divider"></li>
            <li><a href="Settings.jsp">Settings</a></li>
            <li class="divider"></li>
            <li><a href="Home.jsp">Logout</a></li>
            
          </ul>
        </li>
      </ul>
    </div><!-- /.navbar-collapse -->  
<!--     </div> -->
    </nav>   
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <h1>
                       Stacked Charts                     
                    </h1>
                    
                </section>

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
        <script src="js/myjs.js" type="text/javascript"></script>

    <script type="text/javascript" src="//www.google.com/jsapi"></script>
    <script type="text/javascript">
      google.load('visualization', '1', {packages: ['corechart']});

      function drawVisualization() {
        // Create and populate the data table.
      	var data = google.visualization.arrayToDataTable([
        ['Gender', 'Positive', 'Neutral', 'Negative', { role: 'annotation' } ],
        ['Female', ${femalePosCount}, ${femaleNeuCount}, ${femaleNegCount}, ''],
        ['Male', ${malePosCount}, ${maleNeuCount}, ${maleNegCount}, ''],
        ]);

        var options = {
        hAxis: {title: '${vendorName}', titleTextStyle: {color: 'red'}, format: '####'},
        vAxis: {title: 'Count', titleTextStyle: {color: 'blue'}, format: '####'},
		width: 500,
        height: 400,
        legend: { position: 'top', maxLines: 3 },
		bar: { groupWidth: '75%' },
        isStacked: true, 
      };      
        // Create and draw the visualization.
        new google.visualization.ColumnChart(document.getElementById('visualization')).
            draw(data, options);
      }

      google.setOnLoadCallback(drawVisualization);
	</script>

	<% String analysisId = (String)request.getSession().getAttribute("analysisId");
	if (analysisId == null) { %>
		<h2>Please do analysis and then come here to see the reports.</h2>
	<% } else {%>
    	<div id="visualization" style="width: 600px; height: 400px;"></div>
	<% } %>
   </body>
</html>