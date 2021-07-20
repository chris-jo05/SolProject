<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>공지 사항</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="/main/home">Home</a></li>
              <li class="breadcrumb-item active">${vo.bno}번 공지글</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
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
              <h3 class="card-title" >제목 : &nbsp;&nbsp;${vo.b_title}</h3>
         	</div>
            <!-- /.card-header -->

            
            <div class="card-tools">
	            <table class="table table-board col-12">
	            	<tbody>
	            		<tr>
	            			<td>
		            		  <h1 class="card-title" >
		            		  
		            		  부&nbsp;서 : &nbsp;&nbsp;${vo.dname}
		            		  
		            		  <span>
		            		  
	          				    작성자: &nbsp;&nbsp;${vo.b_writer}
		            		  </span>
		            		  <span class="float-right">
				              작성일 : &nbsp;
				              <fmt:formatDate pattern="yyyy-MM-dd HH:mm"  value="${vo.b_date}"/>
		            		  
		            		  </span>
		            		  </h1>
	            			</td>
	            			<td>
	          				    <h1 class="card-title">
	          				    </h1>
	            			</td>
	            			<td class="float-right">
				              <h3 class="card-title" >
				              </h3>
	            			</td>
	            		</tr>
	            	</tbody>
	            </table>
              </div>
              

            <div class="card-body">
<!--               <textarea class="form-control" rows="3"  readonly="readonly" style="background-color:white">
              </textarea>                            -->
              <div class="mailbox-read-message">
              ${vo.b_contents}
              </div>
            </div>
            <!-- /.card-body -->
            
            
 			<%-- 첨부파일 목록 보여주기 --%>
			<!-- 첨부파일이 있을 경우 -->
			  <ul class="mailbox-attachments d-flex align-items-stretch clearfix">
			    <li>
			      
			    </li>
			   
			  </ul>
	              
            <div class="card-footer bg-white">
              <div class="mailbox-controls with-border text-center">
                <div class="btn-group">
                 <!--  <button type="button" id="pre" class="btn btn-default btn-sm" data-container="body" >
                    <i class="fas fa-reply">이전 글</i>
                  </button> -->
            
                  <button type="button" class="btn btn-default btn-sm" id="list" data-container="body">
                    <i class="fas fa-list">목 록</a></i>
                     </button>
                  
                  <!-- <button type="button" id="next" class="btn btn-default btn-sm" data-container="body">
                    <i class="fas fa-share">다음 글</i>
                  </button> -->
                </div>
              </div>
            </div>
            <!-- /.card-footer -->
           <!-- 리스트부분 --> 
          </div>
          <!-- /.card -->
            <div class="card-footer">
                     <button type="button" class="btn btn-primary">수정 하기</button>
                     <button type="button" class="btn btn-success">삭제</button>
            </div>
            
		<input type="hidden" name="bno"  value="${vo.bno}"/>
		</form>
        	</div>    <!-- /.col -->
        </div>
      </div>      <!-- /.row -->
    </section>
      </div><!-- /.container-fluid -->
<%-- 페이지 나누기를 위해 필요한 값 --%>
<form action="list" method="get" id="operForm">
<%--     <input type="hidden" name="type" value="${cri.type}" />
   <input type="hidden" name="keyword" value="${cri.keyword}" /> --%>
   <input type="hidden" name="pageNum" value="${cri.pageNum}" />
   <input type="hidden" name="amount" value="${cri.amount}" />
   <input type="hidden" id="bno" name="bno" value="${vo.bno}"/>
</form> 
<script>
   let bno = ${vo.bno};
</script>
<script>
//operForm 가져온 후 전송하기
let bno = ${vo.bno}
var operForm = $("#operForm");
//Modify버튼 클릭시  get방식 /board/modify
$(".btn-primary").click(function(){
   $.ajax({
        url: "/board/check",
        type: "POST",
        data: {"id": "${vo.b_writer}"},
        success: function(data){
            if(data == 1) {
               operForm.attr('action','boardModify');
               operForm.submit();
            } else {
               alert('권한이 없습니다.');
            }
        },
        error: function(){
            alert("ajaxError");
        }
    });
})

$(".btn-success").click(function(){
	$.ajax({
        url: "/board/check",
        type: "POST",
        data: {"id": "${vo.b_writer}"},
        success: function(data){
            if(data == 1) {
            	operForm.attr('action', 'boardRemove');
            	operForm.submit();
            } else {
               alert('권한이 없습니다.');
            }
        },
        error: function(){
            alert("ajaxError");
        }
    });
})

$("#list").click(function(){
      operForm.find("input[name='bno']").remove();
      operForm.attr('action','/board/boardMain');
      operForm.submit();
})

	
   
</script>


<script src="/resources/project/board/js/boardReader.js"></script>
<%@include file="../includes/footer.jsp" %>