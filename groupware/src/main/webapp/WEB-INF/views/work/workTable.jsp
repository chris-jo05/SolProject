<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>근무 관리</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="/main/home">Home</a></li>
              <li class="breadcrumb-item active"><a href="/self/profile">프로필</a></li>
              <li class="breadcrumb-item active">근무 관리</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-12">
            <div class="card">
              
              <div class="card-body">
                <table id="example2" class="table table-bordered table-hover text-center">
                  <thead>
                  	<tr>
                    	<th class="col-1">사원 번호</th>
                        <th>사원 명</th>
                        <th>직 급</th>
                        <th>근무 일자</th>
                        <th>출근 시간</th>
                        <th>퇴근 시간</th>
                        <th>초과 근무 시간</th>
                    </tr>									
                  </thead>
                  <tbody>
				  <!-- 게시판 리스트 반복문 -->
				  <c:forEach var="vo" items="${workList}">
				  	<tr>
						<td>${vo.eno}</td>
						<td>${vo.ename}</td>
						<td>${vo.position}</td>
						<td>${vo.workDay}</td>
						<td>${vo.startTime}</td>
						<td>${vo.finishTime}</td>
						<td>${vo.overTime}</td>
					</tr>
				  </c:forEach>	
				  </tbody>
                </table>
              </div>
              <!-- /.card-body -->
              
              <!-- 페이지 담당 -->
              <div class="card-footer clearfix">
				<div class="card-tools">
					<ul class="pagination pagination-sm float-right">
						<!-- 이전페이지 -->
	                	<c:if test="${pageVo.prev}">
        	            	<li class="page-item"><a href="${pageVo.startPage-1}" class="page-link">&laquo;</a></li>
    	                </c:if>
    	                <!-- 페이지 (1,2,3,...) -->
						<c:forEach var="idx" begin="${pageVo.startPage}" end="${pageVo.endPage}">
	                    	<li class="page-item ${pageVo.cri.pageNum==idx?'active':''}">
	                        	<a href="${idx}" class="page-link">${idx}</a>
	                        </li>
	                    </c:forEach>
	                    <!-- 다음 페이지 -->
	                    <c:if test="${pageVo.next}">
	                    	<li class="page-item"><a href="${pageVo.endPage+1}" class="page-link">&raquo;</a></li>
	                    </c:if>
					</ul>
				</div>
				<div class="col-md-2 col-md-offset-2">
               	   	<!--페이지 목록 갯수 지정하는 폼-->
               	   	<select name="" id="amount" class="form-control">
               	   		<option value="10" <c:out value="${pageVo.cri.amount==10?'selected':''}"/> >10</option>
               	   		<option value="20" <c:out value="${pageVo.cri.amount==20?'selected':''}"/>>20</option>
               	   		<option value="30" <c:out value="${pageVo.cri.amount==30?'selected':''}"/> >30</option>
               	   	</select>
			  </div>
              </div>
              <!-- 페이지 끝 -->
            </div>
            <!-- /.card -->
 		</div>
          <!-- /.col -->
        </div>
        <!-- /.row -->
      </div>
      <!-- /.container-fluid -->
    </section>
    <!-- /.content -->
	</div>
<form action="" method="get" id="actionForm">
		<input type="hidden" name="pageNum" value="${pageVo.cri.pageNum}" />
		<input type="hidden" name="amount" value="${pageVo.cri.amount}" />
		<input type="hidden" name="eno" value="${login.eno}" />
</form>	
<!-- jQuery -->
<script src="../../plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="../../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- DataTables  & Plugins -->
<script src="../../plugins/datatables/jquery.dataTables.min.js"></script>
<script src="../../plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
<script src="../../plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
<script src="../../plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
<script src="../../plugins/datatables-buttons/js/dataTables.buttons.min.js"></script>
<script src="../../plugins/datatables-buttons/js/buttons.bootstrap4.min.js"></script>
<script src="../../plugins/jszip/jszip.min.js"></script>
<script src="../../plugins/pdfmake/pdfmake.min.js"></script>
<script src="../../plugins/pdfmake/vfs_fonts.js"></script>
<script src="../../plugins/datatables-buttons/js/buttons.html5.min.js"></script>
<script src="../../plugins/datatables-buttons/js/buttons.print.min.js"></script>
<script src="../../plugins/datatables-buttons/js/buttons.colVis.min.js"></script>
<!-- AdminLTE App -->
<script src="../../dist/js/adminlte.min.js"></script>

<!-- Page specific script -->
<script>
  $(function () {
	// 하단 페이지 나누기 버튼 클릭시 이동
	var actionForm = $("#actionForm");
	$(".page-item a").click(function(e){
		e.preventDefault(); //a 속성 중지
		
		//actionForm 안에 pageNum의 값을 사용자가 선택한 번호로 변경
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		
		//actionForm 보내기 
		actionForm.submit();
	});
		
	$("#amount").change(function() {
		let amount = $(this).val();
		
		actionForm.find("input[name='amount']").val(amount);
		
		actionForm.submit();
	})
	
    $("#example1").DataTable({
      "responsive": true, "lengthChange": false, "autoWidth": false,
      "buttons": ["copy", "csv", "excel", "pdf", "print", "colvis"]
    }).buttons().container().appendTo('#example1_wrapper .col-md-6:eq(0)');
    $('#example2').DataTable({
      "paging": true,
      "lengthChange": false,
      "searching": false,
      "ordering": true,
      "info": true,
      "autoWidth": false,
      "responsive": true,
    });
    
	
  });
</script>
<%@include file="../includes/footer.jsp" %>