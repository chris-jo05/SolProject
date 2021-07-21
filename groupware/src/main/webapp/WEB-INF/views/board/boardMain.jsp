<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
                  <li class="breadcrumb-item active">공지  사항</li>
               </ol>
            </div>
         </div>
      </div>
      <!-- /.container-fluid -->
   </section>

   <!-- Main content -->
	<section class="content">
		<div class="container-fluid">
			<div class="row">
				<div class="col-12">
					<div class="card">
					
						<div class="card-header">
							<div class="btn-gorup">
								<button type="button" class="btn btn-primary" onclick="location.href='/board/boardWriter'">공지 작성</button>
								
								<form action="" id="searchForm" class="float-right">
									<div class="input-group input-group-sm">
										<div class="input-group-prepend">
											<select name="type" id="" class="btn btn-default">
												<!-- 옵션으로 타입을 정한다. -->
												<option value="">검색어를 선택하세요</option>
												<option value="T" <c:out value="${pageVO.cri.type=='T'?'selected':''}"/>>제목</option>
												<option value="D" <c:out value="${pageVO.cri.type=='D'?'selected':''}"/>>부서</option>
												<option value="W" <c:out value="${pageVO.cri.type=='W'?'selected':''}"/>>작성자</option>
												<option value="TD" <c:out value="${pageVO.cri.type=='TD'?'selected':''}"/>>제목 or 부서</option>
												<option value="TDW" <c:out value="${pageVO.cri.type=='TDW'?'selected':''}"/>>제목 or 부서 or 작성자</option>
											</select>
										</div>
										<!-- /btn-group -->
										<input type="text" name="keyword" value="${pageVO.cri.keyword}"  />
										<button type="button" class="btn btn-default keyword">
											<i class="fas fa-search"></i>
										</button>
									</div>
								</form>
							
							</div>
							<!-- 검색 -->
						</div>
	                   
						<div class="card-body table-responsive p-0">
							<table class="table table-hover text-nowrap">
								<thead>
									<tr>
										<th>글 번호</th>
										<th>제 목</th>
										<th>작성자</th>
										<th>부서</th>
										<th>등록날짜</th>
										<th>수정날짜</th>
										<th>조회</th>
									</tr>
								</thead>
								<tbody>
									<!-- 게시판 리스트 반복문 -->
									<c:forEach var="vo" items="${list}">
										<tr>
											<td>${vo.bno}</td>
											<td><a href="${vo.bno}" class="move">${vo.b_title}</a></td>
											<td>${vo.b_writer}</td>
											<td>${vo.dname}</td>
											<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
																value="${vo.b_date}" /></td>
											<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
																value="${vo.b_updatedate}" /></td>
											<td>${vo.hit}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<div class="card-footer">
							<ul class="pagination justify-content-center text-center">
								<li>
									<!-- 공지 페이지 수 -->
									<select name="" id="amount" class="btn btn-default form-control">
										<option value="10">10</option>
										<option value="20">20</option>
										<option value="30">30</option>
									</select>
								</li>
								<c:if test="${pageVO.prev}">
									<li class="paginate_button previous"><a class="page-link"  href="${pageVO.startPage-1}">이전</a></li>
								</c:if>          		
							                            		
								<c:forEach var="idx" begin="${pageVO.startPage}" end="${pageVO.endPage}">
									<li class="paginate_button ${pageVO.cri.pageNum==idx?'active':''}">
										<a class="page-link" href="${idx}">${idx}</a>
									</li>
								</c:forEach>
								<!-- 다음 페이지 -->
								<c:if test="${pageVO.next}">
									<li class="paginate_button next"><a class="page-link" href="${pageVO.endPage+1}">다음</a></li>
								</c:if> 
							</ul>
						</div>
						
						
					</div> <!-- card end -->
	                     
				</div><!-- col-12 끝 -->
			</div> <!-- row 끝 -->
		</div><!-- container-fluid 끝 -->
	</section>
</div>
<!-- 페이지 나누기 추가 -->            
<form action="boardMain" method="get" id="actionForm">	
	<input type="hidden" name="type" value="${pageVO.cri.type}" />
	<input type="hidden" name="keyword" value="${pageVO.cri.keyword}" />
	<input type="hidden" name="pageNum" value="${pageVO.cri.pageNum}" />
	<input type="hidden" name="amount" value="${pageVO.cri.amount}" />	
</form>        

<script>
var actionForm = $("#actionForm");
$(".move").click(function(e){
	e.preventDefault(); //타이틀 a 속성 막기

	//actionForm에 bno 값을 추가하여 actionForm 보내기		
	actionForm.append("<input type='hidden' name='bno' value='"+$(this).attr('href')+"'>");
	actionForm.attr('action','boardRead');
	actionForm.submit();		
})
$(".paginate_button a").click(function(e){
		e.preventDefault();  //a 속성 중지
		
		//actionForm의 안의 pageNum의 값을 사용자가 선택한 번호로 변경
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		
		//actionForm 보내기
		actionForm.submit();
	})
	
//게시물 수 변경
$("#amount").change(function(){
		//사용자가 선택한 게시물 수 가져오기
		let amount = $(this).val();
		
		//actionForm의 안의 amount의 값을 사용자가 선택한 번호로 변경
		actionForm.find("input[name='amount']").val(amount);
		
		//actionForm 보내기
		actionForm.submit();
	})
	
//검색 관련 스크립트
$(".keyword").click(function(){
		//검색 폼 가져오기
		var searchForm = $("#searchForm");
		
		//type 가져오기
		var type = $("select[name='type']").val();
		
		//keyword 가져오기
		var keyword = $("input[name='keyword']").val();
		
		if(type===''){
			alert("검색 기준을 확인하세요");
			$("select[name='type']").focus();
			return false;
		}else if(keyword===''){
			alert("검색어를 입력해주세요");
			$("input[name='keyword']").focus();
			return false;
		}
		
		//검색 처음에는 1page 보여주기
		searchForm.find("input[name='pageNum']").val("1");
		
		searchForm.submit();
	})

</script>


<%@include file="../includes/footer.jsp"%>