<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s"%>

<!DOCTYPE html>
<html lang=ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>여행의 즐거움 :: 떠나!</title>
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
	<div class="header-container">
		<div class="wrapper">
			<div class="header-content">
				<div class="head-menu-content">
					<div class="logo-content">
						<a href="/"><img class="logo-img"
							src="../resources/images/logo.png"></a>
					</div>

					<sec:authorize access="isAnonymous()">
						<div class="head-menu-content">
							<ul class="head-menu">
								<li><a href="/customLogin">로그인</a></li>
								<li><a href="/member/join">회원가입</a></li>
							</ul>
						</div>
					</sec:authorize>
					<sec:authorize access="isAuthenticated()">
						<ul class="head-menu">
						<c:set var="userid">
							<sec:authentication property="principal.member.userid" />
						</c:set>
							<li><a href="/my/list?userid=${userid}">마이페이지</a></li>
							<li class="head-submenu"><a class="profile-setting" href="#">
									<div class="head-profile">
										<img class="profile"
											src="../resources/images/profile-img.jpeg">
									</div>
									<div class="profile-txt">
										<sec:authentication property="principal.member.nickname" />
										님
									</div>
							</a>
								<ul class="submenu">
									<li><a id="logoutid" href="/customLogout">로그아웃</a></li>
								</ul></li>
						</ul>
					</sec:authorize>
				</div>
			</div>
		</div>
	</div>
</body>
</html>