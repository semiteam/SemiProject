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
    <link rel="stylesheet" href="resouces/css/course.css">
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
                                <img src="resouces/img/1. 강릉.jpg" alt="">
                            </div>
                            <div class="swiper-slide">
                                <img src="resouces/img/2. 경포대.jpg" alt="">
                            </div>
                            <div class="swir-slide">
                                <img src="resouces/img/2. 경포대2.jpg" alt="">
                            </div>
                            <div class="swiper-slide">
                                <img src="resouces/img/3. 초당 순두부 마을.jpg" alt="">
                            </div>
                            <div class="swiper-slide">
                                <img src="resouces/img/3. 초당 순두부 마을2.jpg" alt="">
                            </div>
                            <div class="swiper-slide">
                                <img src="resouces/img/4. 안목해변 카페거리.jpg" alt="">
                            </div>
                            <div class="swiper-slide">
                                <img src="resouces/img/4. 안목해변 카페거리2.jpg" alt="">
                            </div>
                            <div class="swiper-slide">
                                <img src="resouces/img/5. 주문진 방파제.jpg" alt="">
                            </div>
                            <div class="swiper-slide">
                                <img src="resouces/img/5. 주문진 방파제2.jpg" alt="">
                            </div>
                            <div class="swiper-slide">
                                <img src="resouces/img/6. 정동진 레일바이크.jpg" alt="">
                            </div>
                            <div class="swiper-slide">
                                <img src="resouces/img/6. 정동진 레일바이크2.jpg" alt="">
                            </div>
                            <div class="swiper-slide">
                                <img src="resouces/img/7. 강릉 중앙시장.jpg" alt="">
                            </div>
                            <div class="swiper-slide">
                                <img src="resouces/img/7. 강릉 중앙시장2.jpg" alt="">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="content_3" align="center">
                    <br><br>
                    <h3><br> 🚌  MD가 추천하는 강릉 여행 당일치기 코스 🚌<br>
                        <br><br><br>
                         
                        무더운 여름 더위에 지친 당신!! 시원한 강원도로 훌쩍 떠나보는 건 어때요? <br>
                        지금부터 시원한 풍경으로 유명한 강원도 강릉 당일치기 코스를 소개해 드리겠습니다! <br>
                        <br>
                        1 > 강릉에서 가장 유명한 해변 중 하나, 넓은 백사장과 아름다운 풍경이 있는 <br>
                        경포대 해수욕장으로 떠나봅시다! 이곳은 여름철에 많은 사람들이 찾는 인기 명소로,  <br>
                        6km에 걸친 긴 백사장이 펼쳐져 있으며 아름답고 시원한 풍경이 당신을 반길거에요. <br>
                        
                        <br>
                        2 > 시원한 경포대를 지나 많이 출출하실 거라고 예상 되는데요! 아니나 다를까, <br>
                        강릉 맛집들이 줄 서 있는 초당 순두부 마을이 기다리고 있어요! <br>
                        강릉은 순두부가 유명한데요. 조선시대 '허균'과 '허난설헌'의 아버지 '허엽' 선생이 <br>
                        삼척 부사로 근무할 당시 강릉에 풍부한 콩으로 두부를 만들어 먹기 시작했고 <br>
                        그 맛이 강릉에 퍼지면서 허엽 선생의 호를 붙여 '초당' 순두부로 명명했다고 합니다. <br>
                        강릉까지 왔는데 순두부를 안 먹으면 후회 하겠죠?! <br> 
                        (ps. 순두부 아이스크림도 있어요!!) <br>
                        
                        <br>
                        3 > 순두부를 충분히 맛 보셨다면, 현대인들의 필수 요소인 카페인 수혈해야죠 ~~ <br>
                        파랗고 시원한 해변이 반기는 안목해변 카페거리로 얼른 달려 갑시다! <br>
                        거리에 있는 카페 어디를 가도 후회하지 않을 해변 뷰와 은은한 커피향과, <br>
                        고소하고 맛있는 커피가 어우러져 여러분들에게 행복을 줄 거에용~~ <br>

                        <br>
                        4 > 사랑하는 사람들과 행복한 티타임 되셨나요? 다시 시원한 바닷바람 맞으며 <br>
                        걸어볼 시간입니다! 이 곳은 웬만하면 다 아실 거라고 생각하는데요~~ <br>
                        드라마 '도깨비' 촬영지로 유명한 주문진 방파제로 가보는 거에요 ! <br>
                        이 곳에 가면 배우 '공유' 와 배우 '이동욱'이 반겨줄 것 같지 않나요?! <br>

                        <br>
                        5 > 이번엔 액티비티하고 건강에도 좋은 걸 소개 시켜 드리려고 해요 ~~ <br>
                        정동진 레일바이크라고 들어보셨나요? 바다를 배경 삼아 레일 위에서 즐기는 <br>
                        관광 코스입니다! 무엇보다 낭만 하나는 흘러 넘친다고 자신할 수 있어요! <br>
                        낭만도 챙기고, 건강도 챙기는! 일석이조인 정동진 레일바이크를 즐겨 보세요! <br>

                        <br>
                        6 > 아쉽지만 이제 마지막 코스 입니다 .. 이번에 소개드릴 코스는 !! <br>
                        강릉 중앙시장입니다! 활기 넘치는 전통시장인 중앙시장은 강원도의 <br>
                        맛과 정을 동시에 느낄 수 있는 아주 매력적인 시장입니다 ~! <br>
                        시장 속에 숨어있는 강릉의 명물, 강릉의 문화를 느껴보시면서 하루를 <br>
                        마무리 해보아요 ~~ <br>

                    </h3>
                </div>
            </div>
        </div>
    </div>
</body>

</html>