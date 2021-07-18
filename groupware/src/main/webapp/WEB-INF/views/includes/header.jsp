<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Sol Company</title>

<!-- Google Font: Source Sans Pro -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<!-- Font Awesome -->
<link rel="stylesheet" href="/resources/plugins/fontawesome-free/css/all.min.css">
<!-- Ionicons -->
<link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<!-- Tempusdominus Bootstrap 4 -->
<link rel="stylesheet" href="/resources/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
<!-- iCheck -->
<link rel="stylesheet" href="/resources/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
<!-- JQVMap -->
<link rel="stylesheet" href="/resources/plugins/jqvmap/jqvmap.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="/resources/dist/css/adminlte.min.css">
<!-- overlayScrollbars -->
<link rel="stylesheet" href="/resources/plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
<!-- Daterange picker -->
<link rel="stylesheet" href="/resources/plugins/daterangepicker/daterangepicker.css">
<!-- summernote -->
<link rel="stylesheet" href="/resources/plugins/summernote/summernote-bs4.min.css">
<!-- fullCalendar -->
<link rel="stylesheet" href="/resources/plugins/fullcalendar/main.css">
<!-- Theme style -->
<link rel="stylesheet" href="/resources/dist/css/adminlte.min.css">
</head>
<body class="hold-transition sidebar-mini layout-fixed">
	<div class="wrapper">

		<!-- Preloader -->
		<div class="preloader flex-column justify-content-center align-items-center">
			<img class="animation__shake" src="/resources/dist/img/SolcompanyLogo.png" alt="AdminLTELogo" height="60" width="60">
		</div>

		<!-- Navbar -->
		<nav class="main-header navbar navbar-expand navbar-white navbar-light">
			<!-- Left navbar links -->
			<ul class="navbar-nav">
				<li class="nav-item">
					<a class="nav-link" data-widget="pushmenu" href="#" role="button">
						<i class="fas fa-bars"></i>
					</a>
				</li>

			</ul>
			<ul class="navbar-nav ml-auto">
				<!-- 상단 알람 -->
				<li class="nav-item dropdown">
					<a class="nav-link" data-toggle="dropdown" href="#">
						<i class="far fa-bell"></i>
						<span class="badge badge-warning navbar-badge">15</span>
					</a>
					<div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
						<span class="dropdown-item dropdown-header">새로운 알람 </span>
						<div class="dropdown-divider"></div>
						<a href="/mailbox/mailMain" class="dropdown-item">
							<i class="fas fa-envelope mr-2"></i>
							새 메일
							<span class="float-right text-muted text-sm">3 mins</span>
						</a>
						<div class="dropdown-divider"></div>
						<a href="/board/boardMain" class="dropdown-item">
							<i class="fas fa-file mr-2"></i>
							새로운 공지사항
							<span class="float-right text-muted text-sm">2 days</span>
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
			<a href="/main/home" class="brand-link">
				<img src="/resources/dist/img/SolcompanyLogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
				<span class="brand-text font-weight-light">Sol Company</span>
			</a>

			<!-- 프로필 -->
			<div class="sidebar">
				<!-- Sidebar user panel (optional) -->
				<div class="user-panel mt-3 pb-3 mb-3 d-flex">
					<div class="image">
						<img src="/resources/dist/img/user2-160x160.jpg" class="img-circle elevation-2" alt="User Image">
					</div>
					<div class="info">
						<a href="/self/profile" class="d-block">${login.ename} 님</a>
						<p></p>
						<form action="/work/check" id="checkForm" method="POST">
							<div class="btn-group">
								<input type="hidden" name="eno" value="${login.eno}"/>
								<input type="hidden" name="dno" value="${login.dno}"/>
								<input type="hidden" name="workDay" value=""/>
								<input type="hidden" name="startTime" value=""/>
								<input type="hidden" name="finishTime" value=""/>
								<input type="hidden" name="overTime" value=""/>
								<input type="hidden" name="inout" value=""/>
								<button type="button" id="checkIn" class="btn btn-success btn-xs" value="0">출근</button>
								<button type="button" id="checkOut" class="btn btn-danger btn-xs" value="1">퇴근</button>
							</div>
						</form>
					</div>
				</div>


				<!-- Sidebar Menu -->
				<nav class="mt-2">
					<ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
						<!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->

						<li class="nav-item">
							<a href="/board/boardMain" class="nav-link">
								<i class="nav-icon fas fa-table"></i>
								<p>공지 사항</p>
							</a>
						</li>

						<li class="nav-item">
							<a href="/work/workTable?eno=${login.eno}" class="nav-link">
								<i class="nav-icon far fa-plus-square"></i>
								<p>근무 관리</p>
							</a>
						</li>

						<li class="nav-item">
							<a href="/approval/appMain" class="nav-link">
								<i class="nav-icon fas fa-file"></i>
								<p>전자 결재</p>
							</a>
						</li>

						<li class="nav-item">
							<c:if test= "${login.dno == 10}">
								<a href="/hrteam/hrMain" class="nav-link">
									<i class="nav-icon fas fa-file"></i>
									<p>인사 관리</p>
								</a>
							</c:if>
							<c:if test="${login.dno != 10}">
								<a id="aa" href="/main/home" class="nav-link">
									<i class="nav-icon fas fa-file"></i>
									<p>인사 관리</p>
								</a>
								<script src="/resources/plugins/jquery/jquery.min.js"></script>
								<script>
									$("#aa").click(function() {
										alert("인사팀만 접근 할 수 있습니다.");
									});
								</script>
							</c:if>
						</li>

						<!-- 메일함 -->
						<li class="nav-item">
							<a href="/mailbox/mailMain" class="nav-link">
								<i class="nav-icon far fa-envelope"></i>
								<p>메일함</p>
							</a>
						</li>

						<li class="nav-item">
							<a href="/calendar/calendar" class="nav-link">
								<i class="nav-icon far fa-calendar-alt"></i>
								<p>
									일정
									<span class="badge badge-info right">2</span>
								</p>
							</a>
						</li>

						<li class="nav-item">
							<a href="../resources/pages/calendar.html" class="nav-link">
								<i class="nav-icon far fa-calendar-alt"></i>
								<p>
									예제 메뉴로 이동
									<span class="badge badge-info right">2</span>
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
		<script src="/resources/plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
		<!-- Summernote -->
		<script src="/resources/plugins/summernote/summernote-bs4.min.js"></script>
		<!-- overlayScrollbars -->
		<script src="/resources/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
		<!-- AdminLTE App -->
		<script src="/resources/dist/js/adminlte.js"></script>
		<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
		<script src="/resources/dist/js/pages/dashboard.js"></script>
<script>
let checkForm = $("#checkForm");



$(function() {
	$("#checkIn").click(function(e) {
		console.log("checkIn");
		e.preventDefault();
		
		var now = new Date();
		var year = now.getFullYear();
		var month = ((now.getMonth() + 1) > 9 ? "" : "0") + (now.getMonth() + 1);
		var day = (now.getDate() > 9 ? "" : "0") + now.getDate();
		var cur_day = year + "-" + month + "-" + day;

		var hours = now.getHours();
		var minutes = now.getMinutes();
		var cur_time = hours + ":" + minutes;
		
		check(${login.eno}, cur_day, function(data) {
			if(data == "") {
				checkForm.find("input[name=workDay]").val(cur_day);
				checkForm.find("input[name=startTime]").val(cur_time);
				checkForm.find("input[name=finishTime]").val(" - ");
				checkForm.find("input[name=overTime]").val(" - ");
				checkForm.find("input[name=inout]").val("in");
				
				alert("출근확인 되었습니다.");
				checkForm.submit();
			} else {
				alert("이미 출근 하셨습니다");
			}
		})
		
	})
	
	$("#checkOut").click(function(e) {
		console.log("checkOut");
		e.preventDefault();
		
		var now = new Date();
		var year = now.getFullYear();
		var month = ((now.getMonth() + 1) > 9 ? "" : "0") + (now.getMonth() + 1);
		var day = (now.getDate() > 9 ? "" : "0") + now.getDate();
	    var cur_day = year + "-" + month + "-" + day;
	    
	    var hours = (now.getHours() > 9 ? "" : "0") + now.getHours();
	    var minutes = (now.getMinutes() > 9 ? "" : "0") + now.getMinutes();
	    var cur_time = hours + ":" + minutes;
	    
	    check(${login.eno}, cur_day, function(data) {
			if(data == "") {
				alert("출근 버튼을 먼저 눌러주세요");
			} else {
				console.log(data);
				console.log(now);
				
				$.each(data, function(idx, element) {
					var startTimeSpl = element.startTime.split(":");
					var finishTimeSpl = cur_time.split(":");
					
					var cal_hour = (finishTimeSpl[0] * 1) - (startTimeSpl[0] * 1);
					var cal_min = (finishTimeSpl[1] * 1) - (startTimeSpl[1] * 1);
					
					console.log(cal_hour);
					console.log(cal_min);
					var overTime = "";
					
					if(cal_min >= 0) {
						overTime = ((cal_hour > 9 ? "" : "0") + cal_hour) + "시간 " + ((cal_min > 9 ? "" : "0") + cal_min) + "분";
					} else {
						cal_hour = cal_hour - 1;
						cal_min = 60 + cal_min;
						
						overTime = ((cal_hour > 9 ? "" : "0") + cal_hour) + "시간 " + ((cal_min > 9 ? "" : "0") + cal_min) + " 분";
					}
					console.log(overTime);
					
					let param = {
						eno:element.eno,
						workDay:element.workDay,
						finishTime:cur_time,
						overTime:overTime
					}
					
					$.ajax({
						url:"/work/rest_update/",
						type:"POST",
						contentType:"application/json",
						async:false,
						data:JSON.stringify(param),
						success:function(data) {
							console.log(data);
						}
					})
				})
				
				alert("퇴근 처리 되었습니다.");
			}
		})
	    
	})
	
	function check(eno, cur_day, callback) {
		$.getJSON({
			url:"/work/rest_check/" + eno + "/" + cur_day,
			type:"POST",
			async:false,
			success:function(data) {
				if(callback) {
					callback(data);
				}
			}
		})
	}
})
</script>