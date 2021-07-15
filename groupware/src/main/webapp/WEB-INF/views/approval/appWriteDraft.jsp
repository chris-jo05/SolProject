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
					<form action="" method="post" role="form">
						<div class="card card-primary card-outline">
							<div class="card-header">
								<div class="card-title">
									<p class="font-weight-bold" style="font-size: 20px; margin-bottom: 0px">기안서</p>
									<input type="hidden" name="docClass" value="기안서" />
								</div>
								<div class="card-tools" style="margin: 0px">
									<button type="submit" class="btn btn-primary btn-sm" style="margin-right: 10px;">상신</button>
									<button type="button" class="btn btn-secondary btn-sm" onclick="location.href='/approval/appMain'">취소</button>
								</div>
							</div>

							<div class="card-body">
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
													<input type="text" class="form-control" id="colFormLabel" placeholder="${login.dname}" disabled> <input type="hidden" name="dno" value="${login.dno}" />
												</div>
											</div>
										</div>

										<div class="form-group">
											<div class="row">
												<label for="colFormLabel" class="col-form-label">기안자</label>
												<div class="col">
													<input type="text" class="form-control" id="colFormLabel" placeholder="${login.ename}" disabled> <input type="hidden" name="eno" value="${login.eno}" />
												</div>
											</div>
										</div>
									</div>

									<div class="col-md-4">
										<table class="table table-bordered" style="height: 92.5%">
											<tbody>
												<tr style="height: 0">
													<td class="text-center align-middle" rowspan="2" style="width: 10%;">
														<b>결<br>제
														</b>
													</td>
													<td style="width: 22.5%;"></td>
													<td style="width: 22.5%;"></td>
													<td style="width: 22.5%;"></td>
													<td style="width: 22.5%;"></td>
												</tr>

												<tr>
													<td></td>
													<td></td>
													<td></td>
													<td></td>
												</tr>

												<tr style="height: 0">
													<td class="text-center align-middle" rowspan="2" style="width: 10%;">
														<b>합<br>의
														</b>
													</td>
													<td style="width: 22.5%;"></td>
													<td style="width: 22.5%;"></td>
													<td style="width: 22.5%;"></td>
													<td style="width: 22.5%;"></td>
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
													<input type="text" class="form-control" id="colFormLabel" placeholder="부서선택">
												</div>
											</div>
										</div>

										<div class="form-group">
											<div class="row">
												<label for="colFormLabel" class="col-form-label">제목</label>
												<div class="col">
													<input name="docTitle" type="text" class="form-control" id="appSubtitle" placeholder="제목 입력">
												</div>
											</div>
										</div>

										<div class="form-group">
											<div class="row">
												<label for="colFormLabel" class="col-form-label">내용</label>
												<div class="col">
													<textarea name="docContent" id="summernote"></textarea>
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

<!-- Page specific script -->
<script>
	$ (function () {
		// Summernote
		$ ('#summernote').summernote ()

		// Date and Time picker
		$ ('#datetimepicker').datetimepicker ({
			format : 'YYYY.MM.DD'
		});
		
		// Initialize Select2 Elements
		$ ('.select2').select2 ()
	})
</script>

<%@include file="../includes/footer.jsp"%>