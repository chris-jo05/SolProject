<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<div class="content-header">
		<div class="container-fluid"></div>
		<!-- /.container-fluid -->
	</div>
	<!-- /.content-header -->

	<!-- Main content -->
	<section class="content">
		<div class="container-fluid">

			<!-- Main row -->
			<div class="row">
				<!-- Left col -->
				<section class="col-lg-7 connectedSortable">
					<!-- Custom tabs (Charts with tabs)-->
					<div class="card">
						<div class="card-header border-0 text-center">

							<h3 class="card-title"><i class="fas fa-clipboard"></i> Notice</h3>
							<!-- /.card-header -->
							<!-- 공지 사항 게시판  -->
							<div class="card-body">
								<table class="table table-hover text-nowrap">
									<thead>
										<tr>
											<th>글 번호</th>
											<th>제목</th>
											<th>작성자</th>
											<th>부서</th>
											<th>등록날짜</th>
										</tr>
									</thead>
									<tbody>


										<!-- 게시판 리스트 반복문 -->
										<c:forEach var="vo" items="${list}">
											<tr>
												<td>${vo.bno}</td>
												<td>
													<a href="/board/boardRead?bno=${vo.bno}" class="move">${vo.b_title}</a>
												</td>
												<td>${vo.b_writer}</td>
												<td>${vo.dname}</td>
												<td>
													<fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${vo.b_date}" />
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
							<!-- /.card-body -->
						</div>
					</div>
					<!-- /.card -->

					<!-- 해야 할일 -->
					<div class="card">
						<div class="card-header">
							<h3 class="card-title"><i class="ion ion-clipboard mr-1"></i> 일 정</h3>
						</div>
						<!-- /.card-header -->
						<div class="card-body">
							<ul class="todo-list" data-widget="todo-list">
								
							</ul>
						</div>
						<!-- /.card-body -->
						<div class="card-footer clearfix">
							<button id="cal_btn" type="button" class="btn btn-primary float-right">
								<i class="fas fa-plus"></i>
								일정 관리
							</button>
						</div>
					</div>
					<!-- /.card -->
				</section>
				<!-- /.Left col -->
				<!-- right col (We are only adding the ID to make the widgets sortable)-->
				<section class="col-lg-5 connectedSortable">


					<!-- DIRECT CHAT -->
					<div class="card direct-chat direct-chat-primary">
						<div class="card-header">
							<h3 class="card-title">Direct Chat</h3>

							<div class="card-tools">
								<span title="3 New Messages" class="badge badge-primary">3</span>
								<button type="button" class="btn btn-tool" data-card-widget="collapse">
									<i class="fas fa-minus"></i>
								</button>
								<button type="button" class="btn btn-tool" title="Contacts" data-widget="chat-pane-toggle" id="chatList">
									<i class="fas fa-comments"></i>
								</button>
								<button type="button" class="btn btn-tool" data-card-widget="remove">
									<i class="fas fa-times"></i>
								</button>
							</div>
						</div>
						<!-- /.card-header -->
						<div class="card-body">
							<!-- Conversations are loaded here -->
							<div class="direct-chat-messages">
								<input type="hidden" name="receiver_name" value=""/>
								<input type="hidden" name="chatroom_num" value=""/>
								<input type="hidden" name="receive_eno" value=""/>
								
								
							</div>
							
                           <!-- Contacts are loaded here -->
                           <div class="direct-chat-contacts">
							<!-- 채팅방 리스트 넣어주는 곳-->
                              <ul class="contacts-list">
                                
                              </ul>
                              <!-- /.contacts-list -->
                           </div>
                           <!-- /.direct-chat-pane -->
                        </div>
                        <!-- /.card-body -->
                        
                        <!-- 내용 작성하여 보내는 부분 -->
                        <div class="card-footer">
                           <form action="#" method="get" >
                              <div class="input-group">
                                 <input type="text" name="message"
                                    placeholder="Type Message ..." class="form-control" onkeypress="if(event.keyCode=='13'){event.preventDefault(); searchEvt();}">
                                 <span class="input-group-append">
                                    <button type="button" class="btn btn-primary" id="sendChat">Send</button>
                                 </span>
                              </div>
                           </form>
                        </div>
                        <!-- /.card-footer-->
                     </div>
                     <!--/.direct-chat -->
                     
                     <script type="text/javascript">
                     var send_eno = ${login.eno};
                     var sender_name = "${login.ename}";
                   	 
                     $(function(){
                    	 
                    	 $.getJSON({
                    		 url:"/chatRoomList",
                    		 cache: false,
                    		 success:function(data){
                    			 
                   				 str = "";
                   				 
                    			 $.each(data,function(idx,ele){
                    				 
                    					 console.log(ele.member);
                    					 
                    				 if(send_eno == ele.send_eno){
                    					 
										 str = "<li><a onclick='chat(" + ele.chatroom_num + "," + ele.receive_eno + ")'>";
	                    				 
	                    				 str += "<div class='contacts-list-info'>";
	                    				 str += "<span class='contacts-list-name'>" + ele.receiver_name;
	                    				 str += "<small class='contacts-list-date float-right'>" + timeChange(ele.send_date) + "</small>";
	                    				 str += "</span><span class='contacts-list-msg'>" + ele.chat_msg + "</span>";
	                    				 str += "</div></a></li>"
	                    				 
                    				 }else if(send_eno == ele.receive_eno){
                    					 
	                    				 str = "<li><a onclick='chat(" + ele.chatroom_num + "," + ele.send_eno + ")'>";
	                    				 
	                    				 str += "<div class='contacts-list-info'>";
	                    				 str += "<span class='contacts-list-name'>" + ele.sender_name;
	                    				 str += "<small class='contacts-list-date float-right'>" + timeChange(ele.send_date) + "</small>";
	                    				 str += "</span><span class='contacts-list-msg'>" + ele.chat_msg + "</span>";
	                    				 str += "</div></a></li>"
                    				 }else{
                    					 str += "채팅방 목록이 없습니다.";
                    				 }
                    			 $(".contacts-list").append(str);
                    			 });  // each 종료
                    		 } // success 종료
                    	 }) // getJSON 종료
                    	 
                    	 
                     })
                     
                     function chat(num,eno){
                    	 
                    	 $(".direct-chat-msg").remove();
                    	 
                    	 $.getJSON({
                    		url:"/chatRoom/" + num,
                    		type:"get",
                    		cache: false,
                    	 	success:function(data){
                    	 		
                    	 		str = "";
                    	 		str2 ="";
                    	 		
                    	 		$.each(data,function(idx,ele){
                    	 			
	                    	 		if(ele.name != sender_name){
	                    	 			
	                    	 			str += "<div class='direct-chat-msg'>";
										str += "<div class='direct-chat-infos clearfix'>";
										str += "<span class='direct-chat-name float-left'>" + ele.name + "</span>";
										str += "<span class='direct-chat-timestamp float-right'>";
										str += timeChange(ele.send_date) + "</span></div>";
										str += "<div class='direct-chat-text' id='receiveMsg'>" + ele.chat_msg + "</div></div>";
										
		                    	 		str2 = ele.name;
		                    	 		
	                    	 		}else if(ele.name == sender_name){
	                    	 			
	                    	 			str += "<div class='direct-chat-msg right'>";
										str += "<div class='direct-chat-infos clearfix'>";
										str += "<span class='direct-chat-name float-right'>" + ele.name + "</span>";
										str += "<span class='direct-chat-timestamp float-left'>";
										str += timeChange(ele.send_date) + "</span></div>";
										str += "<div class='direct-chat-text' id='sendMsg'>" + ele.chat_msg + "</div></div>";
										
	                    	 		}
                    	 		})
                    	 		
                    	 		$("input[name='chatroom_num']").val(num);
                    	 		$("input[name='receiver_name']").val(str2);
                    	 		$("input[name='receive_eno']").val(eno);
                    	 		
	                    	 	$(".direct-chat-messages").append(str);
 	                    		$(".direct-chat-messages").scrollTop($(".direct-chat-messages")[0].scrollHeight);
                    	 		
                    	 	} // success 종료
                    	 }) //getJSON 종료
                    	 //스크롤 하단으로 맞춰주기
                    	 $("#chatList").click();
                     }// chat종료
                     
                     // 밀리 세컨드를 연/월/일 시간/분 으로 변환
                     function timeChange(time){
                    	 
                    	 var time = new Date(time);
                    	 
                    	 var year = time.getFullYear();
                    	 var month = time.getMonth()+1;
                    	 var day= time.getDate();
                    	 
                    	 var hour = time.getHours();
                    	 var min = time.getMinutes();
                    	 
                    	 var now = year + "/" + month + "/" + day + "  " + hour + ":" + min;
                    	 return now;
                 
                     }
                     
                   	 function searchEvt(){
                    	
                        var msg = $("input[name='message']").val();
                   		var num = $("input[name='chatroom_num']").val();
                      	var receiver_name = $("input[name='receiver_name']").val();
                      	var receive_eno = $("input[name='receive_eno']").val(); 
                        
                      	console.log(receiver_name);
                      	console.log(receive_eno);
                      	
						if(socket){
                    		
                    		var chatMsg = "chat,"+ msg;
                    		
                    		chatMsg += "," + sender_name + "," + receive_eno + "," + num + "," + send_eno;
                    		socket.send(chatMsg);
                    		$("input[name='message']").val("");
                    		console.log(chatMsg);
                    		
                    	} 
                    	 
                      	
                     }
                     $("#sendChat").click(function(){
                    	 
	                     searchEvt();
                    	 
                     })
                     </script>
                     
					<!-- Calendar -->
                     <div class="card bg-gradient-success">
                        <div class="card-header border-0">

                           <h3 class="card-title">
                              <i class="far fa-calendar-alt"></i> 일정
                           </h3>
                           <!-- tools card -->
                           <div class="card-tools">
                              <button type="button" class="btn btn-success btn-sm"
                                 data-card-widget="collapse">
                                 <i class="fas fa-minus"></i>
                              </button>
                              <button type="button" class="btn btn-success btn-sm"
                                 data-card-widget="remove">
                                 <i class="fas fa-times"></i>
                              </button>
                           </div>
                           <!-- /. tools -->
                        </div>
                        <!-- /.card-header -->
                        <div class="card-body pt-0">
                           <!-- 날씨 api 넣기 -->
                        </div>
                        <!-- /.card-body -->
                     </div>
                     <!-- /.card -->
                  </section>
                  <!-- right col -->
               </div>
               <!-- /.row (main row) -->
            </div>
            <!-- /.container-fluid -->
         </section>
         <!-- /.content -->
      </div>
      <!-- /.content-wrapper -->
<!-- 값을 넘겨줄때 pk값 놓기 -->
<form action="mailMain" method="get" id="actionForm">
	<input type="hidden" name="eno" value="${login.eno}" />
</form>

</body>
</html>
<script>
let todolist = $(".todo-list");

$(function() {
   // 로그인한 사원의 일정 캘린더에 보여주기
   $.getJSON({
         url:"/calendar/rest_list/" + ${login.eno},
         type:"get",
         async:false,
         cache: false,
         success:function(data) {
        	 
            var count = 0;
            $.each(data, function(idx, element) {
               
               var title = element.title;
               var time = element.startDate + " " + element.cal_startTime + " ~ " + element.endDate + " " + element.cal_endTime;
               
               var duration = "";

               var startSpl = element.startDate.split("-");
               var endSpl = element.endDate.split("-");
               var startTimeSpl = element.cal_startTime.split(":");
               var endTimeSpl = element.cal_endTime.split(":");
               
               var now = new Date();
               var year = now.getFullYear(); //연도
               var month = now.getMonth()+1;//월 
               var date = now.getDate();//일
               var hr = now.getHours();//시간
               var min = now.getMinutes();//분
               
               var startDate = new Date(startSpl[0], String((startSpl[1] * 1) - 1), startSpl[2], startTimeSpl[0], startTimeSpl[1]);
               var endDate = new Date(endSpl[0], String((endSpl[1] * 1) - 1), endSpl[2], endTimeSpl[0], endTimeSpl[1]);
               
               var between_minute = Math.ceil((endDate.getTime() - now.getTime())/1000/60);
               
               
               if(now < startDate) {
                  
                  duration = " 시작 예정";
               } else {
                  if(now > endDate) {
                     duration = " 만료";
                  } else {
                     var between_hour = Math.floor(between_minute / 60);
                     var minute_left = between_minute % 60;
                     var between_day = Math.floor(between_hour / 24);
                     var hour_left = between_hour % 24;
                     
                     if(between_day > 0) {
                        duration = " " + between_day + "일";
                     } else if(between_hour > 0) {
                        duration = " " + between_hour + "시간";
                     } else {
                        duration = " " + between_minute + "분";
                     }
                  }
               }
               
               var str = "<tr>";
               
               str += "<td>" + title + "</td>";
               str += "<td>" + time + "</td>";
               str += "</tr>";
               
               var str2 = "<li>";
               str2 += "<span class='handle'><i class='fas fa-ellipsis-v'></i><i class='fas fa-ellipsis-v'></i>";
               str2 += "<div class='icheck-primary d-inline ml-2'>  ";
               
               if(element.cal_check == '1') {
                  str2 += "<input type='checkbox' value='' name='todo " + element.cno + "' id='todoCheck"+ element.cno + "' checked>";
               } else {
                  str2 += "<input type='checkbox' value='' name='todo " + element.cno + "' id='todoCheck"+ element.cno + "'>";
               }
               
               str2 += "<label for='todoCheck" + element.cno + "'></label></div></span>";
               str2 += " <span class='text'>" + title + " <br> " + time + "</span>";
               
               if(duration == " 만료") {
                  str2 += " <small class='badge badge-danger'><i class='far fa-clock'></i>" + duration + "</small></li>";   
               } else {
                  str2 += " <small class='badge badge-info'><i class='far fa-clock'></i>" + duration + "</small></li>";
               }
               
               //str2 += "<div class='tools'><i class='fas fa-edit'></i><i class='fas fa-trash-o'></i></div></li>";
               
               if(count < 5) {
                  todolist.append(str2);
                  count = count + 1;
               }
            })
         }
   });
   
   $("#cal_btn").click(function() {
      
      location.href = "/calendar/calendar";
   });
   
   $(".todo-list li label").click(function() {
      
      if(!$(this).prev().prop("checked")) {
         //체크가 안된 상태에서 체크 박스 클릭 => 체크 하기
         
         var cno = String($(this).prev().attr("name")).split(" ")[1] * 1;
         
         $.ajax({
            url:"/calendar/rest_check/" + cno + "/1",
            type:"POST",
            async:false,
            cache: false,
            success:function(data) {
            }
         })
      } else {
         // 체크가 된 상태에서 체크 박스 클릭 => 체크 풀기
         
         var cno = String($(this).prev().attr("name")).split(" ")[1] * 1;
         
         $.ajax({
            url:"/calendar/rest_check/" + cno + "/0",
            type:"POST",
            async:false,
            success:function(data) {
            }
         })
      }
   })
})

$("#cal_btn").click(function() {
      
      location.href = "/calendar/calendar";
   });

</script>
<%@include file="../includes/footer.jsp"%>