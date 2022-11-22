<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="keywords"
	content="wrappixel, admin dashboard, html css dashboard, web dashboard, bootstrap 4 admin, bootstrap 4, css3 dashboard, bootstrap 4 dashboard, severny admin bootstrap 4 dashboard, frontend, responsive bootstrap 4 admin template, pixel  design, pixel  dashboard bootstrap 4 dashboard template" />
<meta name="description"
	content="Pixel Admin is powerful and clean admin dashboard template, inpired from Bootstrap Framework" />
<meta name="robots" content="noindex,nofollow" />
<title>여행의 즐거움 :: 떠나!</title>
<link rel="canonical"
	href="https://www.wrappixel.com/templates/pixel-admin-lite/" />
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="https://wrappixel.com/demos/free-admin-templates/all-lite-landing-pages/assets/images/logos/pixel-favicon.png" />
<!-- Bootstrap Core CSS -->
<link href="/resources/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" />
<!-- Menu CSS -->
<link
	href="/resources/plugins/bower_components/sidebar-nav/dist/sidebar-nav.min.css"
	rel="stylesheet" />
<!-- toast CSS -->
<link
	href="/resources/plugins/bower_components/toast-master/css/jquery.toast.css"
	rel="stylesheet" />
<!-- morris CSS -->
<link href="/resources/plugins/bower_components/morrisjs/morris.css"
	rel="stylesheet" />
<!-- animation CSS -->
<link href="/resources/css/animate.css" rel="stylesheet" />
<!-- Custom CSS -->
<link href="/resources/css/style.css" rel="stylesheet" />
<!-- color CSS -->
<link href="/resources/css/colors/blue-dark.css" id="theme" rel="stylesheet" />
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<script type="text/javascript">
	$(document).ready(function() {

		$("#logoutid").click(function(e){
			e.preventDefault();
	        //alert("버튼 작동");
	        $.ajax({
	            type:"POST",
	            url:"/customLogout",
	            beforeSend: function(xhr) {
	            	xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	            },
	            success:function(data){
	                console.log(data);
	                location.href="/";
	            } 
	        }); // ajax 
	    });
		
	});
</script>    
</head>

<body>
	<!-- Preloader -->
	<div class="preloader">
		<div class="cssload-speeding-wheel"></div>
	</div>
	<div id="wrapper">
		<!-- Navigation -->
		<nav class="navbar navbar-default navbar-static-top m-b-0">
			<div class="navbar-header">
				<a class="navbar-toggle hidden-sm hidden-md hidden-lg"
					href="javascript:void(0)" data-toggle="collapse"
					data-target=".navbar-collapse"><i
					class="fa fa-bars"></i></a>
				<div class="top-left-part">
					<a class="logo" href="/security/admin">
						<div class="logo-content">
							<img src="/resources/plugins/images/admin-logo.png" alt="home" />
						</div>
					</a>
				</div>

				<ul class="nav navbar-top-links navbar-right pull-right">
					<li><a class="profile-pic" href="#"> <img
							src="/resources/plugins/images/users/admin_profile_img.jpeg"
							alt="user-img" width="36" class="img-circle" /> <b
							class="hidden-xs">
							<sec:authentication property="principal.member.nickname" /> 님</b>
						<button class="btn btn-type1 ma-lf-20" id="logoutid">로그아웃</button>
					</a></li>
				</ul>
			</div>
			<!-- /.navbar-header -->
			<!-- /.navbar-top-links -->
			<!-- /.navbar-static-side -->
		</nav>

		<!-- Left navbar-header -->
		<div class="navbar-default sidebar" role="navigation">
			<div class="sidebar-nav navbar-collapse slimscrollsidebar">
				<ul class="nav" id="side-menu">
					<li style="padding: 10px 0 0"><a href="index.html"
						class="waves-effect"> <i class="fa fa-clock-o fa-fw"
							aria-hidden="true"></i> <span class="hide-menu">방문자 수</span>
					</a></li>
					<li><a href="/profile.html" class="waves-effect"> <i
							class="fa fa-user fa-fw" aria-hidden="true"></i> <span
							class="hide-menu">관리자 정보</span>
					</a></li>
					<li><a href="PC_MB_01.html" class="waves-effect"> <i
							class="fa fa-male fa-fw" aria-hidden="true"></i> <span
							class="hide-menu">회원정보</span>
					</a></li>
					<li><a href="PC_LI_01.html" class="waves-effect"> <i
							class="fa fa-folder fa-fw" aria-hidden="true"></i> <span
							class="hide-menu">게시글목록</span>
					</a></li>
				</ul>
			</div>
		</div>
		<!-- Left navbar-header end -->
		<!-- Page Content -->
		<div id="page-wrapper">
			<div class="container-fluid">
				<div class="row bg-title">
					<div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
						<h4 class="page-title">방문자 수</h4>
					</div>

					<!-- /.col-lg-12 -->
				</div>
				<!-- row -->
				<div class="row">
					<!--col -->
					<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
						<div class="white-box">
							<div class="col-in row">
								<div class="col-md-6 col-sm-6 col-xs-6">
									<i data-icon="E" class="linea-icon linea-basic"></i>
									<h5 class="text-muted vb">일일 방문자 수</h5>
								</div>
								<div class="col-md-6 col-sm-6 col-xs-6">
									<h3 class="counter text-right m-t-15 text-danger">23</h3>
								</div>
								<div class="col-md-12 col-sm-12 col-xs-12">
									<div class="progress">
										<div class="progress-bar progress-bar-danger"
											role="progressbar" aria-valuenow="40" aria-valuemin="0"
											aria-valuemax="100" style="width: 40%">
											<span class="sr-only">40% Complete (success)</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- /.col -->
					<!--col -->
					<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
						<div class="white-box">
							<div class="col-in row">
								<div class="col-md-6 col-sm-6 col-xs-6">
									<i class="linea-icon linea-basic" data-icon="&#xe01b;"></i>
									<h5 class="text-muted vb">전체 방문자 수</h5>
								</div>
								<div class="col-md-6 col-sm-6 col-xs-6">
									<h3 class="counter text-right m-t-15 text-megna">169</h3>
								</div>
								<div class="col-md-12 col-sm-12 col-xs-12">
									<div class="progress">
										<div class="progress-bar progress-bar-megna"
											role="progressbar" aria-valuenow="40" aria-valuemin="0"
											aria-valuemax="100" style="width: 40%">
											<span class="sr-only">40% Complete (success)</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- /.col -->
					<!--col -->
					<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
						<div class="white-box">
							<div class="col-in row">
								<div class="col-md-6 col-sm-6 col-xs-6">
									<i class="linea-icon linea-basic" data-icon="&#xe00b;"></i>
									<h5 class="text-muted vb">총 회원 수</h5>
								</div>
								<div class="col-md-6 col-sm-6 col-xs-6">
									<h3 class="counter text-right m-t-15 text-primary">157</h3>
								</div>
								<div class="col-md-12 col-sm-12 col-xs-12">
									<div class="progress">
										<div class="progress-bar progress-bar-primary"
											role="progressbar" aria-valuenow="40" aria-valuemin="0"
											aria-valuemax="100" style="width: 40%">
											<span class="sr-only">40% Complete (success)</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
				<!--row -->
				<div class="row">
					<div class="col-md-12">
						<div class="white-box">
							<div stlye="width:100%;">
								<canvas id="canvas" style="height: 370px"></canvas>
							</div>
						</div>
					</div>
				</div>
				<!--row -->
				<div class="row">
					<div class="col-sm-12">
						<div class="white-box">
							<h3 class="box-title">Member Info</h3>
							<div class="table-responsive">
								<table class="table">
									<thead>
										<tr>
											<th>순번</th>
											<th>이름</th>
											<th>아이디</th>
											<th>이메일</th>
											<th>주소</th>
											<th>상세주소</th>
											<th>생년월일</th>
											<th>전화번호</th>
											<th>성별</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>1</td>
											<td><a href="PC_MB_02.html">홍길동</a></td>
											<td>Hong1234</td>
											<td>ayo123@naver.com</td>
											<td>서울특별시 관악구 어디로 12-21</td>
											<td>201호</td>
											<td>2000년 4월 12일</td>
											<td>010-1234-5678</td>
											<td>남자</td>
										</tr>
										<tr>
											<td>2</td>
											<td>홍길순</td>
											<td>hey5959</td>
											<td>a1313@gmail.com</td>
											<td>인천광역시 서구 남쪽 22-222</td>
											<td>B101호</td>
											<td>1978년 8월 8일</td>
											<td>010-3214-5665</td>
											<td>여자</td>
										</tr>
										<tr>
											<td>3</td>
											<td>장그래</td>
											<td>yesjang</td>
											<td>yes1235@gmail.com</td>
											<td>서울특별시 강남구 컴퓨터로 33-36</td>
											<td>211호</td>
											<td>1998년 5월 7일</td>
											<td>010-3211-4141</td>
											<td>남자</td>
										</tr>
									</tbody>
								</table>
								<a href="PC_MB_01.html">전체보기</a>
							</div>
						</div>
					</div>
				</div>
				<!-- /.row -->

			</div>
			<!-- /.container-fluid -->
			<footer class="footer text-center"> 2022 COPYRIGHT &copy; by
				WEBDESIGN. ALL RIGHTS RESERVED </footer>
		</div>
		<!-- /#page-wrapper -->
	</div>
	<!-- /#wrapper -->
	<!-- jQuery -->
	<script src="/resources/plugins/bower_components/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap Core JavaScript -->
	<script src="/resources/bootstrap/dist/js/bootstrap.min.js"></script>
	<!-- Menu Plugin JavaScript -->
	<script
		src="/resources/plugins/bower_components/sidebar-nav/dist/sidebar-nav.min.js"></script>
	<!--slimscroll JavaScript -->
	<script src="/resources/js/jquery.slimscroll.js"></script>
	<!--Wave Effects -->
	<script src="/resources/js/waves.js"></script>
	<!--Counter js -->
	<script
		src="/resources/plugins/bower_components/waypoints/lib/jquery.waypoints.js"></script>
	<script
		src="/resources/plugins/bower_components/counterup/jquery.counterup.min.js"></script>
	<!--Morris JavaScript -->
	<script src="/resources/plugins/bower_components/raphael/raphael-min.js"></script>
	<script src="/resources/plugins/bower_components/morrisjs/morris.js"></script>
	<!-- Custom Theme JavaScript -->
	<script src="/resources/js/custom.min.js"></script>
	<script src="/resources/js/dashboard1.js"></script>
	<script
		src="/resources/plugins/bower_components/toast-master/js/jquery.toast.js"></script>
	<!--chart(CDN)-->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							$
									.toast({
										heading : "admin page",
										text : "Membership and product management are available on the administrator page.",
										position : "top-right",
										loaderBg : "#ff6849",
										icon : "info",
										hideAfter : 3500,
										stack : 6,
									});
						});

		// line 차트
		new Chart(document.getElementById("canvas"), {
			type : 'line',
			data : {
				labels : [ '20', '21', '22', '23', '24', '25', '26' ],
				datasets : [ {
					label : '일일 방문자 수',
					data : [ 10, 3, 30, 23, 10, 5, 50 ],
					borderColor : "rgba(255, 201, 14, 1)",
					backgroundColor : "rgba(255, 201, 14, 0.5)",
					fill : true,
					lineTension : 0
				} ]
			},
			options : {
				responsive : true,
				title : {
					display : true,
				},
				tooltips : {
					mode : 'index',
					intersect : false,
				},
				hover : {
					mode : 'nearest',
					intersect : true
				},
				scales : {
					xAxes : [ {
						display : true,
						scaleLabel : {
							display : true,
							labelString : '일'

						}
					} ],
					yAxes : [ {
						display : true,
						ticks : {
							suggestedMin : 0,
						},
						scaleLabel : {
							display : true,
							labelString : '방문자수'
						}
					} ]
				}
			}
		});
	</script>
</body>
</html>
