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
                <button id="submit" type="button" class="btn btn-primary" >일정 작성</button>
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
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
        <h5 class="modal-title">일정 작성</h5>
      </div>
      <div class="modal-body">
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
        		<label for="">일정 시작일</label>
        		<input type="text" name="start" class="form-control" value=""/>
        	</div>
        	<div class="form-group">
        		<label for="">일정 시작시간</label>
        		<input type="text" name="startTime" class="form-control" value=""/>
        	</div>
        	<div class="form-group">
        		<label for="">일정 종료일</label>
        		<input type="text" name="end" class="form-control" value=""/>
        	</div>
        	<div class="form-group">
        		<label for="">일정 종료시간</label>
        		<input type="text" name="endTime" class="form-control" value=""/>
        	</div>
        	<div class="form-group">
        		<label for="">일정 담당자</label>
        		<input type="text" name="rep" class="form-control" value=""/>
        	</div>
        </div>
      </div>
      <div class="modal-footer">
      	 <button type="button" class="btn btn-success" id="modalRegisterBtn">등록</button>
      	 <!-- <button type="button" class="btn btn-warning" id="modalModifyBtn">수정</button>
      	 <button type="button" class="btn btn-danger" id="modalRemoveBtn">삭제</button> -->
        <button type="button" class="btn btn-primary" data-dismiss="modal">종료</button>
      </div>
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
   /*  var Draggable = FullCalendar.Draggable; */

    /* var containerEl = document.getElementById('external-events');
    var checkbox = document.getElementById('drop-remove'); */
    var calendarEl = document.getElementById('calendar');

    // initialize the external events
    // -----------------------------------------------------------------

    /* new Draggable(containerEl, {
      itemSelector: '.external-event',
      eventData: function(eventEl) {
        return {
          title: eventEl.innerText,
          backgroundColor: window.getComputedStyle( eventEl ,null).getPropertyValue('background-color'),
          borderColor: window.getComputedStyle( eventEl ,null).getPropertyValue('background-color'),
          textColor: window.getComputedStyle( eventEl ,null).getPropertyValue('color'),
        };
      }
    }); */

    var calendar = new Calendar(calendarEl, {
      headerToolbar: {
        left  : 'prevYear,prev,next,nextYear today',
        center: 'title',
        right : 'dayGridMonth,timeGridWeek,timeGridDay'
      },
      themeSystem: 'bootstrap',
      //Random default events
      events: [
        /* {
          title          : 'All Day Event',
          start          : new Date(y, m, 1),
          backgroundColor: '#f56954', //red
          borderColor    : '#f56954', //red
          allDay         : true
        },
        {
          title          : 'Long Event',
          start          : new Date(y, m, d - 5),
          end            : new Date(y, m, d - 2),
          backgroundColor: '#f39c12', //yellow
          borderColor    : '#f39c12' //yellow
        },
        {
          title          : 'Meeting',
          start          : new Date(y, m, d, 10, 30),
          allDay         : false,
          backgroundColor: '#0073b7', //Blue
          borderColor    : '#0073b7' //Blue
        },
        {
          title          : 'Lunch',
          start          : new Date(y, m, d, 12, 0),
          end            : new Date(y, m, d, 14, 0),
          allDay         : false,
          backgroundColor: '#00c0ef', //Info (aqua)
          borderColor    : '#00c0ef' //Info (aqua)
        },
        
        {
          title          : 'Click for Google',
          start          : new Date(y, m, 28),
          end            : new Date(y, m, 29),
          url            : 'https://www.google.com/',
          backgroundColor: '#3c8dbc', //Primary (light-blue)
          borderColor    : '#3c8dbc' //Primary (light-blue)
        },
        {
            title          : 'Click for Google',
            start          : new Date(y, m, 26),
            end            : new Date(y, m, 27),
            url            : 'https://www.google.com/',
            backgroundColor: '#3c8dbc', //Primary (light-blue)
            borderColor    : '#3c8dbc' //Primary (light-blue)
          } */
    	  /* {
              title          : 'Birthday Party',
              start          : new Date(y, m, d + 1, 8, 0),
              end            : new Date(y, m, d + 1, 22, 30),
              allDay         : false,
              backgroundColor: '#00a65a', //Success (green)
              borderColor    : '#00a65a', //Success (green)
              
            } */
      ],
      
      editable  : true,
      droppable : true, // this allows things to be dropped onto the calendar !!!
      drop      : function(info) {
        // is the "remove after drop" checkbox checked?
        /* if (checkbox.checked) {
          // if so, remove the element from the "Draggable Events" list
          info.draggedEl.parentNode.removeChild(info.draggedEl);
        } */
      },
      eventClick: function(event,jsEvent,view,cellDate){
		    modal.modal("show");
	  }
      
    }); // var calender end

    calendar.render();
    // $('#calendar').fullCalendar()

    /* ADDING EVENTS */
   /*  var currColor = '#3c8dbc' //Red by default
    // Color chooser button
    $('#color-chooser > li > a').click(function (e) {
      e.preventDefault()
      // Save color
      currColor = $(this).css('color')
      // Add color effect to button
      $('#add-new-event').css({
        'background-color': currColor,
        'border-color'    : currColor
      })
    })
    $('#add-new-event').click(function (e) {
      e.preventDefault()
      // Get value and make sure it is not null
      var val = $('#new-event').val()
      if (val.length == 0) {
        return
      }

      // Create events
      var event = $('<div />')
      event.css({
        'background-color': currColor,
        'border-color'    : currColor,
        'color'           : '#fff'
      }).addClass('external-event')
      event.text(val)
      $('#external-events').prepend(event)

      // Add draggable funtionality
      ini_events(event)

      // Remove event from text input
      $('#new-event').val('')
    }) */
    
    // 모달 영역 값 가져오기
	var modalTitle = modal.find("input[name='title']");
	var modalContent = modal.find("input[name='content']");
	var modalStart = modal.find("input[name='start']");
	var modalStartTime = modal.find("input[name='startTime']");
	var modalEnd = modal.find("input[name='end']");
	var modalEndTime = modal.find("input[name='endTime']");
	var modalRep = modal.find("input[name='rep']");
	
	$.getJSON({
			url:"/calendar/rest_list",
			success:function(data) {
				console.log(data[0]);
				
				$.each(data, function(idx, element) {
					console.log(element.title);
					console.log(element.startDate);
					console.log(typeof(element.endDate));
					
					view(element);
				})
			}
		});
	
	function view(element){
		
		console.log("ddd");
		
		/* calendar.addEvent({
			 title : String(element.memo), // 이벤트 제목
			start : String(element.startDate), //달력 날짜에 매핑
			end : String(element.endDate) 			
		}); */
		
		/* var startDate = String(element.startDate);
		var endDate = (element.endDate);
		 */
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
			title : element.title, // 이벤트 제목
			start : new Date(s_year,s_month,s_day, s_hour, s_minute), //달력 날짜에 매핑
			end : new Date(e_year,e_month,e_day, e_hour, e_minute)
		}); 
	}
	
	
	
	
    $("#submit").click(function () {
    	//input안에 들어있는 value 제거
    	modal.find("input").val("");
    	
    	modal.modal("show");
	})
	
	$("#modalRegisterBtn").click(function () {
		
		// end에 하루를 더 하기위한 작업
		var end = modalEnd.val();
		var endspl = end.split("-");
		var day_int = (endspl[2] * 1) + 1;
		var endPlusOne = [endspl[0],'-',endspl[1],'-',(day_int > 9 ? '':'0') + day_int].join('');
		//console.log(endPlusOne);
		
		calendar.addEvent({
			title : modalTitle.val(), // 이벤트 제목
			start : modalStart.val(), //달력 날짜에 매핑
			end : endPlusOne
		});
		
		modal.modal("hide");
	})
	
  })
  
 
</script>
<%@include file="../includes/footer.jsp" %>