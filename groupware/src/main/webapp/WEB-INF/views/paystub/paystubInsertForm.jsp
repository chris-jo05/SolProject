<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="../includes/header.jsp" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>



  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">	
          <div class="col-sm-6">
            <h1>급여명세서 작성</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="/main/home">Home</a></li>
              <li class="breadcrumb-item active">급여명세서 발급</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-12">
            <div class="card">
              <div class="card-header">
              	<label for="" style="float: left">급여자</label>
                <div class="col-lg-2" style="float: left;margin-bottom: 10px; margin-left: 6px">
	        			<select name="dept" id="dept" class="form-control" >
		                	<option value="empty">----------</option>
		             	</select>
	        	</div>
	        	<div class="col-lg-2" style="float: left; margin-right: 6px">
        			<select name="emp" id="emp" class="form-control" >
	                	
	             	</select>
	        	</div>
                
                <label for="" style="float: left">지급년도</label>
                <div class="col-lg-1" style="float: left;margin-bottom: 10px; margin-left: 6px">
	        			<select name="yearBox" id="yearBox" class="form-control" >
		                	<option value="empty">----------</option>
		             	</select>
	        	</div>
                
                <label for="" style="float: left">지급월</label>
                <div class="col-lg-1" style="float: left;margin-bottom: 10px; margin-left: 6px">
	        			<select name="monthBox" id="monthBox" class="form-control" >
		                	<option value="empty">----------</option>
		             	</select>
	        	</div>
              </div>
              <!-- /.card-header -->
              <div class="card-body">              
                <table id="example1" class="table table-bordered table-hover text-center">
                  <thead>
                  <tr>
                    <th colspan="2">지급항목</th>
                    <th colspan="2">공제항목</th>
                  </tr>
                  </thead>
                  <tbody>
 				<tr>
	 				<td style="font-weight:bolder;">기본급</td>
	 				<td><input type="text" id="normal_wage" class="col-lg-8"/></td>
	 				<td style="font-weight:bolder;">소득세</td>
	 				<td><input type="text" id="income_tax" class="col-lg-8"/></td>
 				</tr>
 				<tr>
	 				<td style="font-weight:bolder;">상여급</td>
	 				<td><input type="text" id="bonus_wage" class="col-lg-8"/></td>
	 				<td style="font-weight:bolder;">주민세</td>
	 				<td><input type="text" id="resident_tax" class="col-lg-8"/></td>
 				</tr>
 				<tr>
	 				<td style="font-weight:bolder;">직책수당</td>
	 				<td><input type="text" id="position_wage" class="col-lg-8"/></td>
	 				<td style="font-weight:bolder;">국민연금</td>
	 				<td><input type="text" id="national_pension" class="col-lg-8"/></td>
 				</tr>
 				<tr>
	 				<td style="font-weight:bolder;">연장수당</td>
	 				<td><input type="text" id="overtime_wage" class="col-lg-8"/></td>
	 				<td style="font-weight:bolder;">건강보험</td>
	 				<td><input type="text" id="health_insurance" class="col-lg-8"/></td>
 				</tr>
 				<tr>
	 				<td style="font-weight:bolder;">휴일수당</td>
	 				<td><input type="text" id="holiday_wage" class="col-lg-8"/></td>
	 				<td style="font-weight:bolder;">고용보험</td>
	 				<td><input type="text" id="emp_Insurance" class="col-lg-8"/></td>
 				</tr>
 				<tr>
	 				<td style="font-weight:bolder;">복리후생비</td>
	 				<td><input type="text" id="benefits" class="col-lg-8"/></td>
	 				<td style="font-weight:bolder;">장기요양</td>
	 				<td><input type="text" id="longterm_care" class="col-lg-8"/></td>
 				</tr>
 				<tr>
	 				<td style="font-weight:bolder;">기타</td>
	 				<td><input type="text" id="etc_wage" class="col-lg-8"/></td>
	 				<td style="font-weight:bolder;">-</td>
	 				<td>-</td>
 				</tr>
                  </tbody>
                  </table> 
              </div>
              <!-- /.card-body -->
              <div class="card-footer">
              	<button id="submit" type="button" class="btn btn-primary float-right" style="margin-top: 10px">발급</button>
              </div>
            </div>
            <!-- /.card -->
          <!-- /.col -->
        </div>
        <!-- /.row -->
      </div>
      </div>
      <!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  


<script src="../../plugins/jquery/jquery.min.js"></script>

<script src="../../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>

<script src="../../plugins/datatables/jquery.dataTables.min.js"></script>
<script src="../../plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
<script src="../../plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
<script src="../../plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
<script src="../../plugins/datatables-buttons/js/dataTables.buttons.min.js"></script>
<script src="../../plugins/datatables-buttons/js/buttons.bootstrap4.min.js"></script>
<script src="../../plugins/jszip/jszip.min.js"></script>
<script src="../../plugins/pdfmake/pdfmake.min.js"></script>
<script src="../../plugins/pdfmake/vfs_fonts.js"></script>
<script src="../../plugins/datatables-buttons/js/buttons.html5.min.js"></script>
<script src="../../plugins/datatables-buttons/js/buttons.print.min.js"></script>
<script src="../../plugins/datatables-buttons/js/buttons.colVis.min.js"></script>

<script src="../../dist/js/adminlte.min.js"></script>

<script src="../../dist/js/demo.js"></script>

<script>
let dname = "${param.dname}";
let ename = "${param.ename}";

$(function () {
	 $(document).ready(function() {
		setDate();
	 });
	 
	 function setDate() {
		var date = new Date();
		var cur_year = date.getFullYear();
		var cur_month = date.getMonth() + 1;
		
		console.log(cur_year);
		getYears(cur_year);
		getMonths(cur_month);
		
		$("#yearBox").val(cur_year);
		$("monthBox").val(cur_month);
		
		$("#yearBox").change(function() {
			var changeYear = $(this).val();
			getYears(changeYear);
			$("#yearBox").val(changeYear);
		});
		
		$("#monthBox").change(function() {
			var changeMonth = $(this).val();
			getMonths(changeMonth);
			$("#monthBox").val(changeMonth);
		});
	 }
	 
	 function getYears(getY) {
		 $("#yearBox option").remove();
		 
		 var stYear = Number(getY) - 2;
		 var endYear = Number(getY) + 5;
		 
		 for(var y = stYear; y <= endYear; y++) {
			 $("#yearBox").append("<option value='"+ y + "'>" + y + "</option>")
		 }
	 }
	 
	 function getMonths(getM) {
		 $("#monthBox option").remove();
		 
		 for(var m = 1; m <= 12; m++) {
			 $("#monthBox").append("<option value='"+ m + "'>" + m + "</option>")
		 }
	 }
	 
	  //일정 담당, 권한 부분의 dept 옵션 넣어주기
	  $.getJSON({
	  	url:"/calendar/rest_dept",
	  	type:"POST",
	  	success:function(data) {
	  		var options = "";
	  		console.log("rest_dept enterd");
	  		$.each(data, function(idx, element) {
	  			//console.log(idx);
					options += "<option value=" + element + ">" + element + "</option>";
			})
				
			$("select[name='dept']").append(options);
	  		
	  		if(dname != "" && ename != "") {
				console.log("param : " + dname + " : " + ename);
				
				$("#dept").val(dname).trigger('change');
				$("#emp").val(ename);
			
			}
	  	}
	  })
	  
	  
  
	//일정 담당자 선택 부분
	// 일정 담당 부분의 부서 셀렉트 변경 시
	$("select[name='dept']").change(function() {
		$("select[name='emp'] option").remove();
		
		var dname = $("select[name='dept']").val();
		
		getEmps(dname, function(data) {
			var options = "";
			
			$.each(data, function(idx, element) {
				options += "<option value=" + element + ">" + element + "</option>";
			})
			
			$("select[name='emp']").append(options);
		})
		
	  });
	
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
	
	$("#submit").click(function() {
		console.log("submit clicked");
		
		var dname = $("#dept").val();
		var ename = $("#emp").val();
		
		getRepNo(ename, dname, function(data) {
			var cal = {
					  eno:data.eno,
					  pay_year:$("#yearBox").val(),
					  pay_month:$("#monthBox").val(),
					  normal_wage:$("#normal_wage").val(),
					  bonus_wage:$("#bonus_wage").val(),
					  position_wage:$("#position_wage").val(),
					  overtime_wage:$("#overtime_wage").val(),
					  holiday_wage:$("#holiday_wage").val(),
					  benefits:$("#benefits").val(),
					  etc_wage:$("#etc_wage").val(),
					  income_tax:$("#income_tax").val(),
					  resident_tax:$("#resident_tax").val(),
					  national_pension:$("#national_pension").val(),
					  health_insurance:$("#health_insurance").val(),
					  emp_Insurance:$("#emp_Insurance").val(),
					  longterm_care:$("#longterm_care").val()
				};
				
				$.ajax({
					url:'/paystub/rest_new/',
					type:'post',
					contentType:'application/json',
					data:JSON.stringify(cal),
					async:false,
					success:function(result) {
						console.log("paystub 삽입 " + result);
					}
				});
				
				location.href = "/paystub/paystubList?eno=" + data.eno;
		});
		
		 
	})
	
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
	
	
});
</script>


<%@include file="../includes/footer.jsp" %>
