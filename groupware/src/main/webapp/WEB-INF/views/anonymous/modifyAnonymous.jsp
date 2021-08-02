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
            <h1>익명 게시판</h1>
          </div>
         
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="/main/home">Home</a></li>
              <li class="breadcrumb-item active">${vo.awriter}의 외침</li>
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
 			<form action="" method="post" role="form"> 
          <div class="card card-primary card-outline">
            <div class="card-header">
              <h3 class="card-title">작성일</h3>
              <input type="date" class="form-control" 
                     readonly="readonly" value="<fmt:formatDate pattern='yyyy-MM-dd'  value='${vo.adate}'/>" >

            </div>
              <div class="card-header">
              <h1 class="card-title">작 성 자</h1>
                <input class="form-control" name="awriter"
                     readonly="readonly" value="${vo.awriter}">
              
            
            </div>
             <div class="card-header">
                <label>제 목</label> <input class="form-control" name="atitle" value="${vo.atitle}">
            
            </div>
            <!-- /.card-header -->
            <div class="mailbox-read-message">
             <label>&nbsp&nbsp 내&nbsp용</label>
            <textarea class="b-content form-control" rows="5" name="acontents">${vo.acontents}
			</textarea>
                </div>
                
                
               <div class="mailbox-controls with-border text-center">
                <div class="btn-group">
                  <button type="button" class="btn btn-default btn-sm" data-container="body" id="list">
                    <i class="fas fa-list">목 록</i>
                     </button>
                </div>
           		</div>
            
            <!-- /.card-footer -->
            
              <div class="card-footer">
                <div class="float-right">
                     <button type="submit" class="btn btn-primary" data-oper='modify'>수정</button>
                   <button type="reset" class="btn btn-danger">취소</button>
                </div>
              </div>
          </div>
             </form>
          <!-- /.card -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
      </div><!-- /.container-fluid -->
    </section>
 
    <!-- /.content -->
  </div>
  
<%@include file="../includes/footer.jsp" %>