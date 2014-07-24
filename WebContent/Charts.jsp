<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
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
                            <p>Hello, <label id="customerNameId"> ${userName}</label></p>

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
             <aside class="right-side">     <br>           
                <!-- Content Header (Page header) -->
                
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
    
      <ul class="nav navbar-nav" style="float: right">       
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown">${vendorName} <b class="caret"></b></a>
          <ul class="dropdown-menu">
          <li><a href="History.jsp">History</a></li>
          	 <li class="divider"></li>
            <li><a href="#">Settings</a></li>
            <li class="divider"></li>
            <li><a href="#">Logout</a></li>
          </ul>
        </li>
      </ul>
    </div><!-- /.navbar-collapse -->  

    </nav>   
                
                
                
                
                
                <section class="content-header">
                    <h1>
                        Column Charts                     
                    </h1>
                    
                </section>

                <!-- Main content -->
                <section class="content">
              
                      <div class="row">
                      <div class="col-md-4" id="chart_div_pos" style="width: 900px; height: 500px;">
                      <h3 class="box-title">Positive Bar Chart</h3></div>
                      <div class="col-md-4" id="chart_div_neg" style="width: 900px; height: 500px;">
                      <h3 class="box-title">Negative Bar Chart</h3></div>
                      <div class="col-md-4" id="chart_div_neu" style="width: 900px; height: 500px;">
                      <h3 class="box-title">Neutral Bar Chart</h3></div>
                      
                      
                    </div><!-- /.row -->       
                           

                    <!-- <div class="row">
                        <div class="col-md-6">
                            Line chart
                            <div class="box box-primary">
                                <div class="box-header">
                                    <i class="fa fa-bar-chart-o"></i>
                                    <h3 class="box-title">Line Chart</h3>
                                </div>
                                <div class="box-body">
                                    <div id="line-chart" style="height: 300px;"></div>
                                </div>/.box-body
                            </div>/.box

                        

                        </div>/.col

                        <div class="col-md-6">
                            Bar chart
                            <div class="box box-primary">
                                <div class="box-header">
                                    <i class="fa fa-bar-chart-o"></i>
                                    <h3 class="box-title">Bar Chart</h3>
                                </div>
                                <div class="box-body">
                                    <div id="bar-chart" style="height: 300px;"></div>
                                </div>/.box-body
                            </div>/.box

                        </div>/.col
                    </div>/.row -->
                   
                </section><!-- /.content -->
            </aside><!-- /.right-side -->
            
            
            
            
            
        </div><!-- ./wrapper -->


        <!-- jQuery 2.0.2 -->
 <!--         <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>  -->
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
        
        <script>
        $(document).ready(function() {
            
        	   $('input[id="reservationtime"]').daterangepicker();  
        	    console.log("document ready");
        	    

        	               
        	});
        
        </script>
    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script type="text/javascript">
    if('${errorMessage}'.toString() != "")
    {
    	 alert('${errorMessage}');
    	document.location.href="Analysis.jsp";	
    }
      google.load("visualization", "1", {'packages':["corechart"]});
      google.setOnLoadCallback(drawChart);
      function drawChart() {
    	  
    	var countArrayPos = [];
        var i;
        countArrayPos = JSON.parse('${BarChartPos}');   
        var dataPos = new google.visualization.DataTable(countArrayPos);
        dataPos.addColumn('number', 'year');
        dataPos.addColumn('number', 'count');
               
        
        for(i=0; i < countArrayPos.length; i++){
       	 //alert(tweetArray[i].location+parseInt(tweetArray[i].count));
            dataPos.addRows([
              [parseInt(countArrayPos[i].year), parseInt(countArrayPos[i].count)]
            ]);
        }     

        var options = {
          title: 'Positive Tweets Chart',
          hAxis: {title: 'Year', titleTextStyle: {color: 'red'}, format: '####'}
     
        };

        var chart = new google.visualization.ColumnChart(document.getElementById('chart_div_pos'));
        chart.draw(dataPos, options);
      }
    </script>
    <script type="text/javascript">
      google.load("visualization", "1", {'packages':["corechart"]});
      google.setOnLoadCallback(drawChart);
      function drawChart() {
    	  
    	var countArrayNeg = [];
        var j;
        var dataNeg = new google.visualization.DataTable();
        dataNeg.addColumn('number', 'year');
        dataNeg.addColumn('number', 'count');
        
        countArrayNeg = JSON.parse('${BarChartNeg}');          
        
        for(j=0; j < countArrayNeg.length; j++){
       	 //alert(tweetArray[i].location+parseInt(tweetArray[i].count));
            dataNeg.addRows([
              [parseInt(countArrayNeg[j].year), parseInt(countArrayNeg[j].count)]
            ]);
        }       

        var options = {
          title: 'Negative Tweets Chart',
          hAxis: {title: 'Year', titleTextStyle: {color: 'red'}, format: '####'}
         
        };

        var chart = new google.visualization.ColumnChart(document.getElementById('chart_div_neg'));
        chart.draw(dataNeg, options);
      }
    </script>
      <script type="text/javascript">
      google.load("visualization", "1", {'packages':["corechart"]});
      google.setOnLoadCallback(drawChart);
      function drawChart() {
    	  
    	var countArrayNeu = [];
        var k;
        var data = new google.visualization.DataTable();
        data.addColumn('number', 'year');
        data.addColumn('number', 'count');
        
        countArrayNeu = JSON.parse('${BarChartNeu}');          
        
        for(k=0; k < countArrayNeu.length; k++){
       	 //alert(tweetArray[i].location+parseInt(tweetArray[i].count));
            data.addRows([
              [parseInt(countArrayNeu[k].year), parseInt(countArrayNeu[k].count)]
            ]);
        }       

        var options = {
          title: 'Neutral Tweets Chart',
          hAxis: {title: 'Year', titleTextStyle: {color: 'red'}, format: '####'}
        
        };

        var chart = new google.visualization.ColumnChart(document.getElementById('chart_div_neu'));
        chart.draw(data, options);
      }
      
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
    	  

    	  $("#chartsId").click(function(e){	      	
    	      	var analysisId=localStorage.getItem("aId");  
    	      	var analysisIdInt = parseInt(analysisId, 10);
    	      	document.location.href="BarChartServlet?analysisId="+analysisIdInt;	      	
    	      	
    	      });
    	  
    	  $("#analyzeId").click(function(e){	           	
  	      	
  	    	var dateRange = localStorage.getItem("time");
  	    	var vendorName =localStorage.getItem("vendorName");
  	    	var sN =localStorage.getItem("sn");
  			//alert(vendorName);
  				
  			document.location.href="AnalyzeVendorServlet?vendorName="+vendorName+"&dateRange="+dateRange+"&sN="+sN;    
  	      	
  	      });
    	  $("#AreaChartYelpId").click(function(e){	      	
  	      	var analysisId=localStorage.getItem("aId");  
  	      	var analysisIdInt = parseInt(analysisId, 10);
  	      	document.getElementById("AreaChartYelpId").href="AreaChartYelpServlet?analysisId="+analysisIdInt;
  	      });
  	  
  	  $("#BubbleChartYelpId").click(function(e){	      	
  	      	var analysisId=localStorage.getItem("aId");  
  	      	var analysisIdInt = parseInt(analysisId, 10);
  	      	document.getElementById("BubbleChartYelpId").href="BubbleChartYelpServlet?analysisId="+analysisIdInt;
  	      	
  	      });
    </script>
             
    </body>
</html>