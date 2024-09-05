<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>여행가조</title>
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
            <div class="logo" onclick="location.href='<%= contextPath %>'">우리 여행가조</div>
            <div class="top_menu">
                <ul>
                    <li id="top_menu_1" onclick="location.href='<%= contextPath %>/GoMyPage.me'">My page</li>
                    <li id="top_menu_2" onclick="location.href='<%= contextPath %>/GoServiceCenter.sc'">고객센터</li>
                    <li id="top_menu_3">로그아웃</li>
                </ul>
            </div>
        </div>

        <div class="under">
            <div class="side_menu">
                <div id="side_menu_open_1" onclick="location.href='<%= contextPath %>'">여행 갈래?</div>
                <div id="side_menu_open_2" onclick="location.href='<%= contextPath %>/GoScheduleMain.sd?mno=<%= loginUser.getmNo() %>'" class="login">계획 짤래?</div>
                <div id="side_menu_open_3" onclick="location.href='<%= contextPath %>/GoPostMain.ps'" class="login">리뷰 볼래?</div>
                <% if (loginAdmin != null) { %>
                	<div id="side_menu_open_4" onclick="location.href='<%= contextPath %>/GoAdminMain.ad'">관리자 메뉴</div>
                <% } %>
                <div id="close_btn" onclick="side_close()"><img src="resouces/img/chevron_left_24dp_5F6368.png" alt=""></div>

                <div id="side_menu_close_1" onclick="location.href='<%= contextPath %>'" class="login">
                    <img src="resouces/img/airplane_ticket_24dp_5F6368.png" alt="">
                    <div class="explanation">여행 갈래?</div>
                </div>
                <% if (loginAdmin != null) { %>
                    <div id="side_menu_close_2" onclick="location.href='<%= contextPath %>/GoShowPlanMain.ad'" class="login">
                        <img src="resouces/img/edit_calendar_24dp_5F6368_FILL0_wght400_GRAD0_opsz24.png" alt="">
                        <div class="explanation">계획 짤래?</div>
                    </div>
                <% } else { %>
                    <div id="side_menu_close_2" onclick="location.href='<%= contextPath %>/GoScheduleMain.sd?mno=<%= loginUser.getmNo() %>'" class="login">
                        <img src="resouces/img/edit_calendar_24dp_5F6368_FILL0_wght400_GRAD0_opsz24.png" alt="">
                        <div class="explanation">계획 짤래?</div>
                    </div>
                <% } %>
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
                    광주 편
                </div>
                <div class="content_3">
                    ✨ MD 픽 추천 숙소 7선 ✨
                </div>
                <div class="content_4">
                    <!-- Swiper -->
                    <div class="swiper mySwiper">
                        <div class="swiper-wrapper">
                            <div class="swiper-slide" type="button">
                                <img src="https://yaimg.yanolja.com/v5/2023/11/30/14/640/65689a336e2d11.83100001.jpg" draggable="false" loading="lazy" class="css-w9k1o7">
                                <div class="cover">광주 장미옥 한옥 펜션 <br><br>
                                    240,000원 ~
                                </div>
                            </div>
                            <div class="swiper-slide" type="button">
                                <span style="box-sizing: border-box; display: block; overflow: hidden; width: initial; height: initial; background: none; opacity: 1; border: 0px; margin: 0px; padding: 0px; position: absolute; inset: 0px;"><img alt="" src="https://yaimg.yanolja.com/v5/2023/04/04/10/1280/642c009a6aac47.73480341.jpg" decoding="async" data-nimg="fill" style="position: absolute; inset: 0px; box-sizing: border-box; padding: 0px; border: none; margin: auto; display: block; width: 0px; height: 0px; min-width: 100%; max-width: 100%; min-height: 100%; max-height: 100%;"></span>
                                <div class="cover">홀리데이인 광주 <br><br>
                                    180,000원 ~
                                </div>
                            </div>
                            <div class="swiper-slide" type="button">
                                <img alt="" src="https://yaimg.yanolja.com/v5/2024/01/29/11/1280/65b7920e207326.88214783.jpg" decoding="async" data-nimg="fill" class="css-sr2c7j" style="position: absolute; inset: 0px; box-sizing: border-box; padding: 0px; border: none; margin: auto; display: block; width: 0px; height: 0px; min-width: 100%; max-width: 100%; min-height: 100%; max-height: 100%;">
                                <div class="cover">컬쳐호텔 람 <br><br>
                                    147,000원 ~
                                </div>
                            </div>
                            <div class="swiper-slide" type="button">
                                <img alt="" src="https://yaimg.yanolja.com/v5/2022/05/17/18/1280/6283eaca078861.79536470.jpg" decoding="async" data-nimg="fill" class="css-sr2c7j" style="position: absolute; inset: 0px; box-sizing: border-box; padding: 0px; border: none; margin: auto; display: block; width: 0px; height: 0px; min-width: 100%; max-width: 100%; min-height: 100%; max-height: 100%;">
                                <div class="cover">라마다 플라자 광주호텔 <br><br>
                                    146,300원 ~
                                </div>
                            </div>
                            <div class="swiper-slide" type="button">
                                <img alt="" src="https://yaimg.yanolja.com/v5/2022/10/31/11/1280/635fad384e97a3.08458721.png" decoding="async" data-nimg="fill" class="css-sr2c7j" style="position: absolute; inset: 0px; box-sizing: border-box; padding: 0px; border: none; margin: auto; display: block; width: 0px; height: 0px; min-width: 100%; max-width: 100%; min-height: 100%; max-height: 100%;">
                                <div class="cover">광주 유탑 부티크 호텔&레지던스 <br><br>
                                    105,000원 ~
                                </div>
                            </div>
                            <div class="swiper-slide" type="button">
                                <img src="https://yaimg.yanolja.com/v5/2022/09/27/13/640/633300ddacbc18.15216415.jpg" draggable="false" loading="lazy" class="css-w9k1o7">
                                <div class="cover">광주 호텔 하이브인 <br><br>
                                    120,000원 ~
                                </div>
                            </div>
                            <div class="swiper-slide" type="button">
                                <img alt="" src="https://yaimg.yanolja.com/v5/2024/07/15/11/1280/66950e9e497cd4.52927482.jpg" decoding="async" data-nimg="fill" class="css-sr2c7j" style="position: absolute; inset: 0px; box-sizing: border-box; padding: 0px; border: none; margin: auto; display: block; width: 0px; height: 0px; min-width: 100%; max-width: 100%; min-height: 100%; max-height: 100%;">
                                <div class="cover">광주 스테이 더 아람 B <br><br>
                                    160,000원 ~
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
                    포브스 선정 광주에서 가볼만한 곳 TOP 7 👍
                </div>
                <div class="content_8">
                    <!-- Swiper -->
                    <div class="swiper mySwiper">
                        <div class="swiper-wrapper">
                            <div class="swiper-slide" type="button">
                                <img src="resouces/img/1913 송정역 시장.jpg" alt="">
                                <div class="cover">1913 송정역 시장</div>
                            </div>
                            <div class="swiper-slide" type="button">
                                <img src="resouces/img/광주호 호수생태원.jpg" alt="">
                                <div class="cover">광주호 호수 생태원</div>
                            </div>
                            <div class="swiper-slide" type="button">
                                <img src="resouces/img/국립광주과학관.jpg" alt="">
                                <div class="cover">국립 광주 과학관</div>
                            </div>
                            <div class="swiper-slide" type="button">
                                <img src="resouces/img/국립광주박물관.jpg" alt="">
                                <div class="cover">국립 광주 박물관</div>
                            </div>
                            <div class="swiper-slide" type="button">
                                <img src="resouces/img/국립아시아문화전당.jpg" alt="">
                                <div class="cover">국립 아시아 문화전당</div>
                            </div>
                            <div class="swiper-slide" type="button">
                                <img src="resouces/img/무등산.jpg" alt="">
                                <div class="cover">무등산</div>
                            </div>
                            <div class="swiper-slide" type="button">
                                <img src="resouces/img/패밀리 랜드.jpg" alt="">
                                <div class="cover">광주 패밀리 랜드</div>
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