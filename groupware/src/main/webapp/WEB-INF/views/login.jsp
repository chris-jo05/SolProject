<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Sol Company</title>
<style>
      .waves {
        position: relative;
        width: 100%;
        height: 30vh;
        margin-bottom: -7px;
        min-height: 100px;
        max-height: 150px;
        overflow: inherit;
      }
      /* Animation */

      .parallax > use {
        animation: move-forever 25s cubic-bezier(0.55, 0.5, 0.45, 0.5) infinite;
      }
      .parallax > use:nth-child(1) {
        animation-delay: -2s;
        animation-duration: 7s;
      }
      .parallax > use:nth-child(2) {
        animation-delay: -3s;
        animation-duration: 10s;
      }
      .parallax > use:nth-child(3) {
        animation-delay: -4s;
        animation-duration: 13s;
      }
      .parallax > use:nth-child(4) {
        animation-delay: -5s;
        animation-duration: 20s;
      }
      @keyframes move-forever {
        0% {
          transform: translate3d(-90px, 0, 0);
        }
        100% {
          transform: translate3d(85px, 0, 0);
        }
      }
    </style>
<!-- Google Font: Source Sans Pro -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">

<!-- Font Awesome -->
<link rel="stylesheet" href="../resources/plugins/fontawesome-free/css/all.min.css">

<!-- icheck bootstrap -->
<link rel="stylesheet" href="../resources/plugins/icheck-bootstrap/icheck-bootstrap.min.css">

<!-- Theme style -->
<link rel="stylesheet" href="../resources/dist/css/adminlte.min.css">

</head>
<body class="hold-transition login-page">
	<div class="login-box">
		<div class="login-logo">
			<img src="../resources/dist/img/SolcompanyLogo.png" height="40" width="40">
			<span>
				<strong>Sol Company</strong>
			</span>
		</div>

		<!-- /.login-logo -->
		<div class="card">
			<div class="card-body login-card-body">
				<form action="/login" method="post">
					<div class="input-group mb-3">
						<input type=text name="id" class="form-control" placeholder="ID">
						<div class="input-group-append">
							<div class="input-group-text">
								<span class="fas fa-user"></span>
							</div>
						</div>
					</div>

					<div class="input-group mb-3">
						<input type="password" name="password" class="form-control" placeholder="Password">
						<div class="input-group-append">
							<div class="input-group-text">
								<span class="fas fa-lock"></span>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-8">
							<div class="icheck-primary">
								<input type="checkbox" id="remember">
								<label for="remember">Remember ID</label>
							</div>
						</div>

						<!-- /.col -->
						<div class="col-4">
							<button type="submit" class="btn btn-primary btn-block">로그인</button>
						</div>
					</div>
				</form>
			</div>
			<!-- /.login-card-body -->
			<div class="card-footer">
				<div class="back">
 					<!--Content before waves-->
 					<div class="inner-back flex"></div>

					<!--Waves Container-->
					<!--  <div class="footer"> -->
						<svg class="waves" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
							 viewBox="0 24 150 28" preserveAspectRatio="none" shape-rendering="auto">
						<defs>
							<path id="gentle-wave" d="M-160 44c30 0 58-18 88-18s 58 18 88 18 58-18 88-18 58 18 88 18 v44h-352z"/>
          				</defs>
          				<g class="parallax">
				            <use xlink:href="#gentle-wave" x="48" y="0" fill="rgba(131,213,216,0.7)"/>
				            <use xlink:href="#gentle-wave" x="48" y="4" fill="rgba(96,204,235,0.5)"/>
				            <use xlink:href="#gentle-wave" x="48" y="15" fill="rgba(116,116,236,0.3)"/>
				            <use xlink:href="#gentle-wave" x="48" y="22" fill="rgba(198,213,247,0.2)"/>
				            <use xlink:href="#gentle-wave" x="48" y="30" fill="rgba(198,213,247,0.2)"/>
          				</g>
      					</svg>
      				</div>
    		<!-- </div> -->
			</div>
		</div>
	</div>
	<!-- /.login-box -->

<script>
$(function(){
	let error = '${error}';
	
	if(error){
		alert(error);
	}
})
</script>
</body>
</html>