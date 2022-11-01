<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    .bcolor-black{
      border: 5px solid black;
    }
    .slide-img-size .swiper-slide img{
      width: 640px;
      height: 640px;
    }
    .small-slide-size .swiper-slide img{
      width: 152.5px;
      height: 152.5px;
    }
    .swiper-button-next{
      background-color: black;
      color:white;
      padding: 40px 30px;
    }
    .swiper-button-next:active{
      background-color: rgba(50, 100, 255, 0.533);
    }
    .swiper-button-prev{
      background-color: black;
      color:white;
      padding: 40px 30px;
    }
    .swiper-button-prev:active{
      background-color: rgba(50, 100, 255, 0.533);
    }
    
    .svg-like{
      fill: powderblue;
    }
    .like-num p{
      color:powderblue;
    }
  </style>
</head>

<body>
<jsp:include page="/WEB-INF/views/includes/header.jsp"></jsp:include>
  <div class="container">
    <div class="wrapper">
      <div class="search-content">
        <select class="search-list">
          <option disabled="">선택</option>
          <option value="제목">제목</option>
          <option value="내용">내용</option>
          <option value="작성자">작성자</option>
        </select>

        <input type="text" placeholder="제목, 내용, 작성자로 검색">
        <a href="#"><img src="/resources/images/search.png" class="search_img" alt="검색"></a>
      </div>
      <div class="travel-content">
        <div class="image-gallery">
          <div class="bcolor-black swiper mySwiper2">
            <div class="swiper-wrapper slide-img-size">
              <div class="swiper-slide">
                <img src="/resources/images/test-img1.jpg" />
              </div>
              <div class="swiper-slide">
                <img src="/resources/images/test-img2.jpg" />
              </div>
              <div class="swiper-slide">
                <img src="/resources/images/test-img3.jpg" />
              </div>
              <div class="swiper-slide">
                <img src="/resources/images/test-img4.jpg" />
              </div>
              <div class="swiper-slide">
                <img src="/resources/images/test-img5.jpg" />
              </div>
              <div class="swiper-slide">
                <img src="/resources/images/test-img6.jpg" />
              </div>
              <div class="swiper-slide">
                <img src="/resources/images/test-img7.jpg" />
              </div>
              <div class="swiper-slide">
                <img src="/resources/images/test-img8.jpg" />
              </div>
              <div class="swiper-slide">
                <img src="/resources/images/test-img9.jpg" />
              </div>
              <div class="swiper-slide">
                <img src="/resources/images/test-img10.jpg" />
              </div>
            </div>
            <div class="swiper-button-next"></div>
            <div class="swiper-button-prev"></div>
            <div class="swiper-pagination bc-op"></div>
          </div>
          <div thumbsSlider="" class="bcolor-black swiper mySwiper">
            <div class="swiper-wrapper small-slide-size">
              <div class="swiper-slide">
                <img src="/resources/images/test-img1.jpg" />
              </div>
              <div class="swiper-slide">
                <img src="/resources/images/test-img2.jpg" />
              </div>
              <div class="swiper-slide">
                <img src="/resources/images/test-img3.jpg" />
              </div>
              <div class="swiper-slide">
                <img src="/resources/images/test-img4.jpg" />
              </div>
              <div class="swiper-slide">
                <img src="/resources/images/test-img5.jpg" />
              </div>
              <div class="swiper-slide">
                <img src="/resources/images/test-img6.jpg" />
              </div>
              <div class="swiper-slide">
                <img src="/resources/images/test-img7.jpg" />
              </div>
              <div class="swiper-slide">
                <img src="/resources/images/test-img8.jpg" />
              </div>
              <div class="swiper-slide">
                <img src="/resources/images/test-img9.jpg" />
              </div>
              <div class="swiper-slide">
                <img src="/resources/images/test-img10.jpg" />
              </div>
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
                <p class="user-name">
                  Jsqoks
                </p>
              </a>
              <a href="postUpdate.html" class="btn btn_type2 mr-100">게시글수정</a>
            </div>
          </div>
          <div class="content">
            <h1 class="title">
              도심 속 아름다움을 찾아, 한옥의 정경을 느끼며 💛
            </h1>
            <div class="detail-hashtag">
              <a href="#" class="topicItem">#국내여행</a>
              <a href="#" class="topicItem">#도시여행</a>
              <a href="#" class="topicItem">#데이트코스</a>
            </div>
            <div class="content-info">
              성수동 웨이팅 필수인 맛집 소바식당
              방송 보면서 정말 먹어보고 싶었는데 드디어 먹었습니다 (꺅&gt;_&lt;)
              운좋게 딱 마지막 손님으로 먹을 수 있었던 소바식당은
              웨이팅이 엄청나더라고요 따로 번호표 없이 줄을 서야 해요
              -
              냉소바랑 온소바 다 맛있었지만 전 온소바가 더 입에 맞았어요✨
              둘 다 국물도 진하고 시원하고 신선한 전복과 새우, 고기도 꽤 많이 들어있었어요
              ✨사이드로 주문한 타마고멘치카즈🍳🥚 바삭 촉촉한 부드러운 식감이 미쳤습니다 ㅠㅠ
              이건 꼭 먹어야 해요!!
              -
              성수동에는 많은 맛집들이 있지만 비주얼과 맛 둘 다 잡을 성수동 소바식당 추천해요👍

              🏠소바식당
              📍서울특별시 성동구 연무장7가길6
              ⏰영업시간 : 11:00-21:00
              ◼브레이크타임 15:00-17:00
            </div>
            <div class="topicItem-list">
              <ul>
                <li>
                  <a href="#">
                    # 소바식당
                  </a>
                </li>
                <li>
                  <a href="#">
                    #이영자맛집
                  </a>
                </li>
                <li>
                  <a href="#">
                    #성수동
                  </a>
                </li>
                <li>
                  <a href="#">
                    #성수동맛집
                  </a>
                </li>
                <li>
                  <a href="#">
                    #성수동핫플
                  </a>
                </li>
              </ul>
            </div>
            <div class="map">
              <!-- 구글 map 영역-->
            </div>
            <div class="time">
              작성일: 2022년 10월 21일
            </div>
            <div class="comment-view-content">
              <div class="comment-count">
                <h3>2 댓글</h3>
              </div>
              <div class="comment-view">
                <div class="comment-left">
                  <div class="user-img">
                    <img class="proflie" src="/resources/images/profile-img.jpeg"/>
                  </div>
                </div>
                <div class="comment-right">
                  <div class="user-nickname">
                    생갈치1호의행방불명
                  </div>
                  <div class="user-comment">
                    이런 예쁜 풍경을 볼수 있다니 정말로
                    멋지네요.
                  </div>
                  <div class="comment-provision">
                    <div class="time">
                      2022년 10월 21일
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="comment-view-content">
              <div class="comment-view">
                <div class="comment-left">
                  <div class="user-img">
                    <img class="proflie" src="/resources/images/profile-img.jpeg"/>
                  </div>
                </div>
                <div class="comment-right">
                  <div class="user-nickname">
                    여행의즐거움
                  </div>
                  <div class="user-comment">
                    맞아요~ 덕분에 좋은 구경하고 가요~
                  </div>
                  <div class="comment-provision">
                    <div class="time">
                      2022년 10월 21일
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          
          <div class="comments-form">
            <div class="textarea">
              <textarea placeholder="댓글을 입력해주세요"></textarea>
              <a href="#" class="btn blue-color-btn">확인</a>
            </div>
            <div class="like">
              <button id="like-click">
                <svg width="32" height="32" viewBox="0 0 256 256" >
                  <path class="like-img"
                    d="M21.333 229.333V95.411h54.814l74.519-74.078 34.41 34.207-17.826 39.87H240l-34.544 133.923H21.333zM150.666 51.637L86 115.919v91.987h102.73l23.49-91.067h-78.138l25.285-56.554-8.701-8.648zm-86.222 65.202H42.89v91.067h21.555v-91.067z"
                    fill="#34475e" class="transform-group"></path>
                </svg>
              </button>
              <div class="count like-count">
                <p>3</p> 
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="list-content">
        <div class="sub-title">
          <h3>관련 추천 게시글</h3>
        </div>
        <ul class="upload-content">
            <li>
                <a href="#">
                    <div class="list-box">
                        <div class="img-view-item">
                            <img src="/resources/images/test-img2.jpg">
                        </div>
                        <div class="list-content-title">
                            <p class="content-title">
                                일본 도쿄 여행, 아사쿠사를 방문하다. 
                            </p>
                        </div>  
                        <div class="list-content-hashtag">
                            <p class="list-hashtag">
                                <span class="hashtag-blue"> 국외여행 </span>                                     
                            </p>
                        </div>
                    </div>
                    <div class="list-user-profile">       
                        <div class="head-profile">
                            <img class="profile" src="/resources/images/profile-img.jpeg">
                        </div>
                        <div class="profile-txt">                   
                        꿈꾸는동
                        </div>
                </div>
                </a>
            </li>
            <li>
                <a href="#">
                    <div class="list-box">
                        <div class="img-view-item">
                            <img src="/resources/images/test-img3.jpg">
                        </div>
                        <div class="list-content-title">
                            <p class="content-title">
                                지브리 미술관에 다녀왔어요! 
                            </p>
                        </div>  
                        <div class="list-content-hashtag">
                            <p class="list-hashtag">
                                <span class="hashtag-blue"> 국외여행 </span>                                     
                            </p>
                            <p class="list-hashtag">
                                <span class="hashtag-blue"> 데이트코스 </span>                                     
                            </p>
                        </div>
                    </div>
                    <div class="list-user-profile">       
                        <div class="head-profile">
                            <img class="profile" src="/resources/images/profile-img.jpeg">
                        </div>
                        <div class="profile-txt">                   
                        생갈치1호의행방불명
                        </div>
                </div>
                </a>
            </li>
            <li>
                <a href="#">
                    <div class="list-box">
                        <div class="img-view-item">
                            <img src="/resources/images/test-img4.jpg">
                        </div>
                        <div class="list-content-title">
                            <p class="content-title">
                                뉴옥의 심장 타임스퀘어
                            </p>
                        </div>  
                        <div class="list-content-hashtag">
                            <p class="list-hashtag">
                                <span class="hashtag-blue"> 국외여행 </span>                                     
                            </p>
                        </div>
                    </div>
                    <div class="list-user-profile">       
                        <div class="head-profile">
                            <img class="profile" src="/resources/images/profile-img.jpeg">
                        </div>
                        <div class="profile-txt">                   
                            Workaholic
                        </div>
                </div>
                </a>
            </li>
            <li>
                <a href="#">
                    <div class="list-box">
                        <div class="img-view-item">
                            <img src="/resources/images/test-img5.jpg">
                        </div>
                        <div class="list-content-title">
                            <p class="content-title">
                                광안리 해수욕장에서<br>
                                부산 여행을 마무리하며
                            </p>
                        </div>  
                        <div class="list-content-hashtag">
                            <p class="list-hashtag">
                                <span class="hashtag-blue"> 국내여행 </span>                                     
                            </p>
                            <p class="list-hashtag">
                                <span class="hashtag-blue"> 데이트코스 </span>                                     
                            </p>
                        </div>
                    </div>
                    <div class="list-user-profile">       
                        <div class="head-profile">
                            <img class="profile" src="/resources/images/profile-img.jpeg">
                        </div>
                        <div class="profile-txt">                   
                        여행의즐거움
                        </div>
                </div>
                </a>
            </li>
            <li>
                <a href="#">
                    <div class="list-box">
                        <div class="img-view-item">
                            <img src="/resources/images/test-img6.jpg">
                        </div>
                        <div class="list-content-title">
                            <p class="content-title">
                                신이 세운 사원 앙코르와트
                            </p>
                        </div>  
                        <div class="list-content-hashtag">
                            <p class="list-hashtag">
                                <span class="hashtag-blue"> 국외여행</span>                                     
                            </p>
                        </div>
                    </div>
                    <div class="list-user-profile">       
                        <div class="head-profile">
                            <img class="profile" src="/resources/images/profile-img.jpeg">
                        </div>
                        <div class="profile-txt">                   
                        journey
                        </div>
                </div>
                </a>
            </li>
            <li>
                <a href="#">
                    <div class="list-box">
                        <div class="img-view-item">
                            <img src="/resources/images/test-img7.jpg">
                        </div>
                        <div class="list-content-title">
                            <p class="content-title">
                                남산 밤산책 한 컷
                            </p>
                        </div>  
                        <div class="list-content-hashtag">
                            <p class="list-hashtag">
                                <span class="hashtag-blue"> 국내여행 </span>                                     
                            </p>
                            <p class="list-hashtag">
                                <span class="hashtag-blue"> 도시여행 </span>                                     
                            </p>
                        </div>
                    </div>
                    <div class="list-user-profile">       
                        <div class="head-profile">
                            <img class="profile" src="/resources/images/profile-img.jpeg">
                        </div>
                        <div class="profile-txt">                   
                            여름밤의꿈
                        </div>
                </div>
                </a>
            </li>
            <li>
                <a href="#">
                    <div class="list-box">
                        <div class="img-view-item">
                            <img src="/resources/images/test-img8.jpg">
                        </div>
                        <div class="list-content-title">
                            <p class="content-title">
                                조선의 상징 경복궁에 방문하다
                            </p>
                        </div>  
                        <div class="list-content-hashtag">
                            <p class="list-hashtag">
                                <span class="hashtag-blue"> 국내여행 </span>                                     
                            </p>
                            <p class="list-hashtag">
                                <span class="hashtag-blue"> 도시여행 </span>                                     
                            </p>
                        </div>
                    </div>
                    <div class="list-user-profile">       
                        <div class="head-profile">
                            <img class="profile" src="/resources/images/profile-img.jpeg">
                        </div>
                        <div class="profile-txt">                   
                            teracorp
                        </div>
                </div>
                </a>
            </li>
            <li>
                <a href="#">
                    <div class="list-box">
                        <div class="img-view-item">
                            <img src="/resources/images/test-img9.jpg">
                        </div>
                        <div class="list-content-title">
                            <p class="content-title">
                                한강에서 피크닉중!
                            </p>
                        </div>  
                        <div class="list-content-hashtag">
                            <p class="list-hashtag">
                                <span class="hashtag-blue"> 국내여행 </span>                                     
                            </p>
                            <p class="list-hashtag">
                                <span class="hashtag-blue"> 데이트코스 </span>                                     
                            </p>
                        </div>
                    </div>
                    <div class="list-user-profile">       
                        <div class="head-profile">
                            <img class="profile" src="/resources/images/profile-img.jpeg">
                        </div>
                        <div class="profile-txt">                   
                        Yehi
                        </div>
                </div>
                </a>
            </li>
            <li>
                <a href="#">
                    <div class="list-box">
                        <div class="img-view-item">
                            <img src="/resources/images/test-img10.jpg">
                        </div>
                        <div class="list-content-title">
                            <p class="content-title">
                                신에게 바쳐진 인간의 선물 <br>
                                판테온  
                            </p>
                        </div>  
                        <div class="list-content-hashtag">
                            <p class="list-hashtag">
                                <span class="hashtag-blue"> 국외여행 </span>                                     
                            </p>
                        </div>
                    </div>
                    <div class="list-user-profile">       
                        <div class="head-profile">
                            <img class="profile" src="/resources/images/profile-img.jpeg">
                        </div>
                        <div class="profile-txt">                   
                        yoribogo
                        </div>
                </div>
                </a>
            </li>
            <li>
                <a href="#">
                    <div class="list-box">
                        <div class="img-view-item">
                            <img src="/resources/images/test-img11.jpg">
                        </div>
                        <div class="list-content-title">
                            <p class="content-title">
                                산티아고 순례길 총 800km, <br>
                                야곱의 흔적을 밟는다.
                            </p>
                        </div>  
                        <div class="list-content-hashtag">
                            <p class="list-hashtag">
                                <span class="hashtag-blue"> 국외여행</span>                                     
                            </p>
                        </div>
                    </div>
                    <div class="list-user-profile">       
                        <div class="head-profile">
                            <img class="profile" src="/resources/images/profile-img.jpeg">
                        </div>
                        <div class="profile-txt">                   
                        dororo
                        </div>
                </div>
                </a>
            </li>
            <li>
                <a href="#">
                    <div class="list-box">
                        <div class="img-view-item">
                            <img src="/resources/images/test-img12.jpg">
                        </div>
                        <div class="list-content-title">
                            <p class="content-title">
                                타이완의 4대 온천<br>
                                관쯔린 온천
                            </p>
                        </div>  
                        <div class="list-content-hashtag">
                            <p class="list-hashtag">
                                <span class="hashtag-blue"> 국외여행 </span>                                     
                            </p>
                        </div>
                    </div>
                    <div class="list-user-profile">       
                        <div class="head-profile">
                            <img class="profile" src="/resources/images/profile-img.jpeg">
                        </div>
                        <div class="profile-txt">                   
                        Jsqoks
                        </div>
                </div>
                </a>
            </li>
         
            
        </ul>
    </div>
    </div>
  </div>
<jsp:include page="/WEB-INF/views/includes/sidebar.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/includes/footer.jsp"></jsp:include>
<div id="top_btn">
  <a href="" onclick="goTop()"><img src="/resources/images/up-arrow.png"></a>
</div>

  <script>
    /*swiper js*/
    var swiper = new Swiper(".mySwiper", {
      spaceBetween: 10,
      slidesPerView: 4,
      freeMode: true,
      watchSlidesProgress: true,
    });
    var swiper2 = new Swiper(".mySwiper2", {
      spaceBetween: 10,
      navigation: {
        nextEl: ".swiper-button-next",
        prevEl: ".swiper-button-prev",
      },
      thumbs: {
        swiper: swiper,
      },
      pagination: {
        el: ".swiper-pagination",
        type: "fraction",
      },
    });
    
    /* like button color change*/
    $("#like-click").click(function(){
      $(".like-img").toggleClass('svg-like');
    });
    $("#like-click").click(function(){
      $(".like-count").toggleClass('like-num');
    });

  </script>

</body>

</html>