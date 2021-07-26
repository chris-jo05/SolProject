<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
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
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

<!-- 2 load the theme CSS file -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css" />
</head>

<body>
	<div class="card">
		<div class="card-header">
			<h3 class="card-title">결재선 지정</h3>
		</div>

		<div class="card-body">
			<div class="row">
				<div class="col-md-4">
					<div class="card">
						<div class="card-header">
							<h3 class="card-title">조직도</h3>
						</div>
						<div class="card-body" style="height: 500px;">
							<div class="form-group">
								<div id="jstree">
									<!-- in this example the tree is populated from inline HTML -->
									<ul>
										<li>Sol Company
											<ul>
												<li>대표이사
													<ul>
														<li>관리팀</li>
														<li>비서팀</li>
														<li>영업팀
															<ul>
																<li>1팀</li>
																<li>2팀</li>
															</ul>
														</li>
														<li>인사팀</li>
														<li>총무팀</li>
													</ul>
												</li>
											</ul>
										</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="col">
					<div class="card">
						<div class="card-header">
							<h3 class="card-title">결제라인선택</h3>
						</div>

						<div class="card-body" style="height: 500px;">
							<div class="form-group">
								<button type="reset" class="btn btn-secondary btn-sm" style="">결재</button>
								<button type="reset" class="btn btn-secondary btn-sm" style="">합의</button>
								<button type="reset" class="btn btn-secondary btn-sm" style="">참조</button>
							</div>

							<div class="form-group" style="height:150px; overflow:auto">
								<table class="table table-sm">
									<thead>
										<tr>
											<td>
												<input type="checkbox" />
											</td>
											<td style="text-align: center; font-weight: bold;">부서 / 사원 선택</td>
										</tr>
									</thead>

									<tbody>
										<tr>
											<td>
												<input type="checkbox" />
											</td>
											<td>[관리팀] 박진우 대리</td>
										</tr>
									</tbody>
								</table>
							</div>

							<div class="form-group">
								<nav>
									<div class="form-group">
										<div class="nav nav-tabs" id="nav-tab" role="tablist">
											<a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">결재</a>
											<a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false">수신참조</a>
											<a class="nav-item nav-link" id="nav-contact-tab" data-toggle="tab" href="#nav-contact" role="tab" aria-controls="nav-contact" aria-selected="false">시행자</a>
										</div>
									</div>
								</nav>
								<div class="tab-content" id="nav-tabContent">
									<div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
										<div class="form-group">
											<button type="delete" class="btn btn-secondary btn-sm" style="">삭제</button>
										</div>

										<div class="form-group" style="overflow:auto">
											<table class="table table-sm">
												<thead>
													<tr>
														<td>
															<input type="checkbox" />
														</td>
														<td style="text-align: center; font-weight: bold;">부서 / 사원 선택</td>
													</tr>
												</thead>

												<tbody>
													<tr>
														<td>
															<input type="checkbox" />
														</td>
														<td>[관리팀] 박진우 대리</td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>

									<div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
										<div class="form-group">
											<button type="delete" class="btn btn-secondary btn-sm" style="">삭제</button>
										</div>

										<div class="form-group" style="overflow:auto">
											<table class="table table-sm">
												<thead>
													<tr>
														<td>
															<input type="checkbox" />
														</td>
														<td style="text-align: center; font-weight: bold;">부서 / 사원 선택</td>
													</tr>
												</thead>

												<tbody>
													<tr>
														<td>
															<input type="checkbox" />
														</td>
														<td>[관리팀] 박진우 대리</td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>

									<div class="tab-pane fade" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab">
										<div class="form-group">
											<button type="delete" class="btn btn-secondary btn-sm" style="">삭제</button>
										</div>

										<div class="form-group" style="overflow:auto">
											<table class="table table-sm">
												<thead>
													<tr>
														<td>
															<input type="checkbox" />
														</td>
														<td style="text-align: center; font-weight: bold;">부서 / 사원 선택</td>
													</tr>
												</thead>

												<tbody>
													<tr>
														<td>
															<input type="checkbox" />
														</td>
														<td>[관리팀] 박진우 대리</td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- /.card-body -->
	</div>

	<!-- jQuery -->
	<script src="/resources/plugins/jquery/jquery.min.js"></script>
	<!-- jQuery UI 1.11.4 -->
	<script src="/resources/plugins/jquery-ui/jquery-ui.min.js"></script>
	<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
	<script>
		$.widget.bridge ('uibutton', $.ui.button)
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

	<!-- 4 include the jQuery library -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.1/jquery.min.js"></script>

	<!-- 5 include the minified jstree source -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>

	<script>
		$ (function () {
			// 6 create an instance when the DOM is ready
			$ ('#jstree').jstree ({
				"plugins" : [
					"wholerow"
				]
			});
			
			// 7 bind to events triggered on the tree
			$ ('#jstree').on ("changed.jstree", function (e, data) {
				console.log (data.selected);
			});
			
			// 8 interact with the tree - either way is OK
			$ ('button').on ('click', function () {
				$ ('#jstree').jstree (true).select_node ('child_node_1');
				$ ('#jstree').jstree ('select_node', 'child_node_1');
				$.jstree.reference ('#jstree').select_node ('child_node_1');
			});
			
			$("#jstree").jstree("open_all");
			
			// navs
			$ ('#myTab a').on ('click', function (e) {
				e.preventDefault ()
				$ (this).tab ('show')
			})
		});
	</script>
</body>
</html>