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
            <h1>공지 사항</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="/main/home">Home</a></li>
              <li class="breadcrumb-item active">공지 사항</li>
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
              
              <div class="card-body table-responsive p-0">
                <table class="table table-hover text-nowrap">
                  <thead>
                  	<tr>
                    	<th>글 번호</th>
                        <th>제 목</th>
                        <th>글쓴이</th>
                        <th>날짜</th>
                        <th>조회</th>
                    </tr>									
                  </thead>
                  <tbody>
                  <tr>
                  	<td>1</td>
                  	<td><a href="/board/boardRead">인사말</a></td>
                  	<td>인사팀</td>
                  	<td>2021/07/01</td>
                  	<td>0</td>
                  </tr>
				  <!-- 게시판 리스트 반복문 -->
				  <c:forEach var="vo" items="${list}">
				  	<tr>
						<td>${vo.bno}</td>
						<td><a href="${vo.bno}" class="move">${vo.title}</a></td>
						<td>${vo.writer}</td>
						<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${vo.regdate}"/></td>
						<td>${vo.replycnt}</td>
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
	                        
							<li class="page-item"><a href="#" class="page-link">3</a></li>
	                    </c:forEach>
	                    <!-- 다음 페이지 -->
	                    <c:if test="${pageVo.next}">
	                    	<li class="page-item"><a href="${pageVo.endPage+1}" class="page-link">&raquo;</a></li>
	                    </c:if>
					</ul>
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