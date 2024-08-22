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
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script> 
        
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css">
        
        <link rel="preconnect" href="https://fonts.googleapis.com">
        
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Hahmlet:wght@100..900&display=swap" rel="stylesheet">
        
        <script defer src="resouces/js/common.js"></script>
        <script defer src="resouces/js/script2.js"></script>
        <link rel="stylesheet" href="resouces/css/manager2.css">
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
                    <div id="side_menu_open_1" onclick="location.href='<%= contextPath %>/GoAdminMain.ad'">회원 관리</div>
                    <div id="side_menu_open_2" onclick="location.href='<%= contextPath %>/GoAdmin2.ad'">사용자 통계</div>
                    <div id="side_menu_open_3" onclick="location.href='<%= contextPath %>/GoAdmin3.ad'">수익 관리</div>
                    <div id="side_menu_open_4" onclick="location.href='<%= contextPath %>'">메인 메뉴</div>
                    <div id="close_btn" onclick="side_close()"><img src="resouces/img/chevron_left_24dp_5F6368.png" alt=""></div>
    
                    <div id="side_menu_close_1" onclick="location.href='<%= contextPath %>/GoAdminMain.ad'">
                        <img src="resouces/img/airplane_ticket_24dp_5F6368.png" alt="">
                        <div class="explanation">회원 관리</div>
                    </div>
                    <div id="side_menu_close_2" onclick="location.href='<%= contextPath %>/GoAdmin2.ad'">
                        <img src="resouces/img/edit_calendar_24dp_5F6368_FILL0_wght400_GRAD0_opsz24.png" alt="">
                        <div class="explanation">사용자 통계</div>
                    </div>
                    <div id="side_menu_close_3" onclick="location.href='<%= contextPath %>/GoAdmin3.ad'">
                        <img src="resouces/img/dynamic_feed_24dp_5F6368.png" alt="">
                        <div class="explanation">수익 관리</div>
                    </div>
                    <div id="side_menu_close_4" onclick="location.href='<%= contextPath %>'">
                        <img src="resouces/img/dynamic_feed_24dp_5F6368.png" alt="">
                        <div class="explanation">메인 메뉴</div>
                    </div>
                    <div id="open_btn" onclick="side_open()">
                        <img src="resouces/img/chevron_right_24dp_5F6368.png" alt="">
                    </div>
                </div>
    
                <div class="content"> 
                        <div class="main count-box">
                            <div class="count-item">
                                <h4>금일 방문자 수</h4>
                                <div id="daily-visitor-count" class="counter">5</div>
                            </div>
                            <div class="count-item">
                                <h4>총 회원 수</h4>
                                <div id="total-member-count" class="counter">55</div>
                            </div>
                            <div class="count-item">
                                <h4>?</h4>
                                <div id="" class="counter">555</div>
                            </div>

                        </div>

                    <div class="main chart-container">
                        <div class="chart-box"><h5>회원/비회원 사용비율</h5><canvas id="userRatioChart"></canvas></div>
                        <div class="chart-box"><h5>회원 성비</h5> <canvas id="genderRatioChart"></canvas></div>
                        <div class="chart-box"><h5>세대별 이용자 비율</h5> <canvas id="ageRatioChart"></canvas></div>
                        <div class="chart-box"><h5>국내/해외여행 트래픽</h5>  <canvas id="travelTrafficRatioChart"></canvas></h5></div>
                    </div>

                </div>
                
            </div>      
        </div>
    </body>
</html>