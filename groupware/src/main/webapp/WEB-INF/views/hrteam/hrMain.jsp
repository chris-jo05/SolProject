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
            <h1>사원 관리</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="/main/home">Home</a></li>
              <li class="breadcrumb-item active">사원 관리</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
        <div class="row">
          <div class="col-12">
          
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">사원 프로필</h3>
                
                <div class="card-tools">
                	<button type="submit" class="btn btn-block btn-success btn-sm"
                	onclick="location.href='/hrteam/hrNewMember' ">사원 추가</button>
                </div>
              </div>
              <!-- ./card-header -->
              <div class="card-body">
                <table class="table table-bordered table-hover">
                  <thead>
                    <tr>
                      <th>사원 번호</th>
                      <th>사원 이름</th>
                      <th>부서</th>
                      <th>직급</th>
                      <th>입사일</th>
                      <th>퇴사일</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr data-widget="expandable-table" aria-expanded="false">
                      <td>175</td>
                      <td>Mike Doe</td>
                      <td>인사팀</td>
                      <td>과장</td>
                      <td>2015/05/30</td>
                      <td>2021/07/03</td>
                    </tr>
                    	<tr class="expandable-body">
                     	 <td colspan="6">
                    	    <ul class="list-group list-group-unbordered mb-3">
		         	         <li class="list-group-item">
		     	               <b> 소 속</b> <a class="float-right">인사팀</a>
		      	            </li>
		   	               <li class="list-group-item">
		    	                <b>&nbsp;직 급</b> <a class="float-right">대리</a>
		   	               </li>
		   	               <li class="list-group-item">
		    	                <b>이 메 일</b> <a class="float-right">auto@solcompany.com</a>
		        	       </li>
		            	   <li class="list-group-item">
		                   		<b>휴 대 폰</b> <a class="float-right">010 - 1234 -1234</a>
		                   </li>
		                   <li class="list-group-item">
		                  	  <b>생 일</b> <a class="float-right">07 / 01</a>
		                   </li>
		                   <li class="list-group-item">
		                  	  <b>성 별</b> <a class="float-right">남 / 여</a>
		            	   </li>
						   <li class="list-group-item">
		            	   		<button type="button" class="btn btn-block btn-success" 
		            	   				onclick="location.href='/hrteam/hrUpdateMember'">수정하기</button>
		            	   </li>
		               	 </ul>                     
                 	 	 </td>
                	    </tr>
                    <tr data-widget="expandable-table" aria-expanded="false">
                      <td>134</td>
                      <td>Jim Doe</td>
                      <td>관리팀</td>
                      <td>주임</td>
                      <td>2020/10/10</td>
                      <td></td>
                    </tr>
                    <tr class="expandable-body">
                      <td colspan="6">
                        <p>
                          Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
                        </p>
                      </td>
                    </tr>
                    <tr data-widget="expandable-table" aria-expanded="false">
                      <td>494</td>
                      <td>Victoria Doe</td>
                      <td>11-7-2014</td>
                      <td>Pending</td>
                      <td>2007/05/09</td>
                      <td></td>
                    </tr>
                    <tr class="expandable-body">
                      <td colspan="5">
                        <p>
                          Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
                        </p>
                      </td>
                    </tr>
                    <tr data-widget="expandable-table" aria-expanded="false">
                      <td>832</td>
                      <td>Michael Doe</td>
                      <td>11-7-2014</td>
                      <td>Approved</td>
                      <td>2015/12/10</td>
                      <td></td>
                    </tr>
                    <tr class="expandable-body">
                      <td colspan="5">
                        <p>
                          Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
                        </p>
                      </td>
                    </tr>
                    <tr data-widget="expandable-table" aria-expanded="false">
                      <td>982</td>
                      <td>Rocky Doe</td>
                      <td>11-7-2014</td>
                      <td>Denied</td>
                      <td>2019/09/08</td>
                      <td></td>
                    </tr>
                    <tr class="expandable-body">
                      <td colspan="5">
                        <p>
                          Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
                        </p>
                      </td>
                    </tr>
                  </tbody>
                </table>
              </div>
              <!-- /.card-body -->
              <div class="card-footer clearfix">
                <ul class="pagination pagination-sm m-0 float-right">
                  <li class="page-item"><a class="page-link" href="#">&laquo;</a></li>
                  <li class="page-item"><a class="page-link" href="#">1</a></li>
                  <li class="page-item"><a class="page-link" href="#">2</a></li>
                  <li class="page-item"><a class="page-link" href="#">3</a></li>
                  <li class="page-item"><a class="page-link" href="#">&raquo;</a></li>
                </ul>
              </div>
            </div>
            <!-- /.card -->
        </div>
        <!-- /.row -->
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  

<!-- <!-- jQuery 
<script src="../../plugins/jquery/jquery.min.js"></script>
Bootstrap 4
<script src="../../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
AdminLTE App
<script src="../../dist/js/adminlte.min.js"></script>
AdminLTE for demo purposes
<script src="../../dist/js/demo.js"></script> -->



<%@include file="../includes/footer.jsp" %>