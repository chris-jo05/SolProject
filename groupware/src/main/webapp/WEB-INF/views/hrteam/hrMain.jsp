<%@page import="com.spring.member.domain.MemberVo"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>




<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1>사원 관리</h1>
				</div>
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item"><a href="/main/home">Home</a></li>
						<li class="breadcrumb-item active">사원 관리</li>
					</ol>
				</div>
			</div>
		</div>
		<!-- /.container-fluid -->
	</section>

	<!-- Main content -->
	<section class="content">
		<div class="row">
			<div class="col-12">

				<div class="card">
					<div class="card-header">
						<button type="submit" class="btn btn-success"
								onclick="location.href='/hrteam/hrNewMember' ">사원 추가</button>
							<div class="card-tools">
							<form action="" id="searchForm">
							<div class="input-group input-group-sm" style="top:10px">
								<input type="text" name="keyword" class="form-control float-right" placeholder="성명" >
								<div class="input-group-append">
									<button type="submit" class="btn btn-default">
										<i class="fas fa-search"></i>
									</button>
									</div>
									</form>
							
									
								&nbsp
								
								
								</div>									
							</div>
							</div>
					<!-- ./card-header -->
					<div class="card-body">
						<table class="table table-bordered table-hover">
							<thead class="text-center">
								<tr>
									<th>사원 번호</th>
									<th>사원 이름</th>
									<th>부서</th>
									<th>직급</th>
									<th>입사일</th>
									<th>퇴사일</th>
								</tr>
							</thead>
							<tbody>

								<%
								List<MemberVo> list = (List<MemberVo>) request.getAttribute("list");
								for (MemberVo vo : list) {

									String date = vo.getHireDate().split(" ")[0];
								%>
								<%-- <c:forEach var="vo" items="${list}"> --%>
								<%-- <fmt:parseDate value="${vo.hireDate}" var="" />
                  <fmt:formatDate value="${vo.hireDate}" pattern="yyyy-MM-dd" /> --%>
								<tr class="member-tr text-center" data-widget="expandable-table"
									aria-expanded="false" onClick="details(<%=vo.getEno()%>)"
									role="tabpanel">

									<td><%=vo.getEno()%></td>
									<td><%=vo.getEname()%></td>
									<td><%=vo.getDname()%></td>
									<td><%=vo.getPosition()%></td>
									<td><%=date%></td>

									<td>
										<%
										if (vo.getLeaveDate() != null) {
										%> <%=vo.getLeaveDate().split(" ")[0]%></td>
									<%
									}
									%>
								</tr>
								<%--   <%} %> --%>
								<tr class="expandable-body">
									<td colspan="6">
										<ul class="list-group list-group-unbordered mb-3">
											<li class="list-group-item"><b> 소 속</b> <a
												class="dname float-right"></a></li>
											<li class="list-group-item"><b>&nbsp;직 급</b> <a
												class="position float-right"></a></li>
											<li class="list-group-item"><b>이 메 일</b> <a
												class="id float-right"></a></li>
											<li class="list-group-item"><b>휴 대 폰</b> <a
												class="mobile float-right"></a></li>
											<li class="list-group-item"><b>생 일</b> <a
												class="birthday float-right"></a></li>
											<li class="list-group-item"><b>성 별</b> <a
												class="gender float-right"></a></li>
											<li class="list-group-item">
												<button type="button" class="btn btn-block btn-success"
													onclick="location.href='/hrteam/hrUpdateMember?eno=<%=vo.getEno()%>'">수정하기</button>
											</li>
										</ul>
									</td>
								</tr>
								<%
								}
								%>

								<%-- </c:forEach> --%>
							</tbody>

						</table>

					</div>
					<!-- 페이지 끝 -->
					<!-- 페이지 담당 -->
					<div class="text-center">
						<ul class="pagination justify-content-center">
							<c:if test="${pageVO.prev}">
								<li class="paginate_button previous"><a class="page-link"
									href="${pageVO.startPage-1}">이전</a></li>
							</c:if>

							<c:forEach var="idx" begin="${pageVO.startPage}"
								end="${pageVO.endPage}">
								<li
									class="paginate_button ${pageVO.cri.pageNum==idx?'active':''}">
									<a class="page-link" href="${idx}">${idx}</a>
								</li>
							</c:forEach>
							<!-- 다음 페이지 -->
							<c:if test="${pageVO.next}">
								<li class="paginate_button next"><a class="page-link"
									href="${pageVO.endPage+1}">다음</a></li>
							</c:if>

						</ul>
					
					</div>
					<div>
				<!-- /.card-body -->
			</div>
			<!-- /.card -->
		</div>
		<!-- /.row -->
</div>
<!-- /.container-fluid -->
</section>
<!-- /.content -->
</div>

<form action="hrMain" method="get" id="actionForm">
	<%-- <input type="hidden" name="type" value="${pageVO.cri.type}" />--%>
	<input type="hidden" name="keyword" value="${pageVO.cri.keyword}" />
	<input type="hidden" name="pageNum" value="${pageVO.cri.pageNum}" /> 
	<input type="hidden" name="amount" value="${pageVO.cri.amount}" />
</form>
<!-- /.content-wrapper -->


<!-- <!-- jQuery 
<script src="../../plugins/jquery/jquery.min.js"></script>
Bootstrap 4
<script src="../../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
AdminLTE App
<script src="../../dist/js/adminlte.min.js"></script>
AdminLTE for demo purposes
<script src="../../dist/js/demo.js"></script> -->

<script>
var actionForm = $("#actionForm");

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




function details(eno) {
	

	$('.member-tr').attr('aria-expanded', 'true');	
	$('.member-tr').ExpandableTable('toggleRow');
	
	$.ajax({
        url: "/hrteam/hrSelectMember",
        type: "get",
        data: {"eno" : eno},
        success: function(data){
            $(".dname").html(data.dname);
            $(".id").html(data.id);
            $(".position").html(data.position);
            $(".mobile").html(data.mobile);
            $(".birthday").html(data.birthday);
            $(".gender").html(data.gender);
        },
        error: function(){
            alert("simpleWithObject err");
        }
    });
}

	$(".btn-default").click(function() {
	var keyword = $("input[name='keyword']").val();
	
	searchForm.find("input[name='pageNum']").val("1");
	
	searchForm.submit();
})

</script>

<%@include file="../includes/footer.jsp"%>