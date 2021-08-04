<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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

.form-control:disabled, .form-control[readonly] {
	background-color: #fff;
}
</style>
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
					<form action="" method="post" role="form">
						<div class="card card-primary card-outline">
							<div class="card-header">
								<h3 class="card-title" style="font-weight: bold;">${appRead.docClass}</h3>
							</div>

							<div class="card-body">
								<div class="row">
									<div class="col-md-8">
										<div class="form-group">
											<div class="row">
												<label for="colFormLabel" class="col-form-label">문서번호</label>
												<div class="col">
													<input type="text" class="form-control" value="${appRead.docNo}" disabled>
												</div>
											</div>
										</div>

										<div class="form-group">
											<div class="row">
												<label for="colFormLabel" class="col-form-label">기안일자</label>
												<div class="col">
													<input type="text" class="form-control" value="<fmt:formatDate pattern="yyyy-MM-dd kk:ss" value="${appRead.docDate}" />" disabled>
												</div>
											</div>
										</div>

										<div class="form-group">
											<div class="row">
												<label for="colFormLabel" class="col-form-label">기안부서</label>
												<div class="col">
													<input type="text" class="form-control" value="${appRead.dname}" disabled>
												</div>
											</div>
										</div>

										<div class="form-group">
											<div class="row">
												<label for="colFormLabel" class="col-form-label">기안자</label>
												<div class="col">
													<input type="text" class="form-control" value="${appRead.ename}" disabled>
												</div>
											</div>
										</div>

										<div class="form-group">
											<div class="row">
												<label for="colFormLabel" class="col-form-label">수신 및 참조</label>
												<div class="col">
													<input type="text" class="form-control" value="" disabled>
												</div>
											</div>
										</div>
									</div>

									<div class="col-md-4">
										<table class="table table-bordered" style="height: 257px;">
											<tbody>
												<tr>
													<td class="text-center align-middle" rowspan="3" style="width: 10%; font-weight: bold;">
														결
														<br>
														제
													</td>
													<td style="width: 22.5%; height: 5%;">
														<input style="text-align: center; width: 80px; background-color: #fff; border: 0 solid black;" type="text" value="" disabled />
													</td>
													<td style="width: 22.5%;">
														<input style="text-align: center; width: 80px; background-color: #fff; border: 0 solid black;" type="text" value="" disabled />
													</td>
													<td style="width: 22.5%;">
														<input style="text-align: center; width: 80px; background-color: #fff; border: 0 solid black;" type="text" value="" disabled />
													</td>
													<td style="width: 22.5%;">
														<input style="text-align: center; width: 80px; background-color: #fff; border: 0 solid black;" type="text" value="" disabled />
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
														<input style="text-align: center; width: 80px; background-color: #fff; border: 0 solid black;" type="text" value="" disabled />
													</td>
													<td>
														<input style="text-align: center; width: 80px; background-color: #fff; border: 0 solid black;" type="text" value="" disabled />
													</td>
													<td>
														<input style="text-align: center; width: 80px; background-color: #fff; border: 0 solid black;" type="text" value="" disabled />
													</td>
													<td>
														<input style="text-align: center; width: 80px; background-color: #fff; border: 0 solid black;" type="text" value="" disabled />
													</td>
												</tr>

												<tr>
													<td class="text-center align-middle" rowspan="3" style="height: 50%; width: 10%; font-weight: bold;">
														합
														<br>
														의
													</td>
													<td style="width: 22.5%; height: 5%;">
														<input style="text-align: center; width: 80px; background-color: #fff; border: 0 solid black;" type="text" value="" disabled />
													</td>
													<td style="width: 22.5%;">
														<input style="text-align: center; width: 80px; background-color: #fff; border: 0 solid black;" type="text" value="" disabled />
													</td>
													<td style="width: 22.5%;">
														<input style="text-align: center; width: 80px; background-color: #fff; border: 0 solid black;" type="text" value="" disabled />
													</td>
													<td style="width: 22.5%;">
														<input style="text-align: center; width: 80px; background-color: #fff; border: 0 solid black;" type="text" value="" disabled />
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
														<input style="text-align: center; width: 80px; background-color: #fff; border: 0 solid black;" type="text" value="" disabled />
													</td>
													<td>
														<input style="text-align: center; width: 80px; background-color: #fff; border: 0 solid black;" type="text" value="" disabled />
													</td>
													<td>
														<input style="text-align: center; width: 80px; background-color: #fff; border: 0 solid black;" type="text" value="" disabled />
													</td>
													<td>
														<input style="text-align: center; width: 80px; background-color: #fff; border: 0 solid black;" type="text" value="" disabled />
													</td>
												</tr>
											</tbody>
										</table>
									</div>

									<div class="col">
										<div class="form-group" id="kind">
											<div class="row">
												<label for="colFormLabel" class="col-form-label">근태구분</label>
												<div class="col">
													<input name="docKind" type="text" class="form-control" id="docKind" value="${appRead.docKind}" disabled>
												</div>
											</div>
										</div>

										<div class="form-group" id="date">
											<div class="row">
												<label for="colFormLabel" class="col-form-label">기간</label>
												<div class="col">
													<input name="docStartDate" type="text" class="form-control" id="docStartDate" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${appRead.docStartDate}" />" disabled>
												</div>

												<div class="col">
													<input name="docEndDate" type="text" class="form-control" id="docEndDate" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${appRead.docEndDate}" />" disabled>
												</div>
											</div>
										</div>

										<div class="form-group">
											<div class="row">
												<label for="colFormLabel" class="col-form-label">시행자</label>
												<div class="col">
													<input type="text" class="form-control" value="" disabled>
												</div>
											</div>
										</div>

										<div class="form-group">
											<div class="row">
												<label for="colFormLabel" class="col-form-label">제목</label>
												<div class="col">
													<input name="docTitle" type="text" class="form-control" id="docTitle" value="${appRead.docTitle}" disabled>
												</div>
											</div>
										</div>

										<div class="form-group">
											<div class="row">
												<label for="colFormLabel" class="col-form-label">내용</label>
												<div class="col">
													<table class="table table-bordered" style="height: 500px;">
														<tbody>
															<tr>
																<td>${appRead.docContent}</td>
															</tr>
														</tbody>
													</table>
												</div>
											</div>
										</div>

										<div class="form-group">
											<div class="row">
												<label for="colFormLabel" class="col-form-label">첨부파일</label>
												<div class="col">
													<input type="text" class="form-control" id="docTitle" value="${AppAttachRead.doc_Filename}" disabled>
												</div>
											</div>
										</div>

										<div class="form-group">
											<div class="row">
												<label for="colFormLabel" class="col-form-label">결제의견</label>
												<div class="col-md-2">
													<input type="text" class="form-control" id="docTitle" value="" disabled>
												</div>

												<div class="col">
													<input type="text" class="form-control" id="docTitle" value="" disabled>
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

<!-- Select2 -->
<script src="/resources/plugins/select2/js/select2.full.min.js"></script>

<!-- bs-custom-file-input -->
<script src="../../plugins/bs-custom-file-input/bs-custom-file-input.min.js"></script>

<!-- Page specific script -->
<script>
	
</script>

<%@include file="../includes/footer.jsp"%>