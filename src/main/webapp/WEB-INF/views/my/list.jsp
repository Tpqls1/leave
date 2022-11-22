<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
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
					<a href="/my/list?userid=${userid}">
						<div class="user-photo">
							<c:choose>
								<c:when test="${profile == null}">
									<img class="profile" src="/resources/images/profile-img.jpeg">
								</c:when>
								<c:otherwise>
									<img class="profile" src="/display?fileName=${profile}">
								</c:otherwise>
							</c:choose>
						</div>
						<div class="user-profileInfo">
							<div class="user-name">
								<sec:authentication property="principal.member.nickname" />
								님
							</div>
							<div class="post-count">
								<h4>${boardCnt}</h4>
								게시물
							</div>
						</div>
					</a>
				</div>
				<div class="myProfile-main">
					<div class="myProfile-left-content">
						<ul class="number-line-alignment">
							<li><a class="myContent-choice" href="/my/list?userid=${userid}">
									나의 게시물 </a></li>
							<c:set var="userid">
								<sec:authentication property="principal.member.userid" />
							</c:set>
							<li><a href="/member/info?userid=${userid}"> 회원정보 </a></li>
						</ul>
					</div>
					<div class="myProfile-right-content">
						<div class="right-content">
						<div class="myProfile-tabmenu">
							<ul class="number-myProfile-alignment">
								<li class="active"><a href="0"> 작성글 </a></li>
								<li><a href="1"> 댓글단 글 </a></li>
								<li><a href="2"> 좋아요 </a></li>
							</ul>
						</div>
                    	<form action="/board/list" id="searchForm" method="get">
                    <div class="search-content">
                        <select name="type" class="search-list">
					        <option value="TCW" <c:out value="${pageMaker.cri.type eq 'TCW'? 'selected':''}"/>>전체</option>
					        <option value="T" <c:out value="${pageMaker.cri.type eq 'T'? 'selected':''}"/>>제목</option>
					        <option value="C" <c:out value="${pageMaker.cri.type eq 'C'? 'selected':''}"/>>내용</option>
					        <option value="W" <c:out value="${pageMaker.cri.type eq 'W'? 'selected':''}"/>>작성자</option>
					        <option value="TC" <c:out value="${pageMaker.cri.type eq 'TC'? 'selected':''}"/>>제목/내용</option>
					        <option value="TW" <c:out value="${pageMaker.cri.type eq 'TW'? 'selected':''}"/>>제목/작성자</option>
                          </select>
                        <input type="text" placeholder="제목, 내용, 작성자로 검색" name="keyword" value="${pageMaker.cri.keyword}" >
					    <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
					    <input type="hidden" name="amount" value="${pageMaker.cri.amount}">
                        <a href="#"><img src="/resources/images/search.png" class="search_img" alt="검색"></a>
                    </div> 
                    	</form>
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
                                       		<c:choose>
			                                   	 <c:when test="${profilePath[bno] != null}">
				                                   <c:forEach var="img" items="${profilePath}">
				                                   	 <c:if test="${img.key == bno}">
		                                       			<img class="profile"src="/display?fileName=${img.value}">
				                                   	 </c:if>
				                                   </c:forEach>
			                                   	 </c:when>
		                                   		 <c:otherwise>
		                                       			<img class="profile"src="/resources/images/profile-img.jpeg">
		                                   		 </c:otherwise>
		                                     </c:choose>
	                                       </div>
	                                       <div class="profile-txt">                   
	                                       	<c:out value='${board.nickname}' />
	                                       </div>
	                               </div>
                            </li>   
                       	</c:forEach>
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
		e.preventDefault();
		$(".number-myProfile-alignment li").removeClass("active");
		$(this).attr('class','active');
		var num = $(this).find("a").attr("href");
		var userid = '${userid}';
		var pageMaker = '<c:out value="${pageMaker}"/>';
		pageMaker.pageNum = 1;
		var url = '';
		if(num == 0){
			url = '/my/listAjax';	
		}else if(num == 1){
			url = '/my/comment';	
		}else{
			url = '/my/like';	
		}
		
		$.ajax({
			 url : url,
             type : "get",
             data : {"cri" : pageMaker, "userid": userid},
             success : function(data){
            	$(".list-content").replaceWith(data);
             },
             error : function(data){
           	 alert('error');
             }
		});//	end ajax
	});// end of clickEvent
	
	var actionForm = $("#actionForm");
	$("#pagenate_button a").on("click", function(e) {
		e.preventDefault();
		console.log("click 눌림");
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.submit();	
	});
	
	// 상세보기 
	$(".right-content").on("click",".move", function(e) {
		e.preventDefault();	
		// form 이용 : pageNum, amount
		actionForm.append("<input type='hidden' name='bno' value='"
			+ $(this).attr('href') + "'>");	// input 태그 bno를 추가
		actionForm.attr("action", "/board/read");
		actionForm.submit();	
	});
	
	// 검색부분에 대한 폼을 변수에 저장
	var searchForm = $("#searchForm");
	// 검색버튼에 click 이벤트를 추가
	$(".search_img").on("click", function(e) {
		e.preventDefault();
		// 유효성 검사
		if(!searchForm.find("option:selected").val()) {	
			alert("검색 종류를 선택하세요.");
			return false;	
		}
		if(!searchForm.find("input[name='keyword']").val()) {	
			alert("키워드를 입력하세요.");
			return false;	
		}
		// 검색을 요청했으면 pageNum = 1로 변경한다.
		searchForm.find("input[name='pageNum']").val("1");
		searchForm.submit();
	});
});
</script>
</html>