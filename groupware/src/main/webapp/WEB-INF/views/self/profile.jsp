<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp" %>

	<!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- <!-- Content Header (Page header)
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>근태 관리</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="/main/home">Home</a></li>
              <li class="breadcrumb-item active">프로필</li>
            </ol>
          </div>
        </div>
      </div>/.container-fluid
    </section> -->
	
		<!-- Profile Image -->
            <div class="card card-primary card-outline">
              <div class="card-body box-profile">
                <div class="text-center">
                  <img class="profile-user-img img-fluid img-circle"
                       src="/resources/dist/img/SolcompanyLogo.png"
                       alt="User profile picture">
                </div>

                <h3 class="profile-username text-center">사원 이름</h3>

                <p class="text-muted text-center">담당 업무</p>

                <ul class="list-group list-group-unbordered mb-3">
                  <li class="list-group-item">
                    <b>소 속</b> <a class="float-right">인사팀</a>
                  </li>
                  <li class="list-group-item">
                    <b>직 위</b> <a class="float-right">대리</a>
                  </li>
                  <li class="list-group-item">
                    <b>이 메 일</b> <a class="float-right">auto@solcompany.com</a>
                  </li>
                  <li class="list-group-item">
                    <b>휴 대 폰</b> <a class="float-right">010 - 1234 -1234</a>
                  </li>
                  <li class="list-group-item">
                    <b>생 일</b> <a class="float-right">07 / 01</a>
                  </li>
                  <li class="list-group-item">
                    <b>성 별</b> <a class="float-right">남 / 여</a>
                  </li>
                </ul>

	                <strong><i class="fas fa-book mr-1"></i> Education</strong>
	
	                <p class="text-muted">
	                  B.S. in Computer Science from the University of Tennessee at Knoxville
	                </p>
	
	                <hr>
	
	                <strong><i class="fas fa-map-marker-alt mr-1"></i>주 소</strong>
	
	                <p class="text-muted">서울 특별시 종로구 sol빌딩 3층 인사팀</p>
	
	                <hr>
	
	                <strong><i class="fas fa-pencil-alt mr-1"></i> Skills</strong>
	
	                <p class="text-muted">
	                  <span class="tag tag-danger">UI Design</span>
	                  <span class="tag tag-success">Coding</span>
	                  <span class="tag tag-info">Javascript</span>
	                  <span class="tag tag-warning">PHP</span>
	                  <span class="tag tag-primary">Node.js</span>
	                </p>
	
	                <hr>
	
	                <strong><i class="far fa-file-alt mr-1"></i> Notes</strong>
	
	                <p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam fermentum enim neque.</p>
               
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>  


<%@include file="../includes/footer.jsp" %>