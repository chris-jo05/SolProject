<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp" %>

<!-- daterange picker -->
<link rel="stylesheet" href="/resources/plugins/daterangepicker/daterangepicker.css">

<!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>사원 추가</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="/main/home">Home</a></li>
              <li class="breadcrumb-item active">사원 추가</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

<!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <!-- left column -->
          <div class="col-md-12">
	<!-- general form elements -->
            <div class="card card-primary">
              <div class="card-header">
                <h3 class="card-title">사원 추가 하기</h3>
              </div>
              <!-- /.card-header -->
              <form action="" method="post" >
	              <div class="card-body">
	                <h4>사원 정보</h4>
	                <br/>
	                <div class="form-group">
	                  <label for="ename">사원 이름</label>
	                  <input 
	                  type="text" 
	                  name="ename"
	                  id="ename" 
	                  class="form-control form-control-border border-width-2" 
	                  placeholder="이름을 작성해 주세요.">
	                </div>
	                
	                <div class="form-group">
	                  <label for="exampleSelectBorder">부서명</label>
	                  <select class="custom-select form-control-border" id="exampleSelectBorder" name="dname">
	                    <option value="인사팀">인사팀</option>
	                    <option value="총무팀">총무팀</option>
	                    <option value="영업팀">영업팀</option>
	                  </select>
	                </div>
	                 
	                <div class="form-group">
	                  <label for="exampleSelectBorderWidth2">직 급</label>
	                  <select class="custom-select form-control-border border-width-2" id="exampleSelectBorderWidth2" name="position">
	                    <option value="사원">사원</option>
	                    <option value="주임">주임</option>
	                    <option value="대리">대리</option>
	                    <option value="과장">과장</option>
	                    <option value="부장">부장</option>
	                  </select>
	                </div>
	                <div class="form-group">
	                  <label for="exampleInputBorderWidth2">생년 월일</label>
	                  <input 
	                  type="text" 
	                  class="form-control form-control-border border-width-2" 
	                  id="exampleInputBorderWidth2" 
	                  placeholder="사원의 생일을 작성해 주세요.(ex:19970815)"
	                  name="birthday">
	                </div>
	                <div class="form-group">
	                  <label for="exampleInputBorderWidth2">전화 번호</label>
	                  <input 
	                  type="text" 
	                  class="form-control form-control-border border-width-2" 
	                  id="exampleInputBorderWidth2" 
	                  placeholder="휴대폰 번호를 입력해 주세요.(010-1234-1234)"
	                  name="mobile">
	                </div>
	                <div class="form-group">
	                  <label for="exampleInputBorderWidth2">이메일</label>
	                  <input 
	                  type="text" 
	                  class="form-control form-control-border border-width-2" 
	                  id="exampleInputBorderWidth2" 
	                  placeholder="이메일 주소를 입력해 주세요."
	                  name="id">
	                </div>
	                <div class="form-group">
	                  <label for="exampleInputBorderWidth2">비밀 번호</label>
	                  <input 
	                  type="password" 
	                  class="form-control form-control-border border-width-2" 
	                  id="exampleInputBorderWidth2" 
	                  placeholder="사용하실 비밀번호를 입력해 주세요."
	                  name="password">
	                </div>
	                <div class="form-group">
	                  <label for="exampleInputBorderWidth2">주소</label>
	                  <input 
	                  type="text" 
	                  class="form-control form-control-border border-width-2" 
	                  id="exampleInputBorderWidth2" 
	                  placeholder="주소를 입력해주세요."
	                  name="address">
	                </div>
	                <div class="form-group">
	                  <label>입사일</label>
	                    <div>
	                        <input type="date" 
	                        class="date"
	                        name="hireDate"/>
	                        </div>
	                    </div>
	                
	                 <!-- <div class="form-group">
	                  <label>퇴사일</label>
	                    <div class="input-group date" id="reservationdate" data-target-input="nearest">
	                        <input type="text" 
	                        class="form-control datetimepicker-input" 
	                        data-target="#reservationdate"
	                        name="leaveDate"/>
	                        <div class="input-group-append" data-target="#reservationdate" data-toggle="datetimepicker">
	                            <div class="input-group-text"><i class="fa fa-calendar"></i></div>
	                        </div> 
	                    </div>
	                </div>  -->
	                
	                <div class="form-group">
	                  <label for="exampleSelectBorderWidth2">은 행</label>
	                  <select class="custom-select form-control-border col-md-3" id="exampleSelectBorderWidth2" name="acou_name">
	                  	  <option>카카오 은행</option>
	                      <option>국민 은행</option>
	                      <option>신한 은행</option>
	                      <option>우리 은행</option>
	                      <option>기업 은행</option>
	                  </select>
	                </div>
	                <div class="form-group">
	                  <label for="exampleInputBorderWidth2">계좌번호</label>
	                  <input type="text" class="form-control form-control-border border-width-2" id="exampleInputBorderWidth2" placeholder="계좌번호를 입력해주세요.(78945-12-45646789)" name="account">
	                </div>
	                <div class="form-group">
	                	<label for="exampleInputBorderWidth2" name="gender">성 별</label>
	                	<div>
	                  <label class="btn btn-primary">
	                    <input type="radio" name="gender" id="option_b2"  value="남자"> 남 자
	                  </label>
	                  <label class="btn btn-danger">
	                    <input type="radio" name="gender" id="option_b3" value="여자"> 여 자
	                  </label>
	                	</div>
	                </div>
	              </div>
	                <div class="card-footer">
	                  <button type="submit" class="btn btn-info">추가 하기</button>
	                  <button type="reset" class="btn btn-default float-right">취소 하기</button>
	                </div>
			   </form>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
            </div>
           </div>
          </div>
        </section>
       </div>

<!-- date-range-picker -->
<script src="/resources/plugins/daterangepicker/daterangepicker.js"></script>
<!-- 입사일을 위한 스크립트 -->
<script>
$(function(){
	
	//Date picker
    $('#reservationdate').datetimepicker({
        format: 'L'
    });
})
</script>
<%@include file="../includes/footer.jsp" %>