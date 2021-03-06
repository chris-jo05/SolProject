<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp" %>
  
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>일정 관리</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="/main/home">Home</a></li>
              <li class="breadcrumb-item active">일정 관리</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
        
        <!-- <div class="col-md-3">
            <div class="sticky-top mb-3">
              <div class="card">
                <div class="card-header">
                  <h4 class="card-title">Draggable Events</h4>
                </div>
                <div class="card-body">
                  the events
                  <div id="external-events">
                    <div class="external-event bg-success">점심 약속</div>
                    <div class="external-event bg-warning">연차</div>
                    <div class="external-event bg-info">프로젝트</div>
                    <div class="external-event bg-primary">결과 발표</div>
                    <div class="external-event bg-danger">월 급</div>
                    <div class="checkbox">
                      <label for="drop-remove">
                        <input type="checkbox" id="drop-remove">
                        remove after drop
                      </label>
                    </div>
                  </div>
                </div>
                /.card-body
              </div>
              /.card
              <div class="card">
                <div class="card-header">
                  <h3 class="card-title">Create Event</h3>
                </div>
                <div class="card-body">
                  <div class="btn-group" style="width: 100%; margin-bottom: 10px;">
                    <ul class="fc-color-picker" id="color-chooser">
                      <li><a class="text-primary" href="#"><i class="fas fa-square"></i></a></li>
                      <li><a class="text-warning" href="#"><i class="fas fa-square"></i></a></li>
                      <li><a class="text-success" href="#"><i class="fas fa-square"></i></a></li>
                      <li><a class="text-danger" href="#"><i class="fas fa-square"></i></a></li>
                      <li><a class="text-muted" href="#"><i class="fas fa-square"></i></a></li>
                    </ul>
                  </div>
                  /btn-group
                  <div class="input-group">
                    <input id="new-event" type="text" class="form-control" placeholder="Event Title">

                    <div class="input-group-append">
                      <button id="add-new-event" type="button" class="btn btn-primary">Add</button>
                    </div>
                    /btn-group
                  </div>
                  /input-group
                </div>
              </div>
            </div>
          </div>
          /.col -->
        
          <div class="col-md-12">
            <div class="card card-primary ">
              <div class="card-body" >
                <!-- THE CALENDAR -->
                <div id="calendar"></div>
                <button id="submit" type="button" class="btn btn-primary float-right" style="margin-top: 10px">일정 작성</button>
              </div>
              <!-- /.card-body -->
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
 
 <!-- 일정 작성 폼 -->
<div class="modal" tabindex="-1">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">일정 작성</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
        <div class="modal-body">
        	<div class="form-group">
        		<label for="">일정 이름</label>
        		<input type="text" name="title" class="form-control" value=""/>
        	</div>
        	<div class="form-group">
        		<label for="">일정 내용</label>
        		<input type="text" name="content" class="form-control" value=""/>
        	</div>
        	<div class="form-group">
        		<label for="">일정 그룹 이름</label>
        		<input type="text" name="groupId" class="form-control" value=""/>
        	</div>
        	 <div class="form-group">
                  <label>일정 시작</label>
                    <div class="input-group date" id="reservationdatetime" data-target-input="nearest">
                        <input type="text" name="start" class="form-control datetimepicker-input" data-target="#reservationdatetime"/>
                        <div class="input-group-append" data-target="#reservationdatetime" data-toggle="datetimepicker">
                            <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                        </div>
                    </div>
            </div>
            <div class="form-group">
                  <label>일정 종료</label>
                    <div class="input-group date" id="reservationdatetime2" data-target-input="nearest">
                        <input type="text" name="end" class="form-control datetimepicker-input" data-target="#reservationdatetime2"/>
                        <div class="input-group-append" data-target="#reservationdatetime2" data-toggle="datetimepicker">
                            <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                        </div>
                    </div>
            </div>
        
        	<div class="form-group">
        		<label for="">일정 담당자</label>
        		<div id="selectRep" style="">
        			<div class="col-lg-5" style="float: left;margin-bottom: 10px; margin-left: 6px">
	        			<select name="dept" id="dept" class="form-control" >
		                	<option value="empty">----------</option>
		             	</select>
	        		</div>
	        		<div class="col-lg-5" style="float: left; margin-right: 6px">
	        			<select name="emp" id="emp" class="form-control" >
		                	
		             	</select>
	        		</div>
	        		<button name="rep-btn" type="button" class="btn btn-primary" style="float: left">확인</button>
        		</div>
        		 <input type="textarea" name="rep" class="form-control" value=""/>
        	</div>
        	<div class="form-group">
        		<label for="">일정 권한자</label>
        		<div class="" style="">
        			<div class="col-lg-6" style="float: left;margin-bottom: 10px;">
	        			<select name="dept_auth" id="dept_auth" class="form-control" >
		                	<option value="empty">----------</option>
		             	</select>
	        		</div>
	        		<div class="col-lg-6" style="float: left; margin-bottom: 10px;">
	        			<select name="emp_auth" id="emp_auth" class="form-control" >
		                	
		             	</select>
	        		</div>
        		</div>
        	</div>
        	<div class="form-group">
        		<label for="">비고</label>
        		<input type="text" name="memo" class="form-control" value=""/>
        	</div>
        	<div class="form-group">
				<div class="btn-group" style="width: 100%;">
					<label for="" style="padding-top: 7.5px">일정 색상</label>
				    <ul class="fc-color-picker" id="color-chooser" style="padding-left: 10px;">
				      <li><button class="btn btn-success btn-lg"></button></li>
				      <li><button class="btn btn-warning btn-lg"></button></li>
				      <li><button class="btn btn-danger btn-lg"></button></li>
				      <li><button class="btn btn-secondary btn-lg"></button></li>
				      <li><button class="btn btn-info btn-lg"></button></li>
				      <li><button class="btn btn-dark btn-lg"></button></li>
				      <li><button class="btn btn-primary active btn-lg"></button></li>
				    </ul>
				    <div class="input-group-append" style="float: right; padding-left: 10px">
                      <button id="add-new-event" type="button" class="btn btn-primary">Color</button>
                	</div>
				</div>
        	</div>
        </div>
      <div class="modal-footer">
      	 <button type="button" class="btn btn-success" id="modalRegisterBtn">등록</button>
      	 <button type="button" class="btn btn-success" id="modalModifyBtn">확인</button>
      	 <button type="button" class="btn btn-warning" id="modalModifyEnterBtn">수정</button>
      	 <button type="button" class="btn btn-danger" id="modalRemoveBtn">삭제</button>
         <button type="button" class="btn btn-primary" id='modalCloseBtn' data-dismiss="modal">종료</button>
      </div>
      <!-- 클릭된 일정의 cno 저장하는 곳 -->
	  <input type="hidden" name="selectedCno" value=""/>
	  
	  <!-- 클릭된 일정의 cno 저장하는 곳 -->
	  <input type="hidden" name="selectedGroup" value=""/>
	  
	  <!-- 변경 전 그룹 이름을 저장하는 곳 -->
	  <input type="hidden" name="beforeModified" value=""/>
	  
	  <!-- 일정 색깔 저장하는 곳 -->
	  <button type="button" name="color" style=""></button>
    </div>
  </div>
</div> 


<!-- Bootstrap -->
<script src="/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- jQuery UI -->
<script src="/resources/plugins/jquery-ui/jquery-ui.min.js"></script>

 <!-- fullCalendar 2.2.5 -->
<script src="/resources/plugins/moment/moment.min.js"></script>
<script src="/resources/plugins/fullcalendar/main.js"></script>

 <script>
  let modal = $(".modal");
 
  //모달 영역 값 가져오기
  var modalTitle = modal.find("input[name='title']");
  var modalContent = modal.find("input[name='content']");
  var modalGroupId = modal.find("input[name='groupId']");
  var modalStart = modal.find("input[name='start']");
  var modalEnd = modal.find("input[name='end']");	
  var modalRep = modal.find("input[name='rep']");
  var modalMemo = modal.find("input[name='memo']");
  var modalDeptAuth = modal.find("select[name=dept_auth]");
  var modalEmpAuth = modal.find("select[name=emp_auth]");
  
  //모달 영역 안에 있는 버튼 가져오기
  var modalModifyBtn = $("#modalModifyBtn");
  var modalModifyEnterBtn = $("#modalModifyEnterBtn");
  var modalRegisterBtn = $("#modalRegisterBtn");
  var modalRemoveBtn = $("#modalRemoveBtn");
  
  // 모달 영역 안에 있는 선택된 일정 cno 가져오기
  var modalSelectedCno = modal.find("input[name='selectedCno']");
  
  //모달 영역 안에 있는 선택된 일정 그룹 이름 가져오기
  var modalSelectedGroup = modal.find("input[name='selectedGroup']");
  
  //모달 영역 안에 있는 일정 담당자 선택부분 가져오기
  var modalSelectRep = modal.find("#selectRep");
  
  $(function () {

    /* initialize the external events
     -----------------------------------------------------------------*/
    function ini_events(ele) {
      ele.each(function () {

        // create an Event Object (https://fullcalendar.io/docs/event-object)
        // it doesn't need to have a start or end
       /*  var eventObject = {
          title: $.trim($(this).text()) // use the element's text as the event title
        }

        // store the Event Object in the DOM element so we can get to it later
        $(this).data('eventObject', eventObject)

        // make the event draggable using jQuery UI
        $(this).draggable({
          zIndex        : 1070,
          revert        : true, // will cause the event to go back to its
          revertDuration: 0  //  original position after the drag
        }) */

      })
    }

    ini_events($('#external-events div.external-event'))

    /* initialize the calendar
     -----------------------------------------------------------------*/
    //Date for the calendar events (dummy data)
    var date = new Date()
    var d    = date.getDate(),
        m    = date.getMonth(),
        y    = date.getFullYear()

    var Calendar = FullCalendar.Calendar;
  
    var calendarEl = document.getElementById('calendar');

    

    var calendar = new Calendar(calendarEl, {
      headerToolbar: {
        left  : 'prevYear,prev,next,nextYear today',
        center: 'title',
        right : 'dayGridMonth,timeGridWeek,timeGridDay'
      },
      themeSystem: 'bootstrap',
      
      events: [
       
      ],
      
      editable  : false,
      droppable : false, // this allows things to be dropped onto the calendar !!!
      drop      : function(info) {
        // is the "remove after drop" checkbox checked?
        /* if (checkbox.checked) {
          // if so, remove the element from the "Draggable Events" list
          info.draggedEl.parentNode.removeChild(info.draggedEl);
        } */
      },
      eventClick: function(event,jsEvent,view,cellDate){
    	  console.log(event.event._def);
    	  
    	  var cno = event.event._def.publicId;
    	  var groupId = event.event._def.groupId;
    	  
    	  modalSelectedCno.val(cno);
    	  modalSelectedGroup.val(groupId);
    	  console.log(modalSelectedGroup.val());
    	  
    	  modalTitle.attr("readonly",true);
    	  modalContent.attr("readonly",true);
    	  modalGroupId.attr("readonly",true);
    	  modalStart.attr("readonly",true);
    	  modalEnd.attr("readonly",true);
    	  modalRep.attr("readonly",true);
    	  modalMemo.attr("readonly",true);
    	  
    	  getOne(cno);
	  }
      
    }); // var calender end

    calendar.render();
    
    
	// 로그인한 사원의 일정 캘린더에 보여주기
	$.getJSON({
			url:"/calendar/rest_list/" + ${login.eno},
			type:"get",
			success:function(data) {
				console.log(data[0]);
				
				$.each(data, function(idx, element) {
					console.log(element.title);
					console.log(element.startDate);
					console.log(element.endDate);
					console.log(element.cal_color);
					
					view(element);
				})
			}
	});
    
    // 일정 담당, 권한 부분의 dept 옵션 넣어주기
    $.getJSON({
    	url:"/calendar/rest_dept",
    	type:"POST",
    	success:function(data) {
    		var options = "";
    		
    		$.each(data, function(idx, element) {
    			console.log(idx);
				options += "<option value=" + element + ">" + element + "</option>";
			})
			
			$("select[name='dept']").append(options);
		    
			$("select[name='dept_auth']").append(options);
    	}
    })
	
    // 일정 작성 버튼 클릭
    $("#submit").click(function () {
    	//input안에 들어있는 value 제거
    	modal.find("input").val("");
    	
    	modalTitle.attr("readonly",false);
    	modalContent.attr("readonly",false);
    	modalGroupId.attr("readonly",false);
    	modalStart.attr("readonly",false);
    	modalEnd.attr("readonly",false);
    	modalRep.attr("readonly",false);
        modalMemo.attr("readonly",false);
        
    	modalModifyBtn.hide();
		modalRemoveBtn.hide();
		modalModifyEnterBtn.hide();
		modalRegisterBtn.show();
    	
		modalSelectRep.show();
		
    	modal.modal("show");
	})
	
	// 일정 등록 버튼
	$("#modalRegisterBtn").click(function () {
		
		console.log(modalTitle.val() == "");
		if(modalTitle.val() == "" || modalContent.val() == "" || modalGroupId.val() == "" || modalStart.val() == "" || modalEnd.val() == "" || modalRep.val() == "") {
			if(modalTitle.val() == "") {
				alert("일정 이름을 입력해주세요.");
				modalTitle.focus();
			} else if(modalContent.val() == "") {
				alert("일정 내용을 입력해주세요.");
				modalContent.focus();
			} else if(modalGroupId.val() == "") {
				alert("일정 그룹 이름을 입력해주세요.");
				modalContent.focus();
			} else if(modalStart.val() == "") {
				alert("일정 시작란을 입력해주세요.");
				modalStart.focus();
			} else if(modalEnd.val() == "") {
				alert("일정 종료란을 입력해주세요.");
				modalEnd.focus();
			} else if(modalRep.val() == "") {
				alert("일정 담당자를 입력해주세요.");
				modalRep.focus();
			}
			
			return;
		} 
		
		if(time_check()) {
			alert("종료일이 시작일 보다 이전입니다.");
			modalStart.focus();
			
			return;
		}
		
		var flag = true;
		
		$.ajax({
			url:"/calendar/rest_group",
			type:"GET",
			async:false,
			success:function(data) {
				$.each(data, function(idx, element) {
					if(modalGroupId.val() == element) {
						flag = false;
					}
				})
			}
		})
		
		if(!flag) {
			alert("그룹 이름이 중복됩니다.")
			modalGroupId.focus();
			
			return;
		}
		
		insert();
	})
	
	// 일정 삭제 버튼
	$("#modalRemoveBtn").click(function(){
		if(modalEmpAuth.val() !== "${login.ename}") {
			alert("권한자가 아닙니다.");
		} else {
			var groupId = modalSelectedGroup.val();
			console.log('remove clicked ' + groupId);
			
			removeGroup(groupId);
		}
	})
	
	// 일정 수정 버튼
	$("#modalModifyEnterBtn").click(function() {
		if (modalEmpAuth.val() !== "${login.ename}") {
			alert("권한자가 아닙니다.");
		} else {
			modalSelectRep.show();
			modalModifyEnterBtn.hide();
			modalModifyBtn.show();
			
			modal.find("input[name='beforeModified']").val(modalGroupId.val());
			modalTitle.attr("readonly",false);
	    	modalContent.attr("readonly",false);
	    	modalGroupId.attr("readonly",false);
	    	modalStart.attr("readonly",false);
	    	modalEnd.attr("readonly",false);
	    	modalRep.attr("readonly",false);
	        modalMemo.attr("readonly",false);
		}
	})
	
	// 일정 수정 확인 버튼
	$("#modalModifyBtn").click(function() {
		var groupId = modalSelectedGroup.val();
		
		console.log('remove clicked ' + groupId);
		
		console.log(modalTitle.val() == "");
		if(modalTitle.val() == "" || modalContent.val() == "" || modalGroupId.val() == "" || modalStart.val() == "" || modalEnd.val() == "" || modalRep.val() == "") {
			if(modalTitle.val() == "") {
				alert("일정 이름을 입력해주세요.");
				modalTitle.focus();
			} else if(modalContent.val() == "") {
				alert("일정 내용을 입력해주세요.");
				modalContent.focus();
			} else if(modalGroupId.val() == "") {
				alert("일정 그룹 이름을 입력해주세요.");
				modalContent.focus();
			} else if(modalStart.val() == "") {
				alert("일정 시작란을 입력해주세요.");
				modalStart.focus();
			} else if(modalEnd.val() == "") {
				alert("일정 종료란을 입력해주세요.");
				modalEnd.focus();
			} else if(modalRep.val() == "") {
				alert("일정 담당자를 입력해주세요.");
				modalRep.focus();
			}
			
			return;
		} 
		
		if(time_check()) {
			alert("종료일이 시작일 보다 이전입니다.");
			modalStart.focus();
			
			return;
		}
		
		var flag = true;
		console.log("변경 전 그룹 이름 : " + modal.find("input[name='beforeModified']").val());
		$.ajax({
			url:"/calendar/rest_group",
			type:"GET",
			async:false,
			success:function(data) {
				$.each(data, function(idx, element) {
					if(modalGroupId.val() == element && modalGroupId.val() != modal.find("input[name='beforeModified']").val()) {
						flag = false;
					}
				})
			}
		})
		
		if(!flag) {
			alert("그룹 이름이 중복됩니다.")
			modalGroupId.focus();
			
			return;
		}
		
		removeGroup(groupId);
		insert();
	})
	
	// 일정 담당자 선택 부분
	// 일정 담당 부분의 부서 셀렉트 변경 시
	$("select[name='dept']").change(function() {
		$("select[name='emp'] option").remove();
		
		var dname = $("select[name='dept']").val();
		
		getEmps(dname, function(data) {
			var options = "<option value='모두'>모두</option>";
			
			$.each(data, function(idx, element) {
				options += "<option value=" + element + ">" + element + "</option>";
			})
			
			$("select[name='emp']").append(options);
		})
		
    });
    
    // 일정 권한 부분의 부서 셀렉트 변경 시
	$("select[name='dept_auth']").change(function() {
		$("select[name='emp_auth'] option").remove();
		
		var dname = $("select[name='dept_auth']").val();
		
		getEmps(dname, function(data) {
			var options = "";
			
			$.each(data, function(idx, element) {
				options += "<option value=" + element + ">" + element + "</option>";
			})
			
			$("select[name='emp_auth']").append(options);
		})
    });
    
	// 일정 담당 확인 버튼 클릭 시
	$("button[name='rep-btn']").click(function() {
		var ename = $("select[name='emp']").val();
		var dname = $("select[name='dept']").val();
		
		if(ename != "모두") {
			modalRep.val(modalRep.val() + " " + ename + "(" + dname + ")");
		} else {
			modalRep.val(modalRep.val() + " " + "모두" + "(" + dname + ")");
		}
		
    });
    
	// 일정 전체 뿌려주기
	function view(element){
		
		console.log("ddd");
		
		
		var s_date = new Date(element.startDate);
		var s_year = s_date.getFullYear();
		var s_month = s_date.getMonth();
	    var s_day= s_date.getDate();

	    var e_date = new Date(element.endDate);
		var e_year = e_date.getFullYear();
		var e_month = e_date.getMonth();
	    var e_day= e_date.getDate();
	    
	    var s_time = element.cal_startTime.split(":");
	    var s_hour = s_time[0] * 1;
	    var s_minute = s_time[1] * 1;
	    
	    var e_time = element.cal_endTime.split(":");
	    var e_hour = e_time[0] * 1;
	    var e_minute = e_time[1] * 1;
	    
	 	calendar.addEvent({
	 		id : element.cno,
	 		groupId : element.groupId,
			title : String(element.title), // 이벤트 제목
			start : new Date(s_year,s_month,s_day, s_hour, s_minute), //달력 날짜에 매핑
			end : new Date(e_year,e_month,e_day, e_hour, e_minute),
			backgroundColor: element.cal_color,
	        borderColor    : element.cal_color
		}); 
	}
	
    // 일정 하나 정보 얻기
	function getOne(cno) {
		$.getJSON({
  		  url:"/calendar/rest_get/" + cno,
  		  type:"post",
  		  success:function(data) {
			console.log(data);
			
			getRepName(data.groupId, function(data) {
				
				var repNames = data.substring(0, data.lastIndexOf(','));
				modalRep.val(repNames);
			});
			
			modalTitle.val(data.title);
			modalContent.val(data.content);
			modalGroupId.val(data.groupId);
			
			//권한자 보여주기
			var ename = data.author.substring(0,data.author.lastIndexOf('('));
			var dname = data.author.substring(data.author.lastIndexOf('(') + 1,data.author.lastIndexOf(')'));
			modalDeptAuth.val(dname).trigger('change');
			modalEmpAuth.val(ename).trigger("change");
			
			modalStart.val(data.startDate + " " + data.cal_startTime);
			modalEnd.val(data.endDate + " " + data.cal_endTime);
			
			modalMemo.val(data.memo);
			
			// 수정, 삭제 버튼만 보이기
			modalSelectRep.hide();
    	  
    	  	modalModifyBtn.hide();
    	  	modalModifyEnterBtn.show();
    	  	modalRegisterBtn.hide();
    	  	modalRemoveBtn.show();
			
			modal.modal("show");
		  }
  	  })
    } 
    
	 // 일정 담당자 이름, 부서명 가져오기
    function getRepName(groupId, callback) {
    	var repNames = "";
    	console.log(groupId);
    	$.ajax({
    		url:"/calendar/rest_group/" + String(groupId),
    		type:"POST",
    		success:function(data) {
    			console.log(data);
    			console.log("enter getRepName");
    			
    			
    			$.each(data, function(idx, element) {
    				repNames += element.ename + "("+ element.dname + "), ";
    			})
    			
    			if(callback) {
    				callback(repNames);
    			}
    		}
    	})
    }
	 
	function insert() {
    	// 담당자를 받아서 eno, bno 가져오기
		var reps = modalRep.val().trim();
		var repSplit = reps.split(" ");
		console.log(repSplit.length);
		
    	for(var i = 0; i < repSplit.length; i++) {
			var rep = repSplit[i];
			var ename = rep.substring(0,rep.lastIndexOf('('));
			var dname = rep.substring(rep.lastIndexOf('(') + 1,rep.lastIndexOf(')'));
			console.log(rep.substring(0,rep.lastIndexOf('(')));
			console.log(rep.substring(rep.lastIndexOf('(') + 1,rep.lastIndexOf(')')));
			
			if(ename === "모두") {
				insert_all(dname);
			} else {
				getRepNo(ename, dname, function(data) {
			    	insert_add(data);
				});
			}
		}
	    
		
		modal.modal("hide");
    }
  	
	// 모두가 선택됐을 때 삽입
  	function insert_all(dname) {
		getEmps(dname, function(data) {
			$.each(data, function(idx, element) {
				getRepNo(element, dname, function(data) {
			    	insert_add(data);
				});
			})
		})
  		
  	}
  	
  	// 삽입 구현부
  	function insert_add(data) {
  	// 날짜 쪼개서 Date 객체 만들기
  		var startSpl = modalStart.val().split(" ");
  		var endSpl = modalEnd.val().split(" ");
  		
		var mStart = startSpl[0];
		var mStartTime = startSpl[1];
		var mEnd = endSpl[0];
		var mEndTime = endSpl[1];
		
		var s_date = new Date(mStart);
		var s_year = s_date.getFullYear();
		var s_month = s_date.getMonth();
	    var s_day= s_date.getDate();

	    var e_date = new Date(mEnd);
		var e_year = e_date.getFullYear();
		var e_month = e_date.getMonth();
	    var e_day= e_date.getDate();
	    
	    var s_time = mStartTime.split(":");
	    var s_hour = s_time[0] * 1;
	    var s_minute = s_time[1] * 1;
	    
	    var e_time = mEndTime.split(":");
	    var e_hour = e_time[0] * 1;
	    var e_minute = e_time[1] * 1;
	    
	    var sDate = new Date(s_year,s_month,s_day, s_hour, s_minute);
	    var eDate = new Date(e_year,e_month,e_day, e_hour, e_minute);
	    
	    var author = modalEmpAuth.val() + "(" + modalDeptAuth.val() + ")";
	    
		var cal = {
			eno:data.eno,
			dno:data.dno,
			title:modalTitle.val(),
			content:modalContent.val(),
			groupId:modalGroupId.val(),
			author:author,
			startDate:mStart,
			endDate:mEnd,
			cal_startTime:mStartTime,
			cal_endTime:mEndTime,
			rep:modalRep.val(),
			memo:modalMemo.val(),
			cal_color:String($("button[name='color']").css('color'))
		};
		
		$.ajax({
			url:'/calendar/rest_new/',
			type:'post',
			contentType:'application/json',
			data:JSON.stringify(cal),
			async:false,
			success:function(result) {
				console.log("ajax result 값 : "+result);
				console.log("groupId 값 : "+ modalGroupId.val());
				console.log(${login.eno});
				if(${login.eno} == data.eno) {
					calendar.addEvent({
						id : result,
						groupId : modalGroupId.val(),
						title : String(modalTitle.val()), // 이벤트 제목
						start : sDate, //달력 날짜에 매핑
						end : eDate,
						backgroundColor: String($("button[name='color']").css('color')),
				        borderColor    : String($("button[name='color']").css('color'))
					});
				}
			}
		})
  	}
	
	// 일정 담당자 이름, 부서명으로 사원번호, 부서번호 가져오기
    function getRepNo(ename, dname, callback) {
		console.log("ename : " + ename + ", dname : " + dname);
    	$.ajax({
    		url:"/calendar/rest_no/" + String(ename) + "/" + String(dname),
    		type:"POST",
    		async:false,
    		success:function(data) {
    			
    			if(callback) {
    				callback(data);
    			}
    		}
    	})
    }
	
	function removeGroup(groupId) {
		$.ajax({
    		url:"/calendar/rest_delete/" + groupId,
    		type:"DELETE",
    		async:false,
    		success:function(data) {
    			console.log("success");
    			
    			modal.modal("hide");
    			
    			var events = calendar.getEvents();
    			console.log(events);
    			
    			
    			for(var i = 0; i < events.length; i++) {
    				if(events[i]._def.groupId === groupId) {
    					events[i].remove();
    				}
    			}
    			//calendar.getEventById(cno).remove();
    		}
    	})
	}
	
	// 부서명으로 해당 부서 사원들 이름 가져오기
	function getEmps(dname, callback) {
		$.getJSON({
	    	url:"/calendar/rest_emp/" + String(dname),
	    	type:"POST",
	    	async:false,
	    	success:function(data) {
	    		if(callback) {
	    			callback(data);
	    		}
	    	}
	    })
	}
	
	function time_check() {
		var startSpl = modalStart.val().split(" ");
  		var endSpl = modalEnd.val().split(" ");
  		
		var mStart = startSpl[0];
		var mStartTime = startSpl[1];
		var mEnd = endSpl[0];
		var mEndTime = endSpl[1];
		
		var s_date = new Date(mStart);
		var s_year = s_date.getFullYear();
		var s_month = s_date.getMonth();
	    var s_day= s_date.getDate();

	    var e_date = new Date(mEnd);
		var e_year = e_date.getFullYear();
		var e_month = e_date.getMonth();
	    var e_day= e_date.getDate();
	    
	    var s_time = mStartTime.split(":");
	    var s_hour = s_time[0] * 1;
	    var s_minute = s_time[1] * 1;
	    
	    var e_time = mEndTime.split(":");
	    var e_hour = e_time[0] * 1;
	    var e_minute = e_time[1] * 1;
	    
	    var sDate = new Date(s_year,s_month,s_day, s_hour, s_minute);
	    var eDate = new Date(e_year,e_month,e_day, e_hour, e_minute);
	    
	    if(sDate >= eDate) {
	    	return true;
	    } else {
	    	return false;
	    }
	}
	
    //Date and time picker
    $('#reservationdatetime').datetimepicker({
    	format: 'yyyy-MM-DD HH:mm',
    	icons: { time: 'far fa-clock' },
    	ignoreReadonly: true
    });
    
    $('#reservationdatetime2').datetimepicker({
    	format: 'yyyy-MM-DD HH:mm',
    	icons: { time: 'far fa-clock' },
    	ignoreReadonly: true
    });
	
    $("button[name='color']").hide();
    
    // 일정 색깔
    $('#color-chooser > li > button').click(function (e) {
        e.preventDefault()
        // Save color
        console.log($(this).css('color'));
        $("#add-new-event").css('background-color',$(this).css('background-color'));
        $("#add-new-event").css('border-color',$(this).css('background-color'));
        $("button[name='color']").css('color',$(this).css('background-color'));
    });
    
   
     
  })
  
 
</script>
<%@include file="../includes/footer.jsp" %>