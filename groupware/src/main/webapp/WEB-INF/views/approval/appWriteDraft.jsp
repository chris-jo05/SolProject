<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>

<script type="text/javascript">
	var openWin;
	
	function openChild () {
		// window.name = "부모창 이름"; 
		window.name = "appWrite";
		// window.open("open할 window", "자식창 이름", "팝업창 옵션");
		openWin = window.open ("appLine", "appLine", "width=800, height=750, resizable = no, scrollbars = no");
	}

	function appLine1 (tdArr1) {
		console.log (tdArr1);
	}

	function appLine2 (tdArr2) {
		console.log (tdArr2);
	}

	function appLine3 (tdArr3) {
		console.log (tdArr3);
	}
</script>

<style>
.table tr td {
	padding: 1px;
	text-align: center;
	vertical-align: middle;
}

.col-form-label {
	width: 105px;
	padding: 7.5px;
}

.form-control:disabled, .form-control[readonly] {
	background-color: #fff;
}
</style>

<!-- daterange picker -->
<link rel="stylesheet" href="/resources/plugins/daterangepicker/daterangepicker.css">

<!-- Select2 -->
<link rel="stylesheet" href="/resources/plugins/select2/css/select2.min.css">
<link rel="stylesheet" href="/resources/plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css">

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1>전자 결재</h1>
				</div>
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item">
							<a href="/main/home">Home</a>
						</li>
						<li class="breadcrumb-item active">전자 결재</li>
					</ol>
				</div>
			</div>
		</div>
		<!-- /.container-fluid -->
	</section>

	<!-- Main content -->
	<section class="content">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-3">
					<%@include file="../includes/appMenu.jsp"%>
				</div>

				<div class="col-md-9">
					<form action="" method="post" id="submitForm" role="form">
						<div class="card card-primary card-outline">
							<div class="card-header">
								<div class="card-title">
									<h3 class="card-title" style="font-weight: bold;">기안서</h3>
									<input type="hidden" name="docClass" value="기안서" />
								</div>
							</div>

							<div class="card-body">
								<div class="col" style="float: right; padding: 0px;">
									<div class="form-group" style="float: right;">
										<button type="submit" class="btn btn-primary btn-sm" id="submit" style="margin-right: 10px;">상신</button>
										<button type="reset" class="btn btn-secondary btn-sm" style="" onclick="location.href='appMain'">취소</button>
									</div>
								</div>

								<div class="row">
									<div class="col-md-8">
										<div class="form-group">
											<div class="row">
												<label for="colFormLabel" class="col-form-label">문서번호</label>
												<div class="col">
													<input type="text" class="form-control" id="colFormLabel" placeholder="기본채번" disabled>
												</div>
											</div>
										</div>

										<div class="form-group">
											<div class="row">
												<label for="colFormLabel" class="col-form-label">기안일자</label>
												<div class="col">
													<input name="docDate" type="text" class="form-control datetimepicker-input" id="datetimepicker" data-toggle="datetimepicker" data-target="#datetimepicker" />
												</div>
											</div>
										</div>

										<div class="form-group">
											<div class="row">
												<label for="colFormLabel" class="col-form-label">기안부서</label>
												<div class="col">
													<input type="text" class="form-control" id="colFormLabel" placeholder="${login.dname}" disabled>
													<input type="hidden" name="dno" value="${login.dno}" />
												</div>
											</div>
										</div>

										<div class="form-group">
											<div class="row">
												<label for="colFormLabel" class="col-form-label">기안자</label>
												<div class="col">
													<input type="text" class="form-control" id="colFormLabel" placeholder="${login.ename}" disabled>
													<input type="hidden" name="eno" value="${login.eno}" />
												</div>
											</div>
										</div>

										<div class="form-group">
											<div class="row">
												<label for="colFormLabel" class="col-form-label">수신 및 참조</label>
												<div class="col">
													<input type="text" class="form-control" id="refs" placeholder="선택" disabled>
												</div>
											</div>
										</div>
									</div>

									<div class="col-md-4">
										<table class="table table-bordered" style="height: 257px; cursor: pointer;" onClick="openChild()">
											<tbody>
												<tr>
													<td class="text-center align-middle" rowspan="3" style="width: 10%; font-weight: bold;">
														결
														<br>
														제
													</td>
													<td style="width: 22.5%; height: 5%;">
														<input style="text-align: center; width: 80px; background-color: #fff; border: 0 solid black;" class="position" id="sign_position1" type="text" disabled />
													</td>
													<td style="width: 22.5%;">
														<input style="text-align: center; width: 80px; background-color: #fff; border: 0 solid black;" class="position" id="sign_position2" type="text" disabled />
													</td>
													<td style="width: 22.5%;">
														<input style="text-align: center; width: 80px; background-color: #fff; border: 0 solid black;" class="position" id="sign_position3" type="text" disabled />
													</td>
													<td style="width: 22.5%;">
														<input style="text-align: center; width: 80px; background-color: #fff; border: 0 solid black;" class="position" id="sign_position4" type="text" disabled />
													</td>
												</tr>

												<tr style="">
													<td></td>
													<td></td>
													<td></td>
													<td></td>
												</tr>

												<tr>
													<td style="height: 5%;">
														<input style="text-align: center; width: 80px; background-color: #fff; border: 0 solid black;" class="position" id="sign_ename1" type="text" disabled />
													</td>
													<td>
														<input style="text-align: center; width: 80px; background-color: #fff; border: 0 solid black;" class="position" id="sign_ename2" type="text" disabled />
													</td>
													<td>
														<input style="text-align: center; width: 80px; background-color: #fff; border: 0 solid black;" class="position" id="sign_ename3" type="text" disabled />
													</td>
													<td>
														<input style="text-align: center; width: 80px; background-color: #fff; border: 0 solid black;" class="position" id="sign_ename4" type="text" disabled />
													</td>
												</tr>

												<tr>
													<td class="text-center align-middle" rowspan="3" style="height: 50%; width: 10%; font-weight: bold;">
														합
														<br>
														의
													</td>
													<td style="width: 22.5%; height: 5%;">
														<input style="text-align: center; width: 80px; background-color: #fff; border: 0 solid black;" class="position" id="con_position1" type="text" disabled />
													</td>
													<td style="width: 22.5%;">
														<input style="text-align: center; width: 80px; background-color: #fff; border: 0 solid black;" class="position" id="con_position2" type="text" disabled />
													</td>
													<td style="width: 22.5%;">
														<input style="text-align: center; width: 80px; background-color: #fff; border: 0 solid black;" class="position" id="con_position3" type="text" disabled />
													</td>
													<td style="width: 22.5%;">
														<input style="text-align: center; width: 80px; background-color: #fff; border: 0 solid black;" class="position" id="con_position4" type="text" disabled />
													</td>
												</tr>

												<tr style="">
													<td></td>
													<td></td>
													<td></td>
													<td></td>
												</tr>

												<tr>
													<td style="height: 5%;">
														<input style="text-align: center; width: 80px; background-color: #fff; border: 0 solid black;" class="position" id="con_ename1" type="text" disabled />
													</td>
													<td>
														<input style="text-align: center; width: 80px; background-color: #fff; border: 0 solid black;" class="position" id="con_ename2" type="text" disabled />
													</td>
													<td>
														<input style="text-align: center; width: 80px; background-color: #fff; border: 0 solid black;" class="position" id="con_ename3" type="text" disabled />
													</td>
													<td>
														<input style="text-align: center; width: 80px; background-color: #fff; border: 0 solid black;" class="position" id="con_ename4" type="text" disabled />
													</td>
												</tr>
											</tbody>
										</table>
									</div>

									<div class="col">
										<div class="form-group">
											<div class="row">
												<label for="colFormLabel" class="col-form-label">시행자</label>
												<div class="col">
													<input type="text" class="form-control" id="workers" placeholder="선택" disabled>
												</div>
											</div>
										</div>

										<div class="form-group">
											<div class="row">
												<label for="colFormLabel" class="col-form-label">제목</label>
												<div class="col">
													<input name="docTitle" type="text" class="form-control" id="appSubtitle" placeholder="제목입력">
												</div>
											</div>
										</div>

										<div class="form-group">
											<div class="row">
												<label for="colFormLabel" class="col-form-label">내용</label>
												<div class="col">
													<textarea name="docContent" id="summernote"><br><br><br><br><br><br><br><br><br><br></textarea>
												</div>
											</div>
										</div>

										<div class="form-group">
											<div class="row">
												<label for="colFormLabel" class="col-form-label">첨부파일</label>
												<div class="col">
													<div class="form-group">
														<div class="custom-file">
															<input type="file" name="AppAttachInsert" class="custom-file-input" id="customFile" multiple>
															<label class="custom-file-label" for="customFile">파일선택</label>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>

	<!-- Control Sidebar -->
	<aside class="control-sidebar control-sidebar-dark">
		<!-- Control sidebar content goes here -->
	</aside>
	<!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->

<!-- Summernote -->
<script src="../resources/plugins/summernote/summernote-bs4.min.js"></script>

<!-- date-range-picker -->
<script src="/resources/plugins/daterangepicker/daterangepicker.js"></script>

<!-- Select2 -->
<script src="/resources/plugins/select2/js/select2.full.min.js"></script>

<!-- bs-custom-file-input -->
<script src="../../plugins/bs-custom-file-input/bs-custom-file-input.min.js"></script>

<!-- Page specific script -->
<script>
	let submitForm = $("#submitForm");	
	
	$ (function () {
		// Summernote
		$ ('#summernote').summernote ()

		// Date and Time picker
		$ ('#datetimepicker').datetimepicker ({
			format : 'YYYY/MM/DD kk:mm'
		});
		
		// Initialize Select2 Elements
		$ ('.select2').select2 ()

	})

	// file Input
	$ (function () {
		bsCustomFileInput.init ();
	});
</script>

<%@include file="../includes/footer.jsp"%>