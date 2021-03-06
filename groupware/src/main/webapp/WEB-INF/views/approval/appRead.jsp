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
														<input id="sign_position1" style="text-align: center; width: 80px; background-color: #fff; border: 0 solid black;" type="text" value="" disabled />
													</td>
													<td style="width: 22.5%;">
														<input id="sign_position2" style="text-align: center; width: 80px; background-color: #fff; border: 0 solid black;" type="text" value="" disabled />
													</td>
													<td style="width: 22.5%;">
														<input id="sign_position3" style="text-align: center; width: 80px; background-color: #fff; border: 0 solid black;" type="text" value="" disabled />
													</td>
													<td style="width: 22.5%;">
														<input id="sign_position4" style="text-align: center; width: 80px; background-color: #fff; border: 0 solid black;" type="text" value="" disabled />
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
														<input id="sign_ename1" style="text-align: center; width: 80px; background-color: #fff; border: 0 solid black;" type="text" value="" disabled />
													</td>
													<td>
														<input id="sign_ename2" style="text-align: center; width: 80px; background-color: #fff; border: 0 solid black;" type="text" value="" disabled />
													</td>
													<td>
														<input id="sign_ename3" style="text-align: center; width: 80px; background-color: #fff; border: 0 solid black;" type="text" value="" disabled />
													</td>
													<td>
														<input id="sign_ename4" style="text-align: center; width: 80px; background-color: #fff; border: 0 solid black;" type="text" value="" disabled />
													</td>
												</tr>

												<tr>
													<td class="text-center align-middle" rowspan="3" style="height: 50%; width: 10%; font-weight: bold;">
														합
														<br>
														의
													</td>
													<td style="width: 22.5%; height: 5%;">
														<input id="con_position1" style="text-align: center; width: 80px; background-color: #fff; border: 0 solid black;" type="text" value="" disabled />
													</td>
													<td style="width: 22.5%;">
														<input id="con_position2" style="text-align: center; width: 80px; background-color: #fff; border: 0 solid black;" type="text" value="" disabled />
													</td>
													<td style="width: 22.5%;">
														<input id="con_position3" style="text-align: center; width: 80px; background-color: #fff; border: 0 solid black;" type="text" value="" disabled />
													</td>
													<td style="width: 22.5%;">
														<input id="con_position4" style="text-align: center; width: 80px; background-color: #fff; border: 0 solid black;" type="text" value="" disabled />
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
														<input id="con_ename1" style="text-align: center; width: 80px; background-color: #fff; border: 0 solid black;" type="text" value="" disabled />
													</td>
													<td>
														<input id="con_ename2" style="text-align: center; width: 80px; background-color: #fff; border: 0 solid black;" type="text" value="" disabled />
													</td>
													<td>
														<input id="con_ename3" style="text-align: center; width: 80px; background-color: #fff; border: 0 solid black;" type="text" value="" disabled />
													</td>
													<td>
														<input id="con_ename4" style="text-align: center; width: 80px; background-color: #fff; border: 0 solid black;" type="text" value="" disabled />
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
													<input name="docKind" id="docKind" type="text" class="form-control" id="docKind" value="${appRead.docKind}" disabled>
												</div>
											</div>
										</div>

										<div class="form-group" id="date">
											<div class="row">
												<label for="colFormLabel" class="col-form-label">기간</label>
												<div class="col">
													<input name="docStartDate" id="docStartDate" type="text" class="form-control" id="docStartDate" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${appRead.docStartDate}" />" disabled>
												</div>

												<div class="col">
													<input name="docEndDate" id="docEndDate" type="text" class="form-control" id="docEndDate" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${appRead.docEndDate}" />" disabled>
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
$(function() {
	console.log("why");
	
	var data = {
	        <c:forEach items="${dls}" var="dl" varStatus="status">
	            a${status.count}:"${dl.doc_linecategory}/${dl.ename}/${dl.position}",
	        </c:forEach>
	};
	
	var s_num = 1;
	var c_num = 1;
	
	console.log(data.a1);
	if(data.a1 != undefined) {
		var spl = data.a1.split("/");
		if(spl[0] == "결재") {
			signInsert(spl, s_num);
			s_num++;
		} else {
			conInsert(spl, c_num);
			c_num++;
		}
	}
	
	
	console.log(data.a2);
	if(data.a2 != undefined) {
		var spl = data.a2.split("/");
		if(spl[0] == "결재") {
			signInsert(spl, s_num);
			s_num++;
		} else {
			conInsert(spl, c_num);
			c_num++;
		}
	}
	console.log(data.a3);
	if(data.a3 != undefined) {
		var spl = data.a3.split("/");
		if(spl[0] == "결재") {
			signInsert(spl, s_num);
			s_num++;
		} else {
			conInsert(spl, c_num);
			c_num++;
		}
	}
	console.log(data.a4);
	if(data.a4 != undefined) {
		var spl = data.a4.split("/");
		if(spl[0] == "결재") {
			signInsert(spl, s_num);
			s_num++;
		} else {
			conInsert(spl, c_num);
			c_num++;
		}
	}
	console.log(data.a5);
	if(data.a5 != undefined) {
		var spl = data.a5.split("/");
		if(spl[0] == "결재") {
			signInsert(spl, s_num);
			s_num++;
		} else {
			conInsert(spl, c_num);
			c_num++;
		}
	}
	console.log(data.a6);
	if(data.a6 != undefined) {
		var spl = data.a6.split("/");
		if(spl[0] == "결재") {
			signInsert(spl, s_num);
			s_num++;
		} else {
			conInsert(spl, c_num);
			c_num++;
		}
	}
	console.log(data.a7);
	if(data.a7 != undefined) {
		var spl = data.a7.split("/");
		if(spl[0] == "결재") {
			signInsert(spl, s_num);
			s_num++;
		} else {
			conInsert(spl, c_num);
			c_num++;
		}
	}
	
	console.log(data.a8);
	if(data.a8 != undefined) {
		var spl = data.a8.split("/");
		if(spl[0] == "결재") {
			signInsert(spl, s_num);
			s_num++;
		} else {
			conInsert(spl, c_num);
			c_num++;
		}
	}
	
	function signInsert(spl, s_num) {
		var s_position = "#sign_position" + s_num;
		var s_ename = "#sign_ename" + s_num;
		
		$(s_position).val(spl[2]);
		$(s_ename).val(spl[1]);
	}
	
	function conInsert(spl, c_num) {
		var c_position = "#con_position" + c_num;
		var c_ename = "#con_ename" + c_num;
		
		$(c_position).val(spl[2]);
		$(c_ename).val(spl[1]);	
	}
	
	if($("#docKind").val() == "") {
		$("#kind").hide();
		$("#date").hide();
	}
})
</script>

<%@include file="../includes/footer.jsp"%>