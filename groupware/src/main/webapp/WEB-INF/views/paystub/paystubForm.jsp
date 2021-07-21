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
            <h1>${paystubVO.ename}님의 ${paystubVO.pay_year}년 ${paystubVO.pay_month}월 급여명세서</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="/main/home">Home</a></li>
              <li class="breadcrumb-item active">${paystubVO.pay_month}월 급여명세서</li>
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
                <h3 class="card-title">귀하의 노고에 감사드립니다.</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
              
              <table id="example2" class="table table-bordered table-hover text-center">
              	<thead>
              	<tr>
              		<th>지급합계</th>
              		<th>공제합계</th>
              		<th>실수령액</th>
              	</tr>
              	</thead>
              	<tbody>
              	<tr>
             	 <td>&#8361; ${paystubVO.totalWages}</td>
             	 <td>&#8361; ${paystubVO.totalTaxs}</td>
             	 <td>&#8361; ${paystubVO.real_amount}</td>
          		</tr>
              	</tbody>
              </table>
              
              
                <table id="example2" class="table table-bordered table-hover text-center">
                  <thead>
                  <tr>
                    <th colspan="2">지급항목</th>
                    <th colspan="2">공제항목</th>
                  </tr>
                  </thead>
                  <tbody>
 				<tr>
	 				<td style="font-weight:bolder;">기본급</td>
	 				<c:if test="${paystubVO.normal_wage == 'wage:'}">
	 					<td>-</td>
	 				</c:if>
	 				<c:if test="${paystubVO.normal_wage != 'wage:'}">
	 					<td>&#8361; ${paystubVO.normal_wage}</td>
	 				</c:if>
	 				<td style="font-weight:bolder;">소득세</td>
	 				<c:if test="${paystubVO.income_tax == 'tax:'}">
	 					<td>-</td>
	 				</c:if>
	 				<c:if test="${paystubVO.income_tax != 'tax:'}">
	 					<td>&#8361; ${paystubVO.income_tax}</td>
	 				</c:if>
 				</tr>
 				<tr>
	 				<td style="font-weight:bolder;">상여급</td>
	 				<c:if test="${paystubVO.bonus_wage == 'wage:'}">
	 					<td>-</td>
	 				</c:if>
	 				<c:if test="${paystubVO.bonus_wage != 'wage:'}">
	 					<td>&#8361; ${paystubVO.bonus_wage}</td>
	 				</c:if>
	 				<td style="font-weight:bolder;">주민세</td>
	 				<c:if test="${paystubVO.resident_tax == 'tax:'}">
	 					<td>-</td>
	 				</c:if>
	 				<c:if test="${paystubVO.resident_tax != 'tax:'}">
	 					<td>&#8361; ${paystubVO.resident_tax}</td>
	 				</c:if>
 				</tr>
 				<tr>
	 				<td style="font-weight:bolder;">직책수당</td>
	 				<c:if test="${paystubVO.position_wage == 'wage:'}">
	 					<td>-</td>
	 				</c:if>
	 				<c:if test="${paystubVO.position_wage != 'wage:'}">
	 					<td>&#8361; ${paystubVO.position_wage}</td>
	 				</c:if>
	 				<td style="font-weight:bolder;">국민연금</td>
	 				<c:if test="${paystubVO.national_pension == 'tax:'}">
	 					<td>-</td>
	 				</c:if>
	 				<c:if test="${paystubVO.national_pension != 'tax:'}">
	 					<td>&#8361; ${paystubVO.national_pension}</td>
	 				</c:if>
 				</tr>
 				<tr>
	 				<td style="font-weight:bolder;">연장수당</td>
	 				<c:if test="${paystubVO.overtime_wage == 'wage:'}">
	 					<td>-</td>
	 				</c:if>
	 				<c:if test="${paystubVO.overtime_wage != 'wage:'}">
	 					<td>&#8361; ${paystubVO.overtime_wage}</td>
	 				</c:if>
	 				<td style="font-weight:bolder;">건강보험</td>
	 				<c:if test="${paystubVO.health_insurance == 'tax:'}">
	 					<td>-</td>
	 				</c:if>
	 				<c:if test="${paystubVO.health_insurance != 'tax:'}">
	 					<td>&#8361; ${paystubVO.health_insurance}</td>
	 				</c:if>
 				</tr>
 				<tr>
	 				<td style="font-weight:bolder;">휴일수당</td>
	 				<c:if test="${paystubVO.holiday_wage == 'wage:'}">
	 					<td>-</td>
	 				</c:if>
	 				<c:if test="${paystubVO.holiday_wage != 'wage:'}">
	 					<td>&#8361; ${paystubVO.holiday_wage}</td>
	 				</c:if>
	 				<td style="font-weight:bolder;">고용보험</td>
	 				<c:if test="${paystubVO.emp_Insurance == 'tax:'}">
	 					<td>-</td>
	 				</c:if>
	 				<c:if test="${paystubVO.emp_Insurance != 'tax:'}">
	 					<td>&#8361; ${paystubVO.emp_Insurance}</td>
	 				</c:if>
 				</tr>
 				<tr>
	 				<td style="font-weight:bolder;">복리후생비</td>
	 				<c:if test="${paystubVO.benefits == 'wage:'}">
	 					<td>-</td>
	 				</c:if>
	 				<c:if test="${paystubVO.benefits != 'wage:'}">
	 					<td>&#8361; ${paystubVO.benefits}</td>
	 				</c:if>
	 				<td style="font-weight:bolder;">장기요양</td>
	 				<c:if test="${paystubVO.longterm_care == 'tax:'}">
	 					<td>-</td>
	 				</c:if>
	 				<c:if test="${paystubVO.longterm_care != 'tax:'}">
	 					<td>&#8361; ${paystubVO.longterm_care}</td>
	 				</c:if>
 				</tr>
 				<tr>
	 				<td style="font-weight:bolder;">기타</td>
	 				<c:if test="${paystubVO.etc_wage == 'wage:'}">
	 					<td>-</td>
	 				</c:if>
	 				<c:if test="${paystubVO.etc_wage != 'wage:'}">
	 					<td>&#8361; ${paystubVO.etc_wage}</td>
	 				</c:if>
	 				<td style="font-weight:bolder;">-</td>
	 				<td>-</td>
 				</tr>
                  </tbody>
                  </table> 
              </div>
              <!-- /.card-body -->
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

<script src="../../dist/js/demo.js"></script> -->

<!-- <script>
  $(function () {
    $("#example1").DataTable({
      "responsive": true, "lengthChange": false, "autoWidth": false,
      "buttons": ["copy", "csv", "excel", "pdf", "print", "colvis"]
    }).buttons().container().appendTo('#example1_wrapper .col-md-6:eq(0)');
    $('#example2').DataTable({
      "paging": true,
      "lengthChange": false,
      "searching": false,
      "ordering": true,
      "info": true,
      "autoWidth": false,
      "responsive": true,
    });
  });
</script> -->


<%@include file="../includes/footer.jsp" %>
