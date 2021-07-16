<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@include file="../includes/header.jsp" %>

	<!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>휴지통</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="/main/home">Home</a></li>
              <li class="breadcrumb-item active">휴지통</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-md-3">

         <%@include file="../includes/mailMenu.jsp" %>
        
        </div>     <!-- /.col -->
        
        <!-- 메일 함 -->
        <div class="col-md-9">
          <div class="card card-primary card-outline">
            <div class="card-header">
              <h3 class="card-title">휴지통</h3>
            </div>
            <!-- /.card-header -->
            
            <div class="card-body p-0">
              <div class="mailbox-controls">
                <!-- Check all button -->
                <button type="button" class="btn btn-default btn-sm checkbox-toggle"><i class="far fa-square"></i>
                </button>
                <div class="btn-group">
                  <button type="button" class="btn btn-default btn-sm delete-mail">
                    <i class="far fa-trash-alt"></i>
                  </button>
                </div>
                <!-- /.btn-group -->
              </div>
              
              <div class="table-responsive mailbox-messages">
                <table class="table table-hover table-striped">
                  <tbody>
					<c:forEach var="vo" items="${beanList}">
    	             <tr>
        	            <td>
            	         <div class="icheck-primary">
                	        <input type="checkbox" value="${vo.m_no}" id="check${vo.m_no}" name="forDelete">
                    	    <label for="check${vo.m_no}"></label>
                 	     </div>
               	     	</td>
              	      	<td class="mailbox-name">${vo.m_id} (${vo.m_writer})</td>
              	    	<td class="mailbox-subject"><a href="/mailbox/readBeanMail?m_no=${vo.m_no}">${vo.m_title}</a></td>
               	     	<td class="mailbox-date"><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${vo.m_sendDate}"/></td>
	                  </tr>
                  </c:forEach>                 
                  </tbody>
                </table>
                <!-- /.table -->
              </div>
              <!-- /.mail-box-messages -->
            </div>
            <!-- /.card-body -->
            <div class="card-footer p-0">
              <div class="mailbox-controls">
                <!-- Check all button -->
                <button type="button" class="btn btn-default btn-sm checkbox-toggle">
                  <i class="far fa-square"></i>
                </button>
                <div class="btn-group">
                  <button type="button" class="btn btn-default btn-sm delete-mail">
                    <i class="far fa-trash-alt"></i>
                  </button>
                </div>
                <!-- /.btn-group -->
                
                <div class="float-right">
                  <ul class="pagination pagination-sm">
                  	<c:if test="${pageVo.prev}">
	                    <button type="button" class="btn btn-default btn-sm">
	                      <i class="fas fa-chevron page-item">
	                      	<a href="${pageVo.startPage-1}">이전 페이지</a>
	                      </i>
	                    </button>
	                  </c:if>
	                  <c:forEach var="num" begin="${pageVo.startPage}" end="${pageVo.endPage}" >
	                  		<li class="page-item ${pageVo.cri.pageNum==num?'active':''}">
	                  			<a href="${num}" class="page-link">${num}</a>
	                  		</li>
	                  </c:forEach>
	                  <c:if test="${pageVo.next}">
	                    <button type="button" class="btn btn-default btn-sm">
	                      <i class="fas fa-chevron page-item">
	                      	<a href="${pageVo.endPage+1}">다음 페이지</a>
	                      </i>
	                    </button>
	                  </c:if>
                  </ul>
                </div>
                <!-- /.float-right -->
              </div>
            </div>
            
          </div>
          <!-- /.card -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
<form action="" id="operForm" method="post" ></form>
<form action="" method="get" id="actionForm">
	<input type="hidden" name="pageNum" value="${pageVo.cri.pageNum}" />
	<input type="hidden" name="amount" value="${pageVo.cri.amount}" />
</form>
<script>
  $(function () {
	  
	// 하단 페이지 나누기 버튼 클릭시 이동
		var actionForm = $("#actionForm");
		$(".page-item a").click(function(e){
			e.preventDefault(); //a 속성 중지
				
			//actionForm 안에 pageNum의 값을 사용자가 선택한 번호로 변경
			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
				
			//actionForm 보내기 
			actionForm.submit();
		})
		  
		var checkBoxArr = new Array();
			
		var operForm = $("#operForm");
			
			  
		$(".delete-mail").click(function(e){
			e.preventDefault();
				
			var str="";
				
		    $('input[name="forDelete"]:checked').each(function (idx) {
		    	str+="<input type='hidden' name='mNoList["+idx+"].m_no' value='"+$(this).val()+"'>";
	   		});	  
			
				
		    operForm.append(str);
			operForm.attr('action','/mailbox/removeBeanMailList');
			
			operForm.submit();
		})
		
    //체크 박스 전체 체크 및 전체 체크 해제
    $('.checkbox-toggle').click(function () {
      var clicks = $(this).data('clicks')
      if (clicks) {
        //체크 되어있지 않을 경우 
        $('.mailbox-messages input[type=\'checkbox\']').prop('checked', false)
        $('.checkbox-toggle .far.fa-check-square').removeClass('fa-check-square').addClass('fa-square')
      } else {
        //체크 되어 있을 경우
        $('.mailbox-messages input[type=\'checkbox\']').prop('checked', true)
        $('.checkbox-toggle .far.fa-square').removeClass('fa-square').addClass('fa-check-square')
      }
      $(this).data('clicks', !clicks)
    })

    //Handle starring for font awesome
    $('.mailbox-star').click(function (e) {
      e.preventDefault()
      //detect type
      var $this = $(this).find('a > i')
      var fa    = $this.hasClass('fa')

      //Switch states
      if (fa) {
        $this.toggleClass('fa-star')
        $this.toggleClass('fa-star-o')
      }
    })
  })
</script>
<%@include file="../includes/footer.jsp" %>