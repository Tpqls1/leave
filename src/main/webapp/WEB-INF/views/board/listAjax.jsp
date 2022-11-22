<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
                <div class="right-content">
                    	<form action="/board/list" id="searchForm" method="get">
                    <div class="search-content">
                        <select name="type" class="search-list">
					        <option value="TCW" <c:out value="${pageMaker.cri.type eq 'TCW'? 'selected':''}"/>>전체</option>
					        <option value="T" <c:out value="${pageMaker.cri.type eq 'T'? 'selected':''}"/>>제목</option>
					        <option value="C" <c:out value="${pageMaker.cri.type eq 'C'? 'selected':''}"/>>내용</option>
					        <option value="W" <c:out value="${pageMaker.cri.type eq 'W'? 'selected':''}"/>>작성자</option>
					        <option value="TC" <c:out value="${pageMaker.cri.type eq 'TC'? 'selected':''}"/>>제목 or 내용</option>
					        <option value="TW" <c:out value="${pageMaker.cri.type eq 'TW'? 'selected':''}"/>>제목 or 작성자</option>
                          </select>
                        <input type="text" placeholder="제목, 내용, 작성자로 검색" name="keyword" value="${pageMaker.cri.keyword}">
					    <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
					    <input type="hidden" name="amount" value="${pageMaker.cri.amount}">
                        <a href="#"><img src="/resources/images/search.png" class="search_img" alt="검색"></a>
                    </div> 
                    	</form>
                    <div class="right-top-content">
                        <div class="tagname-content">
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
	                                       	<c:out value='${board.userid}' />
	                                       </div>
	                               </div>
                            </li>   
                       	</c:forEach>
                        </ul>
                    </div>
				</div>