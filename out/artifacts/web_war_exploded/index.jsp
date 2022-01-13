<!--
author: W3layouts
author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE html>
<html lang="en">
<head>
<title>HOME</title>
<!-- custom-theme -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Homestead Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //custom-theme -->
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- font-awesome-icons -->
<link href="css/font-awesome.css" rel="stylesheet"> 
<!-- //font-awesome-icons -->
<link href="//fonts.googleapis.com/css?family=Roboto+Condensed:300,300i,400,400i,700,700i" rel="stylesheet">
<link href="//fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700,700i,900,900i" rel="stylesheet">
<link rel="stylesheet" href="css/owl.carousel.css" type="text/css" media="all">
<link href="css/owl.theme.css" rel="stylesheet">

</head>	
<body>
<!-- banner -->
<div class="header">
	<div class="w3layouts_header_right">
		<ul>
			<li><i class="fa fa-phone" aria-hidden="true"></i>(+000) 123 456</li>
			<li><i class="fa fa-envelope" aria-hidden="true"></i><a href="mailto:info@example.com">info@example.com</a></li>
		</ul>
	</div>
</div>
<div class="top_heder_agile_info">
	<div class="w3ls_agile_header_inner">	
		<nav class="navbar navbar-default">
			<div class="navbar-header navbar-left">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<h3><a class="navbar-brand" href="index.jsp"><i class="fa fa-home" aria-hidden="true"></i> EastandWrightApartment </a></h3>
			</div>
				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse navbar-right" id="bs-example-navbar-collapse-1">
					<nav class="menu menu--juliet">
						<ul class="nav navbar-nav">
							<li class="active"><a href="index.jsp">Home</a></li>
							<% if (session.getAttribute("user") == null) {
							%>
							<li><a href="login.jsp" >Login</a></li>
							<li><a href="signup.jsp">Register</a></li>
							<%
								} else {
							%>
							<li><a href="userHome.jsp" >My account</a></li>
							<%
								}
							%>

							<li><a href="gallery.html">Gallery</a></li>
							<li><a href="contact.html">Contact</a></li>
						</ul>

					</nav>
				</div>
		</nav>
	</div>
</div>
<!-- //banner -->
<!-- banner -->
<div class="banner-silder">
	<div class="banner">
		<ul>
			<li></li>
			<li></li>
			<li></li>
		</ul>
		<ol>
		</ol>
			<i class="left"></i><i class="right"></i>
			 <div class="banner_wthree_agile_info">
				<h3>High quality community service and convenient property management experience</h3>

			</div>
	</div>
</div>
<!-- //banner -->
<!-- popular -->
<div class="popular-section-wthree ">
	<div class="container">
		<div class="wthree-heading">
			<h2 class="w3l_header">About us</h2>
			<p class="quia">Warm、Thoughtful, High Quality , Efficient</p>
		</div>
			<p class="bui">The most intimate community service website in the United States helps you manage your home. Provide you with all kinds of payment information and analysis, management, reminders, furniture appliances maintenance.</p>

	</div>
</div>
	<!-- //popular -->
<!-- banner-bottom -->

<!-- //banner-bottom -->

<!-- team -->

<!-- team -->
<!-- feedback -->

<!-- //feedback -->
<!-- Stats -->

		<!-- //Stats -->
<!-- myModal -->
				<div class="tooltip-content">

					<div class="modal fade features-modal" id="myModal" tabindex="-1" role="dialog" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
									<h4 class="modal-title">homestead</h4>
								</div>
								<div class="modal-body">
									<img src="images/g4.jpg" class="img-responsive" alt="Boat house">
									<h5>Fishing Season Now Open</h5>
									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent varius lectus vitae porttitor fringilla. Donec turpis orci, elementum a nunc quis, maximus varius ipsum. Sed bibendum ex in dignissim bibendum.</p>
								</div>
							</div>
						</div>
					</div>

				</div>
				<!-- //myModal -->
<!-- footer -->
	<div class="footer">
		<div class="container">
			<div class="col-md-4 agile_footer_grid">
				<h3>Contact Info</h3>
					<div id="main"  style="width:1200px;">
					<div id="left" style="width:400px;float:left;" class="glyphicon glyphicon-map-marker" aria-hidden="true">1234k Avenue, 5th block, <span> Auburn.</span></div>
					<div id="middle" style="width:400px;float:left;" class="glyphicon glyphicon-envelope" aria-hidden="true"><a href="mailto:info@example.com">info@example.com</a></div>
					<div id="right" style="width:400px;float:left;"  class="glyphicon glyphicon-earphone" aria-hidden="true"> +1 (334) 123 4567 </div>

					</div>



			</div>

		</div>
	</div>

<!-- //footer -->
<!-- js -->
<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
<!-- carousal -->
	<script src="js/slick.js" type="text/javascript"></script>
	<script type="text/javascript">
		$(document).on('ready', function() {
		  $(".center").slick({
			dots: true,
			infinite: true,
			centerMode: true,
			slidesToShow: 2,
			slidesToScroll: 2,
			responsive: [
				{
				  breakpoint:800,
				  settings: {
					arrows: true,
					centerMode: false,
					slidesToShow: 1
				  }
				},
				{
				  breakpoint: 480,
				  settings: {
					arrows: true,
					centerMode: false,
					centerPadding: '40px',
					slidesToShow: 1
				  }
				}
			 ]
		  });
		});
	</script>
<!-- //carousal -->
<!-- //js -->
<script>
        $(function(){ 

  // parameters
  // image height
  var images_height = '650px';
  // array of images
  var images_url = [
      'images/banner.jpg',
      'images/banner-1.jpg',
      'images/banner-2.jpg'
  ];
  var images_count = images_url.length;

  // create nodes
  for(var j=0;j<images_count+1;j++){
      $('.banner ul').append('<li></li>')
  }

  // pagination
  for(var j=0;j<images_count;j++){
      if(j==0){
          $('.banner ol').append('<li class="current"></li>')
      }else{
          $('.banner ol').append('<li></li>')
      }
  }

  // convert images into backgrounds
  $('.banner ul li').css('background-image','url('+images_url[0]+')');
  
  $.each(images_url,function(key,value){
      $('.banner ul li').eq(key).css('background-image','url('+value+')');
  });

  $('.banner').css('height',images_height);

  $('.banner ul').css('width',(images_count+1)*100+'%');

  $('.banner ol').css('width',images_count*20+'px');
  $('.banner ol').css('margin-left',-images_count*20*0.5-10+'px');

  var num = 0;

  var window_width = $(window).width();

  $(window).resize(function(){
      window_width = $(window).width();
      $('.banner ul li').css({width:window_width});
      clearInterval(timer);
      nextPlay();
      timer = setInterval(nextPlay,2000);
  });

  $('.banner ul li').width(window_width);

  // pagination dots
  $('.banner ol li').mouseover(function(){
      $(this).addClass('current').siblings().removeClass('current');
      var i = $(this).index();
      //console.log(i);
      $('.banner ul').stop().animate({left:-i*window_width},500);
      num = i;
  });

  // autoplay
  var timer = null;

  function prevPlay(){
      num--;
      if(num<0){
          $('.banner ul').css({left:-window_width*images_count}).stop().animate({left:-window_width*(images_count-1)},500);
          num=images_count-1;
      }else{
          $('.banner ul').stop().animate({left:-num*window_width},500);
      }
      if(num==images_count-1){
          $('.banner ol li').eq(images_count-1).addClass('current').siblings().removeClass('current');
      }else{
          $('.banner ol li').eq(num).addClass('current').siblings().removeClass('current');

      }
  }

  function nextPlay(){
      num++;
      if(num>images_count){
          $('.banner ul').css({left:0}).stop().animate({left:-window_width},500);
          num=1;
      }else{
          $('.banner ul').stop().animate({left:-num*window_width},500);
      }
      if(num==images_count){
          $('.banner ol li').eq(0).addClass('current').siblings().removeClass('current');
      }else{
          $('.banner ol li').eq(num).addClass('current').siblings().removeClass('current');

      }
  }

  timer = setInterval(nextPlay,2000);

  // auto pause on mouse enter
  $('.banner').mouseenter(function(){
      clearInterval(timer);
      $('.banner i').fadeIn();
  }).mouseleave(function(){
      timer = setInterval(nextPlay,2000);
      $('.banner i').fadeOut();
  });

  // goto next
  $('.banner .right').click(function(){
      nextPlay();
  });

  // back to previous
  $('.banner .left').click(function(){
      prevPlay();
  });

});
    </script>

<!-- start-smoth-scrolling -->
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>
<script type="text/javascript">
	jQuery(document).ready(function($) {
		$(".scroll").click(function(event){		
			event.preventDefault();
			$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
		});
	});
</script>
<!-- start-smoth-scrolling -->
<!-- here stars scrolling icon -->
	<script type="text/javascript">
		$(document).ready(function() {
			/*
				var defaults = {
				containerID: 'toTop', // fading element id
				containerHoverID: 'toTopHover', // fading element hover id
				scrollSpeed: 1200,
				easingType: 'linear' 
				};
			*/
								
			$().UItoTop({ easingType: 'easeOutQuart' });
								
			});
	</script>
<!-- //here ends scrolling icon -->
<!-- for bootstrap working -->
	<script src="js/bootstrap.js"></script>
<!-- //for bootstrap working -->
<!-- //here ends scrolling icon -->
	<script src="js/owl.carousel.js"></script>
	<script>
$(document).ready(function() { 
	$("#owl-demo").owlCarousel({
 
		autoPlay: 3000, //Set AutoPlay to 3 seconds
		autoPlay:true,
		items : 3,
		itemsDesktop : [640,5],
		itemsDesktopSmall : [414,4]
 
	});
	
}); 
</script>
<script type="text/javascript" src="js/numscroller-1.0.js"></script>
</body>
</html>