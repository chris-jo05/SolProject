<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Sol Company</title>

<style>
[class^=selectedList1] tr {
	counter-increment: num;
}

[class^=selectedList1] tr>td:nth-child(2):before {
	content: counter(num) " ";
}
</style>

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
<!-- 2 load the theme CSS file -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css" />

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

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
								<div id="jstree"></div>
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
								<input type="button" id="btn1" class="btn btn-secondary btn-sm" value="결재">
								<input type="button" id="btn2" class="btn btn-secondary btn-sm" value="합의">
								<input type="button" id="btn3" class="btn btn-secondary btn-sm" value="참조">
								<input type="button" id="btn4" class="btn btn-secondary btn-sm" value="시행">
							</div>

							<div class="form-group" style="height: 150px; overflow: auto">
								<table class="table table-sm">
									<thead>
										<tr>
											<td style="width: 10%; text-align: center;">
												<input class="allCheck1" type="checkbox">
											</td>
											<td style="text-align: center; font-weight: bold; width: 30%;">부서</td>
											<td style="text-align: center; font-weight: bold; width: 30%;">이름</td>
											<td style="text-align: center; font-weight: bold; width: 30%;">직책</td>
										</tr>
									</thead>

									<tbody id="membersList"></tbody>
								</table>
							</div>

							<div class="form-group" id="summitForm">
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
											<input type="button" id="delete1" class="btn btn-secondary btn-sm" value="삭제">
										</div>

										<div class="form-group" style="height: 150px; overflow: auto">
											<table class="table table-sm">
												<thead>
													<tr>
														<td style="width: 10%; text-align: center;">
															<input class="allCheck2" type="checkbox">
														</td>
														<td style="text-align: center; font-weight: bold; width: 10%;">No</td>
														<td style="text-align: center; font-weight: bold; width: 15%;">구분</td>
														<td style="text-align: center; font-weight: bold; width: 25%;">부서</td>
														<td style="text-align: center; font-weight: bold; width: 25%;">이름</td>
														<td style="text-align: center; font-weight: bold; width: 25%;">직책</td>
													</tr>
												</thead>

												<tbody id="selectedList1" class="selectedList1"></tbody>
											</table>
										</div>
									</div>

									<div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
										<div class="form-group">
											<input type="button" id="delete2" class="btn btn-secondary btn-sm" value="삭제">
										</div>

										<div class="form-group" style="overflow: auto">
											<table class="table table-sm">
												<thead>
													<tr>
														<td style="text-align: center; width: 10%;">
															<input class="allCheck2" type="checkbox" />
														</td>
														<td style="text-align: center; font-weight: bold; width: 30%;">부서</td>
														<td style="text-align: center; font-weight: bold; width: 30%;">이름</td>
														<td style="text-align: center; font-weight: bold; width: 30%;">직책</td>
													</tr>
												</thead>

												<tbody id="selectedList2" class="selectedList2"></tbody>
											</table>
										</div>
									</div>

									<div class="tab-pane fade" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab">
										<div class="form-group">
											<input type="button" id="delete3" class="btn btn-secondary btn-sm" value="삭제">
										</div>

										<div class="form-group" style="overflow: auto">
											<table class="table table-sm">
												<thead>
													<tr>
														<td style="text-align: center; width: 10%;">
															<input class="allCheck2" type="checkbox" />
														</td>
														<td style="text-align: center; font-weight: bold; width: 30%;">부서</td>
														<td style="text-align: center; font-weight: bold; width: 30%;">이름</td>
														<td style="text-align: center; font-weight: bold; width: 30%;">직책</td>
													</tr>
												</thead>

												<tbody id="selectedList3" class="selectedList3"></tbody>
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

		<div class="card-footer">
			<div class="form-group" style="text-align: center;">
				<button id="setWrite" class="btn btn-primary btn-sm">적용</button>
				&nbsp;
				<button class="btn btn-secondary btn-sm" onclick="window.close()">닫기</button>
			</div>
		</div>
	</div>
	<!-- /.card-body -->

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
		$ ('.allCheck1').click (function () {
			$ ('.check1').prop ('checked', this.checked);
		});
		
		$ ('.allCheck2').click (function () {
			$ ('.check2').prop ('checked', this.checked);
		});
		
		$('#delete1').click(function() {
		    $('#selectedList1 input:checkbox[name="check2"]:checked').parent().parent().remove();
		});
		
		$('#delete2').click(function() {
		    $('#selectedList2 input:checkbox[name="check2"]:checked').parent().parent().remove();
		});
		
		$('#delete3').click(function() {
		    $('#selectedList3 input:checkbox[name="check2"]:checked').parent().parent().remove();
		});
		
		// write page 전송
		$('#setWrite').click(function() {
			// 결재 및 합의
			var rowData1 = new Array ();
			var tdArr1 = new Array ();
			var checkbox1 = $ ('#selectedList1  input:checkbox[name="check2"]')
			
			// 수신참조
			var rowData2 = new Array ();
			var tdArr2 = new Array ();
			var checkbox2 = $ ('#selectedList2  input:checkbox[name="check2"]')
			
			// 시행자
			var rowData3 = new Array ();
			var tdArr3 = new Array ();
			var checkbox3 = $ ('#selectedList3  input:checkbox[name="check2"]')
		    
			// 결제 및 합의
		    checkbox1.each (function (i) {
		    	var tr = checkbox1.parent ().parent ().eq (i);
				var td = tr.children ();
			    console.log (tr)
			    console.log (td)
			    
				// tr의 모든 값을 배열에 담는다.
				rowData1.push (tr.text ());

				// td.eq(0)은 체크박스 이므로  td.eq(1)의 값부터 가져온다.
				var turn = td.eq (1).text ();
				var category = td.eq (2).text ();
				var dname = td.eq (3).text ();
				var ename = td.eq (4).text ();
				var position = td.eq (5).text ();
				var eno = td.eq (6).text ();
				var cNo = td.eq (7).text ();
				
				var arr = {turn, category, dname, ename, position, eno, cNo};
				console.log(arr);
				
				// 가져온 값을 배열에 담는다.
				tdArr1.push (arr);
		    });
		    
			// 수신참조
		    checkbox2.each (function (i) {
		    	var tr = checkbox2.parent ().parent ().eq (i);
				var td = tr.children ();;
			    console.log (tr)
			    console.log (td)
			    
				// tr의 모든 값을 배열에 담는다.
				rowData2.push (tr.text ());
				
				// td.eq(0)은 체크박스 이므로  td.eq(1)의 값부터 가져온다.
				var dname = td.eq (1).text ();
				var ename = td.eq (2).text ();
				var position = td.eq (3).text ();
				var eno = td.eq (4).text ();
				var cNo = td.eq (5).text ();
				
				var arr = {dname, ename, position, eno, cNo};
				console.log(arr);
				
				// 가져온 값을 배열에 담는다.
				tdArr2.push (arr);
		    });
		    
			// 시행자
		    checkbox3.each (function (i) {
		    	var tr = checkbox3.parent ().parent ().eq (i);
				var td = tr.children ();
			    console.log (tr)
			    console.log (td)
			    
				// tr의 모든 값을 배열에 담는다.
				rowData3.push (tr.text ());
				
				// td.eq(0)은 체크박스 이므로  td.eq(1)의 값부터 가져온다.
				var dname = td.eq (1).text ();
				var ename = td.eq (2).text ();
				var position = td.eq (3).text ();
				var eno = td.eq (4).text ();
				var cNo = td.eq (5).text ();
				
				var arr = {dname, ename, position, eno, cNo};
				console.log(arr);
				
				// 가져온 값을 배열에 담는다.
				tdArr3.push (arr);
		    });
			console.log(tdArr1); // 결재 + 합의
			console.log(tdArr2); // 수신참조
			console.log(tdArr3); // 시행자
			
			window.opener.appLine1(tdArr1);
			window.opener.appLine2(tdArr2);
			window.opener.appLine3(tdArr3);
			
			
			var sign_position = "sign_position";
			var sign_ename = "sign_ename";
			
			var con_position = "con_position";
			var con_ename = "con_ename";
			
			var sign_cnt = 1;
			var con_cnt = 1;
			
			// 결재선 초기화
			for(var i = 1; i <= 4; i++) {
				window.opener.document.getElementById(sign_position + i).value = "";
				window.opener.document.getElementById(sign_ename + i).value = "";
				
				window.opener.document.getElementById(con_position + 1).value = "";
				window.opener.document.getElementById(con_ename + 1).value = "";
			}
			
			for(var i = 0; i < tdArr1.length; i++) {		
				if(tdArr1[i].category == "결재") {
					var position_id = sign_position + sign_cnt;
					var ename_id = sign_ename + sign_cnt;
					
					window.opener.document.getElementById(position_id).value = tdArr1[i].position;
					window.opener.document.getElementById(ename_id).value = tdArr1[i].ename;
					
					sign_cnt++;
				} else {
					var position_id = con_position + con_cnt;
					var ename_id = con_ename + con_cnt;
					
					window.opener.document.getElementById(position_id).value = tdArr1[i].position;
					window.opener.document.getElementById(ename_id).value = tdArr1[i].ename;
					
					con_cnt++;
				}
			}
			
			var docRef = "";
			var docRefEno = "";
			for(var i = 0; i < tdArr2.length; i++) {
				var ref = "[" + tdArr2[i].dname + "] " + tdArr2[i].ename + " " + tdArr2[i].position;
				var refEno = tdArr2[i].eno;
				
				docRef += ref;
				docRefEno += refEno;
			}
			window.opener.document.getElementById("docRef").value = docRef;
			window.opener.document.getElementById("docRefEno").value = docRefEno;
			
			var docImp = "";
			var docImpEno = "";
			for(var i = 0; i < tdArr3.length; i++) {
				var imp = "[" + tdArr3[i].dname + "] " + tdArr3[i].ename + " " + tdArr3[i].position;
				var impEno = tdArr3[i].eno;
				
				docImp += imp;
				docImpEno += impEno;
			}
			window.opener.document.getElementById("docImp").value = docImp;
			window.opener.document.getElementById("docImpEno").value = docImpEno;
			
			console.log(docRefEno);
			console.log(docImpEno);
		
			// window.close();
			
		});
	</script>

	<script>
		$ (function () {
			$.ajax ({
				async : true,
				type : "GET",
				url : "/teamview/appLineDept",
				dataType : "json",
				success : function (json) {
					console.log (json);
					createJSTree (json);
				}
			});
			
			$ ('#jstree').on ('changed.jstree', function (e, data, dno) {
				console.log (data.node.original.number);
				var dno = data.node.original.number;
				$.ajax ({
					async : true,
					type : "GET",
					url : "/teamview/appLineMember",
					data : {
						dno : dno
					},
					dataType : "json",
					success : function (json) {
						console.log (json);
						let innerHtml = getInnerHtml1 (json);
						console.log (innerHtml);
						$ ('#membersList').html (innerHtml);
					}
				});
			});
			
			// 버튼 클릭 시 해당 위치로 이동
			// 결재
			$ ('#btn1').click (function () {
				var rowData = new Array ();
				var tdArr = new Array ();
				var checkbox = $ ('#membersList input:checkbox[name="check1"]:checked');
				var category = "결재";
				var cNo = "1";
				
				// 체크된 체크박스 값을 가져온다
				checkbox.each (function (i) {
					
					// checkbox.parent() : checkbox의 부모는 <td>이다.
					// checkbox.parent().parent() : <td>의 부모이므로 <tr>이다.
					var tr = checkbox.parent ().parent ().eq (i);
					var td = tr.children ();
					var turn = tr.index();
					console.log(tr);
					console.log(td);
					
					// 체크된 row의 모든 값을 배열에 담는다.
					rowData.push (tr.text ());
					
					// td.eq(0)은 체크박스 이므로  td.eq(1)의 값부터 가져온다.
					var eno = td.eq (1).text () ;
					var dname = td.eq (2).text () ;
					var ename = td.eq (3).text () ;
					var position = td.eq (4).text ();
					
					var arr = {category, cNo, dname, ename, eno, position, turn};
					
					console.log(arr);
					
					// 가져온 값을 배열에 담는다.
					tdArr.push (arr);
				});
				
				let innerHtml = getInnerHtml2 (tdArr);
				$ ("#selectedList1").append (innerHtml);
			});
			
			// 합의
			$ ('#btn2').click (function () {
				var rowData = new Array ();
				var tdArr = new Array ();
				var checkbox = $ ('#membersList input:checkbox[name="check1"]:checked');
				var category = "합의";
				var cNo = "2";
				
				// 체크된 체크박스 값을 가져온다
				checkbox.each (function (i) {
					
					// checkbox.parent() : checkbox의 부모는 <td>이다.
					// checkbox.parent().parent() : <td>의 부모이므로 <tr>이다.
					var tr = checkbox.parent ().parent ().eq (i);
					var td = tr.children ();
					
					// 체크된 row의 모든 값을 배열에 담는다.
					rowData.push (tr.text ());
					
					// td.eq(0)은 체크박스 이므로  td.eq(1)의 값부터 가져온다.
					var eno = td.eq (1).text () ;
					var dname = td.eq (2).text () ;
					var ename = td.eq (3).text () ;
					var position = td.eq (4).text ();
					
					var arr = {category, cNo, dname, ename, eno, position};
					
					console.log(arr);
					
					// 가져온 값을 배열에 담는다.
					tdArr.push (arr);
				});
				
				let innerHtml = getInnerHtml2 (tdArr);
				$ ("#selectedList1").append (innerHtml);
			});
			
			// 수신참조
			$ ('#btn3').click (function () {
				var rowData = new Array ();
				var tdArr = new Array ();
				var checkbox = $ ('#membersList input:checkbox[name="check1"]:checked');
				var category = "수신참조";
				var cNo = "3";
				
				// 체크된 체크박스 값을 가져온다
				checkbox.each (function (i) {
					
					// checkbox.parent() : checkbox의 부모는 <td>이다.
					// checkbox.parent().parent() : <td>의 부모이므로 <tr>이다.
					var tr = checkbox.parent ().parent ().eq (i);
					var td = tr.children ();
					
					// 체크된 row의 모든 값을 배열에 담는다.
					rowData.push (tr.text ());
					
					// td.eq(0)은 체크박스 이므로  td.eq(1)의 값부터 가져온다.
					var eno = td.eq (1).text () ;
					var dname = td.eq (2).text () ;
					var ename = td.eq (3).text () ;
					var position = td.eq (4).text ();
					
					var arr = {category, cNo, dname, ename, eno, position};
					
					console.log(arr);
					
					// 가져온 값을 배열에 담는다.
					tdArr.push (arr);
				});
				
				let innerHtml = getInnerHtml3 (tdArr);
				$ ("#selectedList2").append (innerHtml);
			});
			
			// 시행
			$ ('#btn4').click (function () {
				var rowData = new Array ();
				var tdArr = new Array ();
				var checkbox = $ ('#membersList input:checkbox[name="check1"]:checked');
				var category = "시행";
				var cNo = "4";
				
				// 체크된 체크박스 값을 가져온다
				checkbox.each (function (i) {
					
					// checkbox.parent() : checkbox의 부모는 <td>이다.
					// checkbox.parent().parent() : <td>의 부모이므로 <tr>이다.
					var tr = checkbox.parent ().parent ().eq (i);
					var td = tr.children ();
					
					// 체크된 row의 모든 값을 배열에 담는다.
					rowData.push (tr.text ());
					
					// td.eq(0)은 체크박스 이므로  td.eq(1)의 값부터 가져온다.
					var eno = td.eq (1).text () ;
					var dname = td.eq (2).text () ;
					var ename = td.eq (3).text () ;
					var position = td.eq (4).text ();
					
					var arr = {category, cNo, dname, ename, eno, position};
					
					console.log(arr);
					
					// 가져온 값을 배열에 담는다.
					tdArr.push (arr);
				});
				
				let innerHtml = getInnerHtml3 (tdArr);
				$ ("#selectedList3").append (innerHtml);
			});
			

			
			// 조직도 생성
			function createJSTree (jsonData) {
				var jstree_data = [];
				var dno = [];
				for (var i = 0; i < jsonData.length; i++) {
					var data = {};
					data.number = jsonData [i].dno;
					data.text = jsonData [i].dname;
					jstree_data.push (data);
					dno.push (data.number);
				}
				
				console.log (dno);
				$ ('#jstree').jstree ({
					'core' : {
						'data' : jstree_data,
						'dno' : dno
					}
				});
			}
			
			// 부서 인원 List 가져오기
			function getInnerHtml1 (appLineMember) {
				console.log (appLineMember)
				var innerHtml = "";
				for (var i = 0; i < appLineMember.length; i++) {
					
					innerHtml += '<tr>';
					innerHtml += '	<td style="text-align: center;">';
					innerHtml += '		<input name="check1" class="check1" type="checkbox">';
					innerHtml += '	</td>';
					innerHtml += '	<td style="display:none;">' + appLineMember [i].eno + '</td>';
					innerHtml += '	<td style="text-align: center;">' + appLineMember [i].dname + '</td>';
					innerHtml += '	<td style="text-align: center;">' + appLineMember [i].ename + '</td>';
					innerHtml += '	<td style="text-align: center;">' + appLineMember [i].position + '</td>';
					innerHtml += '</tr>';
				}
				return innerHtml;
			}
			
			// 결재 및 합의 선택 인원 List 가져오기
			function getInnerHtml2 (tdArr) {
				console.log (tdArr)
				var innerHtml = "";
				for (var i = 0; i < tdArr.length; i++) {
					
					innerHtml += '<tr>';
					innerHtml += '	<td style="text-align: center;">';
					innerHtml += '		<input name="check2" class="check2" type="checkbox">';
					innerHtml += '	</td>';
					innerHtml += '	<td style="text-align: center;"></td>';
					innerHtml += '	<td style="text-align: center;">' + tdArr[i].category + '</td>';
					innerHtml += '	<td style="text-align: center;">' + tdArr[i].dname + '</td>';
					innerHtml += '	<td style="text-align: center;">' + tdArr[i].ename + '</td>';
					innerHtml += '	<td style="text-align: center;">' + tdArr[i].position + '</td>';
					innerHtml += '	<td style="display: none;">' + tdArr[i].eno + '</td>';
					innerHtml += '	<td style="display: none;">' + tdArr[i].cNo + '</td>';
					innerHtml += '	<td style="display: none;">' + tdArr[i].turn + '</td>';
					innerHtml += '</tr>';
				}
				return innerHtml;
			}
			
			// 수신참조 및 시행자 선택 인원 List 가져오기
			function getInnerHtml3 (tdArr) {
				console.log (tdArr)
				var innerHtml = "";
				for (var i = 0; i < tdArr.length; i++) {
					
					innerHtml += '<tr>';
					innerHtml += '	<td style="text-align: center;">';
					innerHtml += '		<input name="check2" class="check2" type="checkbox">';
					innerHtml += '	</td>';
					innerHtml += '	<td style="text-align: center;">' + tdArr[i].dname + '</td>';
					innerHtml += '	<td style="text-align: center;">' + tdArr[i].ename + '</td>';
					innerHtml += '	<td style="text-align: center;">' + tdArr[i].position + '</td>';
					innerHtml += '	<td style="display: none;">' + tdArr[i].eno + '</td>';
					innerHtml += '	<td style="display: none;">' + tdArr[i].cNo + '</td>';
					innerHtml += '</tr>';
				}
				return innerHtml;
			}
		});
	</script>
</body>
</html>