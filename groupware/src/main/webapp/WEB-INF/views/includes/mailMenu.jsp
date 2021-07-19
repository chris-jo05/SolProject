<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <!-- 메일 메뉴 -->
    <div class="card">
            <div class="card-header">
              <h3 class="card-title">목록</h3>

              <div class="card-tools">
                <button type="button" class="btn btn-tool" data-card-widget="collapse">
                  <i class="fas fa-minus"></i>
                </button>
              </div>
            </div>
            <div class="card-body p-0">
              <ul class="nav nav-pills flex-column">
                <li class="nav-item active">
                  <a href="/mailbox/mailMain" class="nav-link">
                    <i class="fas fa-inbox"></i> 받은 메일함
                    <span class="badge bg-primary float-right mailCount"></span>
                  </a>
                </li>
                <li class="nav-item">
                  <a href="/mailbox/sendMailBox" class="nav-link">
                    <i class="far fa-envelope"></i> 보낸 메일함
                  </a>
                </li>
                <li class="nav-item">
	                <a href="/mailbox/trashBean" class="nav-link">
    	            	<i class="far fa-trash-alt"></i> 휴지통
    	            </a>
                </li>
              </ul>
            </div>
            <!-- /.card-body -->
          </div>
          
<script>

	let e_id = "${login.id}";
	
$(function(){
	
	//메일 읽었는지에 대한 여부 확인하기
	$.getJSON({
		url:'getCntUnRead',
		data:{
			e_id:e_id
		},
		success:function(result){
			console.log(result);
			
			$(".mailCount").html(result);
		},
		error:function(xhr,status,error){
			console.log("에러발생")
		}
	})
})

</script>