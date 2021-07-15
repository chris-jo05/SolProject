<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="../includes/header.jsp" %>

	  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>메일 쓰기</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="/main/home">Home</a></li>
              <li class="breadcrumb-item active">메일 쓰기</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-md-3">

            
            <%@include file="../includes/mailMenu.jsp" %>
            
            
            
          </div>
          <!-- /.col -->
          <div class="col-md-9">
            <div class="card card-primary card-outline">
              <div class="card-header">
                <h3 class="card-title">새 메일 작성</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
              <form action="" method="post">
              	<c:if test="${read.m_id}">
	                <div class="form-group">
	                  <input class="form-control" placeholder="${read.m_id}" name="e_id" readonly="readonly" value="${read.m_id}">
	                </div>
              	</c:if>
              	<c:if test="${mailList.m_id}">
	                <div class="form-group">
	                  <input class="form-control" placeholder="${mailList.m_id}" name="e_id" readonly="readonly" value="${mailList.m_id}">
	                </div>
              	</c:if>
	                <div class="form-group">
	                  <input class="form-control" placeholder="제목" name="m_title">
	                </div>
	                <div class="form-group">
	                    <textarea id="compose-textarea" class="form-control" style="height: 300px" name="m_content">
	                      
	                    </textarea>
	                </div>
	                <!-- <div class="form-group">
	                  <div class="btn btn-default btn-file">
	                    <i class="fas fa-paperclip"></i> 파일 첨부
	                    <input type="file" name="attachment">
	                  </div>
	                  <p class="help-block">Max. 32MB</p>
	                </div> -->
	              </div>
	              <!-- /.card-body -->
	              <div class="card-footer">
	                <div class="float-right">
	                  	<button type="submit" class="btn btn-primary"><i class="far fa-envelope"></i> 보내기</button>
		                <button type="reset" class="btn btn-danger" onclick="location.href='/mailbox/mailMain'"><i class="fas fa-times"></i> 취소하기</button>
	                </div>
	              </div>
	              <input type="hidden" name="m_writer" value="${login.ename}" />	<!-- 메일 보낸 사람담기 -->
	              <input type="hidden" name="m_id" value="${login.id}" /> 		<!-- 메일 보낸 사람 아이디 담기 -->
	              <input type="hidden" name="eno" value="${login.eno}" />
              </form>
              <!-- /.card-footer -->
            </div>
            <!-- /.card -->
          </div>
          <!-- /.col -->
        </div>
        <!-- /.row -->
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
	
<!-- jQuery -->
<script src="../../plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="../../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- 사이드바 등장관련 js -->
<script src="../../dist/js/adminlte.min.js"></script>
<!-- 메일 작성시 각종 메뉴js -->
<script src="../../plugins/summernote/summernote-bs4.min.js"></script>
<!-- Page specific script -->
<script>
  $(function () {
    //Add text editor
    $('#compose-textarea').summernote()
  })
</script>

<%@include file="../includes/footer.jsp" %>