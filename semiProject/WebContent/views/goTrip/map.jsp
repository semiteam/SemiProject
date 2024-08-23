<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>여행가조</title>

        <script type="text/javascript"
            src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e2bf581f8e5deb3fd9bf4d915aa08ba4"></script>

        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

        <!-- jQuery library -->
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>

        <!-- Popper JS -->
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

        <!-- services와 clusterer, drawing 라이브러리 불러오기 -->
        <script type="text/javascript"
            src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services,clusterer,drawing"></script>

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css">

        <link rel="preconnect" href="https://fonts.googleapis.com">

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Hahmlet:wght@100..900&display=swap" rel="stylesheet">

        <script defer src="resouces/js/common.js"></script>
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
                            <li id="top_menu_2" onclick="location.href='<%= contextPath %>/GoServiceCenter.sc'">고객센터
                            </li>
                            <li id="top_menu_3">로그아웃</li>
                        </ul>
                    </div>
                </div>

                <div class="under">
                    <div class="side_menu">
                        <div id="side_menu_open_1" onclick="location.href='<%= contextPath %>'">여행 갈래?</div>
                        <div id="side_menu_open_2" onclick="location.href='<%= contextPath %>/GoScheduleMain.sd'"
                            class="login">계획 짤래?</div>
                        <div id="side_menu_open_3" onclick="location.href='<%= contextPath %>/GoPostMain.ps'"
                            class="login">리뷰 볼래?</div>
                        <% if (loginAdmin !=null) { %>
                            <div id="side_menu_open_4" onclick="location.href='<%= contextPath %>/GoAdminMain.ad'">관리자
                                메뉴</div>
                            <% } %>
                                <div id="close_btn" onclick="side_close()"><img
                                        src="resouces/img/chevron_left_24dp_5F6368.png" alt=""></div>

                                <div id="side_menu_close_1" onclick="location.href='<%= contextPath %>'" class="login">
                                    <img src="resouces/img/airplane_ticket_24dp_5F6368.png" alt="">
                                    <div class="explanation">여행 갈래?</div>
                                </div>
                                <div id="side_menu_close_2"
                                    onclick="location.href='<%= contextPath %>/GoScheduleMain.sd'" class="login">
                                    <img src="resouces/img/edit_calendar_24dp_5F6368_FILL0_wght400_GRAD0_opsz24.png"
                                        alt="">
                                    <div class="explanation">계획 짤래?</div>
                                </div>
                                <div id="side_menu_close_3" onclick="location.href='<%= contextPath %>/GoPostMain.ps'"
                                    class="login">
                                    <img src="resouces/img/dynamic_feed_24dp_5F6368.png" alt="">
                                    <div class="explanation">리뷰 볼래?</div>
                                </div>
                                <% if (loginAdmin !=null) { %>
                                    <div id="side_menu_close_4"
                                        onclick="location.href='<%= contextPath %>/GoAdminMain.ad'">
                                        <img src="resouces/img/manage_accounts_24dp_5F6368_FILL0_wght400_GRAD0_opsz24.png"
                                            alt="">
                                        <div class="explanation">관리자 메뉴</div>
                                    </div>
                                    <% } %>
                                        <div id="open_btn" onclick="side_open()">
                                            <img src="resouces/img/chevron_right_24dp_5F6368.png" alt="">
                                        </div>
                    </div>

                    <div class="content">
                        <div id="map" style="width:1600px;height: 850px;"></div>
                        <div id="clickLatlng"></div>
                        <script>
                            var container = document.getElementById('map');
                            var options = {
                                center: new kakao.maps.LatLng(37.55482, 126.9712),
                                level: 3
                            };

                            var map = new kakao.maps.Map(container, options);

                            // 지도를 클릭한 위치에 표출할 마커입니다
                            var marker = new kakao.maps.Marker({
                                // 지도 중심좌표에 마커를 생성합니다 
                                position: map.getCenter()
                            });
                            // 지도에 마커를 표시합니다
                            marker.setMap(map);

                            // 지도에 클릭 이벤트를 등록합니다
                            // 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
                            kakao.maps.event.addListener(map, 'click', function (mouseEvent) {

                                // 클릭한 위도, 경도 정보를 가져옵니다 
                                var latlng = mouseEvent.latLng;

                                // 마커 위치를 클릭한 위치로 옮깁니다
                                marker.setPosition(latlng);

                                var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
                                message += '경도는 ' + latlng.getLng() + ' 입니다';

                                var resultDiv = document.getElementById('clickLatlng');
                                resultDiv.innerHTML = message;

                            });

                        </script>
                    </div>
                </div>
            </div>
    </body>

    </html>