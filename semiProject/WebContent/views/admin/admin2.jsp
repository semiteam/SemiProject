<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
    int mCount = (int)request.getAttribute("mCount"); // 전체회원수
	int newCount = (int)request.getAttribute("newCount"); // 오늘가입회원수
	int manCount = (int)request.getAttribute("manCount"); // 남자회원수
	int womanCount = (int)request.getAttribute("womanCount"); // 여자회원수
	
	int under10s = (int)request.getAttribute("under10s"); // 10대 이하 회원수
	int age20s = (int)request.getAttribute("age20s"); // 20대 회원수
	int age30s = (int)request.getAttribute("age20s"); // 30대 회원수
	int over40s = (int)request.getAttribute("over40s"); // 40대 이상 회원수
	int nRcount = (int)request.getAttribute("nRcount"); // 답변이 안달린 고객문의 글 수
	
	
%>
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
                        <li id="top_menu_1" onclick="location.href='<%= contextPath %>/GoMyPage.me'"></li>
                        <li id="top_menu_2" onclick="location.href='<%= contextPath %>/GoServiceCenter.sc'">고객센터</li>
                        <li id="top_menu_3">로그아웃</li>
                    </ul>
                </div>
            </div>

            <div class="under">
                <div class="side_menu">
                    <div id="side_menu_open_1" onclick="location.href='<%=contextPath%>/adminList.ad?cpage=1&pCpage=1'">회원 관리</div>
                    <div id="side_menu_open_2" onclick="location.href='<%=contextPath%>/adminData.ad'">사용자 통계</div>
                  
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
                                <h4>총 회원 수</h4>
                                <div id="total-member-count" class="counter"><%=mCount%></div>
                            </div>
                            <div class="count-item">
                                <h4>신규 회원 수</h4>
                                <div id="daily-visitor-count" class="counter"><%=newCount%></div>
                            </div>
                            <div class="count-item">
                                <h4>답변 안된 문의글</h4>
                                <div id="question-count" class="counter"><%=nRcount %></div>
                            </div>

                        </div>

                    <div class="main chart-container">
                        
                        <div class="chart-box"><h5></h5> <canvas id="genderRatioChart"></canvas></div>
                        <div class="chart-box"><h5></h5> <canvas id="ageRatioChart"></canvas></div>
                        
                    </div>

                </div>
                
            </div>      
        </div>
        <script>
	       		var womanCount = <%= womanCount %>;
	            var manCount = <%= manCount %>;
	            var mCount = <%= mCount %>;
	            
	            var under10s = <%=under10s%>;
	            var age20s = <%=age20s%>;
	            var age30s = <%=age30s%>;
	            var over40s = <%=over40s%>;

			    var womanRatio = Math.round((womanCount / mCount) * 100);
			    var manRatio = Math.round((manCount / mCount) * 100);
			    
			    var ctx = document.getElementById('genderRatioChart').getContext('2d');
			    var genderRatioChart = new Chart(ctx, {
			        type: 'doughnut',
			        data: {
			            labels: ['남성', '여성',],
			            datasets: [{
			                label: '성비',
			                data: [manRatio, womanRatio],  // Directly use the counts
			                backgroundColor: [
			                    'rgba(54, 162, 235, 0.2)',
			                    'rgba(255, 99, 132, 0.2)',
			                ],
			                borderColor: [
			                    'rgba(54, 162, 235, 1)',
			                    'rgba(255, 99, 132, 1)',
			                ],
			                borderWidth: 1
			            }]
			        },
			        options: {
			            responsive: true,
			            plugins: {
			                legend: {
			                    position: 'top',
			                },
			                title: {
			                    display: true,
                                text: '회원 성비'
			                    
			                } 
			            },
                    }
                    
			        
			    });


                var ctx = document.getElementById('ageRatioChart').getContext('2d');
                var ageRatioChart = new Chart(ctx, {
                    type: 'doughnut',
                    data: {
                        labels: ['10대이하', '20대', '30대', '40대이상'],  // Example age groups
                        datasets: [{
                            label: '세대별 이용자 비율',
                            data: [under10s, age20s, age30s, over40s],  
                            backgroundColor: [
                                'rgba(255, 99, 132, 0.2)',  // Color for 10대
                                'rgba(54, 162, 235, 0.2)',  // Color for 20대
                                'rgba(255, 206, 86, 0.2)',  // Color for 30대
                                'rgba(75, 192, 192, 0.2)',  // Color for 40대
                               
                            ],
                            borderColor: [
                                'rgba(255, 99, 132, 1)',  // Border color for 10대
                                'rgba(54, 162, 235, 1)',  // Border color for 20대
                                'rgba(255, 206, 86, 1)',  // Border color for 30대
                                'rgba(75, 192, 192, 1)',  // Border color for 40대  
                            ],
                            borderWidth: 1  
                        }]
                    },
                    options: {
                        responsive: true,
                        plugins: {
                            legend: {
                                position: 'top',
                            },
                            title: {
                                display: true,
                                text:"세대별 이용자 비율",
                                
                            }
                        }
                    }
                });


        </script>
    </body>
</html>