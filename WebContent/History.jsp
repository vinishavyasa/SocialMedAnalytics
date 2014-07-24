<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="com.bean.HistoryBean"%>
<%@ page import="com.service.Service" %>
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

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>History Page</title>
<style>
.srchlst_wrap { _text-align:left; } 
.srchlst { width:700px;  text-align:left; }
.rsi { padding: 3px 0; }
.rsh { padding: 3px 0; border-bottom: 1px solid #EBEBEB; color: #6F6F6F; }
table, th, td
{
border:1px double black;
}
th, td
{
padding:15px;
}
</style>
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
                        <li class="active">
                            <a href="Analysis.jsp">
                                <i class="fa fa-dashboard"></i> <span>Analysis</span>
                            </a>
                        </li>
                        <li>
                            <a href="HeatMap.jsp" id="heatmapId">
                                <i class="fa fa-th"></i> <span>Heat Map</span> 
                            </a>
                        </li>
                        <li >
                            <a href="Charts.jsp" id="chartsId">
                                <i class="fa fa-bar-chart-o"></i>
                                <span>Charts</span>                             
                            </a>
                         
                        </li>
                        <li>
                            <a href="WordCloud.jsp" id="wordCloudId">
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
    
    
    
    <div style="bgcolor:blue " > 
    	<form name="showhistory" method="post" action="Analysis.jsp">
    	
    	   <div class="srchlst_wrap">
                <div class="srchlst">
                    <div class="rsh"><b>MY RECENT ANALYSIS </b>- <a class=sl href="/?cls">clear</a></div>
                    <table style="width:900px">
                        <%
                		Service service = new Service();
                        String userName = (String)request.getSession().getAttribute("userName");
                        ArrayList<HistoryBean> history = service.getHistory(userName);
                        
                        Iterator<HistoryBean> it = history.iterator();
                        while (it.hasNext()) {
                        	%>
                        	<tr>
                        	<%
                        	HistoryBean historyBean = it.next();
                        	String searchLine = userName + "-" + historyBean.getVendorName() + "-" + historyBean.getSocialNetwork() +
                        			"-" + historyBean.getFromDateString() + "-" + historyBean.getToDateString();
                        	String displayLine =  historyBean.getSocialNetwork() +
                        			" - " + historyBean.getFromDateString() + "-" + historyBean.getToDateString();
                        	String analysisDate = historyBean.getAnalysisDate();
                        	
                        	String href = "/SocialMedAnalytics2/AnalyzeVendorServlet?fromHistoryPage=yes&vendorName=" + historyBean.getVendorName() + "&dateRange=" +
                        			historyBean.getFromDateString() + "- " + historyBean.getToDateString() +
                        			"&sN=" +  historyBean.getSocialNetwork();
                        	href = href.replaceAll(" ", "%20");
                        	%>
                            <!-- <div class="rsi"><a id="rsl_0" href="<%=href%>"  title=""><%=displayLine%></a></div>  -->
                            <td><%=analysisDate %></td>
                            <td><a id="rsl_0" href="<%=href%>"  title=""><%=displayLine%></a></td>
                            </tr>
						<%
						}
						%>
					</table>                    
                </div>
            </div>
    	</form>
    </div>
    
    
   
    	
    	
    
    
    
    
    
    </div>
      
    
    </aside>
    </div>
    
    
    
    
    
    
    
    
    
    
</body>
</html>