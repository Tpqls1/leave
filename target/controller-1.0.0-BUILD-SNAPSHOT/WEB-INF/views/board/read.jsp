<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>여행의 즐거움 :: 떠나!</title>
<link rel="stylesheet" type="text/css" href="/resources/css/common.css">
<link rel="stylesheet" href="/resources/css/swiper-bundle.min.css">
<script src="/resources/js/jquery-3.5.1.min.js"></script>
<script src="/resources/js/jquery-user.js"></script>
<script src="/resources/js/swiper-bundle.min.js"></script>
<style>
.bcolor-black {
	border: 5px solid black;
}

.slide-img-size .swiper-slide img {
	width: 640px;
	height: 640px;
}

.small-slide-size .swiper-slide img {
	width: 152.5px;
	height: 152.5px;
}

.swiper-button-next {
	background-color: black;
	color: white;
	padding: 40px 30px;
}

.swiper-button-next:active {
	background-color: rgba(50, 100, 255, 0.533);
}

.swiper-button-prev {
	background-color: black;
	color: white;
	padding: 40px 30px;
}

.swiper-button-prev:active {
	background-color: rgba(50, 100, 255, 0.533);
}

.svg-like {
	fill: powderblue;
}

.like-num p {
	color: powderblue;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/includes/header.jsp"></jsp:include>
	<div class="container">
		<div class="wrapper">
			<div class="search-content">
				<form action="/board/list" id="searchForm" method="get">
					<select name="type" class="search-list">
						<option value="TCW"
							<c:out value="${pageMaker.cri.type eq 'TCW'? 'selected':''}"/>>전체</option>
						<option value="T"
							<c:out value="${pageMaker.cri.type eq 'T'? 'selected':''}"/>>제목</option>
						<option value="C"
							<c:out value="${pageMaker.cri.type eq 'C'? 'selected':''}"/>>내용</option>
						<option value="W"
							<c:out value="${pageMaker.cri.type eq 'W'? 'selected':''}"/>>작성자</option>
						<option value="TC"
							<c:out value="${pageMaker.cri.type eq 'TC'? 'selected':''}"/>>제목/내용</option>
						<option value="TW"
							<c:out value="${pageMaker.cri.type eq 'TW'? 'selected':''}"/>>제목/작성자</option>
					</select> <input type="text" name="keyword" value="${pageMaker.cri.keyword}">
					<input type="hidden" name="pageNum"
						value="${pageMaker.cri.pageNum}"> <input type="hidden"
						name="amount" value="${pageMaker.cri.amount}"> <a href="#"><img
						src="/resources/images/search.png" class="search_img" alt="검색"></a>
				</form>
			</div>
			<div class="travel-content">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
					  <sec:authentication property="principal" var="pinfo"/>
					<input type="hidden" id="userid" name="userid" value="${pinfo.username}">
					<c:set var="nickname">
				  	  <sec:authentication property="principal.member.nickname" />
				    </c:set>
		  			<input id="nickname" type="hidden" name="nickname" value="${nickname}">
				<div class="image-gallery">
					<div class="bcolor-black swiper mySwiper2">
						<div class="swiper-wrapper slide-img-size">
							<c:choose>
								<c:when test="${thumbnailPath != null}">
									<div class="swiper-slide">
										<img src="/display?fileName=${thumbnailPath}" />
									</div>
								</c:when>
								<c:otherwise>
									<div class="swiper-slide">
										<img src="/resources/images/noimage.png" />
									</div>
								</c:otherwise>
							</c:choose>
							<c:forEach var="attach" items="${attachPath}">
								<div class="swiper-slide">
									<img src="/display?fileName=${attach}" />
								</div>
							</c:forEach>
						</div>
						<div class="swiper-button-next"></div>
						<div class="swiper-button-prev"></div>
						<div class="swiper-pagination bc-op"></div>
					</div>
					<div thumbsSlider="" class="bcolor-black swiper mySwiper">
						<div class="swiper-wrapper small-slide-size">
							<c:choose>
								<c:when test="${thumbnailPath != null}">
									<div class="swiper-slide">
										<img src="/display?fileName=${thumbnailPath}" />
									</div>
								</c:when>
								<c:otherwise>
									<div class="swiper-slide">
										<img src="/resources/images/noimage.png" />
									</div>
								</c:otherwise>
							</c:choose>
							<c:forEach var="attach" items="${attachPath}">
								<div class="swiper-slide">
									<img src="/display?fileName=${attach}" />
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
				<div class="image-gallery-info">
					<div class="user-info">
						<div class="content-top-form">
							<a href="profile.html">
								<div class="user-photo">
									<img class="profile" src="/resources/images/profile-img.jpeg">
								</div>
								<p class="user-name">${board.nickname}</p>
							</a> 
							<sec:authorize access="isAuthenticated()">
							</sec:authorize>
							<a href="/board/update?bno=${board.bno}"
								class="btn btn_type2 mr-100">게시글수정</a>
						</div>
					</div>
					<div class="content">
						<h1 class="title">
							<c:out value="${board.title}" />
						</h1>
						<div class="detail-hashtag">
							<c:forEach var="cat" items="${categories}">
								<c:choose>
									<c:when test="${cat.catno == 1}">
										<a href="#" class="topicItem">국내여행</a>
									</c:when>
									<c:when test="${cat.catno == 2}">
										<a href="#" class="topicItem">국외여행</a>
									</c:when>
									<c:when test="${cat.catno == 3}">
										<a href="#" class="topicItem">도시여행</a>
									</c:when>
									<c:when test="${cat.catno == 4}">
										<a href="#" class="topicItem">맛집탐방</a>
									</c:when>
									<c:when test="${cat.catno == 5}">
										<a href="#" class="topicItem">데이트코스</a>
									</c:when>
								</c:choose>
							</c:forEach>
						</div>
						<div class="content-info">
							<c:out value="${board.content}" />
						</div>
						<div class="topicItem-list">
							<ul>
								<c:forEach var="tag" items="${tagList}">
									<li><a class="tag" id="${tag.tagName}" href="#list-content">${tag.tagName}</a></li>
								</c:forEach>
							</ul>
						</div>
						<div class="time">
							작성일:
							<fmt:formatDate value="${board.regDate}"
								pattern="yyyy년 MM월 dd일 hh:mm" />
						</div>
						<div class="comment-area">
								<div class="comment-count">
									<h3>${board.comCnt}&nbsp;댓글</h3>
								</div>
							<c:forEach var="comment" items="${comments}">
							<div class="comment-view-content">
								<div class="comment-view">
									<div class="comment-left">
										<div class="user-img">
											<img class="proflie" src="/resources/images/profile-img.jpeg" />
										</div>
									</div>
									<div class="comment-right">
										<div class="user-nickname">${comment.nickname}
										  <div class="frm-right">
								            <button id="cmtUpdate" name="${comment.cno}" class="btn btn_type1" >수정</button>
								            <button id="cmtDelete" name="${comment.cno}" class="btn btn_type1" >삭제</button>
								          </div>
										</div>
										<div class="user-comment">${comment.comment}</div>
										<div class="comment-provision">
										<div class="time">
										<fmt:formatDate value="${comment.comDate}"
											pattern="yyyy년 MM월 dd일 hh:mm"/></div>
										</div>
									</div>
								</div>
							</div>
							</c:forEach>
						</div>
					</div>
					<!-- 댓글 작성 --> 
			  		<div class="comments-form">
		            	<div class="textarea">
			              	<textarea placeholder="댓글을 입력해주세요"></textarea>
			              	<a href="#" class="btn blue-color-btn">확인</a>
		            	</div>
		            <!-- 좋아요 -->
		            <div class="like">
		              <button id="like-click">
		              	<%-- <c:choose>
		              		<c:when test="${like != null}">
		              		 <c:set var="like" items="like-img svg-like"/>
		              		</c:when>
		              		<c:otherwise>
		              		 <c:set var="like" items="like-img"/>
		              		</c:otherwise>
		              	</c:choose> --%>
		                <svg width="32" height="32" viewBox="0 0 256 256" >
		                  <path class="like-img"
		                    d="M21.333 229.333V95.411h54.814l74.519-74.078 34.41 34.207-17.826 39.87H240l-34.544 133.923H21.333zM150.666 51.637L86 115.919v91.987h102.73l23.49-91.067h-78.138l25.285-56.554-8.701-8.648zm-86.222 65.202H42.89v91.067h21.555v-91.067z"
		                    fill="#34475e" class="transform-group"></path>
		                </svg>
		              </button>
		              <div class="count like-count">
		                <p>${board.likeCnt}</p> 
		              </div>
		            </div>
		          </div>
				</div>
			</div>
			<div id="list-content" class="list-content">
				<div class="sub-title">
					<h3>관련 추천 게시글</h3>
				</div>
				<ul class="upload-content">
					<c:forEach var="board" items="${list}" varStatus="status">
					<c:set var="bno" value="${board.bno }"/>
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
										<a class="move content-title"
											href='<c:out value="${board.bno}"/>'> <c:out
												value="${board.title}" />
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
			</div>
					<form id="actionForm" action="/board/list" method="get">
						<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
						<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
						<!--  검색 기능 -->
						<input type="hidden" name="type" value="${pageMaker.cri.type}">
						<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
						<input type="hidden" name="catno" value="${catno}">
					</form>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/includes/sidebar.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/includes/footer.jsp"></jsp:include>
	<div id="top_btn">
		<a href="" onclick="goTop()"><img
			src="/resources/images/up-arrow.png"></a>
	</div>
<script>
$(document).ready(function() {
	var csrfHeaderName = "${_csrf.headerName}";
	var csrfTokenValue = "${_csrf.token}";
	
	//	검색 폼
	var searchForm = $("#searchForm");
	$(".search_img").on("click", function(e) {
		e.preventDefault();
		if (!searchForm.find("option:selected").val()) {
			alert("검색 종류를 선택하세요.");
			return false;
		}
		if (!searchForm.find("input[name='keyword']").val()) {
			alert("키워드를 입력하세요.");
			return false;
		}
		searchForm.find("input[name='pageNum']").val("1");
		searchForm.submit();
	});
	
	var actionForm = $("#actionForm");
	
	
	// 상세보기 
	$(".list-content").on("click", ".move", function(e) {
		e.preventDefault();
		actionForm.append("<input type='hidden' name='bno' value='"
			+ $(this).attr('href') + "'>");	// input 태그 bno를 추가
		actionForm.attr("action", "/board/read");	// /board/list -> /board/read
		actionForm.submit();	// 상세보기로 이동
	});
	
	
	//	댓글 등록
	$(".blue-color-btn").on("click", function(e){
		e.preventDefault();	
		var bno = '<c:out value="${board.bno}"/>';
		var nickname = $("#nickname").val();
		var userid = $("#userid").val();
		var comment = $(".textarea textarea").val();
		if(comment == null | comment == ''){
			alert("댓글을 입력해주세요");
			$(".textarea textarea").focus();
			return false;
		}
		
		$.ajax({
			url: '/comments/insert',
			type : "post",
			//	userid 추가
            data : {"bno" : bno, "comment" : comment, "nickname": nickname, "userid": userid},
            beforeSend: function(xhr){
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			},
            success : function(data){ 
               $(".comment-area").replaceWith(data);
            },
            error : function(data){
        	alert('error');
            }
		});
	});
	
	//	댓글 삭제
	$(".content").on("click","#cmtDelete", function(e){
	if(confirm('댓글 삭제')){
		var bno = '<c:out value="${board.bno}"/>';
		var cno = $(this).attr("name");
		$.ajax({
			url: '/comments/delete',
			type : "post",
            data : {"cno" : cno, "bno": bno},
            beforeSend: function(xhr){
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			},
            success : function(data){ 
               $(".comment-area").replaceWith(data);
            },
            error : function(data){
        	alert('error');
            }
		});// $.ajax
	}
	});
	
	//	댓글 수정
	$(".content").on("click","#cmtUpdate", function(e){
		var comment = $(this).closest(".comment-right").find(".user-comment");
		var commentVal = $(this).closest(".comment-right").find(".user-comment").text();
		var cno = $(this).attr("name");
		str = "<div class='comment-update-form'><div class='textarea'><textarea id='textVal'>"+ commentVal +"</textarea></div>";
		str += "<button id='btnConfirm' name='"+ cno +"' class='btn'>확인</button>";
		str += "<button id='btnCancle' name='"+ cno +"' style='margin-left: 10px' class='btn'>취소</button>"
		str += "<input type='hidden' id='commentVal' value='"+ commentVal +"'></div>";
		comment.replaceWith(str);
	});// 수정/삭제

	//	수정취소 버튼
	$(".content").on("click","#btnCancle",function(e){
		var comment = $(this).closest(".comment-update-form");
		var commentVal = $(this).closest(".comment-update-form").find("#commentVal").val();
		console.log(commentVal);
		str = "<div class='user-comment'>"+ commentVal +"</div>";
		comment.replaceWith(str);
	});
	
	//	수정확인 버튼
	$(".content").on("click","#btnConfirm",function(e){
		if(confirm('댓글을 수정?')){
			var cno = $(this).attr("name");
			var bno = '<c:out value="${board.bno}"/>';
			var userid = $("#userid").val();
			var comment = $(this).closest(".comment-update-form").find("#textVal").val();
			if(comment == null | comment == ''){
				alert("내용을 입력해주세요");
				$(this).closest(".comment-update-form").find("#textVal").focus();
				return false;
			}
			
			$.ajax({
				url: '/comments/update',
				type : "post",
	            data : {"cno" : cno, "comment" : comment,"bno": bno ,"userid":userid},
	            beforeSend: function(xhr){
					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
				},
	            success : function(data){ 
	               $(".comment-area").replaceWith(data);
	            },
	            error : function(data){
	        	alert('error');
	            }
			});// $.ajax
		}
	});
	
	//	좋아요 버튼
	$(".comments-form").on("click",".like", function(e){
		var userid = $("#userid").val();
		var bno = '<c:out value="${board.bno}"/>';
		$.ajax({
			url: '/board/like',
			type : "post",
			//	userid 추가
            data : {"userid": userid, "bno": bno},
            beforeSend: function(xhr){
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			},
            success : function(data){ 
               $(".like").replaceWith(data);
            },
            error : function(data){
        	alert('error');
            }
		});// $.ajax		
	});
	
	//	해시태그 검색
	$(".topicItem-list").on("click", ".tag", function(e){
		var tagName = $(this).attr("id");
		$.ajax({
			url: '/board/hashtag',
			type: 'get',
			data: {"tagName": tagName},
			beforeSend: function(xhr){
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			},
			success: function(data){
				$(".upload-content").replaceWith(data);
			},
			error : function(data){
				alert('error');
			}
		});	//	$.ajax
	})
	
});// $(document).ready
</script>
<script>
	/*swiper js*/
	var swiper = new Swiper(".mySwiper", {
		spaceBetween : 10,
		slidesPerView : 4,
		freeMode : true,
		watchSlidesProgress : true,
	});
	var swiper2 = new Swiper(".mySwiper2", {
		spaceBetween : 10,
		navigation : {
			nextEl : ".swiper-button-next",
			prevEl : ".swiper-button-prev",
		},
		thumbs : {
			swiper : swiper,
		},
		pagination : {
			el : ".swiper-pagination",
			type : "fraction",
		},
	});
</script>
</body>
</html>