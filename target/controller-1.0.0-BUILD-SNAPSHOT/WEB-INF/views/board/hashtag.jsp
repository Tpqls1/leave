<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<ul class="upload-content">
	<c:forEach var="board" items="${list}" varStatus="status">
		<c:set var="bno" value="${board.bno }" />
		<li>
			<div class="list-box">
				<div class="img-view-item">
					<c:choose>
						<c:when test="${fileCallPath[bno] != null}">
							<c:forEach var="img" items="${fileCallPath}">
								<c:if test="${img.key == bno}">
									<img src="/display?fileName=${img.value}">
								</c:if>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<img src="/resources/images/noimage.png">
						</c:otherwise>
					</c:choose>
				</div>
				<div class="list-content-title">
					<p class="content-title">
						<a class="move content-title" href='<c:out value="${board.bno}"/>'>
							<c:out value="${board.title}" />
						</a>
					</p>
				</div>
				<div class="list-content-hashtag">
					<c:forEach var="category" items="${catList}">
						<c:if test="${category.bno == bno}">
							<p class="list-hashtag">
								<c:choose>
									<c:when test="${category.catno == 1}">
										<span class="hashtag-blue">국내여행</span>
									</c:when>
									<c:when test="${category.catno == 2}">
										<span class="hashtag-blue">국외여행</span>
									</c:when>
									<c:when test="${category.catno == 3}">
										<span class="hashtag-blue">도시여행</span>
									</c:when>
									<c:when test="${category.catno == 4}">
										<span class="hashtag-blue">맛집탐방</span>
									</c:when>
									<c:when test="${category.catno == 5}">
										<span class="hashtag-blue">데이트코스</span>
									</c:when>
								</c:choose>
							</p>
						</c:if>
					</c:forEach>
				</div>
			</div>
			<div class="list-user-profile">
				<div class="head-profile">
					<img class="profile" src="/resources/images/profile-img.jpeg">
				</div>
				<div class="profile-txt">
					<c:out value='${board.userid}' />
				</div>
			</div>
		</li>
	</c:forEach>
</ul>