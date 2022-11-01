<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>여행의 즐거움 :: 떠나!</title>
    <link rel="stylesheet" type="text/css" href="resources/css/common.css">
    <script src="resources/js/jquery-3.5.1.min.js"></script>
    <script src="resources/js/jquery-user.js"></script>
</head>
<body>
    <div class="header-container">
        <div class="wrapper">
          <div class="header-content">
            <div class="head-menu-content">
              <div class="logo-content">
                <a href="index.html"><img class="logo-img" src="resources/images/logo.png"></a>
              </div>
              <!-- 로그인 상태의 headmenu -->
              <ul class="head-menu">
                <li><a href="myprofile.html">마이페이지</a></li>
                <li class="head-submenu">
                  <a class="profile-setting" href="#">
  
                    <div class="head-profile">
                      <img class="profile" src="resources/images/profile-img.jpeg">
                    </div>
                    <div class="profile-txt">
                      홍길동님
                    </div>
                  </a>
                  <ul class="submenu">
                    <li><a href="#">로그아웃</a></li>
                  </ul>
                </li>
              </ul>
            </div>
            <!--    로그아웃 상태의 headmenu -->
            <!--
                  <div class="head-menu-content">
                      <ul class="head-menu">
                      <li><a href="login.html">로그인</a></li>
                      <li><a href="regist.html">회원가입</a></li> 
                      </ul>   
                  </div>
                -->
  
          </div>
        </div>
      </div>

      <div class="main-container">
        <div class="wrapper">
          <div class="myProfile-content">
            <div class="user-info">
              <a href="myprofile.html">
                <div class="user-photo">
                  <img class="profile" src="resources/images/profile-img.jpeg">
                </div>
                <div class="user-profileInfo">
                  <div class="user-name">
                      Jsqoks
                  </div>
                  <div class="post-count">
                      <h4>2</h4> 게시물
                  </div> 
                </div>
              </a>
            </div>

            <div class="memberInfo-main">
              <div class="myProfile-left-content">
                  <ul class = "number-line-alignment" >
                    <li><a href="myprofile.html"> 나의 게시물 </a></li> 
                    <li><a class="myContent-choice" href="memberInfo.html"> 회원정보 </a></li>
                  </ul>
              </div>
              <div class="memberInfo-right-content">
                <form action="#" onsubmit="return checkMemInfo()" method="post" name="memInfo_frm">
                  <input type="hidden" name="pw" id="pw" maxlength="16" value="q1w2e3r4">
                  <table class="table mem_info_table">
                  <caption class=""><h2>회원정보수정</h2></caption>
                  <tbody>
                    <tr>
                      <th>이름</th>
                      <td><input type="text" id="username" name="username"  maxlength="16" value="홍길동" placeholder="이름을 입력하세요." readonly></td>
                    </tr>
                    <tr>
                      <th>아이디</th>
                      <td><input type="text" id="userid" name="userid"  maxlength="16" value="Hong1234" placeholder="아이디를 입력하세요." readonly></td>
                    </tr>
                    <tr>
                      <th>패스워드확인<span class="icon">*</span></th> <!-- input hidden password : q1w2e3r4-->
                      <td><input type="password" name="mem_conpw" id="mem_conpw" value="" maxlength="16" placeholder="패스워드를 입력하세요." class="form-box"></td>
                  </tr>  
                  <tr>
                    <th>닉네임</th>
                    <td><input type="text" id="nickname" name="nickname"  maxlength="16" value="Jsqoks" placeholder="닉네임을 입력하세요."><h4 class="regist-info">2자 이상 16자 이하, 영어 또는 숫자 또는 한글로 구성해주세요.</h4></td>
                  </tr>
                    <tr>
                      <th style=" vertical-align: middle;">이메일</th>
                      <td>
                        <input type="text" name="email" id="email" maxlength="30" value="ayo123" placeholder="이메일을 입력하세요." >
                        @
                        <input id="domain-txt" name="domain-txt" type="text" value="naver.com" />
                        <select id="domain-list" name="domain-list">
                          <option value="1" selected>직접 입력</option>
                          <option value="naver.com">naver.com</option>
                          <option value="gmail.com">gmail.com</option>
                          <option value="hanmail.net">hanmail.net</option>
                          <option value="nate.com">nate.com</option>
                          <option value="kakao.com">kakao.com</option>
                        </select>
                      </td>
                    </tr>  
                    <tr>
                      <th style=" vertical-align: middle;">주소<span class="icon">*</span></th>
                      <td>
                        <input type="text" id="postCode" name="postCode" maxlength="5" size="5" value="12345" readonly style="width:100px;"> <!-- 우편번호 -->
                        <input type="text" id="addr" name="addr" maxlength="20" value="서울특별시 관악구 어디로 12-21" readonly style="width:250px;"> <!-- 주소 -->
                        <input type="button" class="btn btn_type1" value="우편번호 찾기"> <!-- 주소 찾기 버튼-->
                      </td>
                    </tr>  
                    <tr>
                      <th>상세주소</th>
                      <td><input type="text" name="mem_detail_addr" id="mem_detail_addr"  maxlength="20" value="201호" placeholder="상세 주소를 입력해주세요."></td>
                    </tr>
                    <tr>
                      <th  style=" vertical-align: middle;">생년월일<span class="icon">*</th>
                      <td>
                      <input type="text" name="birth_date" id="birth_date" maxlength="10" value="2000-04-12" placeholder="YYYY-MM-DD" onkeyup="birth_keyup(this)">
                        <!--  <div class="info" id="info__birth">
                          <select class="box" id="birth-year">
                            <option disabled selected>출생 연도</option>
                          </select>
                          <select class="box" id="birth-month">
                            <option disabled selected>월</option>
                          </select>
                          <select class="box" id="birth-day">
                            <option disabled selected>일</option>
                          </select>
                        </div>
                        -->
                      </td> 
                    </tr>  
                    <tr>
                      <th>전화번호<span class="icon">*</span></th>
                      <td><input type="text" name="phone" id="phone"  maxlength="13" value="010-1234-5678" placeholder="010-0000-0000" onkeyup="mobile_keyup(this)"></td>
                    </tr>   
                    <tr>
                      <th>성별</th> <!-- checked로 페이지 시작시 라디오 버튼 남자 누른거로 고정 -->
                      <td><input type="radio" name="gender" id="gender" value="m" checked="checked">남자 <input type="radio" name="gender" id="gender" value="w" style="margin-left:10px">여자</td>
                      <!-- <input type='radio' <?=gender == 'female'? 'checked': ''> 서버에서 받아온 값으로 이런식으로 불켜주기 -->
                    </tr>  
                  </tbody>
                </table>
                <div class="member_Info_btnForm"> 
                  <a class="btn btn_type2" href="infoUpdate.html">뒤로가기</a>
                  <input class="btn btn_type4" type="submit" value="수정하기"></a>
                </div>
              </div> <!--/right-content div -->
                
            </div>
          </div>  
           

          </div>
        </div>  
      </div>

      <div class="footer-container">
        <div class="wrapper">
            <div class="footer-content">
                <div class="ft-service">
                    <div class="ft-box">
                        <h4>고객 문의</h4>
                        <ul class="ft-box-li">
                            <li><a href="#">고객센터</a></li>
                            <li><a href="#">FAQ</a></li>
                            <li><a href="#">1:1문의</a></li>
                        </ul>
                        <ul class="sns-img">
                            <li><a href="https://facebook.com/" target="_blank"><img src="/resources/images/foot_facebook.png"></a></li>
                            <li><a href="http://www.instargram.com" target="_blank"><img src="/resources/images/foot_instargram.png"></a></li>
                            <li><a href="http://www.youtube.com" target="_blank"><img src="/resources/images/foot_youtube.png"></a></li>
                            <li><a href="https://twitter.com/" target="_blank"><img src="/resources/images/foot_twitter.png"></a></li>
                        </ul>
                    </div>
                    <div class="ft-box">
                        <h4>회사소개</h4>
                        <ul class="ft-box-li">
                            <li><a href="#">떠나닷컴 소개</a></li>
                            <li><a href="#">이용약관</a></li>
                            <li><a href="#">개인정보 처리방침</a></li>
                        </ul>
                    </div>
                    <div class="ft-box">
                        <h4>기타서비스</h4>
                        <ul class="ft-box-li"> 
                            <li><a href="#">정보</a></li>
                            <li><a href="#">쿠키</a></li>
                            <li><a href="#">채용정보</a></li>
                        </ul>
                    </div>
                </div> 
                <div class="ft-copy">
                    <b class="copy-txt">
                        COPYRIGHT &copy; TRAVEL KOREA PET ALL RIGHTS RESERVED<br/>
                        사이트 운영자: Dduna.com TRAVLE KOREA PET<br/>
                        고객센터: 1555-5555
                    </b> 
                </div>   
            </div>
        </div>
    </div>

    <div id="quick_menu">
        <div class="quick_img_wrapper">
            <a href="#" target="_blank"><img class="quick_img" src="/resources/images/side-img.jpg"></a>
        </div>
        <div class="side_menu">
            <ul>
                <!-- 로그아웃 상태의 사이드바 메뉴 -->
        		<li><a href="#" class="link_menu" target="_blank">회원가입</a></li>
              	<li><a href="#" class="link_menu" target="_blank">로그인</a></li>	
                <!-- 로그인 상태의 사이드바 메뉴 -->
                <!--    
                <li><a href="#" class="link_menu" target="_blank">마이페이지</a></li>
                <li><a href="#" class="link_menu" target="_blank">포스트하기</a></li>	
                -->	
            </ul>        
        </div>
    </div>

    <div id="top_btn">
        <a href="" onclick="goTop()"><img src="/resources/images/up-arrow.png"></a>
    </div>
</body>
<!--user Script-->
<script>
  // 이메일 입력방식 선택
 
  $('#domain-list').change(function(){
             $("#domain-list option:selected").each(function () {
               
               if($(this).val()== '1'){ // 직접입력일 경우
                 $("#domain-txt").val('');                // 값 초기화
                 $("#domain-txt").attr("disabled",false); // 활성화
               }else{ // 직접입력이 아닐경우
                 $("#domain-txt").val($(this).text());   // 선택값 입력
                 $("#domain-txt").attr("disabled",true); // 비활성화
               }
             });
           });
 /*
     // 도메인 직접 입력 or domain option 선택
     const domainListEl = document.querySelector('#domain-list')
     const domainInputEl = document.querySelector('#domain-txt')
     // select 옵션 변경 시
     domainListEl.addEventListener('change', (event) => {
     // option에 있는 도메인 선택 시
     if(event.target.value !== "type") {
       // 선택한 도메인을 input에 입력하고 disabled
       domainInputEl.value = event.target.value
       domainInputEl.disabled = true
     } else { // 직접 입력 시
       // input 내용 초기화 & 입력 가능하도록 변경
       domainInputEl.value = ""
       domainInputEl.disabled = false
     }
     })
   */
 
     // '출생 연도' 셀렉트 박스 option 목록 동적 생성
     const birthYearEl = document.querySelector('#birth-year')
     // option 목록 생성 여부 확인
     isYearOptionExisted = false;
     birthYearEl.addEventListener('focus', function () {
     // year 목록 생성되지 않았을 때 (최초 클릭 시)
     if(!isYearOptionExisted) {
       isYearOptionExisted = true
       for(var i = 1940; i <= 2022; i++) {
       // option element 생성
       const YearOption = document.createElement('option')
       YearOption.setAttribute('value', i)
       YearOption.innerText = i
       // birthYearEl의 자식 요소로 추가
       this.appendChild(YearOption);
       }
     }
     });
     const birthYearE2 = document.querySelector('#birth-month')
     // option 목록 생성 여부 확인
     isYearOptionExisted2 = false;
     birthYearE2.addEventListener('focus', function () {
     // year 목록 생성되지 않았을 때 (최초 클릭 시)
     if(!isYearOptionExisted2) {
       isYearOptionExisted2 = true
       for(var i = 1; i <= 12; i++) {
       // option element 생성
       const monthOption = document.createElement('option')
       monthOption.setAttribute('value', i)
       monthOption.innerText = i
       // birthYearE2의 자식 요소로 추가
       this.appendChild(monthOption);
       }
     }
     });
     const birthYearE3 = document.querySelector('#birth-day')
     // option 목록 생성 여부 확인
     isYearOptionExisted3 = false;
     birthYearE3.addEventListener('focus', function () {
     // year 목록 생성되지 않았을 때 (최초 클릭 시)
     if(!isYearOptionExisted3) {
       isYearOptionExisted3 = true
       for(var i = 1; i <= 31; i++) {
       // option element 생성
       const dayOption = document.createElement('option')
       dayOption.setAttribute('value', i)
       dayOption.innerText = i
       // birthYearE2의 자식 요소로 추가
       this.appendChild(dayOption);
       }
     }
     });
 
   
     //  생년월일 - 하이픈 자동 생성
     function birth_keyup(obj){
       let birth_len = obj.value.length;
       if (event.keyCode==8){
         obj.value = obj.value.slice(0,birth_len)
         return 0;
       }else if(birth_len==4 || birth_len==7){
         obj.value += '-';
       }
     }
     //  전화번호  - 하이픈 자동 생성 
     function mobile_keyup(obj){
       let mobile_len=obj.value.length;
       console.log(mobile_len)
       if(event.keyCode==8){
         obj.value=obj.value.slice(0,mobile_len); 
         return 0; 
       }else if (mobile_len==3 || mobile_len==8){
         obj.value += '-';
       }
     }
   
   
     function checkMemInfo(){
   
     //이메일 유효성검사 관련 변수
     var email_rule =  /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
     var mem_email = $("#email").val();
     var mem_domain = $("#domain-txt").val();
     var mail ="";
   
     mail = mem_email+"@"+mem_domain;
     //전화번호 유효성검사 관련 변수
     var phone_rule  = /01[016789]-[^0][0-9]{2,3}-[0-9]{3,4}/;
     var mem_phone = $("#phone").val();
     
     //이름 유효성검사 정규식
     var name_RegExp = /[가-힣]{2,15}$/; 	
 
     //id pw 유효성 검사 정규식
     var idpw_RegExp = /^[a-zA-z0-9]{4,12}$/; 
 
         //닉네임 유효성 검사 정규식
         var nickname_RegExp = /^(?=.*[a-zA-Z0-9가-힣])[a-zA-Z0-9가-힣]{2,16}$/;
     
 
 
        //닉네임 유효성 검사
        if($("#nickname").val() == null || $("#nickname").val()==""){
             alert("닉네임이 비었습니다. 다시 입력하세요.");
             $("#nickname").focus();
             return false;
        }
         else if (!nickname_RegExp.test($("#nickname").val())) {            
             alert("닉네임은 2자 이상 16자 이하, 영어 또는 숫자 또는 한글로 입력하세요");
             $("#nickname").focus();
             return false;
         }
        
         if($("#pw").val() != $("#mem_conpw").val()){ 
		        alert("비밀번호와 비밀번호 확인란이 상이합니다."); 
            $("#conpw").val(""); 
            $("#conpw").focus(); 
            return false; 
		    }   
         
     if($("#email").val() == null || $("#email").val()==""){
             alert("이메일란이 비었습니다. 다시 입력하세요.");
             $("#email").focus();
             return false;
     } else if($("#domain-txt").val() == null || $("#domain-txt").val()==""){
             alert("도메인란이 비었습니다. 다시 입력하세요.");
             $("#domain-txt").focus();
             return false;
     } else if($("#postCode").val() == null || $("postCode").val()==""){
             alert("우편번호란이 비었습니다. 다시 입력하세요.");
             $("#postCode").focus();
             return false;
     } else if($("#addr").val() == null || $("#addr").val()==""){
             alert("주소란이 비었습니다. 다시 입력하세요.");
             $("#addr").focus();
             return false;
     } else if($("#birth_date").val() == null || $("#birth_date").val()==""){
             alert("생년월일란이 비었습니다. 다시 입력하세요.");
             $("#birth_date").focus();
             return false;  
     } else if($("#phone").val() == null || $("#phone").val()==""){
             alert("전화번호란이 비었습니다. 다시 입력하세요.");
             $("#phone").focus();
             return false;  
     } else if($(':radio[name="gender"]:checked').length < 1){
             alert("성별이 선택되지 않았습니다. 성별을 선택하세요.");
             $("#gender").focus();
             return false;           
     } 
   
     // 이메일 확인
     if(!email_rule.test(mail)){
       alert("이메일을 형식에 맞게 입력해주세요.");
       $("#email").focus(); 
       return false;
     }
     // 전화번호
      if(!phone_rule.test(mem_phone)){
       alert("전화번호를 형식에 맞게 입력해주세요.");
       $("#phone").focus(); 
       return false;
     }
 
     /*console.log(mail);*/
     alert("회원가입이 완료되었습니다.");
     return true;
     }
 </script>
 </html>