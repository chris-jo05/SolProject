<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@include file="../includes/header.jsp" %>

	<!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>메일 읽기</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="/main/home">Home</a></li>
              <li class="breadcrumb-item active">메일 읽기</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-md-3">

           <%@include file="../includes/mailMenu.jsp" %>
            
          </div>
          <!-- /.col -->
        <div class="col-md-9">
          <div class="card card-primary card-outline">
            <form action="" method="post">
            <div class="card-header">
            	<!-- 메일 제목 -->
              <h3 class="card-title">${read.m_title}</h3>

            </div>
            <!-- /.card-header -->
            <div class="card-body p-0">
              <div class="mailbox-read-info">
                <!-- 메일 주소 -->
                <h6>보낸 사람 : ${read.m_writer}
                <br />
                <h6>메일 주소 : <a href="/mailbox/mailWrite"> ${read.m_id}@SolCompany.com</a> 
                	<!-- 보낸 날짜 -->
                	<span class="mailbox-read-time float-right"><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${read.m_sendDate}"/></span></h6>
                </h6> 
                
                <div class="mailbox-controls text-center">
                  <button type="button" class="btn btn-default btn-sm" data-oper="prev" data-container="body" title="이전 메일">
                    <i class="fas fa-reply"></i>
                  </button>
                  
                  <button type="button" class="btn btn-default btn-sm" data-oper="next" data-container="body" title="다음 메일">
                    <i class="fas fa-share"></i>
                  </button>
                </div>
              </div>
              <!-- /.mailbox-read-info -->
              <div class="mailbox-read-message">${read.m_content}</div>
              <!-- /.mailbox-read-message -->
            </div>
            <!-- /.card-body -->
            <div class="card-footer bg-white">
            <!-- 첨부파일이 있을 경우 -->
              <ul class="mailbox-attachments d-flex align-items-stretch clearfix">
                <li>
                  
                </li>
               
              </ul>
            </div>
            <!-- /.card-footer -->
            
            </form>
          </div>
          <!-- /.card -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
<form action="" id="operForm" method="post" >
	<input type="hidden" name="m_no" value="${read.m_no}" />
</form>
<script>
	let m_no = ${read.m_no};
	let prev = ${read.m_prev};
	let next = ${read.m_next};
	
$(function(){
	
	var operForm = $("#operForm");
	var input = $("input[type='hidden']")
	
	$("button").click(function(e){
		e.preventDefault();
		
		var oper = $(this).data("oper");
		
		if(oper === "prev"){
			
			if(prev == 0){
				operForm.attr('method','get');
				alert("이전페이지가 존재하지 않습니다.!!");
			}else if(prev != 0){
				console.log(prev);
				input.attr('value',prev)
				operForm.attr('method','get');
				operForm.attr('action','/mailbox/readSendMail?m_no='+prev);
			}
		}else if(oper === "next"){
			
			if(next == 0){
				operForm.attr('method','get');
				alert("다음페이지가 존재하지 않습니다.!!");
			}else if(next != 0){
				input.attr('value',next)
				operForm.attr('method','get');
				operForm.attr('action',"/mailbox/readSendMail?m_no=" + next);
			}
			
		}
				operForm.submit();	
	})
});	 
</script>
<script src="/resources/project/mail/js/readMail.js"></script>
<%@include file="../includes/footer.jsp" %>