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
<!-- Sweet Alert 플러그인 -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
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
				
				$(document).ready(function() {	// HTML 태그가 모두 로딩이 된다음에 실행
					var formObj = $("form");
					
					// modify, remove, list
					$("button").on("click", function(e) {
						e.preventDefault();	// 디폴트 동작을 막는다.
						// $(this) : 이벤트가 발생한 요소 -> submit 버튼
						var operation = $(this).data("oper");	// data-oper 속성값을 읽는다.
						if(operation === 'remove') {		// Remove 버튼이 눌린 경우
							formObj.attr("action", "/admin/remove");	// modify -> remove
						} else if(operation === 'list') {	// List 버튼이 눌린 경우
							// 페이징 관련된 파라미터를 가지고 다니도록 수정 필요
							formObj.attr("action", "/adminlist");	// /board/modify -> /board/list
							formObj.attr("method", "get");
							// 필요한 파라미터(pageNum, amount)만 전송을 하기 위해 복사
							var pageNumTag = $("input[name='pageNum']").clone();
							var amountTag = $("input[name='amount']").clone();
							// 검색 관련
							var keywordTag = $("input[name='keyword']").clone(); 
							var typeTag = $("input[name='type']").clone();
							formObj.empty();	// input 태그들을 모두 삭제
							formObj.append(pageNumTag);
							formObj.append(amountTag);
							// 검색 관련
							formObj.append(keywordTag); 
							formObj.append(typeTag);
						    formObj.append(str).submit();
						  }
						formObj.submit();	// 서버로 요청
					});
					
					$(document).ready(function() { // HTML 코드가 로딩된 다음에 실행되도록
						var operForm = $("#operForm");

						// 버튼이 눌리면 실행되도록 이벤트를 등록
						$("button").on("click", function(e) {
							e.preventDefault(); // 디폴트 동작을 막고
							// 어느 버튼이 눌렸는지 확인
							// $(this) : 눌려진 버튼
							var operation = $(this).data("oper");
							if (operation === 'modify') { // modify 화면으로 이동
								operForm.submit();
							} else if (operation === 'list') { // 목록보기 화면으로 이동
								operForm.find("#bno").remove(); // input bno를 삭제
								operForm.attr("action", "/admin/list");
								operForm.submit();
							}
					});

			});
</script>

<!-- style -->
<style>
.table input:focus {
	border: 2px solid #c2dae8;
	border-color: #c2dae8;
}

.logout_a {
	color: white;
}
</style>
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
					<div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
						<h4 class="page-title">게시글 상세정보</h4>
					</div>
					<div class="col-lg-9 col-sm-8 col-md-8 col-xs-12"></div>
					<!-- /.col-lg-12 -->
				</div>
				<div class="row">
					<div class="col-md-12">
						<div class="white-box">
							<h3 class="box-title">${board.userid}회원님의게시글</h3>
							<div class="member_update_container">
								<div class="wrapper">
									<div class="member_update_content">
										<form action="/admin/get" method="get" name="mem_update_frm">
											<input type="hidden" name="${_csrf.parameterName}"
												value="${_csrf.token}">
											<table class="table border-td">
												<tbody>
													<tr>
														<th class="text-center">닉네임</th>
														<td class="pd-lf-40"><input class="update-txt"
															type="text" value="${board.nickname}" disabled></td>
													</tr>
													<tr>
														<th class="text-center">제목</th>
														<td class="pd-lf-40"><input class="update-txt"
															type="text" value="${board.title}" disabled></td>
													</tr>
													<tr>
														<th class="text-center">작성일</th>
														<td class="pd-lf-40"><fmt:formatDate
																pattern="yyyy-MM-dd" value="${board.regDate}" /> <%-- <input class="update-txt"
															type="text" value="${board.regDate}" disabled> --%></td>
													</tr>
													<tr>
														<th class="text-center">댓글수</th>
														<td class="pd-lf-40"><input class="update-txt"
															type="text" value="${board.comCnt}" disabled></td>
													</tr>
													<tr>
														<th class="text-center">썸네일 이미지</th>
														<td class="pd-lf-40"><input type="file"></td>
													</tr>
													<tr>
														<th class="text-center" style="vertical-align: middle;">내용</th>
														<td class="pd-lf-40"><textarea name="text-content"
																placeholder="${board.content}" disabled></textarea></td>
													</tr>
													<tr>
														<th class="text-center">첨부파일</th>
														<td class="pd-lf-40"><input type="file"></td>
													</tr>
													<tr>
														<th class="text-center">해시태그</th>
														<td class="pd-lf-40"><c:forEach items="${tag}"
																var="tag">
																<c:out value="${tag.tagName}" />
															</c:forEach>
													</tr>
											</table>
											<div class="btn_form">
												<button class="btn back_btn btn-type1" type="button"
													onclick="history.back();">목록</button>
												<button class="btn btn-type2" type="button" id="del_btn"
													data-oper='remove'>삭제</button>
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
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


	<!-- Script -->
	<script type="text/javascript"
		src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript"></script>
	<!-- User Script -->
	<script>
		/**
		 *회원 삭제 모달 창
		 * */
		$("#del_btn").click(function() {
			swal({
				title : "게시글을 정말 삭제하시겠습니까?",
				text : "게시글을 정말 삭제하시겠습니까?",
				type : "warning",
				showCancelButton : true,
				confirmButtonClass : "btn-danger",
				confirmButtonText : "예",
				cancelButtonText : "아니오",
				closeOnConfirm : false,
				closeOnCancel : true
			}, function(isConfirm) {
				if (isConfirm) {
					formObj.attr("action", "/admin/remove");	// modify -> remove
					formObj.attr("method", "post");
					formObj.submit();
					// swal('', '회원 정보가 삭제되었습니다.', "success");
				} else {
					return false;
				}

			});
			return;
		} else if(operation === 'list') {	// List
			self.location= "/admin/list";
		return;
		}
		formObj.submit();
	});
});
		

	</script>
	
</body>
</html>
