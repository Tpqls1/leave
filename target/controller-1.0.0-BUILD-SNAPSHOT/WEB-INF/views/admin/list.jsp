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
<link href="/resources/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet" />
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
<link href="/resources/css/colors/blue-dark.css" id="theme"
	rel="stylesheet" />
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
	$(document).ready(
			function() {

				$("#logoutid").click(
						function(e) {
							e.preventDefault();
							//alert("버튼 작동");
							$.ajax({
								type : "POST",
								url : "/customLogout",
								beforeSend : function(xhr) {
									xhr.setRequestHeader("${_csrf.headerName}",
											"${_csrf.token}");
								},
								success : function(data) {
									console.log(data);
									location.href = "/";
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
					data-target=".navbar-collapse"><i class="fa fa-bars"></i></a>
				<div class="top-left-part">
					<a class="logo" href="/admin/index">
						<div class="logo-content">
							<img src="/resources/plugins/images/admin-logo.png" alt="home" />
						</div>
					</a>
				</div>

				<ul class="nav navbar-top-links navbar-right pull-right">
					<li><a class="profile-pic" href="/admin/index"> <img
							src="/resources/plugins/images/users/admin_profile_img.jpeg"
							alt="user-img" width="36" class="img-circle" /> <b
							class="hidden-xs"><sec:authentication
									property="principal.member.nickname" /> 님</b>
							<button class="btn btn-type1 ma-lf-20" id="logoutid"
								onclick="/customLogout">로그아웃</button>
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
					<li style="padding: 10px 0 0"><a href="/admin/index"
						class="waves-effect"> <i class="fa fa-clock-o fa-fw"
							aria-hidden="true"></i> <span class="hide-menu">방문자 수</span>
					</a></li>
					<c:set var="userid">
						<sec:authentication property="principal.member.userid" />
					</c:set>
					<li><a href="/admin/info?userid=${userid}"
						class="waves-effect"> <i class="fa fa-user fa-fw"
							aria-hidden="true"></i> <span class="hide-menu">관리자 정보</span>
					</a></li>
					<li><a href="/admin/memberList" class="waves-effect"> <i
							class="fa fa-male fa-fw" aria-hidden="true"></i> <span
							class="hide-menu">회원정보</span>
					</a></li>
					<li><a href="/admin/list" class="waves-effect"> <i
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
					<div class="page-option">
						<h4 class="page-title">게시글목록</h4>
						<div class="page-search">
							<select class="search-list">
								<option disabled>선택</option>
								<option value="제목">제목</option>
								<option value="닉네임">닉네임</option>
							</select> <input type="text" class="search-text " placeholder="Search">
							<button class="btn btn-type2" type="button">search</button>
						</div>
					</div>

					<!-- /.col-lg-12 -->
				</div>
				<!-- /row -->
				<div class="row">
					<div class="col-sm-12">
						<div class="white-box">
							<h3 class="box-title">게시글목록</h3>
							<div class="table-responsive">
								<table class="table">
									<thead>
										<tr>
											<th>순번</th>
											<th>닉네임</th>
											<th>제목</th>
											<th>작성일</th>
											<th>조회수</th>
										</tr>
									</thead>
									<c:forEach items="${list}" var="board">
										<tr>
											<td><c:out value="${board.bno}" /></td>
											<td><c:out value="${board.userid}" /></td>
											<td>
											<a href='/admin/get?bno=<c:out value="${board.bno}" />'>
											<c:out value="${board.title}" /></a>
											</td>
											<td>
											<fmt:formatDate pattern = "yyyy-MM-dd" value="${board.regDate}" />
											<%-- <c:out value="${board.regDate}" /> --%></td>
											<td><c:out value="${board.comCnt}" /></td>
										</tr>
									</c:forEach>
								</table>
								<div class="val-center">
									<ul class="pagination">
										<li><a href="#" aria-label="Previous"> <span
												aria-hidden="true">&laquo;</span>
										</a></li>
										<li><a href="#">1</a></li>
										<li><a href="#">2</a></li>
										<li><a href="#">3</a></li>
										<li><a href="#">4</a></li>
										<li><a href="#">5</a></li>
										<li><a href="#">6</a></li>
										<li><a href="#">7</a></li>
										<li><a href="#">8</a></li>
										<li><a href="#">9</a></li>
										<li><a href="#">10</a></li>
										<li><a href="#" aria-label="Next"> <span
												aria-hidden="true">&raquo;</span>
										</a></li>
									</ul>
								</div>
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
	<script
		src="/resources/plugins/bower_components/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap Core JavaScript -->
	<script src="/resources/bootstrap/dist/js/bootstrap.min.js"></script>
	<!-- Menu Plugin JavaScript -->
	<script
		src="/resources/plugins/bower_components/sidebar-nav/dist/sidebar-nav.min.js"></script>
	<!--slimscroll JavaScript -->
	<script src="/resources/js/jquery.slimscroll.js"></script>
	<!--Wave Effects -->
	<script src="/resources/js/waves.js"></script>
	<!-- Custom Theme JavaScript -->
	<script src="/resources/js/custom.min.js"></script>
</body>
</html>
