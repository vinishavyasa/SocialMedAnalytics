<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Social Media Analysis | Heat Map Page</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <!-- bootstrap 3.0.2 -->
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- font Awesome -->
        <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <!-- Ionicons -->
        <link href="css/ionicons.min.css" rel="stylesheet" type="text/css" />
        <!-- Theme style -->
        <link href="css/AdminLTE.css" rel="stylesheet" type="text/css" />
       <link rel="stylesheet" href="css/ammap.css" type="text/css" />
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
             <aside class="right-side"><br>                  
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
          <a href="#" class="dropdown-toggle" data-toggle="dropdown">${vendorName}<b class="caret"></b></a>
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
                        Heat Map                       
                    </h1>
                    
                </section>

                <!-- Main content -->
                <section class="content">
                <div class="col-md-8">
						<div class="box box-primary">
                                <div class="box-header">
                                    <h3 class="box-title">Heat Map of USA</h3>
                                </div><!-- /.box-header -->
                             
                            </div>
						</div>
						
						
						 <div class="row">
                      <div class="col-md-6">
                        <div id="chart_div" style="width: 900px; height: 500px;"></div>
                      </div>
                    
                    </div>
                </section><!-- /.content -->
            </aside><!-- /.right-side -->
            
            
            
            
            
        </div><!-- ./wrapper -->


        <!-- jQuery 2.0.2 -->
             <script src="js/jquery-2.0.2.js" type="text/javascript"></script>  
        
        <!-- Bootstrap -->
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <!-- AdminLTE App -->
    
       
       <!--  <script src="js/ammap.js" type="text/javascript"></script> -->
        <!-- map file should be included after ammap.js -->
	<!-- 	<script src="js/usaLow.js" type="text/javascript"></script> -->
		
		
		
        <script type='text/javascript' src='https://www.google.com/jsapi'></script> 	    
  	    <script type="text/javascript">
  
  	  if('${errorMessage}'.toString() == "")
		  {
  		 	//alert("inside if");
			google.load('visualization', '1', {'packages': ['geochart']});
  			google.setOnLoadCallback(drawRegionsMap);

   function drawRegionsMap() {	   
	   var tweetArray = [];
       var i;
       
       

     var data = new google.visualization.DataTable();         
     data.addColumn('string', 'location');
     data.addColumn('number', 'Tweet Code');
     
     tweetArray = JSON.parse('${HeatMap}');          
     
   
     for(i=0; i < tweetArray.length; i++){
    	 //alert(tweetArray[i].location+parseInt(tweetArray[i].count));
         data.addRows([
           [tweetArray[i].location, parseInt(tweetArray[i].count)]
         ]);
     }
   

     var options = {
     		
     		region: 'US',
     		resolution: "provinces",
     		colorAxis: {colors: ['#99CCCC','#FF0000', '#000066']}         		
     		
     };

     var chart = new google.visualization.GeoChart(document.getElementById('chart_div'));
     chart.draw(data, options);
 };
   
		  }  
	  else
		  {
		  //alert("else");
		 alert('${errorMessage}');
		 document.location.href="Analysis.jsp";
		  }
  	    
  
  	    
  	    
  	  
  	    </script>
     
   <script type="text/javascript">
  	    
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
			//alert(vendorName);
				
			document.location.href="AnalyzeVendorServlet?vendorName="+vendorName+"&dateRange="+dateRange+"&sN="+sN;    
	      	
	      });

	  $("#chartsId").click(function(e){	      	
	      	var analysisId=localStorage.getItem("aId");  
	      	var analysisIdInt = parseInt(analysisId, 10);
	      	document.location.href="BarChartServlet?analysisId="+analysisIdInt;	      	
	      	
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