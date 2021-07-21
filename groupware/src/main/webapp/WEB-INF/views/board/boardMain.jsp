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
         
        	 <div class="col-md-3">
                  <a href="/board/boardWriter"
                     class="btn btn-primary btn-block mb-3">공지 작성</a>
                     <!-- 공지 페이지 수 -->
                     <select name="" id="amount">
                    	 <option value="10">10</option>
                    	 <option value="20">20</option>
                   	 	 <option value="30">30</option>
                     </select>
             </div>
             <!-- 검색 -->
		
                <div class="input-group input-group-sm">
                <form action="" id="searchForm">
               		 <select name="type" id="" class="form-control">
               		 <!-- 옵션으로 타입을 정한다. -->
                 		 <option value="">검색어를 선택하세요</option>
                 		 <option value="T" <c:out value="${pageVO.cri.type=='T'?'selected':''}"/>>제목</option>
                  	   	 <option value="D" <c:out value="${pageVO.cri.type=='D'?'selected':''}"/>>부서</option>
                  		 <option value="W" <c:out value="${pageVO.cri.type=='W'?'selected':''}"/>>작성자</option>
                 		 <option value="TD" <c:out value="${pageVO.cri.type=='TD'?'selected':''}"/>>제목 or 부서</option>
                 		 <option value="TDW" <c:out value="${pageVO.cri.type=='TDW'?'selected':''}"/>>제목 or 부서 or 작성자</option>
                
                      </select>
                    
                      <!-- 키워드 값 설정 -->
                      	<input type="text" name="keyword" value="${pageVO.cri.keyword}" />
                      	<!--<input type="hidden" name="pageNum" value="${pageVO.cri.pageNum}"/>
                      	<input type="hidden" name="amount" value="${pageVO.cri.amount}" />-->
                            			
					<button type="button" class="btn btn-default">
                       <i class="fas fa-search"></i>
               </button>
          	 </form>
             </div>
                   
         </div>
                  
             
             
             
            <div class="col-12">
            
               <div class="card">

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
                  <!-- /.card-body -->

               </div>
                  <!-- 페이지 담당 -->
                     <div class="text-center">
                            <ul class="pagination justify-content-center">
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
                     
                  </div> 
                  <!-- 페이지 끝 -->
                     
               <!-- /.card -->
            </div>
            <!-- /.col -->
         </div>
         </section>
         <!-- /.row -->
      </div>
      
<!-- 페이지 나누기 추가 -->            
<form action="boardMain" method="get" id="actionForm">	
<input type="hidden" name="type" value="${pageVO.cri.type}" />
<input type="hidden" name="keyword" value="${pageVO.cri.keyword}" />
<input type="hidden" name="pageNum" value="${pageVO.cri.pageNum}" />
<input type="hidden" name="amount" value="${pageVO.cri.amount}" />	
</form>        
<!-- /.container-fluid -->

<!-- /.content -->

<!-- jQuery -->
<script src="../../plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="../../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- DataTables  & Plugins -->
<script src="../../plugins/datatables/jquery.dataTables.min.js"></script>
<script
   src="../../plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
<script
   src="../../plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
<script
   src="../../plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
<script
   src="../../plugins/datatables-buttons/js/dataTables.buttons.min.js"></script>
<script
   src="../../plugins/datatables-buttons/js/buttons.bootstrap4.min.js"></script>
<script src="../../plugins/jszip/jszip.min.js"></script>
<script src="../../plugins/pdfmake/pdfmake.min.js"></script>
<script src="../../plugins/pdfmake/vfs_fonts.js"></script>
<script src="../../plugins/datatables-buttons/js/buttons.html5.min.js"></script>
<script src="../../plugins/datatables-buttons/js/buttons.print.min.js"></script>
<script src="../../plugins/datatables-buttons/js/buttons.colVis.min.js"></script>
<!-- AdminLTE App -->
<script src="../../dist/js/adminlte.min.js"></script>

<!-- Page specific script -->
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
$(".btn-default").click(function(){
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