<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- 전자결재 메뉴 -->
<div class="card">
	<div class="card-header">
		<h3 class="card-title">부서명</h3>

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
					&nbsp;&nbsp;인사팀
				</a>
			</li>

			<li class="nav-item">
				<a href="/approval/appWriteReport" class="nav-link">
					<i class="far fa-file"></i>
					&nbsp;&nbsp;총무팀
				</a>
			</li>

			<li class="nav-item">
				<a href="/approval/appWriteResignation" class="nav-link">
					<i class="far fa-file"></i>
					&nbsp;&nbsp;영업팀
				</a>
			</li>

		</ul>
	</div>
</div>

<!-- /.card-body -->