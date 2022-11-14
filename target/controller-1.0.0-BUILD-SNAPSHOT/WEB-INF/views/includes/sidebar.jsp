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
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>여행의 즐거움 :: 떠나!</title>
</head>
<body>
	<div id="quick_menu">
		<div class="quick_img_wrapper">
			<a href="#" target="_blank"><img class="quick_img"
				src="/resources/images/side-img.jpg"></a>
		</div>
		<div class="side_menu">
			<ul>
			<c:set var="userid">
				<sec:authentication property="principal.member.userid" />
			</c:set>
				<!-- 로그아웃 상태의 사이드바 메뉴 -->
				<sec:authorize access="isAnonymous()">
					<li><a href="/customLogin" class="link_menu" target="_blank">로그인</a></li>
					<li><a href="/member/join" class="link_menu" target="_blank">회원가입</a></li>
				</sec:authorize>
				<sec:authorize access="isAuthenticated()">
					<li><a href="/my/list?userid=${userid}" class="link_menu" target="_blank">마이페이지</a></li>
					<li><a href="/board/post" class="link_menu" target="_blank">포스트하기</a></li>
				</sec:authorize>
			</ul>
		</div>
	</div>



	<!--     <div id="top_btn">
        <a href="" onclick="goTop()"><img src="/resources/images/up-arrow.png"></a>
    </div> -->
</body>
</html>