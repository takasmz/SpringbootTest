<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<meta charset="utf-8">
	<title>精品课程网</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1, user-scalable=no">
	<meta name="description" content="">
	<meta name="author" content="">
	<link rel="stylesheet" type="text/css" href="/components/mbts/css/cloud-admin.css" >
	<link rel="stylesheet" type="text/css"  href="/components/mbts/css/themes/default.css" id="skin-switcher" >
	<link rel="stylesheet" type="text/css"  href="/components/mbts/css/responsive.css" >
	<!-- STYLESHEETS -->
	<!--[if lt IE 9]>
	<script src="js/flot/excanvas.min.js"></script>
	<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
	<script src="http://css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js"></script>
	<![endif]-->
	<link href="/components/mbts/font-awesome/css/font-awesome.min.css" rel="stylesheet">
	<!-- ANIMATE -->
	<link rel="stylesheet" type="text/css" href="/components/mbts/css/animatecss/animate.min.css" />
	<!-- DATE RANGE PICKER -->
	<link rel="stylesheet" type="text/css" href="/components/mbts/js/bootstrap-daterangepicker/daterangepicker-bs3.css" />
	<!-- TODO -->
	<link rel="stylesheet" type="text/css" href="/components/mbts/js/jquery-todo/css/styles.css" />
	<!-- FULL CALENDAR -->
	<link rel="stylesheet" type="text/css" href="/components/mbts/js/fullcalendar/fullcalendar.min.css" />
	<!-- GRITTER -->
	<link rel="stylesheet" type="text/css" href="/components/mbts/js/gritter/css/jquery.gritter.css" />

</head>
<body>
	<!-- HEADER -->
	<header class="navbar clearfix" id="header">
		<div class="container">
				<div class="navbar-brand">
					<!-- 网站logo -->
					<a href="index.html" class="dropdown-toggle">
					   <img src="/components/mbts/img/logo/logo.png" alt="Cloud Admin Logo" class="img-responsive" height="30" width="120">
						<!-- 例如: <img src="img/logo/logo.png" alt="Cloud Admin Logo" class="img-responsive" height="30" width="120"> -->
					</a>
					<!-- /网站logo -->
					<!-- TEAM STATUS FOR MOBILE -->
					<div class="visible-xs">
						<a href="#" class="team-status-toggle switcher btn dropdown-toggle">
							<i class="fa fa-users"></i>
						</a>
					</div>
					<!-- /TEAM STATUS FOR MOBILE -->
					<!-- 导航条显示隐藏按钮 -->
					<div id="sidebar-collapse" class="sidebar-collapse btn">
						<i class="fa fa-bars" 
							data-icon1="fa fa-bars" 
							data-icon2="fa fa-bars" ></i>
					</div>
					<!-- /导航条显示隐藏按钮 -->
				</div>
				
				<!-- NAVBAR LEFT -->
				<ul class="nav navbar-nav pull-left hidden-xs" id="navbar-left">
				<#list courses as course>  
					<li class="dropdown">
						<a href="javascript:void(0)" onclick="switchCurriculum(${courseno})" class="dropdown-toggle" data-toggle="dropdown">
							<h5><span class="name">${course.caption}</span></h5>
						</a>
					</li>					
				</#list>
				</ul>

				<!-- BEGIN TOP NAVIGATION MENU -->					
				<ul class="nav navbar-nav pull-right">
					<!-- BEGIN NOTIFICATION DROPDOWN -->	
					<li class="dropdown" id="header-notification">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">
							<i class="fa fa-bell"></i>
							<span class="badge">0</span>						
						</a>
						<ul class="dropdown-menu notification">
							<li class="dropdown-title">
								<span><i class="fa fa-bell"></i> 0 Notifications</span>
							</li>																																										
							<li class="footer">
								<a href="#">See all notifications <i class="fa fa-arrow-circle-right"></i></a>
							</li>
						</ul>
					</li>
					<!-- END NOTIFICATION DROPDOWN -->
					<!-- BEGIN INBOX DROPDOWN -->
					<li class="dropdown" id="header-message">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">
						<i class="fa fa-envelope"></i>
						<span class="badge">0</span>
						</a>
						<ul class="dropdown-menu inbox">
							<li class="dropdown-title">
								<span><i class="fa fa-envelope-o"></i> 0 Messages</span>
								<span class="compose pull-right tip-right" title="Compose message"><i class="fa fa-pencil-square-o"></i></span>
							</li>																					
							<li class="footer">
								<a href="#">See all messages <i class="fa fa-arrow-circle-right"></i></a>
							</li>
						</ul>
					</li>
					<!-- END INBOX DROPDOWN -->
					<!-- BEGIN TODO DROPDOWN -->
					<li class="dropdown" id="header-tasks">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">
						<i class="fa fa-tasks"></i>
						<span class="badge">0</span>
						</a>
						<ul class="dropdown-menu tasks">
							<li class="dropdown-title">
								<span><i class="fa fa-check"></i> 0 tasks in progress</span>
							</li>																																		
							<li class="footer">
								<a href="#">See all tasks <i class="fa fa-arrow-circle-right"></i></a>
							</li>
						</ul>
					</li>
					<!-- END TODO DROPDOWN -->
					<!-- BEGIN USER LOGIN DROPDOWN -->
					<li class="dropdown user" id="header-user">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">
							<img alt="" src="/components/mbts/img/avatars/portrait.png" />
							<span class="username">未登陆</span>
							<i class="fa fa-angle-down"></i>
						</a>
						<ul class="dropdown-menu">
							<li><a href="#"><i class="fa fa-cog"></i> 账号设置</a></li>
							<li><a href="#"><i class="fa fa-eye"></i> 偏好设置</a></li>
							<li><a href="login.html"><i class="fa fa-power-off"></i> 登陆</a></li>
						</ul>
					</li>
					<!-- END USER LOGIN DROPDOWN -->
				</ul>
				<!-- END TOP NAVIGATION MENU -->
		</div>
		
	</header>
	<!--/HEADER -->	
	<!-- PAGE -->
	<section id="page">
				<!-- SIDEBAR -->
				<div id="sidebar" class="sidebar">
					<div class="sidebar-menu nav-collapse">
						<div class="divide-20"></div>
						<!-- SEARCH BAR -->
						<div id="search-bar">
							<input class="search" type="text" placeholder="Search"><i class="fa fa-search search-icon"></i>
						</div>
						<!-- /SEARCH BAR -->
						
						<!-- SIDEBAR QUICK-LAUNCH -->
						<!-- <div id="quicklaunch">
						<!-- /SIDEBAR QUICK-LAUNCH -->
						
						<!-- SIDEBAR MENU -->
						<ul>							
							<li class="has-sub">
								<a href="javascript:;" class="">
								<i class="fa fa-bookmark-o fa-fw"></i> <span class="menu-text">课程介绍</span>
								<span class="arrow"></span>
								</a>
								<ul class="sub">
									<li><a class="" href="elements.html"><span class="sub-menu-text">简介</span></a></li>									
									<li><a class="" href="buttons_icons.html"><span class="sub-menu-text">教师队伍</span></a></li>
									<li><a class="" href="sliders_progress.html"><span class="sub-menu-text">教学大纲</span></a></li>
									<li><a class="" href="typography.html"><span class="sub-menu-text">课表</span></a></li>									
								</ul>
							</li>							
							<li class="has-sub">
								<a href="javascript:;" class="">
								<i class="fa fa-table fa-fw"></i> <span class="menu-text">课程资源</span>
								<span class="arrow"></span>
								</a>
								<ul class="sub">
									<li><a class="" href="/download?sn=${courseno!1}"><span class="sub-menu-text">教学课件</span></a></li>
									<li><a class="" href="/download?sn=${courseno!1}"><span class="sub-menu-text">教学教案</span></a></li>
									<li><a class="" href="/download?sn=${courseno!1}"><span class="sub-menu-text">教学视频</span></a></li>
									<li><a class="" href="/download?sn=${courseno!1}"><span class="sub-menu-text">实验指导</span></a></li>
								</ul>
							</li>
							<li class="has-sub">
								<a href="javascript:;" class="">
								<i class="fa fa-pencil-square-o fa-fw"></i> <span class="menu-text">课程习题</span>
								<span class="arrow"></span>
								</a>
								<ul class="sub">
									<li><a class="" href="forms.html"><span class="sub-menu-text">作业</span></a></li>
									<li><a class="" href="wizards_validations.html"><span class="sub-menu-text">练习</span></a></li>
									<li><a class="" href="rich_text_editors.html"><span class="sub-menu-text">考核</span></a></li>									
								</ul>
							</li>							
							<li class="has-sub">
								<a href="javascript:;" class="">
								<i class="fa fa-columns fa-fw"></i> <span class="menu-text">教学交流</span>
								<span class="arrow"></span>
								</a>
								<ul class="sub">
									<li><a class="" href="mini_sidebar.html"><span class="sub-menu-text">答疑</span></a></li>
									<li><a class="" href="fixed_header.html"><span class="sub-menu-text">讨论</span></a></li>									
									<li><a class="" href="fixed_header_sidebar.html"><span class="sub-menu-text">前沿</span></a></li>
									<li><a class="" href="fixed_header_sidebar.html"><span class="sub-menu-text">实践</span></a></li>
								</ul>
							</li>																					
						</ul>
						<!-- /SIDEBAR MENU -->
					</div>
				</div>
				<!-- /SIDEBAR -->
		<div id="main-content">			
			<div class="container">
				<div class="row">
					<div id="content" class="col-lg-12">
						<!-- PAGE HEADER-->
						<div class="row">
							<div class="col-sm-12">
								<div class="page-header">
									<!-- BREADCRUMBS -->
									<ul class="breadcrumb">
										<li>
											<i class="fa fa-home"></i>
											<a href="index">Home</a>
										</li>
										<li>Dashboard - shared on weidea.net</li>
									</ul>
									<!-- /BREADCRUMBS -->									
								</div>
							</div>
						</div>
						<!-- /PAGE HEADER -->
						
					   <!-- PAGE CONTENT -->
						<div id="pagecontent" style="height:1000px;">
							
							<iframe src="${contenthtml!'#'}?sn=${courseno!1}" id="iframepage" frameborder="0" scrolling="no" marginheight="0" marginwidth="0"  width="100%" onLoad="iFrameHeight()"></iframe>
					
								
														
						</div>
						<!-- /PAGE CONTENT -->
						
						
						<div class="footer-tools">
							<span class="go-top">
								<i class="fa fa-chevron-up"></i> Top
							</span>
						</div>
					</div><!-- /CONTENT-->
				</div>
			</div>
		</div>
	</section>
	<!--/PAGE -->
	<!-- JAVASCRIPTS -->
	<!-- Placed at the end of the document so the pages load faster -->
	<!-- JQUERY -->
	<script src="/components/mbts/js/jquery/jquery-2.0.3.min.js"></script>
	<!-- JQUERY UI-->
	<script src="/components/mbts/js/jquery-ui-1.10.3.custom/js/jquery-ui-1.10.3.custom.min.js"></script>
	<!-- BOOTSTRAP -->
	<script src="/components/mbts/bootstrap-dist/js/bootstrap.min.js"></script>
	
		
	<!-- DATE RANGE PICKER -->
	<script src="/components/mbts/js/bootstrap-daterangepicker/moment.min.js"></script>
	
	<script src="/components/mbts/js/bootstrap-daterangepicker/daterangepicker.min.js"></script>
	<!-- SLIMSCROLL -->
	<script type="text/javascript" src="/components/mbts/js/jQuery-slimScroll-1.3.0/jquery.slimscroll.min.js"></script>
	<!-- SLIMSCROLL -->
	<script type="text/javascript" src="/components/mbts/js/jQuery-slimScroll-1.3.0/jquery.slimscroll.min.js"></script>
	<script type="text/javascript" src="/components/mbts/js/jQuery-slimScroll-1.3.0/slimScrollHorizontal.min.js"></script>
	<!-- BLOCK UI -->
	<script type="text/javascript" src="/components/mbts/js/jQuery-BlockUI/jquery.blockUI.min.js"></script>
	<!-- SPARKLINES -->
	<script type="text/javascript" src="/components/mbts/js/sparklines/jquery.sparkline.min.js"></script>
	<!-- EASY PIE CHART -->
	<script src="components/mbts/js/jquery-easing/jquery.easing.min.js"></script>
	<script type="text/javascript" src="components/mbts/js/easypiechart/jquery.easypiechart.min.js"></script>
	<!-- FLOT CHARTS -->
	<script src="/components/mbts/js/flot/jquery.flot.min.js"></script>
	<script src="/components/mbts/js/flot/jquery.flot.time.min.js"></script>
    <script src="/components/mbts/js/flot/jquery.flot.selection.min.js"></script>
	<script src="/components/mbts/js/flot/jquery.flot.resize.min.js"></script>
    <script src="/components/mbts/js/flot/jquery.flot.pie.min.js"></script>
    <script src="/components/mbts/js/flot/jquery.flot.stack.min.js"></script>
    <script src="/components/mbts/js/flot/jquery.flot.crosshair.min.js"></script>
	<!-- TODO -->
	<script type="text/javascript" src="/components/mbts/js/jquery-todo/js/paddystodolist.js"></script>
	<!-- TIMEAGO -->
	<script type="text/javascript" src="/components/mbts/js/timeago/jquery.timeago.min.js"></script>
	<!-- FULL CALENDAR -->
	<script type="text/javascript" src="/components/mbts/js/fullcalendar/fullcalendar.min.js"></script>
	<!-- COOKIE -->
	<script type="text/javascript" src="/components/mbts/js/jQuery-Cookie/jquery.cookie.min.js"></script>
	<!-- GRITTER -->
	<script type="text/javascript" src="/components/mbts/js/gritter/js/jquery.gritter.min.js"></script>
	<!-- CUSTOM SCRIPT -->
	<script src="/components/mbts/js/script.js"></script>
	<script>
		jQuery(document).ready(function() {		
			App.setPage("index");  //Set current page
			App.init(); //Initialise plugins and elements
		});
		
		function switchCurriculum(sn){
			window.location.href= '/download?sn='+sn; 
		}
	</script>
	<!-- /JAVASCRIPTS -->
</body>
</html>