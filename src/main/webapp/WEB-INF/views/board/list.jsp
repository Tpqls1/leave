<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
    <script src="/resources/js/jquery-ui.min.js"></script>
    <script src="/resources/js/jquery-migrate-1.4.1.min.js"></script>
</head>
<body>
    <jsp:include page="/WEB-INF/views/includes/header.jsp"></jsp:include>
    <div class="main-container main">
        <div class="wrapper">
            <div class="main-content">
                <div class="left-content">
                    <div class="title-content">
                        <h2>트립 가이드</h2>
                    </div>
                    <div class="hashtag-content">
                        <div class="hashtag-tabmenu">
                            <ul class = "number-line-alignment" >
                                <li class = "active"> 전체보기 </a></li> 
                                <li> 국내여행 </li> 
                                <li> 국외여행 </li> 
                                <li> 도시여행 </li> 
                                <li> 맛집탐방 </li> 
                                <li> 데이트코스 </li> 
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="right-content">
                    <div class="search-content">
                    	<form action="/board/list" id="searchForm" method="get">
                        <select name="type" class="search-list">
                            <option value="" <c:out value="${pageMaker.cri.type == null? 'selected':''}"/>>전체</option>
					        <option value="T" <c:out value="${pageMaker.cri.type eq 'T'? 'selected':''}"/>>제목</option>
					        <option value="C" <c:out value="${pageMaker.cri.type eq 'C'? 'selected':''}"/>>내용</option>
					        <option value="W" <c:out value="${pageMaker.cri.type eq 'W'? 'selected':''}"/>>작성자</option>
					        <option value="TC" <c:out value="${pageMaker.cri.type eq 'TC'? 'selected':''}"/>>제목 or 내용</option>
					        <option value="TW" <c:out value="${pageMaker.cri.type eq 'TW'? 'selected':''}"/>>제목 or 작성자</option>
					        <option value="TCW" <c:out value="${pageMaker.cri.type eq 'TCW'? 'selected':''}"/>>제목 or 내용 or 작성자</option>
                          </select>
                        <input type="text" name="keyword" value="${pageMaker.cri.keyword}">
					    <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
					    <input type="hidden" name="amount" value="${pageMaker.cri.amount}">
                        <a href="#"><img src="/resources/images/search.png" class="search_img" alt="검색"></a>
                    	</form>
                    </div> 
                    <div class="right-top-content">
                        <div class="tagname-content">
                            <h1>#전체보기</h1>
                        </div>
                        <div class="post-content">
                         <a class="btn btn_type1" href="/board/post">+  포스팅</a>
                        </div>
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
	                                           <c:out value="${board.title}"/>
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
	                                       	<c:out value='${board.userid}' />
	                                       </div>
	                               </div>
                            </li>   
                       	</c:forEach>
                        </ul>
                    </div>
                    <!-- <div class="paging-content">
                        <ul class="pagination model">
                            <li><a href="#" class="first">처음 페이지</a></li>
                            <li><a href="#" class="arrow left"><</a></li>
                            <li><a href="#" class="active num">1</a></li>
                            <li><a href="#" class="num">2</a></li>
                            <li><a href="#" class="arrow right">></a></li>
                            <li><a href="#" class="last">마지막 페이지</a></li>
                        </ul>
					<div class="paging-content"> -->
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
				<!-- 페이징 처리를 위한 폼을 추가 : 확장성을 위해서 -> 앞으로 다른 파라미터를 추가되더라도
				같은 형태로 적용하려고 -->
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
    </div>
<jsp:include page="/WEB-INF/views/includes/footer.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/includes/sidebar.jsp"></jsp:include>
    <div id="top_btn">
        <a href="" onclick="goTop()"><img src="/resources/images/up-arrow.png"></a>
    </div>
</body>
<script src="http://code.jquery.com/jquery-latest.js"></script> 
<script>
$(document).ready(function(){
	var result = '<c:out value="${result}" />'; // controller로부터 수신된 결과를 저장
	console.log(result);
	
	var actionForm = $("#actionForm");
	$("#pagenate_button a").on("click", function(e) {
		e.preventDefault();
		console.log("click 눌림");
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.submit();	
	});
	
	// 상세보기 링크가 눌렸을 때 동작
	$(".move").on("click", function(e) {
		e.preventDefault();	// 디폴트 동작을 막고
		// form을 이용 : pageNum, amount 데이터가 있으므로
		actionForm.append("<input type='hidden' name='bno' value='"
			+ $(this).attr('href') + "'>");	// input 태그 bno를 추가
		actionForm.attr("action", "/board/get");	// /board/list -> /board/get
		actionForm.submit();	// 상세보기로 이동
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
							