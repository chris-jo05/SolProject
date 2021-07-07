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
            <h1>공지 사항</h1>
          </div>
         
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="/main/home">Home</a></li>
              <li class="breadcrumb-item active">${vo.bno} 공지글</li>
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
          <div class="card card-primary card-outline">
  <!--          <form action="" method="post" role="form"> -->
            <div class="card-header">
              <h3 class="card-title">작성일</h3>
               <input class="form-control" name=""
                     readonly="readonly" value="">

            </div>
              
               <div class="card-header">
              <h3 class="card-title">부  서</h3>
                <input class="form-control" name=""
                     readonly="readonly" value="">
              
            
            </div>
              <div class="card-header">
              <h1 class="card-title">작 성 자</h1>
                <input class="form-control" name=""
                     readonly="readonly" value="">
              
            
            </div>
             <div class="card-header">
                <label>제 목</label> <input class="form-control" name="title">
            
            </div>
            <!-- /.card-header -->
            <div class="card-body p-0">
              
              
              
              <!-- /.mailbox-controls -->
              <div class="mailbox-read-message">
            <textarea class="form-control" rows="3" name="content">1. 공지사항

            </textarea>
                
              </div>
              <!-- /.mailbox-read-message -->
            </div>
            <!-- /.card-body -->
            <div class="card-footer bg-white">
              <ul class="mailbox-attachments d-flex align-items-stretch clearfix">
                <li>
                  <span class="mailbox-attachment-icon"><i class="far fa-file-pdf"></i></span>

                  <div class="mailbox-attachment-info">
                    <a href="#" class="mailbox-attachment-name"><i class="fas fa-paperclip"></i> Sep2014-report.pdf</a>
                        <span class="mailbox-attachment-size clearfix mt-1">
                          <span>1,245 KB</span>
                          <a href="#" class="btn btn-default btn-sm float-right"><i class="fas fa-cloud-download-alt"></i></a>
                        </span>
                  </div>
                </li>
              </ul>
              
              <div class="mailbox-controls with-border text-center">
                <div class="btn-group">
                  <button type="button" class="btn btn-default btn-sm" data-container="body" title="Reply">
                    <i class="fas fa-reply">이전 글</i>
                  </button>
            
                  <button type="button" class="btn btn-default btn-sm" data-container="body" title="list">
                    <i class="fas fa-list"><a href="/board/boardMain">목 록</a></i>
                     </button>
                  <button type="button" class="btn btn-default btn-sm" data-container="body" title="Forward">
                    <i class="fas fa-share">다음 글</i>
                  </button>

                </div>
              </div>
            </div>
            <!-- /.card-footer -->
            
             </form>
              <div class="card-footer">
                <div class="float-right">
                     <button type="submit" class="btn btn-primary"></i>수정</button>
                   <button type="reset" class="btn btn-danger">취소</button>
                </div>
              </div>
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
<%@include file="../includes/footer.jsp" %>