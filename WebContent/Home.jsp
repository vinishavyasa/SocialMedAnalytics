<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<meta charset="UTF-8">
<title>Social Media Analysis | Home Page</title>
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
<link rel="stylesheet" href="css/register.css" />
<link rel="stylesheet" href="css/nivo-slider.css" media="screen" />

<style type="text/css">
.slider {
	width: 1100px;
	height: 400px;
	overflow: hidden;
	margin: 30px auto;
}


.slider img{
	width: 1100px;
	height: 400px;
	display: none;

}


</style>

<script type="text/javascript" 	src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js">
	
</script>
<script type="text/javascript" 	src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>

<script type="text/javascript">
jQuery(function($) { 

	  // settings
	  var $slider = $('.slider'); // class or id of carousel slider
	  var $slide = 'img'; // could also use 'img' if you're not using a ul
	  var $transition_time = 500; // 1 second
	  var $time_between_slides = 4000; // 4 seconds

	  function slides(){
	    return $slider.find($slide);
	  }

	  slides().fadeOut();

	  // set active classes
	  slides().first().addClass('active');
	  slides().first().fadeIn($transition_time);

	  // auto scroll 
	  $interval = setInterval(
	    function(){
	      var $i = $slider.find($slide + '.active').index();

	      slides().eq($i).removeClass('active');
	      slides().eq($i).fadeOut($transition_time);

	      if (slides().length == $i + 1) $i = -1; // loop to start

	      slides().eq($i + 1).fadeIn($transition_time);
	      slides().eq($i + 1).addClass('active');
	    }
	    , $transition_time +  $time_between_slides 
	  );

	});
/*	function Slider() {

			$(".slider #1").hide("slide", {
			direction : 'left'
		}, 300);

		var sc = $(".slider img").size();
		var count = 1;

		setInterval(function() {
			$(".slider #" + count).show("slide", {
				direction : 'right'
			}, 300);
			$(".slider #" + count).delay(5500).hide("slide", {
				direction : 'left'
			}, 300);

			if (count == sc) {

				count = 1;

			} else {
				count = count + 1;
			}

		}, 6500);

	} */
</script> 


</head>
<body onload="Slider();" class="skin-blue">


	<script src="js/jquery.nivo.slider.pack.js"></script> 


	


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
			<!-- /.navbar-collapse -->
		</nav>
		
		
		
		
		
		<!-- Content Header (Page header) -->
		
			<h1 style= "text-align:center" ><b>Measure, analyze and evolve.</b></h1>



		

		<!-- Main content -->
	<!-- 	<section class="content" >-->





		<div class="row" style="background:">

			<div class="slider">

				<img id="1" src="img/slide12.png" border="0" alt=""> 
				<img id="2" src="img/slide13.png" border="0" alt="">
				 <img id="3" src="img/slide19.png" border="0" alt="">
				 <img id="4" src="img/slide15.png" border="0" alt=""> 
				 <img id="5" src="img/slide20.png" border="0" alt="">
				 <img id="6" src="img/slide17.png" border="0" alt="">

			</div>
			
		<div  style="position: absolute; left:150px; z-index: 18; height: 90px; width: 300px; background: transparent; border:;">


			<span><b> One tool to track down all relevant conversations about your brands, products, competitors and industry.</b></span>
		</div>
		<div 
			style="position: absolute; left: 530px; z-index: 19; height: 90px; width: 300px; background: transparent; border: none;">


			<span><b>We provide real-time collaboration tools, that can effectively and efficiently engage with all social customers. Even for high volume accounts.</b></span>
		</div>
		
		<div 
			style="position: absolute; left: 900px; z-index: 20; height: 90px; width: 300px; background: transparent; border: none;">


			<span><b> A dashboard that gives you insight into all of your business efforts at the same time allows you to come up with a better overall strategy.</b></span>
		</div>
		</div>
		
		
		
		<br>
		<br>
		<br>
		<br>
		<br>

		<footer class="navbar navbar-default" style="text-color:white"> <span> © 2014 Social Media Analytics Inc. All Rights Reserved. </span> </footer>

	</div>
	
	<!-- End of first Row -->
<!-- 	</section>-->
	<!-- /.content -->


	



	<script src="js/jquery-2.0.2.js" type="text/javascript"></script>
	<!-- Bootstrap -->
	<script src="js/bootstrap.min.js" type="text/javascript"></script>

 
	<script type="text/javascript">
		$(document).ready(
				function() {

					var docHeight = $(window).height();
					var footerHeight = $('#footer').height();
					var footerTop = $('#footer').position().top + footerHeight;

					if (footerTop < docHeight) {
						$('#footer').css('margin-top',
								10 + (docHeight - footerTop) + 'px');
					}
				});
	</script>
	<script>
		var j = jQuery.noConflict();
		j(document).ready(function() {
			j('#slider').nivoSlider();
		});

		/* $(window).load(function() {
		     $('#slider').nivoSlider({
		         directionNavHide: false,
		         captionOpacity: 1,
		         prevText: '<',
            nextText: '>'
		     });
		 });*/
	</script>

</body>
</html>