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
    <link rel="stylesheet" href="resouces/css/common.css">
    <link rel="stylesheet" href="resouces/css/popup.css">
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
                <div class="content_2">
                    <!-- Swiper -->
                    <div class="swiper mySwiper">
                        <div class="swiper-wrapper">
                            <div class="swiper-slide">
                                <img src="resouces/img/4. 서천.JPG" alt="">
                            </div>
                            <div class="swiper-slide">
                                <img src="resouces/img/서천1.JPG" alt="">
                            </div>
                            <div class="swiper-slide">
                                <img src="resouces/img/서천2.JPG" alt="">
                            </div>
                            <div class="swiper-slide">
                                <img src="resouces/img/서천3.JPG" alt="">
                            </div>
                            <div class="swiper-slide">
                                <img src="resouces/img/서천4.JPG" alt="">
                            </div>
                            <div class="swiper-slide">
                                <img src="resouces/img/서천5.JPG" alt="">
                            </div>
                            <div class="swiper-slide">
                                <img src="resouces/img/서천6.JPG" alt="">
                            </div>
                            <div class="swiper-slide">
                                <img src="resouces/img/서천7.JPG" alt="">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="content_3" align="center">
                    <br><br>
                    <h3><br> 🍺서천 마케-트 팝업스토어🍺<br>
                        <br><br><br>
                       
                        @#$%남녀 방문객 모집#$@#$ <br>
                        ★☆목마른 방문객 환영☆★ <br>
                        ▷논알콜 음료 완비◁ <br>
                        <br>
                        충남 서천을 연남동에 그대로 옮겨놓은 <br>
                        서천 마케-트 팝업스토어에서는 <br>
                        <br>
                        크러시 생맥주와 서천 명물 먹거리를 <br>
                        함께 맛볼 수 있는데🍻 <br>
                        <br>
                        🍻 시원한 웰컴드링크 증정 <br>
                        🎮 서천 굿즈 100% 증정 게임 <br>
                        🌸 맥문동 꽃축제 초대 이벤트 등 <br>
                        <br>
                        즐길 거리까지 가득 준비되어 있어 🎶 <br>
                        <br>
                        함께 더워 피해서 <br>
                        서천 마케-트로 놀러 가보지 않을래? <br>
                        <br>
                        📍마포구 동교로38길 19, 스몰타운스몰 <br>
                        📍07.26(금)-08.04(일) <br>
                        📍매일: 12:00~20:00 <br>
                    </h3>
                </div>
            </div>
        </div>
    </div>
</body>

</html>