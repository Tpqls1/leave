<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

<%@ include file="/WEB-INF/views/includes/header.jsp"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>여행의 즐거움 :: 떠나!</title>
<link rel="stylesheet" type="text/css" href="/resources/css/common.css">
<script src="/resources/js/jquery-3.5.1.min.js"></script>
<script src="/resources/js/jquery-user.js"></script>
</head>
<body>
	<div class="main-container">
		<div class="wrapper">
			<div class="myProfile-content">
				<div class="user-info">
					<a href="/my/list">
						<div class="user-photo">
							<img class="profile" src="/resources/images/profile-img.jpeg">
						</div>
						<div class="user-profileInfo">
							<div class="user-name">
								<sec:authentication property="principal.member.nickname" />
								님
							</div>
							<div class="post-count">
								<h4>2</h4>
								게시물
							</div>
						</div>
					</a>
				</div>
				<div class="myProfile-main">
					<div class="myProfile-left-content">
						<ul class="number-line-alignment">
							<li><a href="/my/list"> 나의 게시물 </a></li>
							<li><a class="myContent-choice" href="/member/info">
									회원정보 </a></li>
						</ul>
					</div>
					<div class="memberInfo-right-content">
						<table class="table mem_info_table">
							<caption class="">
								<h2>회원정보</h2>
							</caption>
							<tbody>
								<tr>
									<th>이름</th>
									<td>${member.username}</td>
								</tr>
								<tr>
									<th>아이디</th>
									<td>${member.userid}</td>
								</tr>
								<tr>
									<th>닉네임</th>
									<td>${member.nickname}</td>
								</tr>
								<tr>
									<th>이메일</th>
									<td>${member.email}</td>
								</tr>
								<tr>
									<th>우편번호 / 주소</th>
									<td>${member.postCode} / ${member.addr}</td>
								</tr>
								<tr>
									<th>상세주소</th>
									<td>${member.detAddr}</td>
								</tr>
								<tr>
									<th>생년월일</th>
									<td>${member.birth_date}</td>
								</tr>
								<tr>
									<th>전화번호</th>
									<td>${member.phone}</td>
								</tr>
								<tr>
									<th>성별</th>
									<td>${member.gender}</td>
								</tr>
							</tbody>
						</table>
						<div class="member_Info_btnForm">
							<c:set var="userid">
								<sec:authentication property="principal.member.userid" />
							</c:set>
							<a class="btn btn_type3" href="/member/update?userid=${userid}">회원정보수정</a>
						</div>
					</div>
					<!--/right-content div -->

				</div>
			</div>


		</div>
	</div>

	<%@ include file="/WEB-INF/views/includes/footer.jsp"%>

	<%@ include file="/WEB-INF/views/includes/sidebar.jsp"%>


	<div id="top_btn">
		<a href="" onclick="goTop()"><img
			src="/resources/images/up-arrow.png"></a>
	</div>
</body>
</html>