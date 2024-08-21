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
                        포항 편
                </div>
                <div class="content_3">
                    ✨ MD 픽 추천 숙소 7선 ✨
                </div>
                <div class="content_4">
                     <!-- Swiper -->
                     <div class="swiper mySwiper">
                        <div class="swiper-wrapper"> 
                            <div class="swiper-slide" type="button">
                                <img alt="포항 더헤이븐리조트펜션 사진" src="https://yaimg.yanolja.com/v5/2023/11/24/13/1280/6560a4354bff75.69812674.jpg" decoding="async" data-nimg="fill" class="css-sr2c7j" style="position: absolute; inset: 0px; box-sizing: border-box; padding: 0px; border: none; margin: auto; display: block; width: 0px; height: 0px; min-width: 100%; max-width: 100%; min-height: 100%; max-height: 100%;">                                
                                <div class="cover">포항 더헤이븐리조트펜션 <br><br>
                                    180,000원 ~
                                </div>
                            </div>
                            <div class="swiper-slide" type="button">
                                <img alt="포항 영일대 브라운도트 포항영일대해수욕장점 사진" src="https://yaimg.yanolja.com/v5/2020/12/16/14/1280/5fd9a19d53fe23.26104338.jpg" decoding="async" data-nimg="fill" class="css-sr2c7j" style="position: absolute; inset: 0px; box-sizing: border-box; padding: 0px; border: none; margin: auto; display: block; width: 0px; height: 0px; min-width: 100%; max-width: 100%; min-height: 100%; max-height: 100%;">
                                <div class="cover">포항 영일대 브라운도트 포항영일대해수욕장점 <br><br>
                                    120,000원 ~
                                </div>
                            </div>
                            <div class="swiper-slide" type="button">
                                <img alt="포항 190워터스테이 사진" src="https://yaimg.yanolja.com/v5/2024/06/23/13/1280/6678284b84c499.73262866.jpg" decoding="async" data-nimg="fill" class="css-sr2c7j" style="position: absolute; inset: 0px; box-sizing: border-box; padding: 0px; border: none; margin: auto; display: block; width: 0px; height: 0px; min-width: 100%; max-width: 100%; min-height: 100%; max-height: 100%;">
                                <div class="cover">포항 190워터스테이 <br><br>
                                    80,000원 ~
                                </div>
                            </div>
                            <div class="swiper-slide" type="button">
                                <img alt="포항 프레젠트풀빌라 사진" src="https://yaimg.yanolja.com/v5/2024/05/28/14/1280/6655ec639f85a5.80617622.jpg" decoding="async" data-nimg="fill" class="css-sr2c7j" style="position: absolute; inset: 0px; box-sizing: border-box; padding: 0px; border: none; margin: auto; display: block; width: 0px; height: 0px; min-width: 100%; max-width: 100%; min-height: 100%; max-height: 100%;">
                                <div class="cover">포항 프레젠트풀빌라<br><br>
                                    134,000원 ~
                                </div>
                            </div>
                            <div class="swiper-slide" type="button">
                                <img alt="포항 유앤미풀빌라 사진" src="https://yaimg.yanolja.com/v5/2024/05/31/12/1280/6659bfec88ef06.53191548.jpg" decoding="async" data-nimg="fill" class="css-sr2c7j" style="position: absolute; inset: 0px; box-sizing: border-box; padding: 0px; border: none; margin: auto; display: block; width: 0px; height: 0px; min-width: 100%; max-width: 100%; min-height: 100%; max-height: 100%;">
                                <div class="cover">포항 유앤미 풀빌라 <br><br>
                                    250,000원 ~
                                </div>
                            </div>
                            <div class="swiper-slide" type="button">
                                <img alt="포항 이스트케이프 사진" src="https://yaimg.yanolja.com/v5/2024/05/09/11/1280/663cadec8933e6.39092445.jpg" decoding="async" data-nimg="fill" class="css-sr2c7j" style="position: absolute; inset: 0px; box-sizing: border-box; padding: 0px; border: none; margin: auto; display: block; width: 0px; height: 0px; min-width: 100%; max-width: 100%; min-height: 100%; max-height: 100%;">
                                <div class="cover">포항 이스트케이프 <br><br>
                                    300,000원 ~
                                </div>
                            </div>
                            <div class="swiper-slide" type="button">
                                <img alt="포항 마담아네뜨 사진" src="https://yaimg.yanolja.com/v5/2024/06/20/14/1280/6674381cc59ac3.02577975.jpg" decoding="async" data-nimg="fill" class="css-sr2c7j" style="position: absolute; inset: 0px; box-sizing: border-box; padding: 0px; border: none; margin: auto; display: block; width: 0px; height: 0px; min-width: 100%; max-width: 100%; min-height: 100%; max-height: 100%;">
                                <div class="cover">포항 마담아네뜨 <br><br>
                                    208,000원 ~
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
                    포브스 선정 포항에서 가볼만한 곳 TOP 7 👍
                </div>
                <div class="content_8">
                     <!-- Swiper -->
                     <div class="swiper mySwiper">
                        <div class="swiper-wrapper"> 
                            <div class="swiper-slide" type="button">
                                <img src="resouces/img/1. 호미곶.jpg" alt="">
                                <div class="cover">호미곶 해맞이 광장</div>
                            </div>
                            <div class="swiper-slide" type="button">
                                <img src="resouces/img/2. 포항함 박물관.jpg" alt="">
                                <div class="cover">포항함 박물관</div>
                            </div>
                            <div class="swiper-slide" type="button">
                                <img src="resouces/img/3. 국립 등대 박물관.jpg" alt="">
                                <div class="cover">국립 등대 박물관</div>
                            </div>
                            <div class="swiper-slide" type="button">
                                <img src="resouces/img/4. 덕동 문화마을.jpg" alt="">
                                <div class="cover">덕동 문화마을</div>
                            </div>
                            <div class="swiper-slide" type="button">
                                <img src="resouces/img/5. 죽도시장.jpg" alt="">
                                <div class="cover">죽도시장</div>
                            </div>
                            <div class="swiper-slide" type="button">
                                <img src="resouces/img/6. 영일대 해수욕장.jpg" alt="">
                                <div class="cover">영일대 해수욕장</div>
                            </div>
                            <div class="swiper-slide" type="button">
                                <img src="resouces/img/7. 오어사.jpg" alt="">
                                <div class="cover">오어사</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>

</html>