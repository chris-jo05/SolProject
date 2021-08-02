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
            <h1>익명글 작성</h1>
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
          <form id="insert" action="" method="post">
            <div class="card card-primary card-outline">
            
              <!-- /.card-header -->
              <div class="card-body">
               <div class="form-group">
                     <label for="exampleInputBorderWidth2">제 목</label>
                     <input type="text" class="form-control form-control-border border-width-2" id="exampleInputBorderWidth2" name="atitle" placeholder="제목을 입력해주세요.">
                   </div>
                 <div class="form-group">
                     <label for="exampleInputBorderWidth2">작성자</label>
                     <input type="text" class="form-control form-control-border border-width-2" id="exampleInputBorderWidth2" name="awriter"  placeholder="닉네임을 입력해주세요.">
                   </div>
                   
                     <div class="form-group">
                     <label for="exampleInputBorderWidth2">비밀번호</label>
                     <input type="password" class="form-control form-control-border border-width-2" id="exampleInputBorderWidth2" name="apassword"  placeholder="비밀번호를 입력해주세요.">
                   </div>
                
                       
               <div class="form-group">
                  <label>내용</label>
                  <textarea class="b-content form-control" rows="5" name="acontents"></textarea>
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
   
<%@include file="../includes/footer.jsp" %>