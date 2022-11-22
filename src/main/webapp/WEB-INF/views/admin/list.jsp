<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s"%>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="keywords"
	content="wrappixel, admin dashboard, html css dashboard, web dashboard, bootstrap 4 admin, bootstrap 4, css3 dashboard, bootstrap 4 dashboard, severny admin bootstrap 4 dashboard, frontend, responsive bootstrap 4 admin template, pixel  design, pixel  dashboard bootstrap 4 dashboard template" />
<meta name="description"
	content="Pixel Admin is powerful and clean admin dashboard template, inpired from Bootstrap Framework" />
<meta name="robots" content="noindex,nofollow" />
<title>여행의 즐거움 :: 떠나!</title>
<link rel="canonical"
	href="https://www.wrappixel.com/templates/pixel-admin-lite/" />
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="https://wrappixel.com/demos/free-admin-templates/all-lite-landing-pages/assets/images/logos/pixel-favicon.png" />
<!-- Bootstrap Core CSS -->
<link href="/resources/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet" />
<!-- Menu CSS -->
<link
	href="/resources/plugins/bower_components/sidebar-nav/dist/sidebar-nav.min.css"
	rel="stylesheet" />
<!-- toast CSS -->
<link
	href="/resources/plugins/bower_components/toast-master/css/jquery.toast.css"
	rel="stylesheet" />
<!-- morris CSS -->
<link href="/resources/plugins/bower_components/morrisjs/morris.css"
	rel="stylesheet" />
<!-- animation CSS -->
<link href="/resources/css/animate.css" rel="stylesheet" />
<!-- Custom CSS -->
<link href="/resources/css/style.css" rel="stylesheet" />
<!-- color CSS -->
<link href="/resources/css/colors/blue-dark.css" id="theme"
	rel="stylesheet" />
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<script type="text/javascript">
	$(document).ready(
			function() {

				$("#logoutid").click(
						function(e) {
							e.preventDefault();
							//alert("버튼 작동");
							$.ajax({
								type : "POST",
								url : "/customLogout",
								beforeSend : function(xhr) {
									xhr.setRequestHeader("${_csrf.headerName}",
											"${_csrf.token}");
								},
								success : function(data) {
									console.log(data);
									location.href = "/";
								}
							}); // ajax 
						});
				
				
				var actionForm = $("#actionForm");
				// 페이징 링크가 눌리면 페이지 이동 처리
				$(".pagenate_button a").on("click", function(e) {
					// $(this) : 눌린 링크(a)
					e.preventDefault(); // 우선 디폴트 동작을 막고(서버로 전송을 막는다)
					
					e.stopPropagation();	// 카페 확인 추가
					
					console.log("click 눌림");
					
					actionForm.find("input[name='pageNum']").val($(this).attr("href"));
					actionForm.submit();
				});
				
				// 상세보기 링크가 눌렸을 때 동작
				$(".move").on("click", function(e) {
					e.preventDefault(); // 디폴트 동작을 막고
					// form을 이용 : pageNum, amount 데이터가 있으므로
					actionForm.append("<input type='hidden' name='bno' value='"
									+ $(this).attr('href')+ "'>"); // input 태그 bno를 추가
					actionForm.attr("action","/admin/get"); // /board/list -> /board/get
					actionForm.submit(); // 상세보기로 이동
				});

	});
	
	
	
	
</script>
</head>

<body>
	<!-- Preloader -->
	<div class="preloader">
		<div class="cssload-speeding-wheel"></div>
	</div>
	<div id="wrapper">
		<!-- Navigation -->
		<nav class="navbar navbar-default navbar-static-top m-b-0">
			<div class="navbar-header">
				<a class="navbar-toggle hidden-sm hidden-md hidden-lg"
					href="javascript:void(0)" data-toggle="collapse"
					data-target=".navbar-collapse"><i class="fa fa-bars"></i></a>
				<div class="top-left-part">
					<a class="logo" href="/admin/index">
						<div class="logo-content">
							<img src="/resources/plugins/images/admin-logo.png" alt="home" />
						</div>
					</a>
				</div>

				<ul class="nav navbar-top-links navbar-right pull-right">
					<li><a class="profile-pic" href="/admin/index"> <img
							src="/resources/plugins/images/users/admin_profile_img.jpeg"
							alt="user-img" width="36" class="img-circle" /> <b
							class="hidden-xs"><sec:authentication
									property="principal.member.nickname" /> 님</b>
							<button class="btn btn-type1 ma-lf-20" id="logoutid"
								onclick="/customLogout">로그아웃</button>
					</a></li>
				</ul>
			</div>
			<!-- /.navbar-header -->
			<!-- /.navbar-top-links -->
			<!-- /.navbar-static-side -->
		</nav>

		<!-- Left navbar-header -->
		<div class="navbar-default sidebar" role="navigation">
			<div class="sidebar-nav navbar-collapse slimscrollsidebar">
				<ul class="nav" id="side-menu">
					<li style="padding: 10px 0 0"><a href="/admin/index"
						class="waves-effect"> <i class="fa fa-clock-o fa-fw"
							aria-hidden="true"></i> <span class="hide-menu">방문자 수</span>
					</a></li>
					<c:set var="userid">
						<sec:authentication property="principal.member.userid" />
					</c:set>
					<li><a href="/admin/info?userid=${userid}"
						class="waves-effect"> <i class="fa fa-user fa-fw"
							aria-hidden="true"></i> <span class="hide-menu">관리자 정보</span>
					</a></li>
					<li><a href="/admin/memberList" class="waves-effect"> <i
							class="fa fa-male fa-fw" aria-hidden="true"></i> <span
							class="hide-menu">회원정보</span>
					</a></li>
					<li><a href="/admin/list" class="waves-effect"> <i
							class="fa fa-folder fa-fw" aria-hidden="true"></i> <span
							class="hide-menu">게시글목록</span>
					</a></li>
				</ul>
			</div>
		</div>
		<!-- Left navbar-header end -->
		<!-- Page Content -->
		<div id="page-wrapper">
			<div class="container-fluid">
				<div class="row bg-title">
					<div class="page-option">
						<h4 class="page-title">게시글목록</h4>
						<div class="row">
					<div class="col-lg-12">
						<form id='searchForm' action="/admin/memberList" method='get'>
							<select name='type'>
								<option value="N"
									<c:out value="${pageMaker.cri.type eq 'T'?'selected':''}"/>>제목</option>
								<option value="U"
									<c:out value="${pageMaker.cri.type eq 'N'?'selected':''}"/>>닉네임</option>
								
							</select> <input type='text' name='keyword'
								value='${pageMaker.cri.keyword}' /> <input type='hidden'
								name='pageNum' value='${pageMaker.cri.pageNum}' /> <input
								type='hidden' name='amount' value='${pageMaker.cri.amount}' />
							<button class='btn btn-default'>Search</button>
						</form>
					</div>
				</div>
					</div>

					<!-- /.col-lg-12 -->
				</div>
				<!-- /row -->
				<div class="row">
					<div class="col-sm-12">
						<div class="white-box">
							<h3 class="box-title">게시글목록</h3>
							<div class="table-responsive">
								<table class="table">
									<thead>
										<tr>
											<th>순번</th>
											<th>닉네임</th>
											<th>제목</th>
											<th>작성일</th>
											<th>댓글수</th>
										</tr>
									</thead>
									<c:forEach items="${list}" var="board">
										<tr>
											<td><c:out value="${board.bno}" /></td>
											<td><c:out value="${board.nickname}" /></td>
											<td><a href='/admin/get?bno=<c:out value="${board.bno}" />'> 
												<c:out value="${board.title}" /></a></td>
											<td><fmt:formatDate pattern="yyyy-MM-dd"
													value="${board.regDate}" /> <%-- <c:out value="${board.regDate}" /> --%></td>
											<td><c:out value="${board.comCnt}" /></td>
										</tr>
									</c:forEach>
								</table>
								<div class="val-center">
									<ul class="pagination">
										<!-- 이전 페이지 -->
										<c:if test="${pageMaker.prev}">
											<li class="pagenate_button previous"><a
												href="${pageMaker.startPage -1}">Previous</a></li>
										</c:if>
										<!-- startPage .... endPage -->
										<c:forEach var="num" begin="${pageMaker.startPage}"
											end="${pageMaker.endPage}">
											<li class="pagenate_button ${pageMaker.cri.pageNum == num ? "active":""} ">
												<a href="${num}">${num}</a>
											</li>
										</c:forEach>
										<!-- 다음 페이지 -->
										<c:if test="${pageMaker.next}">
											<li class="pagenate_button next"><a
												href="${pageMaker.endPage +1}">Next</a></li>
										</c:if>
									</ul>
								</div>
								<form id="actionForm" action="/admin/list" method="get">
									<input type="hidden" name="pageNum"
										value="${pageMaker.cri.pageNum}"> <input type="hidden"
										name="amount" value="${pageMaker.cri.amount}">
									<!-- 추가 된다. -> 검색 기능 -->
									<input type='hidden' name='type'
										value='<c:out value="${pageMaker.cri.type}"/>'> <input
										type='hidden' name='keyword'
										value='<c:out value="${pageMaker.cri.keyword}"/>'>

								</form>
							</div>
						</div>
					</div>
				</div>
				<!-- /.row -->
			</div>
			<!-- /.container-fluid -->
			<footer class="footer text-center"> 2022 COPYRIGHT &copy; by
				WEBDESIGN. ALL RIGHTS RESERVED </footer>
		</div>
		<!-- /#page-wrapper -->
	</div>
	<!-- /#wrapper -->
	<!-- jQuery -->
	<script
		src="/resources/plugins/bower_components/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap Core JavaScript -->
	<script src="/resources/bootstrap/dist/js/bootstrap.min.js"></script>
	<!-- Menu Plugin JavaScript -->
	<script
		src="/resources/plugins/bower_components/sidebar-nav/dist/sidebar-nav.min.js"></script>
	<!--slimscroll JavaScript -->
	<script src="/resources/js/jquery.slimscroll.js"></script>
	<!--Wave Effects -->
	<script src="/resources/js/waves.js"></script>
	<!-- Custom Theme JavaScript -->
	<script src="/resources/js/custom.min.js"></script>

	<script type="text/javascript">
	$(document).ready( function() { // HTML 태그가 모두 렌더링이 끝난다음에 실행
		var result = '<c:out value="${result}" />'; // controller로부터 수신된 결과를 저장
		console.log(result);
		// 게시글 쓰기 : 게시글 번호, 게시글 수정/게시글 삭제 : Success가 저장된다.
		// 모달창을 띄워 준다.
		checkModal(result);
		history.replaceState({}, null, null);
		
		function checkModal(result) {
			// history.state : 모달창을 띄우지 않토록 마크가 되어 있는 경우
			if (result === '' || history.state) { // back button이나 forward button에 의하여 이 페이지로 이동
				return;
			}
			// 게시글 쓰기, 게시글 수정, 게시글 삭제
			if (parseInt(result) > 0) { // 새로운 게시글이 추가된 경우
				// 모달창의 본문을 변경
				$(".modal-body").html(
						"게시글" + parseInt(result)
								+ " 번이 등록되었습니다.");
			}
			$("#myModal").modal("show"); // 모달창을 띄워준다.
		}
		// 게시글 쓰기 버튼을 눌리면 게시글 쓰기(/board/register) 페이지로 이동
		$("#regBtn").on("click", function(e) {
			self.location = "/admin/register"; // 게시글 쓰기 페이지로 이동
	});

	// form 객체를 선언
	var actionForm = $("#actionForm");
	// 페이징 링크가 눌리면 페이지 이동 처리
	$(".pagenate_button a").on("click", function(e) {
		// $(this) : 눌린 링크(a)
		e.preventDefault(); // 우선 디폴트 동작을 막고(서버로 전송을 막는다)
		
		e.stopPropagation();	// 카페 확인 추가
		
		console.log("click 눌림");
		
		actionForm.attr("action","/admin/list"); // 카페 확인 추가
		
		
		// input 태그 pageNum에 눌린 페이지 번호를 넣어준다.
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
	//actionForm.attr("action", "/board/list");	// list 안떠서 강제로 추가
		actionForm.submit(); // 서버로 전송이 된다. submit 버튼을 누른것과 같은 동작
	});

	// 상세보기 링크가 눌렸을 때 동작
	$(".move").on("click", function(e) {
		e.preventDefault(); // 디폴트 동작을 막고
		// form을 이용 : pageNum, amount 데이터가 있으므로
		actionForm.append("<input type='hidden' name='bno' value='"
						+ $(this).attr('href')+ "'>"); // input 태그 bno를 추가
		actionForm.attr("action","/board/get"); // /board/list -> /board/get
		actionForm.submit(); // 상세보기로 이동
	});

	// 검색 부분에 대한 폼을 변수에 저장
	var searchForm = $("#searchForm");
	// click 이벤트를 추가
	$("#searchForm button").on("click", function(e) {
		e.preventDefault();
		// 유효성 검사
		if (!searchForm.find("option:selected").val()) { // 검색 유형을 선택하지 않은 경우
			alert("검색종류를 선택하세요");
			return false; // 서버로 전송이 되지 않는다.
		}
		if (!searchForm.find("input[name='keyword']").val()) {
			alert("키워드를 입력하세요");
			return false;
		}
		// 검색을 요청했으면 pageNum = 1로 변경한다.
		searchForm.find("input[name='pageNum']").val("1"); // 1페이지부터 보여지도록 설정
		searchForm.submit(); // 검색 요청을 한다.
	
	});
});
	
</script>
</body>

</html>
