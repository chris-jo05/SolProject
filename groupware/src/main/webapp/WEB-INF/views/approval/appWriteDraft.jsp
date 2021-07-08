<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>

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
							<a href="#">Home</a>
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
					<div class="card card-primary card-outline">
						<div class="card-header">
							<div class="card-title">
								<p class="font-weight-bold" style="font-size: 20px; margin-bottom: 0px">기안서</p>
							</div>
							<div class="card-tools" style="margin: 0px">
								<button type="button" class="btn btn-primary btn-sm" style="margin-right: 10px;">상신</button>
								<button type="button" class="btn btn-secondary btn-sm">취소</button>
							</div>
						</div>

						<div class="card-body">
							<div class="row">
								<div class="col-md-8">
									<div class="form-group">
										<div class="row">
											<label for="colFormLabel" class="col-form-label">문서번호</label>
											<div class="col">
												<input type="email" class="form-control" id="colFormLabel" placeholder="" disabled>
											</div>
										</div>
									</div>

									<div class="form-group">
										<div class="row">
											<label for="colFormLabel" class="col-form-label">기안일자</label>
											<div class="col">
												<div class="input-group date" id="reservationdatetime" data-target-input="nearest">
													<input type="text" class="form-control datetimepicker-input" data-target="#reservationdatetime" />
													<div class="input-group-append" data-target="#reservationdatetime" data-toggle="datetimepicker">
														<div class="input-group-text">
															<i class="fa fa-calendar"></i>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>

									<div class="form-group">
										<div class="row">
											<label for="colFormLabel" class="col-form-label">기안부서</label>
											<div class="col">
												<input type="email" class="form-control" id="colFormLabel" placeholder="" disabled>
											</div>
										</div>
									</div>

									<div class="form-group">
										<div class="row">
											<label for="colFormLabel" class="col-form-label">기안자</label>
											<div class="col">
												<input type="email" class="form-control" id="colFormLabel" placeholder="" disabled>
											</div>
										</div>
									</div>
								</div>

								<div class="col-md-4">
									<table class="table table-bordered" style="height: 92.5%">
										<tbody>
											<tr style="height: 0">
												<td class="text-center align-middle" rowspan="2" style="width: 10%;"><b>결<br>제
												</b></td>
												<td>대리</td>
												<td>과장</td>
												<td>차장</td>
												<td>부장</td>
											</tr>

											<tr>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
											</tr>

											<tr style="height: 0">
												<td class="text-center align-middle" rowspan="2" style="width: 10%;"><b>합<br>의
												</b></td>
												<td>대리</td>
												<td>과장</td>
												<td>차장</td>
												<td>부장</td>
											</tr>

											<tr>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
											</tr>
										</tbody>
									</table>
								</div>

								<div class="col">
									<div class="form-group">
										<div class="row">
											<label for="colFormLabel" class="col-form-label">수신 및 참조</label>
											<div class="col">
												<select class="select2" multiple="multiple" data-placeholder="부서 선택" style="width: 100%;">
													<option>부서 1</option>
													<option>부서 2</option>
													<option>부서 3</option>
													<option>부서 4</option>
													<option>부서 5</option>
												</select>
											</div>
										</div>
									</div>

									<div class="form-group">
										<div class="row">
											<label for="colFormLabel" class="col-form-label">제목</label>
											<div class="col">
												<input type="" class="form-control" id="appSubtitle" placeholder="제목 입력">
											</div>
										</div>
									</div>

									<div class="form-group">
										<div class="row">
											<label for="colFormLabel" class="col-form-label">내용</label>
											<div class="col">
												<textarea id="summernote"><br><br><br><br><br><br><br><br><br><br></textarea>
											</div>
										</div>
									</div>

									<div class="form-group">
										<div class="row">
											<label for="colFormLabel" class="col-form-label">첨부파일</label>
											<div class="col">
												<div class="input-group">
													<div class="custom-file">
														<input type="file" class="custom-file-input" id="exampleInputFile">
														<label class="custom-file-label" for="exampleInputFile">파일선택</label>
													</div>
													<div class="input-group-append">
														<span class="input-group-text">Upload</span>
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

<!-- Page specific script -->
<script>
	$(function() {
		// Summernote
		$('#summernote').summernote()

		//Date and time picker
		$('#reservationdatetime').datetimepicker({
			icons : {
				time : 'far fa-clock'
			}
		});

		// Timepicker
		$('#timepicker').datetimepicker({
			format : 'LT'
		})

		// Date range picker
		$('#reservation').daterangepicker()

		// Initialize Select2 Elements
		$('.select2').select2()
	})
</script>

<%@include file="../includes/footer.jsp"%>