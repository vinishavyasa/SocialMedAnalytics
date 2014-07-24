<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Social Media Analysis | Demographics Page</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
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
                            <p>Hello, <label id="customerNameId"> Walmart</label></p>

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
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <h1>
                        Demographics                       
                    </h1>
                    
                </section>

                <!-- Main content -->
                <section class="content">
                <div class="col-md-6">
						<div class="box box-primary">
                                <div class="box-header">
                                    <h3 class="box-title">Gauge</h3>
                                </div><!-- /.box-header -->
                                <!-- form start -->
                               <div class="box-body no-padding">
                                    <div class="row">
                                        <div class="col-sm-7">
                                            <!-- bar chart -->
                                            <div class="chart" id="bar-chart" style="height: 250px; position: relative;">
                                            
                                            
                          					</div>
                                        </div>
                                        <div class="col-sm-5">
                                            <div class="pad">
                                                <!-- Progress bars -->
                                                <div class="clearfix">
                                                    <span class="pull-left">Bandwidth</span>
                                                    <small class="pull-right">10/200 GB</small>
                                                </div>
                                                <div class="progress xs">
                                                    <div class="progress-bar progress-bar-green" style="width: 70%;"></div>
                                                </div>

                                                <div class="clearfix">
                                                    <span class="pull-left">Transfered</span>
                                                    <small class="pull-right">10 GB</small>
                                                </div>
                                                <div class="progress xs">
                                                    <div class="progress-bar progress-bar-red" style="width: 70%;"></div>
                                                </div>

                                                <div class="clearfix">
                                                    <span class="pull-left">Activity</span>
                                                    <small class="pull-right">73%</small>
                                                </div>
                                                <div class="progress xs">
                                                    <div class="progress-bar progress-bar-light-blue" style="width: 70%;"></div>
                                                </div>

                                                <div class="clearfix">
                                                    <span class="pull-left">FTP</span>
                                                    <small class="pull-right">30 GB</small>
                                                </div>
                                                <div class="progress xs">
                                                    <div class="progress-bar progress-bar-aqua" style="width: 70%;"></div>
                                                </div>
                                                <!-- Buttons -->
                                                <p>
                                                    <button class="btn btn-default btn-sm"><i class="fa fa-cloud-download"></i> Generate PDF</button>
                                                </p>
                                            </div><!-- /.pad -->
                                        </div><!-- /.col -->
                                    </div><!-- /.row - inside box -->
                                    
                                          <div class="row">
                                           <div class="col-sm-7">
                                           
                                           </div>
                                          </div>
                                </div>
                            </div>
						</div>
						
                </section><!-- /.content -->
            </aside><!-- /.right-side -->
            
            
            
            
            
        </div><!-- ./wrapper -->


        <!-- jQuery 2.0.2 -->
               <script src="js/jquery-2.0.2.js" type="text/javascript"></script>  
        <script src="//cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
        <!-- <script src="js/jquery-1.10.2.js"></script> -->
        <!-- Bootstrap -->
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <!-- AdminLTE App -->     
            
                <script src="js/morris.min.js" type="text/javascript"></script>
                  
                    <script src="js/dashboard.js" type="text/javascript"></script>
          <script type='text/javascript' src='https://www.google.com/jsapi'></script>
  	    <script type="text/javascript" src="js/heatmapGoogle.js"></script>
  
        

    </body>
</html>