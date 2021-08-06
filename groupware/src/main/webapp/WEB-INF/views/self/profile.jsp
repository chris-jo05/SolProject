<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp" %>

	<!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!--Content Header (Page header)-->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>프로필</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="/main/home">Home</a></li>
              <li class="breadcrumb-item active">프로필</li>
            </ol>
          </div>
        </div>
      </div>
    </section>
	
		<!-- Profile Image -->
            <div class="card card-primary card-outline">
              <div class="card-body box-profile">
                <div class="text-center">
                  <img class="profile-user-img img-fluid img-circle"
                       src="/resources/dist/img/SolcompanyLogo.png"
                       alt="User profile picture">
                </div>

                <h3 class="profile-username text-center">${login.ename}</h3>

                <p class="text-muted text-center">담당 업무</p>

                <ul class="list-group list-group-unbordered mb-3">
                  <li class="list-group-item">
                    <b>소 속</b> <a class="float-right">${login.dname}</a>
                  </li>
                  <li class="list-group-item">
                    <b>직 위</b> <a class="float-right">${login.position}</a>
                  </li>
                  <li class="list-group-item">
                    <b>이 메 일</b> <a class="float-right">${login.id}@solcompany.com</a>
                  </li>
                  <li class="list-group-item">
                    <b>휴 대 폰</b> <a class="float-right">${login.mobile}</a>
                  </li>
                  <li class="list-group-item">
                    <b>생 일</b> <a class="float-right">${login.birthday}</a>
                  </li>
                  <li class="list-group-item">
                    <b>성 별</b> <a class="float-right">${login.gender}</a>
                  </li>
                </ul>
				<div class="btn-group-center text-center">
                        <button type="button" class="btn btn-info" id="att-btn">근무  관리</button>
                        <button type="button" class="btn btn-success" id="pay-btn">급여 명세서</button>
                </div>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>  

<script>
$(function() {
	$("#att-btn").click(function() {
		var now = new Date();
		var year = now.getFullYear();
		var month = now.getMonth() + 1;
		var eno = ${login.eno};
		
		
		location.href = "/work/workTable?eno=" + eno + "&year=" + year + "&month=" + month;
	})
	
	$("#pay-btn").click(function() {
		var now = new Date();
		var year = now.getFullYear();
		var eno = ${login.eno};
		
		location.href='/paystub/paystubList?eno=' + eno + '&year=' + year;
	})
})
</script>
<%@include file="../includes/footer.jsp" %>