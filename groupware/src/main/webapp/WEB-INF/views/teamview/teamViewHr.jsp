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
    <section class="content">
      <!-- Default box -->
      <div class="card card-solid">
      
      <div class="btn float-right">
        <button type="submit" class="btn-lg btn-success" onclick="location.href='/hrteam/hrNewDeptMember?dname=${member[0].dname}'" id="insertMember" style="float: right">사원 추가</button>
        </div>
      	<c:if test="${login.dno!=10}">
        <script>
        $("#insertMember").hide();
        </script>
        </c:if>
        <div class="card-body pb-0">
          <div class="row">
          <!-- 각 사원 정보 -->
           
            <c:forEach var="vo" items="${member}">
	            <div class="col-12 col-sm-6 col-md-4 d-flex align-items-stretch flex-column">
	              <div class="card bg-light d-flex flex-fill">
	                <div class="card-header text-muted border-bottom-0">
	                  ${vo.dname}
	                </div>
	                <div class="card-body">
	                    <div class="col-12">
	                      <h2 class="lead" name="receiver_name">${vo.ename}</h2>
	                      <br />
	                      <p class="text-muted text-sm">직급 : ${vo.position}</p>
	                      <ul class="ml-4 mb-0 fa-ul text-muted">
	                        <li class="small"><span class="fa-li"><i class="nav-icon far fa-envelope"></i></span>
	                         이메일 : <a href="/mailbox/mailWrite?m_id=${vo.id}">${vo.id}@solcompany.com</a>
	                         </li>
	                        <br />
	                        <li class="small"><span class="fa-li"><i class="fas fa-lg fa-phone"></i></span> 휴대폰 : ${vo.mobile}</li>
	                      </ul>
	                    </div>
	                </div>
	               
	                <div class="card-footer">
	                  <div class="text-right">
	                     <a href="/insertChatRoom?receiver_name=${vo.ename}" class="btn btn-sm bg-teal">
	                      <i class="fas fa-comments"></i>
	                    </a>
	                    <a href="/paystub/paystubInsertForm?dname=${vo.dname}&ename=${vo.ename}" class="btn btn-sm btn-warning" style="color : white;">
	                      급여 명세서
	                    </a>
	                    <a href="/teamview/member_profile?eno=${vo.eno}" class="btn btn-sm btn-primary">
	                      <i class="fas fa-user"></i> View Profile
	                    </a>
	                  </div>
	                </div>
	              </div>
	            </div>
            </c:forEach>
            
            
          </div>
        </div>
        <!-- /.card-body -->
        
        <!-- 페이지 나누기 부분 -->
        <div class="card-footer">
          <nav aria-label="Contacts Page Navigation">
            <ul class="pagination justify-content-center m-0">
            	<c:if test="${pageVo.prev}">
	            	<button type="button" class="btn btn-default btn-sm">
	                	<i class="fas fa-chevron page-item">
	                    	<a href="${pageVo.startPage-1}">이전 페이지</a>
	                	</i>
	            	</button>
	            </c:if>
            	<c:forEach var="num" begin="${pageVo.startPage}" end="${pageVo.endPage}"  >
	            	<li class="page-item ${pageVo.cri.pageNum==num?'active':''}" >
	                	<a href="${num}" class="page-link">${num}</a>
	            	</li>
	            </c:forEach>
	            <c:if test="${pageVo.next}">
	            	<button type="button" class="btn btn-default btn-sm">
	            		<i class="fas fa-chevron page-item">
	            			<a href="${pageVo.endPage+1}">다음 페이지</a>
	            		</i>
	            	</button>
	            </c:if>
            </ul>
          </nav>
        </div>
        <!-- /.card-footer -->
      </div>
      <!-- /.card -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
<form action="" id="chatForm" >
</form>
<form action="" method="get" id="actionForm">
	<input type="hidden" name="dno" value="<%=request.getParameter("dno")%>" />
	<input type="hidden" name="pageNum" value="${pageVo.cri.pageNum}" />
	<input type="hidden" name="amount" value="${pageVo.cri.amount}" />
</form>
<script>
	let sender_name = "${login.ename}";
	let receiver_name = $(".lead").html();
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
</script>

<%@include file="../includes/footer.jsp" %>