<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Sol Company</title>

<!-- Google Font: Source Sans Pro -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="/resources/plugins/fontawesome-free/css/all.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<!-- Tempusdominus Bootstrap 4 -->
<link rel="stylesheet"
	href="/resources/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
<!-- iCheck -->
<link rel="stylesheet"
	href="/resources/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
<!-- JQVMap -->
<link rel="stylesheet" href="/resources/plugins/jqvmap/jqvmap.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="/resources/dist/css/adminlte.min.css">
<!-- overlayScrollbars -->
<link rel="stylesheet"
	href="/resources/plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
<!-- Daterange picker -->
<link rel="stylesheet"
	href="/resources/plugins/daterangepicker/daterangepicker.css">
<!-- summernote -->
<link rel="stylesheet"
	href="/resources/plugins/summernote/summernote-bs4.min.css">
	<!-- fullCalendar -->
  <link rel="stylesheet" href="/resources/plugins/fullcalendar/main.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="/resources/dist/css/adminlte.min.css">
</head>
<body class="hold-transition sidebar-mini layout-fixed">
	<div class="wrapper">

		<!-- Preloader -->
		<div
			class="preloader flex-column justify-content-center align-items-center">
			<img class="animation__shake"
				src="/resources/dist/img/SolcompanyLogo.png" alt="AdminLTELogo"
				height="60" width="60">
		</div>

		<!-- Navbar -->
		<nav
			class="main-header navbar navbar-expand navbar-white navbar-light">
			<!-- Left navbar links -->
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" data-widget="pushmenu"
					href="#" role="button"><i class="fas fa-bars"></i></a></li>
				
			</ul>
			<ul class="navbar-nav ml-auto">
				<!-- 상단 알람 -->
				<li class="nav-item dropdown"><a class="nav-link"
					data-toggle="dropdown" href="#"> <i class="far fa-bell"></i> <span
						class="badge badge-warning navbar-badge">15</span>
				</a>
					<div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
						<span class="dropdown-item dropdown-header">새로운 알람 </span>
						<div class="dropdown-divider"></div>
						<a href="/mailbox/mailMain" class="dropdown-item"> <i
							class="fas fa-envelope mr-2"></i> 새 메일 <span
							class="float-right text-muted text-sm">3 mins</span>
						</a>
						<div class="dropdown-divider"></div>
						<a href="/board/boardMain" class="dropdown-item"> <i class="fas fa-file mr-2"></i>
							새로운 공지사항 <span class="float-right text-muted text-sm">2
								days</span>
						</a>
						<div class="dropdown-divider"></div>
						<a href="#" class="dropdown-item dropdown-footer"> 모든 알림 보기</a>
					</div>
				</li>
				<li class="nav-item dropdown">
					<a class="nav-link" href="/logout" role="button">
						<i class="fas fa-sign-out-alt">로그 아웃</i>
					</a>
				</li>
			</ul>

			
		</nav>
		<!-- /.navbar -->

		<!-- Main Sidebar Container -->
		<aside class="main-sidebar sidebar-dark-primary elevation-4">
			<!-- Brand Logo -->
			<a href="/main/home" class="brand-link"> <img
				src="/resources/dist/img/SolcompanyLogo.png" alt="AdminLTE Logo"
				class="brand-image img-circle elevation-3" style="opacity: .8">
				<span class="brand-text font-weight-light">Sol Company</span>
			</a>

			<!-- 프로필 -->
			<div class="sidebar">
				<!-- Sidebar user panel (optional) -->
				<div class="user-panel mt-3 pb-3 mb-3 d-flex">
					<div class="image">
						<img src="/resources/dist/img/user2-160x160.jpg"
							class="img-circle elevation-2" alt="User Image">
					</div>
					<div class="info">
						<a href="/self/profile" class="d-block">${login.ename} 님</a>
						<p></p>
						<form action="">
							<div class="btn-group">
	                      	 	<button type="button" class="btn btn-success btn-xs" value="0">출근</button>
	                       	 	<button type="button" class="btn btn-danger btn-xs" value="1">퇴근</button>
	                     	 </div>
						</form>
					</div>
				</div>


				<!-- Sidebar Menu -->
				<nav class="mt-2">
					<ul class="nav nav-pills nav-sidebar flex-column"
						data-widget="treeview" role="menu" data-accordion="false">
						<!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
								<li class="nav-item">
									<a href="/board/boardMain" class="nav-link"> 
										<i class="nav-icon fas fa-table"></i>
											<p>	공지 사항</p>
									</a>
								</li>
						
								<li class="nav-item">
									<a href="/work/workTable" class="nav-link">
										<i class="nav-icon far fa-plus-square"></i>
											<p>근무 관리</p>
									</a>
								</li>
							
								<li class="nav-item">
									<a href="/approval/appMain"class="nav-link">
										<i class="nav-icon fas fa-file"></i>
											<p> 전자 결제</p>
									</a>
								</li>
						
								<li class="nav-item">
									<a href="/hrteam/hrMain"class="nav-link">
										<i class="nav-icon fas fa-file"></i>
											<p>인사 관리</p>
									</a>
								</li>
								
								<!-- 메일함 -->
								<li class="nav-item">
									<a href="/mailbox/mailMain" class="nav-link">
									 <i class="nav-icon far fa-envelope"></i>
										<p> 메일함 </p>
									</a>
								</li>
						
							
								
								<li class="nav-item">
									<a href="/calendar/calendar" class="nav-link">
										<i class="nav-icon far fa-calendar-alt"></i>
											<p>일정 <span class="badge badge-info right">2</span>
											</p>
									</a>
								</li>
								
								<li class="nav-item">
									<a href="../resources/pages/calendar.html" class="nav-link">
										<i class="nav-icon far fa-calendar-alt"></i>
											<p>예제 메뉴로 이동 <span class="badge badge-info right">2</span>
											</p>
									</a>
								</li>
						</ul>
					</nav>
				<!-- /.sidebar-menu -->
			</div>
			<!-- /.sidebar -->
		</aside>

	<!-- jQuery -->
	<script src="/resources/plugins/jquery/jquery.min.js"></script>
	<!-- jQuery UI 1.11.4 -->
	<script src="/resources/plugins/jquery-ui/jquery-ui.min.js"></script>
	<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
	<script>
		$.widget.bridge('uibutton', $.ui.button)
	</script>
	<!-- Bootstrap 4 -->
	<script src="/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- ChartJS -->
	<script src="/resources/plugins/chart.js/Chart.min.js"></script>
	<!-- Sparkline -->
	<script src="/resources/plugins/sparklines/sparkline.js"></script>
	<!-- JQVMap -->
	<script src="/resources/plugins/jqvmap/jquery.vmap.min.js"></script>
	<script src="/resources/plugins/jqvmap/maps/jquery.vmap.usa.js"></script>
	<!-- jQuery Knob Chart -->
	<script src="/resources/plugins/jquery-knob/jquery.knob.min.js"></script>
	<!-- daterangepicker -->
	<script src="/resources/plugins/moment/moment.min.js"></script>
	<script src="/resources/plugins/daterangepicker/daterangepicker.js"></script>
	<!-- Tempusdominus Bootstrap 4 -->
	<script
		src="/resources/plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
	<!-- Summernote -->
	<script src="/resources/plugins/summernote/summernote-bs4.min.js"></script>
	<!-- overlayScrollbars -->
	<script
		src="/resources/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
	<!-- AdminLTE App -->
	<script src="/resources/dist/js/adminlte.js"></script>
	<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
	<script src="/resources/dist/js/pages/dashboard.js"></script>