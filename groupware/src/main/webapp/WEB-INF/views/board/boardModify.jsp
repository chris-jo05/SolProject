<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


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
              <li class="breadcrumb-item active">${vo.bno}번 공지글</li>
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
            <div class="card-header">
              <h3 class="card-title">작성일</h3>
              <input type="date" class="form-control" 
                     readonly="readonly" value="<fmt:formatDate pattern='yyyy-MM-dd'  value='${vo.b_date}'/>" >
              
             
				
            </div>
              
               <div class="card-header">
              <h3 class="card-title">부  서</h3>
                <input class="form-control" 
                     readonly="readonly" value="${vo.dname}">
              
            
            </div>
              <div class="card-header">
              <h1 class="card-title">작 성 자</h1>
                <input class="form-control" name="b_writer"
                     readonly="readonly" value="${vo.b_writer}">
              
            
            </div>
             <div class="card-header">
                <label>제 목</label> <input class="form-control" name="b_title" value="${vo.b_title}">
            
            </div>
            <!-- /.card-header -->
            <div class="card-body p-0">
              
              
              
              <!-- /.mailbox-controls -->
              <div class="mailbox-read-message">
            <textarea class="form-control" rows="3" name="b_contents">${vo.b_contents}
			</textarea>
                
              </div>
              <!-- /.mailbox-read-message -->
            </div>
            <!-- /.card-body -->
            <div class="card-footer bg-white">
             <div class="form-group">
           <ul class="mailbox-attachments d-flex align-items-stretch clearfix">
             <li>
               
             </li>
            
           </ul> 
                  <div class="btn btn-default btn-file">
                  	<i class="fas fa-paperclip"></i> 파일 첨부
                    	<input type="file" name="attachment" multiple>
                  </div>
                  <p class="help-block"> 
                  </p>
                </div>
            

              <div class="mailbox-controls with-border text-center">
                <div class="btn-group">
                 
                  <button type="button" class="btn btn-default btn-sm" data-container="body" id="list">
                    <i class="fas fa-list">목 록</a></i>
                     </button>
                  
                </div>
              </div>
            </div>
            <!-- /.card-footer -->
            
              <div class="card-footer">
                <div class="float-right">
                     <button type="submit" class="btn btn-primary" data-oper='modify'>수정</button>
                   <button type="reset" class="btn btn-danger">취소</button>
                </div>
              </div>
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
  <form action="boardModfy" method="get" id="operForm">
<%--<input type="hidden" name="type" value="${cri.type}" />
   <input type="hidden" name="keyword" value="${cri.keyword}" />--%>
   <input type="hidden" name="pageNum" value="${cri.pageNum}" />
   <input type="hidden" name="amount" value="${cri.amount}" />
<input type="hidden" name="bno" value="${vo.bno}"/>
</form> 
  <!-- /.content-wrapper -->
<script>
 let bno = ${vo.bno};

 var operForm = $("#operForm");
$(".btn-danger").click(function(){
      operForm.attr('action','/board/boardRead?bno=' + bno);
      operForm.submit();
})

   </script>
  <script src="/resources/project/board/js/boardModify.js"></script>
<%@include file="../includes/footer.jsp" %>