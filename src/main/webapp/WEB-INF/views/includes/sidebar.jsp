<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<div id="quick_menu">
	<div class="quick_img_wrapper">
		<a href="#" target="_blank"><img class="quick_img"
			src="/resources/images/side-img.jpg"></a>
	</div>
	<div class="side_menu">
		<ul>
			<sec:authorize access="isAnonymous()">
				<li><a href="/customLogin" class="link_menu" target="_blank">로그인</a></li>
				<li><a href="/member/join" class="link_menu" target="_blank">회원가입</a></li>
			</sec:authorize>
			<sec:authorize access="isAuthenticated()">
				<li><a href="/my/list" class="link_menu"
					target="_blank">마이페이지</a></li>
				<li><a href="/board/post" class="link_menu" target="_blank">포스트하기</a></li>
			</sec:authorize>
		</ul>
	</div>
</div>