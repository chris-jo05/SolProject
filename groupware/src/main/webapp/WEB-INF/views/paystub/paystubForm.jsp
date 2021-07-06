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
            <h1>천상현님의 2021년 07월 급여명세서</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="/main/home">Home</a></li>
              <li class="breadcrumb-item active">7월 급여명세서</li>
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
             	 <td>&#8361; 4,010,000</td>
             	 <td>&#8361; 317,200</td>
             	 <td>&#8361; 3,692,800</td>
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
 				<td>&#8361; 3,000,000</td>
 				<td style="font-weight:bolder;">국민연금</td>
 				<td>&#8361; 57,000</td>
 				</tr>
 				<tr>
 				<td style="font-weight:bolder;">상여급</td>
 				<td>&#8361; 500,000</td>
 				<td style="font-weight:bolder;">건강보험</td>
 				<td>&#8361; 100,300</td>
 				</tr>
 				<tr>
 				<td style="font-weight:bolder;">직책수당</td>
 				<td>&#8361; 130,000</td>
 				<td style="font-weight:bolder;">고용보험</td>
 				<td>&#8361; 11,300</td>
 				</tr>
 				<tr>
 				<td style="font-weight:bolder;">야근수당</td>
 				<td>&#8361; 170,000</td>
 				<td style="font-weight:bolder;">갑근세</td>
 				<td>&#8361; 44,300</td>
 				</tr>
 					<tr>
 				<td style="font-weight:bolder;">특근수당</td>
 				<td>&#8361; 110,000</td>
 				<td style="font-weight:bolder;">주민세</td>
 				<td>&#8361; 4,300</td>
 				</tr>
 					<tr>
 				<td style="font-weight:bolder;">기타</td>
 				<td>&#8361; 100,000</td>
 				<td style="font-weight:bolder;">기타</td>
 				<td>&#8361; 100,000</td>
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
