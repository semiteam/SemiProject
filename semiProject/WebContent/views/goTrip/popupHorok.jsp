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
                                <img src="resouces/img/5. 호록.JPG" alt="">
                            </div>
                            <div class="swiper-slide">
                                <img src="resouces/img/호록1.JPG" alt="">
                            </div>
                            <div class="swiper-slide">
                                <img src="resouces/img/호록2.JPG" alt="">
                            </div>
                            <div class="swiper-slide">
                                <img src="resouces/img/호록3.JPG" alt="">
                            </div>
                            <div class="swiper-slide">
                                <img src="resouces/img/호록4.JPG" alt="">
                            </div>
                            <div class="swiper-slide">
                                <img src="resouces/img/호록5.JPG" alt="">
                            </div>
                            <div class="swiper-slide">
                                <img src="resouces/img/호록6.JPG" alt="">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="content_3" align="center">
                    <br><br>
                    <h3><br>🍻Horok!술림픽 팝업스토어🍻<br>
                        <br><br><br>
                        T Factory에서 전 세계 주류들이 메달 경쟁을 펼친다!🎖️<br>
                        <br>
                        우리나라를 포함한 <br>
                        다양한 해외 주류를 체험하고, <br>
                        투표도 하며 특별한 굿즈를 받아보자!✨️ <br>
                        <br>
                        주류 샘플러 1set를 무료 시음부터 <br>
                        메달 순위 맞히고 추가 굿즈 획득!🥇 <br>
                        쏘믈리에 콘테스트로 메달과 인증서까지 <br>
                        다채로운 즐길 거리는 물론이고 <br>
                        <br>
                        주류를 구매하면 각인 서비스도 제공한다구🍾<br>
                        <br>
                        맛있는 술 좋아하면, &lt;Horok!술림픽&gt; 꼭 가기 <br> 
                        <br>
                            💌입장 시, 주류 샘플러 1set를 무료 시음 <br>
                            💌주류 순위 매기는 체험 진행 시, 지비츠 추가 증정 <br>
                            💌주류 구매 시, 각인 서비스 제공 <br>
                        <br>
                            📍마포구 양화로 144 1층, T Factory <br>
                            📍07.04(목)-08.31(토) <br>
                            📍매일: 11:00 ~ 21:00 <br>
                            (*매달 3번째 월요일 정기휴무) <br>
                    </h3>
                </div>
                <br><br>
            </div>
        </div>
    </div>
</body>

</html>