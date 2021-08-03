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
					<h1>익명 게시판</h1>
				</div>
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item"><a href="/main/home">Home</a></li>
						<li class="breadcrumb-item active">${vo.atitle}의외침</li>
					</ol>
				</div>
			</div>
		</div>
		<!-- /.container-fluid -->
	</section>

	<!-- Main content -->
	<section class="content">
		<div class="container-fluid">
			<div class="row">
				<!-- /.col -->
				<div class="col-md-9">
					<form action="" id="form">

						<div class="card card-primary card-outline">
							<div class="card-header">
								<h3 class="card-title">제&nbsp;목 : &nbsp;&nbsp;${vo.atitle}</h3>
								<div class="float-right">
									<h3 class="card-title">
										작성일 : &nbsp;
										<fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${vo.adate}" />
									</h3>
								</div>
							</div>

							<div class="card-header">
								<div class="float-right">
									<h1 class="card-title">작성자: &nbsp;&nbsp;${vo.awriter}</h1>
								</div>
							</div>



							<!-- /.card-header -->

							<div class="card-body p-0 text-center" style="height: '20px'">
								<div class="card-tools">
									<p>&nbsp;&nbsp;${vo.acontents}</p>
								</div>
							
							</div>
							<!-- /.card-body -->
							<div class="card-footer bg-white">
					
								<div class="text-center">
									<div class="btn-group ">
										<button type="button" id="pre" class="btn btn-default btn-sm" data-container="body">
											<i class="fas fa-reply">이전 글</i>
										</button>

										<button type="button" class="btn btn-default btn-sm" id="list" data-container="body">
											<i class="fas fa-list">목 록</i>
										</button>

										<button type="button" id="next" class="btn btn-default btn-sm" data-container="body">
											<i class="fas fa-share">다음 글</i>
										</button>
									</div>
								</div>
							</div>
							<!-- /.card-footer -->
							<!-- 리스트부분 -->

							<div class="card-footer">
								<button type="button" class="btn btn-primary"
									data-target="#modal-sm" data-toggle="modal">수정 하기</button>
								<div class="modal fade" id="modal-sm" style="display: none;"
									aria-hidden="true">
									<div class="modal-dialog modal-sm">
										<div class="modal-content">
											<div class="modal-header">
												<h4 class="modal-title" style="font-weight: bold;">비밀번호 입력</h4>
												<button type="button" class="close" data-dismiss="modal"
													aria-label="Close">
													<span aria-hidden="true">x</span>
												</button>
											</div>
											<div class="modal-body">
												<input type="password" name="apassword" id="" value="" />
											</div>
											<div class="modal-footer justify-content-between">
												<button type="button" class="btn btn-default"
													data-dismiss="modal">Close</button>
												<button type="button" class="btn btn-primary" id="modifyBtn">Confirm</button>

											</div>
										</div>
									</div>
								</div>

								<button type="button" class="btn btn-success float-right"
									data-target="#modal-sm2" data-toggle="modal">삭 제</button>
								<div class="modal fade" id="modal-sm2" style="display: none;"
									aria-hidden="true">
									<div class="modal-dialog modal-sm">
										<div class="modal-content">
											<div class="modal-header">
												<h4 class="modal-title" style="font-weight: bold;">비밀번호 입력</h4>
												<button type="button" class="close" data-dismiss="modal"
													aria-label="Close">
													<span aria-hidden="true">x</span>
												</button>
											</div>
											<div class="modal-body">
												<input type="password" name="apassword2" id="" value="" />
											</div>
											<div class="modal-footer justify-content-between">
												<button type="button" class="btn btn-default"
													data-dismiss="modal">Close</button>
												<button type="button" class="btn btn-primary" id="removeBtn">Confirm</button>

											</div>
										</div>
									</div>
								</div>
								</div>
							</div>
							<!-- /.card -->
						 
					</form>
				</div>
				<!-- /.col -->
			</div>
		</div>
		<!-- /.row -->
	</section>
</div>
	<form action="" method="get" id="operForm">
	<input type="hidden" name="pageNum" value="${cri.pageNum}" />
   	<input type="hidden" name="amount" value="${cri.amount}" />
	<input type="hidden" name="ano" value="${vo.ano}" />
	</form>
<!-- /.container-fluid -->
<script>
var ano = ${vo.ano};
let prev = ${vo.a_prev};
let next = ${vo.a_next};
let modal = $(".modal");

var operForm=$("#operForm");

$("#list").click(function(){
    operForm.find("input[name='ano']").remove();
    operForm.attr('action','/anonymous/anonymousMain');
    operForm.submit();
})
$("#next").click(function(){
	var input = $("input[id='ano']");
	
	if(next == 0){
		operForm.attr('method','get');
		alert("다음페이지가 존재하지 않습니다.");
	}else if(next != 0){
		input.attr('value',next)
		operForm.attr('method','get');
		operForm.attr('action','/anonymous/readAnonymous?ano='+ next);
	}
	operForm.submit();	
})

$("#pre").click(function(){
	var input = $("input[id='ano']");
	
	if(prev == 0){
		operForm.attr('method','get');
		alert("이전페이지가 존재하지 않습니다.");
	}else if(prev != 0){
		console.log(prev);
		input.attr('value',prev)
		operForm.attr('method','get');
		operForm.attr('action','/anonymous/readAnonymous?ano='+prev);
	}
	operForm.submit();	
})


var modalPassword = modal.find("input[name=apassword]");
var modalPassword2 = modal.find("input[name=apassword2]");


$("#modifyBtn").click(function() {
	console.log(ano);
	
	$.ajax({
		url:"/anonymous/checkpw/" + ano,
		type:"POST",
		success:function(data) {
			console.log(data);
			
			if(modalPassword.val() == data) {
				operForm.attr('action','modifyAnonymous')
				operForm.submit();
			} else {
				alert("비밀번호가 다릅니다.");
			}
			
		}
	})
});

$("#removeBtn").click(function() {
	console.log(ano);
	
	checkpw(ano, function(data) {
		if(modalPassword2.val() == data) {
			// 삭제 ajax 구현
			$.ajax({
				url:"/anonymous/anonyDelete/" + ano,
				type:"DELETE",
				success:function(data) {
					console.log(data);
					location.href='/anonymous/anonymousMain'
				},
				error:function() {
					alert("simpleWithObject err");
				}	
			});
		} else {
			alert("비밀번호가 다릅니다.");
		}
	})
});

function checkpw(ano, callback) {
	$.ajax({
		url:"/anonymous/checkpw/" + ano,
		type:"POST",
		async:false,
		success:function(data) {
			console.log(data);
			
			callback(data);
		}
	})
};






</script>
<%@include file="../includes/footer.jsp"%>