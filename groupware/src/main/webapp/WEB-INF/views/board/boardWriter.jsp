<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp" %>

     <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>공지사항 작성</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="/main/home">Home</a></li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <!-- /.col -->
          <div class="col-md-9">
          <form action="" method="post" role="form">
            <div class="card card-primary card-outline">
            
              <!-- /.card-header -->
              <div class="card-body">
               <div class="form-group">
                     <label for="exampleInputBorderWidth2">제 목</label>
                     <input type="text" class="form-control form-control-border border-width-2" id="exampleInputBorderWidth2" name="b_title" placeholder="제목을 입력해 주세요.">
                   </div>
                 <div class="form-group">
                     <label for="exampleInputBorderWidth2">작성자</label>
                     <input type="text" class="form-control form-control-border border-width-2" id="exampleInputBorderWidth2" name="b_writer" value="${login.ename}" readonly="readonly" style="background-color:white">
                   </div>
                <div class="form-group">
                     <div class="form-group">
                     <label for="exampleInputBorderWidth2">부서</label>
                     <input type="text" class="form-control form-control-border border-width-2" id="exampleInputBorderWidth2" name="dname" value="${vo.dname}" readonly="readonly" style="background-color:white">
                   </div>
                   </div>
                       
               <div class="form-group">
                  <label>Content</label>
                  <textarea class="form-control" rows="3" name="b_contents"></textarea>
            </div>
                <div class="form-group">
                  <div class="btn btn-default btn-file">
                    <i class="fas fa-paperclip"></i> 
                    파일 첨부
                    <input type="file" name="attachment">
                  </div>
                  <p class="help-block">Max. 32MB</p>
                </div>
              </div>
              <!-- /.card-body -->
              <div class="card-footer">
                <div class="float-right">
                   <button type="submit" class="btn btn-primary"> 등록하기</button>
                   <button type="reset" class="btn btn-danger"> 취소하기</button>
                </div>
              </div>
              <!-- /.card-footer -->
            </div>
            </form>
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


<%@include file="../includes/footer.jsp" %>