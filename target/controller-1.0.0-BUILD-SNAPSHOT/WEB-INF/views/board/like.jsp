<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
 <!-- 좋아요 -->
<div class="like">
  <button id="like-click">
    <svg width="32" height="32" viewBox="0 0 256 256" >
      <c:choose>
      	<c:when test="${result > 0}">
	      <path class="like-img svg-like" 
	        d="M21.333 229.333V95.411h54.814l74.519-74.078 34.41 34.207-17.826 39.87H240l-34.544 133.923H21.333zM150.666 51.637L86 115.919v91.987h102.73l23.49-91.067h-78.138l25.285-56.554-8.701-8.648zm-86.222 65.202H42.89v91.067h21.555v-91.067z"
	        fill="#34475e" class="transform-group"></path>
      	</c:when>
      	<c:otherwise>
	      <path class="like-img" 
	        d="M21.333 229.333V95.411h54.814l74.519-74.078 34.41 34.207-17.826 39.87H240l-34.544 133.923H21.333zM150.666 51.637L86 115.919v91.987h102.73l23.49-91.067h-78.138l25.285-56.554-8.701-8.648zm-86.222 65.202H42.89v91.067h21.555v-91.067z"
	        fill="#34475e" class="transform-group"></path>
      	</c:otherwise>
      </c:choose>
    </svg>
  </button>
  <div class="count like-count">
    <p>${likeCnt}</p> 
  </div>
</div>