<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp" %>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<div class="content-header">
				<div class="container-fluid">
					
				</div>
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
								<div class="card-header">
									<h3 class="card-title">
										<i class="ion ion-clipboard mr-1"></i> 공지 사항 ${login.ename}
									</h3>
									<!-- 공지사항 페이지 나누기 -->
									<div class="card-tools">
										<ul class="pagination pagination-sm">
											<li class="page-item"><a href="#" class="page-link">&laquo;</a></li>
											<li class="page-item"><a href="#" class="page-link">1</a></li>
											<li class="page-item"><a href="#" class="page-link">2</a></li>
											<li class="page-item"><a href="#" class="page-link">3</a></li>
											<li class="page-item"><a href="#" class="page-link">&raquo;</a></li>
										</ul>
									</div>
								</div>
								<!-- /.card-header -->
								<!-- 공지 사항 게시판  -->
								<div class="card-body">
									<table class="table table-hover text-nowrap">
				            	      <thead>
				          	 	       	<tr>
				           		         	<th>글 번호</th>
				           		            <th>제 목</th>
				                    	    <th>글쓴이</th>
				                	        <th>날짜</th>
				            	            <th>조회</th>
				        	            </tr>									
				    	              </thead>
				    	              <tbody>
				    	              <tr>
				    	              	<td>1</td>
					                  	<td><a href="/board/boardRead">인사말</a></td>
					                  	<td>인사팀</td>
					                  	<td>2021/07/01</td>
					                  	<td>0</td>
					                  </tr>
									  <!-- 게시판 리스트 반복문 -->
									  <c:forEach var="vo" items="${list}">
									  	<tr>
											<td>${vo.bno}</td>
											<td><a href="${vo.bno}" class="move">${vo.title}</a></td>
											<td>${vo.writer}</td>
											<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${vo.regdate}"/></td>
											<td>${vo.replycnt}</td>
										</tr>
									  </c:forEach>	
									  </tbody>
					                </table>
								</div>
								<!-- /.card-body -->
							</div>
							<!-- /.card -->

							<!-- 해야 할일 -->
							<div class="card">
								<div class="card-header">
									<h3 class="card-title">
										<i class="ion ion-clipboard mr-1"></i> 해야 할일
									</h3>
									<!-- 해야 할일 페이지 나누기 -->
									<div class="card-tools">
										<ul class="pagination pagination-sm">
											<li class="page-item"><a href="#" class="page-link">&laquo;</a></li>
											<li class="page-item"><a href="#" class="page-link">1</a></li>
											<li class="page-item"><a href="#" class="page-link">2</a></li>
											<li class="page-item"><a href="#" class="page-link">3</a></li>
											<li class="page-item"><a href="#" class="page-link">&raquo;</a></li>
										</ul>
									</div>
				                
								</div>
								<!-- /.card-header -->
								<div class="card-body">
									<ul class="todo-list" data-widget="todo-list">
										<li>
											<!-- drag handle --> <span class="handle"> <i
												class="fas fa-ellipsis-v"></i> <i class="fas fa-ellipsis-v"></i>
										</span> <!-- checkbox -->
											<div class="icheck-primary d-inline ml-2">
												<input type="checkbox" value="" name="todo1" id="todoCheck1">
												<label for="todoCheck1"></label>
											</div> <!-- todo text --> <span class="text">Design a nice
												theme</span> <!-- Emphasis label --> <small
											class="badge badge-danger"><i class="far fa-clock"></i>
												2 mins</small> <!-- General tools such as edit or delete-->
											<div class="tools">
												<i class="fas fa-edit"></i> <i class="fas fa-trash-o"></i>
											</div>
										</li>
										<li><span class="handle"> <i
												class="fas fa-ellipsis-v"></i> <i class="fas fa-ellipsis-v"></i>
										</span>
											<div class="icheck-primary d-inline ml-2">
												<input type="checkbox" value="" name="todo2" id="todoCheck2"
													checked> <label for="todoCheck2"></label>
											</div> <span class="text">Make the theme responsive</span> <small
											class="badge badge-info"><i class="far fa-clock"></i>
												4 hours</small>
											<div class="tools">
												<i class="fas fa-edit"></i> <i class="fas fa-trash-o"></i>
											</div></li>
										<li><span class="handle"> <i
												class="fas fa-ellipsis-v"></i> <i class="fas fa-ellipsis-v"></i>
										</span>
											<div class="icheck-primary d-inline ml-2">
												<input type="checkbox" value="" name="todo3" id="todoCheck3">
												<label for="todoCheck3"></label>
											</div> <span class="text">Let theme shine like a star</span> <small
											class="badge badge-warning"><i class="far fa-clock"></i>
												1 day</small>
											<div class="tools">
												<i class="fas fa-edit"></i> <i class="fas fa-trash-o"></i>
											</div></li>
										<li><span class="handle"> <i
												class="fas fa-ellipsis-v"></i> <i class="fas fa-ellipsis-v"></i>
										</span>
											<div class="icheck-primary d-inline ml-2">
												<input type="checkbox" value="" name="todo4" id="todoCheck4">
												<label for="todoCheck4"></label>
											</div> <span class="text">Let theme shine like a star</span> <small
											class="badge badge-success"><i class="far fa-clock"></i>
												3 days</small>
											<div class="tools">
												<i class="fas fa-edit"></i> <i class="fas fa-trash-o"></i>
											</div></li>
										<li><span class="handle"> <i
												class="fas fa-ellipsis-v"></i> <i class="fas fa-ellipsis-v"></i>
										</span>
											<div class="icheck-primary d-inline ml-2">
												<input type="checkbox" value="" name="todo5" id="todoCheck5">
												<label for="todoCheck5"></label>
											</div> <span class="text">Check your messages and
												notifications</span> <small class="badge badge-primary"><i
												class="far fa-clock"></i> 1 week</small>
											<div class="tools">
												<i class="fas fa-edit"></i> <i class="fas fa-trash-o"></i>
											</div></li>
										<li><span class="handle"> <i
												class="fas fa-ellipsis-v"></i> <i class="fas fa-ellipsis-v"></i>
										</span>
											<div class="icheck-primary d-inline ml-2">
												<input type="checkbox" value="" name="todo6" id="todoCheck6">
												<label for="todoCheck6"></label>
											</div> <span class="text">Let theme shine like a star</span> <small
											class="badge badge-secondary"><i class="far fa-clock"></i>
												1 month</small>
											<div class="tools">
												<i class="fas fa-edit"></i> <i class="fas fa-trash-o"></i>
											</div></li>
									</ul>
								</div>
								<!-- /.card-body -->
								<div class="card-footer clearfix">
									<button type="button" class="btn btn-primary float-right">
										<i class="fas fa-plus"></i> Add item
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
										<button type="button" class="btn btn-tool"
											data-card-widget="collapse">
											<i class="fas fa-minus"></i>
										</button>
										<button type="button" class="btn btn-tool" title="Contacts"
											data-widget="chat-pane-toggle">
											<i class="fas fa-comments"></i>
										</button>
										<button type="button" class="btn btn-tool"
											data-card-widget="remove">
											<i class="fas fa-times"></i>
										</button>
									</div>
								</div>
								<!-- /.card-header -->
								<div class="card-body">
									<!-- Conversations are loaded here -->
									<div class="direct-chat-messages">
										<!-- Message. Default to the left -->
										<div class="direct-chat-msg">
											<div class="direct-chat-infos clearfix">
												<span class="direct-chat-name float-left">Alexander
													Pierce</span> <span class="direct-chat-timestamp float-right">23
													Jan 2:00 pm</span>
											</div>
											<!-- /.direct-chat-infos -->
											<img class="direct-chat-img"
												src="../resources/dist/img/user1-128x128.jpg"
												alt="message user image">
											<!-- /.direct-chat-img -->
											<div class="direct-chat-text">Is this template really
												for free? That's unbelievable!</div>
											<!-- /.direct-chat-text -->
										</div>
										<!-- /.direct-chat-msg -->

										<!-- Message to the right -->
										<div class="direct-chat-msg right">
											<div class="direct-chat-infos clearfix">
												<span class="direct-chat-name float-right">Sarah
													Bullock</span> <span class="direct-chat-timestamp float-left">23
													Jan 2:05 pm</span>
											</div>
											<!-- /.direct-chat-infos -->
											<img class="direct-chat-img"
												src="../resources/dist/img/user3-128x128.jpg"
												alt="message user image">
											<!-- /.direct-chat-img -->
											<div class="direct-chat-text">You better believe it!</div>
											<!-- /.direct-chat-text -->
										</div>
										<!-- /.direct-chat-msg -->

										<!-- Message. Default to the left -->
										<div class="direct-chat-msg">
											<div class="direct-chat-infos clearfix">
												<span class="direct-chat-name float-left">Alexander
													Pierce</span> <span class="direct-chat-timestamp float-right">23
													Jan 5:37 pm</span>
											</div>
											<!-- /.direct-chat-infos -->
											<img class="direct-chat-img"
												src="../resources/dist/img/user1-128x128.jpg"
												alt="message user image">
											<!-- /.direct-chat-img -->
											<div class="direct-chat-text">Working with AdminLTE on
												a great new app! Wanna join?</div>
											<!-- /.direct-chat-text -->
										</div>
										<!-- /.direct-chat-msg -->

										<!-- Message to the right -->
										<div class="direct-chat-msg right">
											<div class="direct-chat-infos clearfix">
												<span class="direct-chat-name float-right">Sarah
													Bullock</span> <span class="direct-chat-timestamp float-left">23
													Jan 6:10 pm</span>
											</div>
											<!-- /.direct-chat-infos -->
											<img class="direct-chat-img"
												src="../resources/dist/img/user3-128x128.jpg"
												alt="message user image">
											<!-- /.direct-chat-img -->
											<div class="direct-chat-text">I would love to.</div>
											<!-- /.direct-chat-text -->
										</div>
										<!-- /.direct-chat-msg -->

									</div>
									<!--/.direct-chat-messages-->

									<!-- Contacts are loaded here -->
									<div class="direct-chat-contacts">
										<ul class="contacts-list">
											<li><a href="#"> <img class="contacts-list-img"
													src="../resources/dist/img/user1-128x128.jpg"
													alt="User Avatar">

													<div class="contacts-list-info">
														<span class="contacts-list-name"> Count Dracula <small
															class="contacts-list-date float-right">2/28/2015</small>
														</span> <span class="contacts-list-msg">How have you been?
															I was...</span>
													</div> <!-- /.contacts-list-info -->
											</a></li>
											<!-- End Contact Item -->
											<li><a href="#"> <img class="contacts-list-img"
													src="../resources/dist/img/user7-128x128.jpg"
													alt="User Avatar">

													<div class="contacts-list-info">
														<span class="contacts-list-name"> Sarah Doe <small
															class="contacts-list-date float-right">2/23/2015</small>
														</span> <span class="contacts-list-msg">I will be waiting
															for...</span>
													</div> <!-- /.contacts-list-info -->
											</a></li>
											<!-- End Contact Item -->
											<li><a href="#"> <img class="contacts-list-img"
													src="../resources/dist/img/user3-128x128.jpg"
													alt="User Avatar">

													<div class="contacts-list-info">
														<span class="contacts-list-name"> Nadia Jolie <small
															class="contacts-list-date float-right">2/20/2015</small>
														</span> <span class="contacts-list-msg">I'll call you back
															at...</span>
													</div> <!-- /.contacts-list-info -->
											</a></li>
											<!-- End Contact Item -->
											<li><a href="#"> <img class="contacts-list-img"
													src="../resources/dist/img/user5-128x128.jpg"
													alt="User Avatar">

													<div class="contacts-list-info">
														<span class="contacts-list-name"> Nora S. Vans <small
															class="contacts-list-date float-right">2/10/2015</small>
														</span> <span class="contacts-list-msg">Where is your
															new...</span>
													</div> <!-- /.contacts-list-info -->
											</a></li>
											<!-- End Contact Item -->
											<li><a href="#"> <img class="contacts-list-img"
													src="../resources/dist/img/user6-128x128.jpg"
													alt="User Avatar">

													<div class="contacts-list-info">
														<span class="contacts-list-name"> John K. <small
															class="contacts-list-date float-right">1/27/2015</small>
														</span> <span class="contacts-list-msg">Can I take a look
															at...</span>
													</div> <!-- /.contacts-list-info -->
											</a></li>
											<!-- End Contact Item -->
											<li><a href="#"> <img class="contacts-list-img"
													src="../resources/dist/img/user8-128x128.jpg"
													alt="User Avatar">

													<div class="contacts-list-info">
														<span class="contacts-list-name"> Kenneth M. <small
															class="contacts-list-date float-right">1/4/2015</small>
														</span> <span class="contacts-list-msg">Never mind I
															found...</span>
													</div> <!-- /.contacts-list-info -->
											</a></li>
											<!-- End Contact Item -->
										</ul>
										<!-- /.contacts-list -->
									</div>
									<!-- /.direct-chat-pane -->
								</div>
								<!-- /.card-body -->
								<div class="card-footer">
									<form action="#" method="post">
										<div class="input-group">
											<input type="text" name="message"
												placeholder="Type Message ..." class="form-control">
											<span class="input-group-append">
												<button type="button" class="btn btn-primary">Send</button>
											</span>
										</div>
									</form>
								</div>
								<!-- /.card-footer-->
							</div>
							<!--/.direct-chat -->
							
							<!-- Calendar -->
							<div class="card bg-gradient-success">
								<div class="card-header border-0">

									<h3 class="card-title">
										<i class="far fa-calendar-alt"></i> 일정
									</h3>
									<!-- tools card -->
									<div class="card-tools">
										<!-- button with a dropdown -->
										<div class="btn-group">
											<!-- <button type="button"
												class="btn btn-success btn-sm dropdown-toggle"
												data-toggle="dropdown" data-offset="-52">
												<i class="fas fa-bars"></i>
											</button> -->
											<!-- <div class="dropdown-menu" role="menu">
												<a href="#" class="dropdown-item">일정 추가</a> <a
													href="#" class="dropdown-item">일정 지우기</a>
												<div class="dropdown-divider"></div>
												<a href="#" class="dropdown-item">달력 보기</a>
											</div> -->
										</div>
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
									<!--The calendar -->
									<div id="calendar" style="width: 100%; background-color: white">
										<table class="table table-hover text-nowrap" id="calendarTable">
					            	      <thead style="color: black">
					          	 	       	<tr>
					           		         	<th>일정 이름</th>
					           		            <th>일정 시간</th>
					        	            </tr>									
					    	              </thead>
					    	              <tbody style="color: black">
					    	              <tr>
					    	             	<!-- 일정 불러오는 부분 -->
						                  </tr>
										  </tbody>
					                	</table>
									</div>
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
</body>
</html>
<script>
let calendarTable = $("#calendar #calendarTable");

$(function() {
	// 로그인한 사원의 일정 캘린더에 보여주기
	console.log("${login.eno}");
	$.getJSON({
			url:"/calendar/rest_list/" + ${login.eno},
			type:"get",
			success:function(data) {
				console.log(data);
				
				
				$.each(data, function(idx, element) {
					console.log(element.title);
					console.log(element.startDate);
					console.log(element.endDate);
					console.log(element.cno);
					
					var str = "<tr>";
					
					var title = element.title;
					var time = element.startDate + " " + element.cal_startTime + " ~ " + element.endDate + " " + element.cal_endTime;
					
					str += "<td>" + title + "</td>";
					str += "<td>" + time + "</td>";
					str += "</tr>";
					
					calendarTable.append(str);
				})
			}
		});
})
</script>
<%@include file="../includes/footer.jsp" %>