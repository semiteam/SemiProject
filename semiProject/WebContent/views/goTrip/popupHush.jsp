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
                <div id="side_menu_open_1" onclick="location.href='views/goTrip/goTripLogin_O.jsp'">여행 갈래?</div>
                <div id="side_menu_open_2" onclick="location.href='views/schedule/plan_X.jsp'">계획 짤래?</div>
                <div id="side_menu_open_3" onclick="location.href='views/post/postMain.jsp'">리뷰 볼래?</div>
                <div id="side_menu_open_4" onclick="location.href='views/manager/manager1.jsp'">관리자 메뉴</div>
                <div id="close_btn" onclick="side_close()"><img src="resouces/img/chevron_left_24dp_5F6368.png" alt=""></div>

                <div id="side_menu_close_1" onclick="location.href='views/goTrip/goTripLogin_O'">
                    <img src="resouces/img/airplane_ticket_24dp_5F6368.png" alt="">
                    <div class="explanation">여행 갈래?</div>
                </div>
                <div id="side_menu_close_2" onclick="location.href='views/schedule/plan_X.jsp'">
                    <img src="resouces/img/edit_calendar_24dp_5F6368_FILL0_wght400_GRAD0_opsz24.png" alt="">
                    <div class="explanation">계획 짤래?</div>
                </div>
                <div id="side_menu_close_3" onclick="location.href='views/post/postMain.jsp'">
                    <img src="resouces/img/dynamic_feed_24dp_5F6368.png" alt="">
                    <div class="explanation">리뷰 볼래?</div>
                </div>
                <div id="side_menu_close_4" onclick="location.href='views/manager/manager1.jsp'">
                    <img src="resouces/img/manage_accounts_24dp_5F6368_FILL0_wght400_GRAD0_opsz24.png" alt="">
                    <div class="explanation">관리자 메뉴</div>
                </div>
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
                                <img src="resouces/img/1. 강남허쉬.JPG" alt="">
                            </div>
                            <div class="swiper-slide">
                                <img src="resouces/img/허쉬1.jpg" alt="">
                            </div>
                            <div class="swiper-slide">
                                <img src="resouces/img/허쉬2.JPG" alt="">
                            </div>
                            <div class="swiper-slide">
                                <img src="resouces/img/허쉬3.JPG" alt="">
                            </div>
                            <div class="swiper-slide">
                                <img src="resouces/img/허쉬4.JPG" alt="">
                            </div>
                            <div class="swiper-slide">
                                <img src="resouces/img/허쉬5.JPG" alt="">
                            </div>
                            <div class="swiper-slide">
                                <img src="resouces/img/허쉬7.JPG" alt="">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="content_3" align="center">
                    <br><br>
                    <h3><br>🍫삼성강남x허쉬 팝업스토어🍫<br>
                        <br><br><br>

                        강남에서 달콤한 향기를 따라가면 등장하는 <br>
                        삼성과 허쉬의 역대급 콜라보레이션 팝업! 🍪 <br>
                        <br>
                        불가피하게 버려지는 허쉬 폐비닐을<br>
                        액세서리로 만들어 보는 <br> 
                        리사이클링 체험을 할 수 있고 🗝️ <br>
                        <br>
                        허쉬 드링크, 허쉬 초콜릿 증정하는<br>
                        SNS 이벤트가 준비되어 있다구~ 🎁<br>
                        <br>
                        힙한 콜라보 갤럭시 폰 케이스와<br>
                        버즈 케이스도 구경할 수 있는<br>
                        삼성강남으로 놀러 와! 🍩 <br>
                        <br>
                        📍서초구 강남대로 411, 3층 <br>
                        📍07.29(월)-08.11(일) <br>
                        📍매일: 10:00~20:00 <br>
                    </h3>
                </div>
            </div>
        </div>
    </div>
</body>

</html>