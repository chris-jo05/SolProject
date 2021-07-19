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
	                      <h2 class="lead"><b>${vo.ename}</b></h2>
	                      <br />
	                      <p class="text-muted text-sm">직급 : ${vo.position}</p>
	                      <ul class="ml-4 mb-0 fa-ul text-muted">
	                        <li class="small"><span class="fa-li"><i class="nav-icon far fa-envelope"></i></span>
	                         이메일 : <a href="/mailbox/mailWriteId" value="${vo.id}">${vo.id}@solcompany.com</a>
	                         </li>
	                        <br />
	                        <li class="small"><span class="fa-li"><i class="fas fa-lg fa-phone"></i></span> 휴대폰 : ${vo.mobile}</li>
	                      </ul>
	                    </div>
	                </div>
	                <div class="card-footer">
	                  <div class="text-right">
	                    <a href="#" class="btn btn-sm bg-teal">
	                      <i class="fas fa-comments"></i>
	                    </a>
	                    <a href="#" class="btn btn-sm btn-primary">
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
        <div class="card-footer">
          <nav aria-label="Contacts Page Navigation">
            <ul class="pagination justify-content-center m-0">
              <li class="page-item active"><a class="page-link" href="#">1</a></li>
              <li class="page-item"><a class="page-link" href="#">2</a></li>
              <li class="page-item"><a class="page-link" href="#">3</a></li>
              <li class="page-item"><a class="page-link" href="#">4</a></li>
              <li class="page-item"><a class="page-link" href="#">5</a></li>
              <li class="page-item"><a class="page-link" href="#">6</a></li>
              <li class="page-item"><a class="page-link" href="#">7</a></li>
              <li class="page-item"><a class="page-link" href="#">8</a></li>
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


<!-- jQuery -->
<script src="../../plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="../../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="../../dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="../../dist/js/demo.js"></script>
</body>
</html>


<%@include file="../includes/footer.jsp" %>