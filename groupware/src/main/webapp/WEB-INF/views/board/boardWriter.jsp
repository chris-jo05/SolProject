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
          <form action="" method="post" role="form" id="operForm">
            <div class="card card-primary card-outline">
            
              <!-- /.card-header -->
              <div class="card-body">
               <div class="form-group">
                     <label for="exampleInputBorderWidth2">제 목</label>
                     <input type="text" class="b-title form-control form-control-border border-width-2" id="exampleInputBorderWidth2" name="b_title" placeholder="제목을 입력해 주세요.">
                   </div>
                 <div class="form-group">
                     <label for="exampleInputBorderWidth2">작성자</label>
                     <input type="text" class="b-writer form-control form-control-border border-width-2" id="exampleInputBorderWidth2" name="b_writer" value="${login.ename}" readonly="readonly" style="background-color:white">
                   </div>
                <div class="form-group">
	                  <label for="exampleSelectBorder">부서명</label>
	                  <select class="b-select custom-select form-control-border" id="exampleSelectBorder" name="dname">
	                    <option selected value="">부서 선택</option>
	                    <option value="총무팀">총무팀</option>
	                    <option value="영업팀">영업팀</option>
	                    <option value="영업2팀">영업2팀</option>
	                    <option value="인사팀">인사팀</option>
	                    <option value="비서팀">비서팀</option>
	                    <option value="관리팀">관리팀</option>
	                  </select>
	                  <small id="exampleSelectBorder" class="text-info"></small>
	                </div>
                       
               <div class="form-group">
                  <label>Content</label>
                  <textarea class="b-content form-control" rows="3" name="b_contents"></textarea>
            </div>
                <!-- 파일 첨부 -->
                <div class="form-group">
                  <div class="btn btn-default btn-file">
                  	<i class="fas fa-paperclip"></i> 파일 첨부
                    	<input type="file" name="attachment" multiple>
                  </div>
                  <p class="help-block"> 
                  </p>
                </div>
              </div>
              <!-- /.card-body -->
              <div class="card-footer">
                <div class="float-right">
                   <button type="submit" class="btn btn-primary" id="board"> 등록하기</button>
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
   
<script>

$(".btn-primary").click(function(){
	
	console.log("소켓이 연결되었습니다 " + socket);
	
	let socketMsg = "새로운 공지사항,";
	console.log("소켓에 전송할 메세지 : " + socketMsg);
	if(socket){
		socket.send(socketMsg);
	}
})

</script>
<script src="/resources/project/board/js/boardWriter.js"></script>
<%@include file="../includes/footer.jsp" %>