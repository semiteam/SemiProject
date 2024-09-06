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
    <link rel="stylesheet" href="resouces/css/common.css">
    <link rel="stylesheet" href="resouces/css/popup.css">
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
                    <% if (loginAdmin != null) { %>
                        <div id="side_menu_open_2" onclick="location.href='<%= contextPath %>/GoShowPlanMain.ad'" class="login">계획 짤래?</div>
                    <% } else { %>
                        <div id="side_menu_open_2" onclick="location.href='<%= contextPath %>/GoScheduleMain.sd?mno=<%= loginUser.getmNo() %>'" class="login">계획 짤래?</div>
                    <% } %>
                    <div id="side_menu_open_3" onclick="location.href='<%= contextPath %>/list.po?cpage=1'" class="login">리뷰 볼래?</div>
                    <% if (loginAdmin != null) { %>
                        <div id="side_menu_open_4" onclick="location.href='<%= contextPath %>/adminList.ad?cpage=1&pCpage=1'">관리자 메뉴</div>
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
                    <div id="side_menu_close_3" onclick="location.href='<%= contextPath %>/list.po?cpage=1'" class="login">
                        <img src="resouces/img/dynamic_feed_24dp_5F6368.png" alt="">
                        <div class="explanation">리뷰 볼래?</div>
                    </div>
                    <% if (loginAdmin != null) { %>
                        <div id="side_menu_close_4" onclick="location.href='<%= contextPath %>/adminList.ad?cpage=1&pCpage=1'">
                            <img src="resouces/img/manage_accounts_24dp_5F6368_FILL0_wght400_GRAD0_opsz24.png" alt="">
                            <div class="explanation">관리자 메뉴</div>
                        </div>
                    <% } %>
                    <div id="open_btn" onclick="side_open()">
                        <img src="resouces/img/chevron_right_24dp_5F6368.png" alt="">
                    </div>
                </div>

            <div class="content">
                <div class="content_2">
                    <!-- Swiper -->
                    <div class="swiper mySwiper">
                        <div class="swiper-wrapper">
                            <div class="swiper-slide">
                                <img src="resouces/img/2. 대구.JPG" alt="">
                            </div>
                            <div class="swiper-slide">
                                <img src="resouces/img/원피스1.JPG" alt="">
                            </div>
                            <div class="swiper-slide">
                                <img src="resouces/img/원피스2.JPG" alt="">
                            </div>
                            <div class="swiper-slide">
                                <img src="resouces/img/원피스3.JPG" alt="">
                            </div>
                            <div class="swiper-slide">
                                <img src="resouces/img/원피스4.JPG" alt="">
                            </div>
                            <div class="swiper-slide">
                                <img src="resouces/img/원피스6.JPG" alt="">
                            </div>
                            <div class="swiper-slide">
                                <img src="resouces/img/원피스7.JPG" alt="">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="content_3" align="center">
                    <br><br>
                    <h3><br>🏴‍☠️원피스 애니메이션 25주년 팝업스토어🏴‍☠️<br>
                        <br><br><br>

                        원피스 애니메이션 25주년을 기념해 <br>
                        더현대 서울에 이어 더현대 대구에 등장했다⚓️ <br>
                        <br>
                        📷 애니메이션 속 주인공이 되어볼 수 있는 포토존 <br>
                        🛒 피규어부터 인형, 문구류, 키링 등 총 400여 종의 굿즈 <br>
                        등 팬들의 마음을 설레게 할 즐길 거리가 가득하다구👀 <br>
                        <br>
                        뿐만 아니라, 원피스 덕후들을 위한 이벤트도 <br>   
                        알차게 준비되어 있으니 <br>
                        이번 주, 원피스 대서사의 감동을 느껴보러 <br>
                        더현대 대구로 놀러 가보자💨 <br>
                        <br>
                        💌 방문객 원피스 애니메이션 25주년 디자인 스티커 무료 증정 <br>
                        💌 5만원 이상 구매 시 응모권 1장 증정 <br> 
                        💌 10만원 이상 구매 시 루피 수배서 리유저블백 증정 <br>
                        💌 15만원 이상 구매 시 원피스 전시 관람권 2매 증정 <br>
                        💌 일일 한정 스미스앤레더 키링 판매 <br>
                        <br>
                        📍대구 중구 달구벌대로 2077, 더현대 대구 B2 팝업스테이지 <br>
                        📍07.26(금)-08.04(일) <br>
                        📍매일: 10:30~20:00 (금토일 20:30) <br>

                    </h3>
                </div>
                <br><br>
            </div>
        </div>
    </div>
</body>

</html>