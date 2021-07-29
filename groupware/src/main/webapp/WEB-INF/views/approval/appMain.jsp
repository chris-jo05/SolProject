<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../includes/header.jsp"%>

<!-- DataTables -->
<link rel="stylesheet" href="../resources/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
<link rel="stylesheet" href="../resources/plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
<link rel="stylesheet" href="../resources/plugins/datatables-buttons/css/buttons.bootstrap4.min.css">

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

	<!-- 메뉴 -->
	<section class="content">
		<div class="row">
			<div class="col-md-3">
				<%@include file="../includes/appMenu.jsp"%>
			</div>
			<!-- /메뉴 -->

			<!-- card header -->
			<div class="col-md-9">
				<div class="card card-primary card-outline">
					<div class="card-header">
						<h3 class="card-title">상신함</h3>
					</div>
					<!-- /.card-header -->

					<div class="card-body">
						<table id="example2" class="table table-bordered table-hover">
							<thead>
								<tr>
									<th style="width: 10%">문서번호</th>
									<th style="width: 10%">문서분류</th>
									<th>제목</th>
									<th style="width: 12%">기안일자</th>
									<th style="width: 10%">기안부서</th>
									<th style="width: 10%">기안자</th>
									<th style="width: 10%">상태</th>
								</tr>
							</thead>

							<tbody>
								<c:forEach var="appList" items="${appList}">
									<tr>
										<td>${appList.docNo}</td>
										<td>${appList.docClass}</td>
										<td>
											<a href="/approval/appRead?docNo=${appList.docNo}" class="move">${appList.docTitle}</a>
										</td>
										<td>
											<fmt:formatDate pattern="yyyy-MM-dd kk:ss" value="${appList.docDate}" />
										</td>
										<td>${appList.dname}</td>
										<td>${appList.ename}</td>
										<td></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<!-- /.card-body -->
				</div>
			</div>
			<!-- /.card -->
		</div>
		<!-- /.col -->
	</section>
	<!-- /.content -->
</div>
<!-- /.content-wrapper -->

<!-- DataTables  & Plugins -->
<script src="../resources/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="../resources/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
<script src="../resources/plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
<script src="../resources/plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
<script src="../resources/plugins/datatables-buttons/js/dataTables.buttons.min.js"></script>
<script src="../resources/plugins/datatables-buttons/js/buttons.bootstrap4.min.js"></script>
<script src="../resources/plugins/jszip/jszip.min.js"></script>
<script src="../resources/plugins/pdfmake/pdfmake.min.js"></script>
<script src="../resources/plugins/pdfmake/vfs_fonts.js"></script>
<script src="../resources/plugins/datatables-buttons/js/buttons.html5.min.js"></script>
<script src="../resources/plugins/datatables-buttons/js/buttons.print.min.js"></script>
<script src="../resources/plugins/datatables-buttons/js/buttons.colVis.min.js"></script>

<!-- Page specific script -->
<script>
	$ (function () {
		$ ("#example1").DataTable ({
			"responsive" : true, "lengthChange" : false, "autoWidth" : false, "buttons" : [
					"copy", "csv", "excel", "pdf", "print", "colvis"
			]
		}).buttons ().container ().appendTo ('#example1_wrapper .col-md-6:eq(0)');
		$ ('#example2').DataTable ({
			"paging" : true, "lengthChange" : false, "searching" : false, "ordering" : true, "info" : true, "autoWidth" : false, "responsive" : true,
		});
	});
</script>

<%@ include file="../includes/footer.jsp"%>