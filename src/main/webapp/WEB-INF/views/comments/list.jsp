<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<div class="comment-area">
	<div class="comment-count">
		<h3>${comCnt}&nbsp;댓글</h3>
	</div>
	<c:forEach var="comment" items="${comments}">
	<div class="comment-view-content">
		<div class="comment-view">
			<div class="comment-left">
				<div class="user-img">
				<c:set var="cno" value="${comment.cno }"/>
					<c:choose>
						<c:when test="${comProfile[cno] != null}">
							<c:forEach var="img" items="${comProfile}">
								<c:if test="${img.key == cno}">
									<img class="profile"src="/display?fileName=${img.value}">
								</c:if>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<img class="profile"src="/resources/images/profile-img.jpeg">
						</c:otherwise>
					</c:choose>
				</div>
			</div>
			<div class="comment-right">
			<sec:authentication property="principal" var="pinfo"/>
				<div class="user-nickname">${comment.nickname}
				  <div class="frm-right">
						<c:if test="${pinfo.username == comment.userid}">
		            <button id="cmtUpdate" name="${comment.cno}" class="btn btn_type1" >수정</button>
		            <button id="cmtDelete" name="${comment.cno}" class="btn btn_type1" >삭제</button>
						</c:if>
		          </div>
				</div>
				<div class="user-comment">${comment.comment}</div>
				<div class="comment-provision">
					<div class="time"><fmt:formatDate value="${comment.comDate}"
						pattern="yyyy년 MM월 dd일 hh:mm"/></div>
				</div>
			</div>
		</div>
	</div>
	</c:forEach>
</div>