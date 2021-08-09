<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1></h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="/main/home">Home</a></li>
              <li class="breadcrumb-item active">급여 명세서</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-12">
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">급여 명세서</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <table id="example2" class="table table-bordered table-hover">
                  <thead>
                  <tr>
                    <th>날짜</th>
                    <th>부서</th>
                    <th>직급</th>
                    <th>계좌번호</th>
                    <th>거래은행</th>
                  </tr>
                  </thead>
	                  <tbody>
						<c:if test="${not empty paystubList}">
							<c:forEach var="vo" items="${paystubList}">
								<tr>
									<c:if test="${vo.pay_month <= '9'}">
										<td style="cursor:pointer;color:blue;" onClick="location.href='paystubForm?year=${param.year}&month=${vo.pay_month}&eno=${param.eno}'">${vo.pay_year}-0${vo.pay_month}</td>
									</c:if>
									<c:if test="${vo.pay_month > '9'}">
										<td style="cursor:pointer;color:blue;" onClick="location.href='paystubForm?year=${param.year}&month=${vo.pay_month}&eno=${param.eno}'">${vo.pay_year}-${vo.pay_month}</td>
									</c:if>
									
									<td>${vo.dname}</td>
									<td>${vo.position}</td>
									<td>${vo.acount}</td>
									<td>${vo.acou_name}</td>
								</tr>
							 </c:forEach>	
						</c:if>
	                  </tbody>
                  </table>
                  <c:if test="${empty paystubList}">
						  	<div style="text-align: center; margin-top: 10px;">급여명세서가 없습니다</div>
				  </c:if>
              </div>
             
              <!-- /.card-body -->
              <!-- 페이지 담당 -->
              <div class="card-footer clearfix">
				 <label for="" style="float: left">년도</label>
                <div class="col-lg-1" style="float: left;margin-bottom: 10px; margin-left: 6px">
	        			<select name="yearBox" id="yearBox" class="form-control">
		                	
		             	</select>
	        	</div>
	        	<button id="search" type="button" class="btn btn-primary float-left">검색</button>
              </div>
            </div>
            <!-- /.card -->
          <!-- /.col -->
        </div>
        <!-- /.row -->
      </div>
      </div>
      <!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
<form action="" method="get" id="actionForm">
		<input type="hidden" name="eno" value="${param.eno}" />
		<input type="hidden" name="year" value="" />
</form>
  

<!-- <script src="../../plugins/jquery/jquery.min.js"></script>
<script src="../../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="../../plugins/datatables/jquery.dataTables.min.js"></script>
<script src="../../plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
<script src="../../plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
<script src="../../plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
<script src="../../plugins/datatables-buttons/js/dataTables.buttons.min.js"></script>
<script src="../../plugins/datatables-buttons/js/buttons.bootstrap4.min.js"></script>
<script src="../../plugins/jszip/jszip.min.js"></script>
<script src="../../plugins/pdfmake/pdfmake.min.js"></script>
<script src="../../plugins/pdfmake/vfs_fonts.js"></script>
<script src="../../plugins/datatables-buttons/js/buttons.html5.min.js"></script>
<script src="../../plugins/datatables-buttons/js/buttons.print.min.js"></script>
<script src="../../plugins/datatables-buttons/js/buttons.colVis.min.js"></script>

<script src="../../dist/js/adminlte.min.js"></script>

<script src="../../dist/js/demo.js"></script>   -->

<!-- Page specific script -->
<script>
let actionForm = $("#actionForm");

$(function () {
	$(document).ready(function() {
		setDate();
	 });
	 
	 function setDate() {
		var year = ${param.year};
		
		console.log(year);
		getYears(year);
		
		$("#yearBox").val(year);
		
		$("#yearBox").change(function() {
			var changeYear = $(this).val();
			getYears(changeYear);
			$("#yearBox").val(changeYear);
		});
		
		
	 }
	 
	 function getYears(getY) {
		 $("#yearBox option").remove();
		 
		 var stYear = Number(getY) - 2;
		 var endYear = Number(getY) + 5;
		 
		 for(var y = stYear; y <= endYear; y++) {
			 $("#yearBox").append("<option value='"+ y + "'>" + y + "</option>")
		 }
	 }		 
	 
	 $("#search").click(function() {
	    	console.log("search clicked");
		
			actionForm.find("input[name='year']").val($("#yearBox").val());
			
			//actionForm 보내기 
			actionForm.submit();
	 });
});
</script>



<%@include file="../includes/footer.jsp" %>
