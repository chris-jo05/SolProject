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
					<h1>익명 게시판</h1>
				</div>
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item"><a href="/main/home">Home</a></li>
						<li class="breadcrumb-item active">익명 게시판</li>
					</ol>
				</div>
			</div>
		</div>
		<!-- /.container-fluid -->
	</section>
	
	<section class="content">
		<div class="container-fluid">
			<div class="row">
				<div class="col-12">
					<div class="card">
					
						<div class="card-header">
							<div class="btn-gorup">
								<button type="button" class="btn btn-primary" onclick="location.href='/anonymous/newAnonymous'">익명 글작성</button>
							
									<form action="" id="searchForm" class="float-right">
									<div class="input-group input-group-sm">
										<div class="input-group-prepend">
											<select name="type" id="" class="btn btn-default">
												<!-- 옵션으로 타입을 정한다. -->
												<option value="">검색어를 선택하세요</option>
												<option value="T" <c:out value="${pageVO.cri.type=='T'?'selected':''}"/>>제목</option>
												<option value="C" <c:out value="${pageVO.cri.type=='C'?'selected':''}"/>>내용</option>
												<option value="W" <c:out value="${pageVO.cri.type=='W'?'selected':''}"/>>작성자</option>
												<option value="TC" <c:out value="${pageVO.cri.type=='TC'?'selected':''}"/>>제목 or 내용</option>
												<option value="TCW" <c:out value="${pageVO.cri.type=='TCW'?'selected':''}"/>>제목 or 내용 or 작성자</option>
											</select>
										</div>
										<!-- /btn-group -->
										<input type="text" name="keyword" value="${pageVO.cri.keyword}"  />
										<button type="button" class="btn btn-default keyword">
											<i class="fas fa-search"></i>
										</button>
									</div>
								</form>
							
							</div> <!-- btn-group -->
						</div> <!-- card-header -->
	<div class="card-body table-responsive p-0">
							<table class="table table-hover text-nowrap">
								<thead>
									<tr>
										<th>글 번호</th>
										<th>제 목</th>
										<th>작성자</th>
										<th>등록날짜</th>
										<th>수정날짜</th>
									</tr>
								</thead>
								<tbody>
								<!-- 익명게시판 리스트 반복문 -->
								<c:forEach var="vo" items="${list}">
								<tr>
											<td>${vo.ano}</td>
											<td><a href="${vo.ano}" class="move">${vo.atitle}</a></td>
											<td>${vo.awriter}</td>
											<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${vo.adate}" /></td>
											<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${vo.aupdatedate}" /></td>
										</tr>
										</c:forEach>
								</tbody>
							</table>
								</div> <!-- card-body table -->
					</div> <!-- card -->
				</div> <!-- col-12 -->
			</div>  <!-- row -->
		</div> <!-- container-fluid -->
		</section> <!-- content -->
	</div> <!-- content-wrapper -->
	<div class="card-footer">
	<ul class="pagination justify-content-center text-center">
	<li>
			
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
	<form action="anonymousMain" method="get" id="actionForm">
	<input type="hidden" name="type" value="${pageVO.cri.type}" /> 
	<input type="hidden" name="keyword" value="${pageVO.cri.keyword}" />
	<input type="hidden" name="pageNum" value="${pageVO.cri.pageNum}" />
	<input type="hidden" name="amount" value="${pageVO.cri.amount}" />
	
	</form>
   <script>
   	var actionForm = $("#actionForm");
   	$(".move").click(function(e){
		e.preventDefault(); //타이틀 a 속성 막기
		
			
		actionForm.append("<input type='hidden' name='ano' value='"+$(this).attr('href')+"'>");
		actionForm.attr('action','readAnonymous');
		actionForm.submit();		
	})
	
	$(".paginate_button a").click(function(e){
		e.preventDefault();  //a 속성 중지
		
		//actionForm의 안의 pageNum의 값을 사용자가 선택한 번호로 변경
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		
		//actionForm 보내기
		actionForm.submit();
	})
	
	
	$("#amount").change(function(){
		//사용자가 선택한 게시물 수 가져오기
		let amount = $(this).val();
		
		//actionForm의 안의 amount의 값을 사용자가 선택한 번호로 변경
		actionForm.find("input[name='amount']").val(amount);
		
		//actionForm 보내기
		actionForm.submit();
	})
	
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