<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>여행 갈래?</title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
    
    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

    <!-- Swiper -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />

    <!-- Swiper JS -->
    <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css">

    <link rel="preconnect" href="https://fonts.googleapis.com">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Hahmlet:wght@100..900&display=swap" rel="stylesheet">

    <script defer src="resouces/js/common.js"></script>
    <script defer src="resouces/js/swiper.js"></script>
    <link rel="stylesheet" href="resouces/css/goTripMain.css">
    <link rel="stylesheet" href="resouces/css/common.css">
</head>

<body>
    <%@ include file="../common/basic.jsp" %>
    <div class="wrap">
        <div class="top">
            <div class="logo" onclick="location.href='views/goTrip/goTripLogin_O.jsp'">우리 여행가조</div>
            <div class="top_menu">
                <ul>
                    <li id="top_menu_1" onclick="location.href=''">My page</li>
                    <li id="top_menu_2" onclick="location.href=''">고객센터</li>
                    <li id="top_menu_3" onclick="location.href='views/goTrip/goTripLogin_X.jsp'">로그아웃</li>
                </ul>
            </div>
        </div>

        <div class="under">
            <div class="side_menu">
                <div id="side_menu_open_1" onclick="location.href='<%= contextPath %>'">여행 갈래?</div>
                <div id="side_menu_open_2" onclick="location.href='<%= contextPath %>/GoScheduleMain.sd'" class="login">계획 짤래?</div>
                <div id="side_menu_open_3" onclick="location.href='<%= contextPath %>/GoPostMain.ps'" class="login">리뷰 볼래?</div>
                <% if (loginAdmin != null) { %>
                	<div id="side_menu_open_4" onclick="location.href='<%= contextPath %>/GoAdminMain.ad'">관리자 메뉴</div>
                <% } %>
                <div id="close_btn" onclick="side_close()"><img src="resouces/img/chevron_left_24dp_5F6368.png" alt=""></div>

                <div id="side_menu_close_1" onclick="location.href='<%= contextPath %>'" class="login">
                    <img src="resouces/img/airplane_ticket_24dp_5F6368.png" alt="">
                    <div class="explanation">여행 갈래?</div>
                </div>
                <div id="side_menu_close_2" onclick="location.href='<%= contextPath %>/GoScheduleMain.sd'" class="login">
                    <img src="resouces/img/edit_calendar_24dp_5F6368_FILL0_wght400_GRAD0_opsz24.png" alt="">
                    <div class="explanation">계획 짤래?</div>
                </div>
                <div id="side_menu_close_3" onclick="location.href='<%= contextPath %>/GoPostMain.ps'" class="login">
                    <img src="resouces/img/dynamic_feed_24dp_5F6368.png" alt="">
                    <div class="explanation">리뷰 볼래?</div>
                </div>
                <% if (loginAdmin != null) { %>
	                <div id="side_menu_close_4" onclick="location.href='<%= contextPath %>/GoAdminMain.ad'">
	                    <img src="resouces/img/manage_accounts_24dp_5F6368_FILL0_wght400_GRAD0_opsz24.png" alt="">
	                    <div class="explanation">관리자 메뉴</div>
	                </div>
	            <% } %>
                <div id="open_btn" onclick="side_open()">
                    <img src="resouces/img/chevron_right_24dp_5F6368.png" alt="">
                </div>
            </div>

            <div class="content">
                <div class="content_1">
                    집 나가면 고생? 국내 여행은 달라!
                </div>
                <div class="content_2">
                    부산 편
                </div>
                <div class="content_3">
                    ✨ MD 픽 추천 숙소 7선 ✨
                </div>
                <div class="content_4">
                    <!-- Swiper -->
                    <div class="swiper mySwiper">
                        <div class="swiper-wrapper">
                            <div class="swiper-slide" type="button">
                                <img alt=""
                                    src="https://yaimg.yanolja.com/v5/2022/10/07/18/1280/63406efe8ef757.60182715.jpg"
                                    decoding="async" data-nimg="fill" class="css-sr2c7j">
                                <div class="cover">하운드 해운대 1호점 시그니처 <br><br>
                                    149,000원 ~
                                </div>
                            </div>
                            <div class="swiper-slide" type="button">
                                <img alt=""
                                    src="https://yaimg.yanolja.com/v5/2023/12/26/14/1280/658ae29a3de5b7.76643723.jpg"
                                    decoding="async" data-nimg="fill" class="css-sr2c7j">
                                <div class="cover">어반 스테이 부산송도해변 <br><br>
                                    115,900원 ~
                                </div>
                            </div>
                            <div class="swiper-slide" type="button">
                                <img alt=""
                                    src="https://yaimg.yanolja.com/v5/2023/09/07/09/1280/64f99ae84fcd14.79280647.jpg"
                                    decoding="async" data-nimg="fill" class="css-sr2c7j">
                                <div class="cover">엘본쓰 <br><br>
                                    199,000원 ~
                                </div>
                            </div>
                            <div class="swiper-slide" type="button">
                                <img alt=""
                                    src="https://yaimg.yanolja.com/v5/2024/03/25/21/1280/6601efbcd0b185.72569977.JPG"
                                    decoding="async" data-nimg="fill" class="css-sr2c7j">
                                <div class="cover">부산 에스스테이펜션 <br><br>
                                    156,000원 ~
                                </div>
                            </div>
                            <div class="swiper-slide" type="button">
                                <img alt=""
                                    src="https://yaimg.yanolja.com/v5/2024/07/18/10/1280/6698f13fbb3c67.85488183.jpg"
                                    decoding="async" data-nimg="fill" class="css-sr2c7j">
                                <div class="cover">부산 송정스테이서몽 <br><br>
                                    199,040원 ~
                                </div>
                            </div>
                            <div class="swiper-slide" type="button">
                                <img alt=""
                                    src="https://yaimg.yanolja.com/v5/2024/08/05/15/1280/66b0f07de2a1b4.27214523.jpg"
                                    decoding="async" data-nimg="fill" class="css-sr2c7j">
                                <div class="cover">부산 드림하우스 펜션 <br><br>
                                    87,000원 ~
                                </div>
                            </div>
                            <div class="swiper-slide" type="button">
                                <img alt=""
                                    src="https://yaimg.yanolja.com/v5/2022/07/28/10/1280/62e2618ef0ee32.74129597.jpg"
                                    decoding="async" data-nimg="fill" class="css-sr2c7j">
                                <div class="cover">그랜드 엘시티 레지던스 <br><br>
                                    422,000원 ~
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="content_5">
                    놀면 뭐 타지? ✈️
                </div>
                <div class="content_6">
                    <!-- Swiper -->
                    <div class="swiper mySwiper">
                        <div class="swiper-wrapper">
                            <div class="swiper-slide" type="button"
                                onclick="location.href='https://carmore.kr/home/rent?v=20240801154352'">
                                <img class="w-100 click-no-effect normal-img" data-idx="0"
                                    src="https://d1y0pslxvt2ep5.cloudfront.net/event/content/content_325_1_20240610054548.png"
                                    style="width: 50%;">
                                <div class="cover">렌트카 조회 하기</div>
                            </div>
                            <div class="swiper-slide" type="button" onclick="location.href='https://flight.naver.com/'">
                                <img class="bOaTkZcdqgXxzJCZECTz"
                                    src="https://media.istockphoto.com/id/1366159026/ko/%EB%B2%A1%ED%84%B0/%EC%83%81%EC%97%85%EC%9A%A9-%ED%95%AD%EA%B3%B5%EC%82%AC-%ED%95%AD%EA%B3%B5%ED%8E%B8-%ED%83%91%EC%8A%B9%EA%B6%8C.jpg?s=612x612&amp;w=0&amp;k=20&amp;c=ZwLd6tZh2K4lR8vRjr7H_XNHkrRssRIR0dhv-AjLY6A="
                                    alt="상업용 항공사 항공편 탑승권 - 비행기 티켓 stock illustrations">
                                <div class="cover">항공편 조회 하기</div>
                            </div>
                            <div class="swiper-slide" type="button"
                                onclick="location.href='https://www.google.com/maps/?hl=ko'">
                                <img src="resouces/img/지도.jpg" alt="">
                                <div class="cover">내 맘 대로 <br> 소요시간 조회 하기</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="content_7">
                    포브스 선정 부산에서 가볼만한 곳 TOP 7 👍
                </div>
                <div class="content_8">
                    <!-- Swiper -->
                    <div class="swiper mySwiper">
                        <div class="swiper-wrapper">
                            <div class="swiper-slide" type="button">
                                <img src="resouces/img/광안대교.jpg" alt="">
                                <div class="cover">광안대교 <br><br><br> 부산광역시 수영구 민락동 ~ </div>
                            </div>
                            <div class="swiper-slide" type="button">
                                <img src="resouces/img/해운대 해수욕장.jpg" alt="">
                                <div class="cover">해운대 해수욕장 <br><br><br> 부산 해운대구 우동 ~ </div>
                            </div>
                            <div class="swiper-slide" type="button">
                                <img src="resouces/img/감천문화마을.jpg" alt="">
                                <div class="cover">감천 문화 마을 <br><br><br> 부산광역시 사하구 감내2로 203</div>
                            </div>
                            <div class="swiper-slide" type="button">
                                <img src="resouces/img/부산영화체험박물관.jpg" alt="">
                                <div class="cover">부산 영화 체험 박물관 <br><br><br> 부산 중구 대청로126번길 12</div>
                            </div>
                            <div class="swiper-slide" type="button">
                                <img src="resouces/img/삼락생태공원.jpg" alt="">
                                <div class="cover">삼락 생태 공원 <br><br><br> 부산 사상구 삼락동 29-46 </div>
                            </div>
                            <div class="swiper-slide" type="button">
                                <img src="resouces/img/송도스카이워크.jpg" alt="">
                                <div class="cover">송도 스카이 워크 <br><br><br> 부산광역시 서구 암남동 129-4 </div>
                            </div>
                            <div class="swiper-slide" type="button">
                                <img src="resouces//자갈치시장.jpg" alt="">
                                <div class="cover">자갈치 시장 <br><br><br> 부산 중구 자갈치해안로 52 </div>
                            </div>
                        </div>
                    </div>
                </div>

                <br><br>
            </div>
        </div>
    </div>
</body>

</html>