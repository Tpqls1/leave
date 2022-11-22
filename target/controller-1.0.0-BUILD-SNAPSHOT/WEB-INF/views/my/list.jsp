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
<script src="/resources/js/jquery-click2.js"></script>
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
							<li><a class="myContent-choice" href="/my/list">
									나의 게시물 </a></li>
							<c:set var="userid">
								<sec:authentication property="principal.member.userid" />
							</c:set>
							<li><a href="/member/info?userid=${userid}"> 회원정보 </a></li>
						</ul>
					</div>
					<div class="myProfile-right-content">
						<div class="myProfile-tabmenu">
							<ul class="number-myProfile-alignment">
								<li class="active"><a> 작성글 </a></li>
								<!--/board/list?catno="1"-->
								<li><a > 댓글단 글 </a></li>
								<!--/board/list?catno="2"-->
								<li><a > 좋아요 </a></li>
								<!--/board/list?catno="3"-->
							</ul>
						</div>
						<div class="right-content">
                    <div class="search-content">
                    	<form action="/board/list" id="searchForm" method="get">
                        <select name="type" class="search-list">
					        <option value="TCW" <c:out value="${pageMaker.cri.type eq 'TCW'? 'selected':''}"/>>전체</option>
					        <option value="T" <c:out value="${pageMaker.cri.type eq 'T'? 'selected':''}"/>>제목</option>
					        <option value="C" <c:out value="${pageMaker.cri.type eq 'C'? 'selected':''}"/>>내용</option>
					        <option value="W" <c:out value="${pageMaker.cri.type eq 'W'? 'selected':''}"/>>작성자</option>
					        <option value="TC" <c:out value="${pageMaker.cri.type eq 'TC'? 'selected':''}"/>>제목/내용</option>
					        <option value="TW" <c:out value="${pageMaker.cri.type eq 'TW'? 'selected':''}"/>>제목/작성자</option>
                          </select>
                        <input type="text" name="keyword" value="${pageMaker.cri.keyword}" >
					    <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
					    <input type="hidden" name="amount" value="${pageMaker.cri.amount}">
                        <a href="#"><img src="/resources/images/search.png" class="search_img" alt="검색"></a>
                    	</form>
                    </div> 
                    <div class="list-content">
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
	                                       <img class="profile"src="/resources/images/profile-img.jpeg">
	                                       </div>
	                                       <div class="profile-txt">                   
	                                       	<c:out value='${board.nickname}' />
	                                       </div>
	                               </div>
                            </li>   
                       	</c:forEach>
                        </ul>
                    </div>
					<div class="paging-content">
						<ul class="pagination model">
						<c:if test="${pageMaker.prev}">
							<li id="pagenate_button previous"><a href="${pageMaker.startPage - 1}" class="arrow left">이전</a></li>	
						</c:if>
						<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
							<li id="pagenate_button"><a href="${num}" class="${pageMaker.cri.pageNum == num ? 'active' : ''} num">${num}</a></li>
						</c:forEach>
						<c:if test="${pageMaker.next}">
							<li id="pagenate_button next"><a href="${pageMaker.endPage + 1}" class="arrow right">다음</a></li>
						</c:if>
						</ul>
					</div>
	                    </div>
					<form id="actionForm" action="/board/list" method="get">
						<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
						<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
						<!-- 추가 된다. -> 검색 기능 -->
						<input type="hidden" name="type" value="${pageMaker.cri.type}">
						<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
					</form>
	                </div>
	            </div>
			</div>
					</div>
					<!--/right-content div -->

				</div>
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
<script>
$(document).ready(function(){
	$(".number-myProfile-alignment").children().on("click",function(e){
		$(".number-myProfile-alignment li").removeClass("active");
		$(this).attr('class','active');
		var content = $(this).text();
		console.log(content);
		
		var pageMaker = '<c:out value="${pageMaker}"/>';
		pageMaker.pageNum = 1;
		$.ajax({
			if(content == ){
			 url : '/my/written',
			}else if(){
			 url : '/my/written',
			}else{
			 url : '/my/written',
			}
             type : "get",
             data : {"cri" : pageMaker, "userid": userid},
             success : function(data){
            	 alert(data);
            	$(".myProfile-right-content").replaceWith(data);
             },
             error : function(data){
           	 alert('error');
             }
		});//	end ajax
	}// end of clickEvent
});
</script>
</html>