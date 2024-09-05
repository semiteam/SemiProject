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
                <div class="content_2">
                    <!-- Swiper -->
                    <div class="swiper mySwiper">
                        <div class="swiper-wrapper">
                            <div class="swiper-slide">
                                <img src="resouces/img/3. 짱구.JPG" alt="">
                            </div>
                            <div class="swiper-slide">
                                <img src="resouces/img/짱구1.JPG" alt="">
                            </div>
                            <div class="swiper-slide">
                                <img src="resouces/img/짱구2.JPG" alt="">
                            </div>
                            <div class="swiper-slide">
                                <img src="resouces/img/짱구3.JPG" alt="">
                            </div>
                            <div class="swiper-slide">
                                <img src="resouces/img/짱구4.JPG" alt="">
                            </div>
                            <div class="swiper-slide">
                                <img src="resouces/img/짱구5.JPG" alt="">
                            </div>
                            <div class="swiper-slide">
                                <img src="resouces/img/짱구6.JPG" alt="">
                            </div>
                            <div class="swiper-slide">
                                <img src="resouces/img/짱구7.JPG" alt="">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="content_3" align="center">
                    <br><br>
                    <h3><br>🚘짱구는 여행중 in 전주🚘<br>
                        <br><br><br>
                        짱구가 잠실을 지나 전주에 드디어 도착! 🚂<br>
                        <br>
                        입구부터 마련된 귀염뽀짝 포토존으로 <br>
                        발길을 멈추게 하는데..!👀 <br>
                        <br>
                        물욕을 자극하는 다채로운 굿즈부터 <br>
                        전주 한정판 피규어 무드등까지 <br>
                        한자리에서 만나볼 수 있다구-🛒 <br>
                        <br>    
                        뿐만 아니라, 팝업에 방문만 해도 짱구 스티커를💛 <br>
                        일정 금액 이상 구매 시, 응모권과 랜덤 굿즈를💛  <br>
                        제공하니 모두 놓치지 말고 다 챙기기! <br>
                        <br>
                        방문 고객에게 제공하는 스페셜 쿠폰으로 <br>
                        한옥마을도 함께 둘러보며 <br>
                        짱구와 함께 즐거운 시간을 보내보자💨 <br>
                        <br>
                        🔻아직 짱구의 여행은 끝나지 않았다! 일정 참고하기🔻 <br>
                        ✔️대구 현대백화점 더현대: 9월 27일~10월 6일 <br>
                        ✔️부산 신세계백화점 센텀시티: 11월 15일~11월 24일 <br>
                        <br>
                        💌팝업 방문한 고객 전원, 전주 한정판 짱구 스티커 증정 <br>
                        💌 3만원 이상 구매 시, 랜덤 굿즈 증정 (*재고 소진 시, 종료) <br>
                        💌 5만원 이상 구매 시, 전기자전거 & 가죽 에디션 응모권 증정 <br>
                        💌 7만원 이상 구매 시, 전주 한옥마을 키링 증정 <br>
                        <br>    
                        📍전주시 완산구 최명희길 28, 전주 한옥마을 <br>
                        📍08.02(금)-09.18(수) <br>
                        📍매일: 10:00~19:00 <br>
                    </h3>
                </div>

                <br><br>
            </div>
        </div>
    </div>
</body>

</html>