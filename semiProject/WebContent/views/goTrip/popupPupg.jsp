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
                                <img src="resouces/img/7. 펍지.JPG" alt="">
                            </div>
                            <div class="swiper-slide">
                                <img src="resouces/img/펍지1.JPG" alt="">
                            </div>
                            <div class="swiper-slide">
                                <img src="resouces/img/펍지2.JPG" alt="">
                            </div>
                            <div class="swiper-slide">
                                <img src="resouces/img/펍지3.JPG" alt="">
                            </div>
                            <div class="swiper-slide">
                                <img src="resouces/img/펍지4.JPG" alt="">
                            </div>
                            <div class="swiper-slide">
                                <img src="resouces/img/펍지5.JPG" alt="">
                            </div>
                            <div class="swiper-slide">
                                <img src="resouces/img/펍지6.JPG" alt="">
                            </div>
                            <div class="swiper-slide">
                                <img src="resouces/img/펍지7.JPG" alt="">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="content_3" align="center">
                    <br><br>
                    <h3><br>🔫배틀그라운드 팝업스토어🔫<br>
                        <br><br><br>
                        역대급 스케일의 <br>
                        배틀그라운드 팝업스토어가 <br>
                        성수에 문을 열었다🏝️<br>
                        <br>
                        배그 ‘사녹’ 맵을 옮겨놓은 컨셉으로<br>
                        몰입감이 최고조라는데…!🗺️<br>
                        <br>
                        🎳 아케이드존<br>
                        🏄‍♀️ 서핑라이더존<br>
                        🍔 푸드존<br>
                        📷 포토존 등<br>
                        <br>
                        다양한 스팟으로 구성되어 있어<br>
                        놀 거리, 즐길 거리가 한가득‼️<br>
                        <br>
                        @댓글로 배그 덕후들 소환하고 이소식 알려주자<br>
                        <br>
                        📍성동구 왕십리로4길 5 <br>
                        📍08.01(목)-08.18(일) (*매주 월-수 휴무) <br>
                        📍목~일: 14:00~20:00 (*last time 19:30) <br>
                    </h3>
                </div>

                <br><br>
            </div>
        </div>
    </div>
</body>

</html>