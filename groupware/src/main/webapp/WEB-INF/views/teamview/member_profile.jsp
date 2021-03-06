<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp" %>

	<!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- <!-- Content Header (Page header)-->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>${member.ename}님의 프 로 필</h1>
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
	
	<br />
		<!-- Profile Image -->
            <div class="card card-primary card-outline">
              <div class="card-body box-profile">
                <div class="text-center">
                  <img class="profile-user-img img-fluid img-circle"
                       src="/resources/dist/img/SolcompanyLogo.png"
                       alt="User profile picture">
                </div>

                <h3 class="profile-username text-center">${member.ename}</h3>

                <p class="text-muted text-center">담당 업무</p>

                <ul class="list-group list-group-unbordered mb-3">
                  <li class="list-group-item">
                    <b>소 속</b> <a class="float-right">${member.dname}</a>
                  </li>
                  <li class="list-group-item">
                    <b>직 위</b> <a class="float-right">${member.position}</a>
                  </li>
                  <li class="list-group-item">
                    <b>이 메 일</b> <a class="float-right">${member.id}@solcompany.com</a>
                  </li>
                  <li class="list-group-item">
                    <b>휴 대 폰</b> <a class="float-right">${member.mobile}</a>
                  </li>
                  <li class="list-group-item">
                    <b>생 일</b> <a class="float-right">${member.birthday}</a>
                  </li>
                  <li class="list-group-item">
                    <b>성 별</b> <a class="float-right">${member.gender}</a>
                  </li>
                </ul>
              </div>
              <!-- /.card-body -->
              
              <div class="card-footer">
              	<div class="text-center">
	                <button type="button" class="btn btn-default btn-sm" id="list" data-container="body" onclick="location.href='/teamview/teamViewHr?dno=${member.dno}'">
		            	<i class="fas fa-list">목 록</i>
		            </button>
              	</div>
              </div>
            </div>
            <!-- /.card -->
          </div>  

<script>

</script>
<%@include file="../includes/footer.jsp" %>