<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

<%@ include file="/WEB-INF/views/includes/header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>여행의 즐거움 :: 떠나!</title>
<link rel="stylesheet" type="text/css" href="/resources/css/common.css">
<script src="/resources/js/jquery-3.5.1.min.js"></script>
<script src="/resources/js/jquery-user.js"></script>
<style>
.login-table tbody .login-border-none td{
	border: none;
	text-align: right;
}
.login-table tbody .login-border-none td p{
	color: red;
}
</style>
</head>

<div class="main-container">
	<div class="wrapper">
		<div class="login-content">
			<form role="form" method="post" action="/login">
				<table class="table login-table">
					<caption class="login-title">
						<h2>로그인</h2>
					</caption>
					<tbody>
						<tr>
							<th>아이디</th>
							<td><input class="form-control" placeholder="아이디를 입력해주세요."
								name="username" type="text" value="${result}" autofocus></td>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td><input class="form-control" placeholder="비밀번호를 입력해주세요."
								name="password" type="password" value=""></td>
						</tr>
						<tr>
							<td class="login-add-info" colspan="2"><label> <input
									name="remember-me" type="checkbox"> 로그인 상태 유지</td>							
							</label>
						</tr>
						<tr class="login-border-none">
						<td colspan="2"><h2>
								<p><c:out value="${error}" /></p>
							</h2></td>
						</tr>
					</tbody>
				</table>
				<div class="btn_form">
					<input class="btn btn_type3 btn-success" type="submit" value="로그인">
				</div>
				<div class="regist-link">
					아직 떠나닷컴의 회원이 아니신가요? <a href="/member/join">회원가입</a>
				</div>
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" />
			</form>
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
	$(".btn-success").on("click", function(e) {
		e.preventDefault();
		$("form").submit();
	});

	//로그인 관련 유효성검사
	function loginCheck() {

		//id pw 유효성 검사 정규식
		var idpw_RegExp = /^[a-zA-z0-9]{4,12}$/;

		//아이디 유효성검사    
		if (($("#userid").val() == null || $("#userid").val() == "")) {
			alert("아이디를 입력해주세요.")
			$("#userid").focus();
			return false;
		} else if (!idpw_RegExp.test($("#userid").val())) {
			alert("아이디는 4~12자의 영문 대소문자와 숫자의 조합으로 입력하여 주세요.");
			$("#userid").focus();
			return false;
		}

		//패스워드 유효성검사 
		if ($("#pw").val() == null || $("#pw").val() == "") {
			alert("비밀번호를 입력해주세요.");
			$("#pw").focus();
			return false;
		} else if (!idpw_RegExp.test($("#pw").val())) {
			alert("비밀번호는 4~12자의 영문 대소문자와 숫자의 조합으로 입력하여 주세요.");
			$("#pw").focus();
			console.log($("pw").val());
			return false;
		}
	}
</script>

<c:if test="${param.logout != null}">
	<script>
		$(document).ready(function() {
			alert("로그아웃 하였습니다.");
		});
	</script>
</c:if>
</html>