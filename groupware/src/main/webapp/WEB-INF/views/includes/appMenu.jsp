<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- 전자결재 메뉴 -->
<div class="card">
	<div class="card-header">
		<h3 class="card-title">결재양식</h3>

		<div class="card-tools">
			<button type="button" class="btn btn-tool" data-card-widget="collapse">
				<i class="fas fa-minus"></i>
			</button>
		</div>
	</div>

	<div class="card-body p-0">
		<ul class="nav nav-pills flex-column">
			<li class="nav-item">
				<a href="/approval/appWriteDraft" class="nav-link">
					<i class="far fa-file"></i>
					&nbsp;&nbsp;기안서
				</a>
			</li>

			<li class="nav-item">
				<a href="/approval/appWriteReport" class="nav-link">
					<i class="far fa-file"></i>
					&nbsp;&nbsp;보고서
				</a>
			</li>

			<li class="nav-item">
				<a href="/approval/appWriteResignation" class="nav-link">
					<i class="far fa-file"></i>
					&nbsp;&nbsp;사직서
				</a>
			</li>

			<li class="nav-item">
				<a href="/approval/appWriteExpenseStatement" class="nav-link">
					<i class="far fa-file"></i>
					&nbsp;&nbsp;지출내역서
				</a>
			</li>

			<li class="nav-item">
				<a href="/approval/appWriteAnnualPlan" class="nav-link">
					<i class="far fa-file"></i>
					&nbsp;&nbsp;연차신청서
				</a>
			</li>

			<li class="nav-item">
				<a href="/approval/appWriteBusinessTrip" class="nav-link">
					<i class="far fa-file"></i>
					&nbsp;&nbsp;출장신청서
				</a>
			</li>
		</ul>
	</div>
</div>

<div class="card">
	<div class="card-header">
		<h3 class="card-title">문서보관함</h3>

		<div class="card-tools">
			<button type="button" class="btn btn-tool" data-card-widget="collapse">
				<i class="fas fa-minus"></i>
			</button>
		</div>
	</div>

	<div class="card-body p-0">
		<ul class="nav nav-pills flex-column">
			<li class="nav-item">
				<a href="/approval/appMain" class="nav-link">
					<i class="far fa-file"></i>
					&nbsp;&nbsp;상신함
				</a>
			</li>
			
			<li class="nav-item">
				<a href="/approval/appBoxReceive" class="nav-link">
					<i class="far fa-file"></i>
					&nbsp;&nbsp;수신함
				</a>
			</li>
			
			<li class="nav-item">
				<a href="/approval/appBoxImplementation" class="nav-link">
					<i class="far fa-file"></i>
					&nbsp;&nbsp;시행함
				</a>
			</li>

			<li class="nav-item">
				<a href="/approval/appBoxReturn" class="nav-link">
					<i class="far fa-file"></i>
					&nbsp;&nbsp;반려함
				</a>
			</li>

			<li class="nav-item">
				<a href="/approval/appBoxReference" class="nav-link">
					<i class="far fa-file"></i>
					&nbsp;&nbsp;참조함
				</a>
			</li>
		</ul>
	</div>
</div>
<!-- /.card-body -->