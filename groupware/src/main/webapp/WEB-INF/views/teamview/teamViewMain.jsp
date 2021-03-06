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
            <h1>조 직 도</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="/main/home">Home</a></li>
              <li class="breadcrumb-item active">조 직 도</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>
	
    <!-- Main content -->
    <section class="conteamViewHrtent">
      <!-- Default box -->
      <div class="card card-solid">
        <div class="card-body pb-0">
          <div class="row">
          <!-- 각 사원 정보 -->
           
            <c:forEach var="vo" items="${teamList}">
	            <div class="col-12 col-sm-6 col-md-4 d-flex align-items-stretch flex-column">
	              <div class="card bg-light d-flex flex-fill">
	                <div class="card-body">
	                    <div class="col-12">
	                      <h2 class="lead">
	                      	<br />
	                      	<b>${vo.dname}</b>
	                      </h2>
	                      <br />
	                      <ul class="ml-4 mb-0 fa-ul text-muted">
                      <li class="small"><span class="fa-li"><i class="fas fa-lg fa-building"></i></span> 부서 위치&nbsp; :&nbsp;&nbsp; 4층</li>
                      <br /> 
                        <li class="small"><span class="fa-li"><i class="fas fa-lg fa-phone"></i></span> 전화 번호 : ${vo.dphone}</li>
                      </ul>
	                    </div>
	                </div>
	                <div class="card-footer">
	                  <div class="text-right">
	                     <a href="/teamview/teamViewHr?dno=${vo.dno}" class="btn btn-sm btn-primary">
                      <i class="fas fa-user"></i> 사원 보기
                    </a>
	                  </div>
	                </div>
	              </div>
	            </div>
            </c:forEach>
            
          </div>
        </div>
        <!-- /.card-body -->
        <!-- 페이지 나누기  -->
        <div class="card-footer clearfix">
            <button type="button" class="btn btn-primary" id="newTeam">부서 추가</button>
            <!-- 부서추가버튼 인사관리팀만 보일 수 있도록 -->
            <c:if test="${login.dno!= 10}">
        	<script>
        	$("#newTeam").hide();
        	</script>
        	</c:if>
            <ul class="pagination pagination m-0 float-right">
            	<c:forEach var="num" begin="${pageVo.startPage}" end="${pageVo.endPage}"  >
	            	<li class="page-item ${pageVo.cri.pageNum==num?'active':''}" >
	                	<a href="${num}" class="page-link">${num}</a>
	            	</li>
	            </c:forEach>
        	</ul>
        </div>
        <!-- /.card-footer -->
      </div>
      <!-- /.card -->

    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

 <!-- 부서 추가 폼 -->
<div class="modal" tabindex="-1">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">부서 추가</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form action="/teamview/newTeam" method="post">
      <div class="modal-body">
      	<div class="form-group">
        	<label for="dname">부서 이름</label>
        	<input type="text" name="dname" class="form-control" value=""/>
        </div>
        <div class="form-group">
        	<label for="dphone">부서 전화 번호</label>
        	<input type="text" name="dphone" class="form-control" value=""/>
      	</div>
      </div>
      <div class="modal-footer">
      	 <button type="submit" class="btn btn-success" id="modalRegisterBtn">등록</button>
         <button type="button" class="btn btn-primary" id='modalCloseBtn' data-dismiss="modal">종료</button>
      </div>
      </form>
	  
    </div>
  </div>
</div> 
<form action="" method="get" id="actionForm">
	<input type="hidden" name="pageNum" value="${pageVo.cri.pageNum}" />
	<input type="hidden" name="amount" value="${pageVo.cri.amount}" />
</form>
<script>

$(function(){
	// 하단 페이지 나누기 버튼 클릭시 이동
	var actionForm = $("#actionForm");
	
	$(".page-item a").click(function(e){
		e.preventDefault(); //a 속성 중지
			
		//actionForm 안에 pageNum의 값을 사용자가 선택한 번호로 변경
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			
		//actionForm 보내기 
		actionForm.submit();
	})
})

let modal = $(".modal");

//모달 영역 값 가져오기
var modalDname = modal.find("input[name='dname']");
var modaldphone = modal.find("input[name='dphone']");

//모달 영역 안에 있는 버튼 가져오기
var modalRegisterBtn = $("#modalRegisterBtn");

//일정 작성 버튼 클릭
$("#newTeam").click(function () {
	//input안에 들어있는 value 제거
	modal.find("input").val("");
	
	modalDname.attr("readonly",false);
	modaldphone.attr("readonly",false);
	
	modal.modal("show");
	
})

</script>

<%@include file="../includes/footer.jsp" %>