<%@page import="java.time.LocalDate"%>
<%@page import="semi.schedule.model.vo.Schedule"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	ArrayList<Schedule> list = (ArrayList<Schedule>)request.getAttribute("list");
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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

        <!-- Popper JS -->
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
        
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css">
        
        <link rel="preconnect" href="https://fonts.googleapis.com">
        
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Hahmlet:wght@100..900&display=swap" rel="stylesheet">

        <!-- lodash cdn -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.17.21/lodash.min.js" integrity="sha512-WFN04846sdKMIP5LKNphMaWzU7YpMyCU245etK3g/2ARYbPK9Ub18eG+ljU96qKRCWh+quCY7yefSmlkQw1ANQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

        <!-- GSAP cdn -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.5/gsap.min.js" integrity="sha512-7eHRwcbYkK4d9g/6tD/mhkf++eoTHwpNM9woBxtPUBWm67zeAfFC+HrdoE2GanKeocly/VxeLvIqwvCdk7qScg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        
        <!-- GSAP ScrollToPlugin -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.5/ScrollToPlugin.min.js" integrity="sha512-1PKqXBz2ju2JcAerHKL0ldg0PT/1vr3LghYAtc59+9xy8e19QEtaNUyt1gprouyWnpOPqNJjL4gXMRMEpHYyLQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

        <!-- SWIPER -->
        <link rel="stylesheet" href="https://unpkg.com/swiper@6.8.4/swiper-bundle.min.css" />
        <script defer src="https://unpkg.com/swiper@6.8.4/swiper-bundle.min.js"></script>

        <!-- Scroll Magic -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/ScrollMagic/2.0.8/ScrollMagic.min.js" integrity="sha512-8E3KZoPoZCD+1dgfqhPbejQBnQfBXe8FuwL4z/c8sTrgeDMFEnoyTlH3obB4/fV+6Sg0a0XF+L/6xS4Xx1fUEg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
        
        <script defer src="resouces/js/common.js"></script>
        <link rel="stylesheet" href="resouces/css/common.css">
        <style>
            thead tr:not(:first-child),
            tbody tr {
                height: 40px;
                border-right: 1px solid #ffffff;
                border-top: 1px solid #ffffff;
                border-left: 1px solid #ffffff;
            }

            tbody tr:last-child {border-bottom: 1px solid white;}

            thead tr:first-child {height: 70px;}

            input:focus {outline: none;}

            tbody tr {cursor: pointer;}

            th, td {padding-top: 10px;}
        </style>
    </head>
    <body>
        <%@ include file="../common/basic.jsp" %>
        <div class="wrap">
            <div id="full_cover"></div>
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
                    <div id="side_menu_open_2" onclick="location.href='<%= contextPath %>/GoShowPlanMain.ad'" class="login">계획 짤래?</div>
                    <div id="side_menu_open_3" onclick="location.href='<%= contextPath %>/list.po?cpage=1'" class="login">리뷰 볼래?</div>
                    <div id="side_menu_open_4" onclick="location.href='<%= contextPath %>/GoAdminMain.ad'">관리자 메뉴</div>

                    <div id="close_btn" onclick="side_close()"><img src="resouces/img/chevron_left_24dp_5F6368.png" alt=""></div>
    
                    <div id="side_menu_close_1" onclick="location.href='<%= contextPath %>'" class="login">
                        <img src="resouces/img/airplane_ticket_24dp_5F6368.png" alt="">
                        <div class="explanation">여행 갈래?</div>
                    </div>
                    <div id="side_menu_close_2" onclick="location.href='<%= contextPath %>/GoShowPlanMain.ad'" class="login">
                        <img src="resouces/img/edit_calendar_24dp_5F6368_FILL0_wght400_GRAD0_opsz24.png" alt="">
                        <div class="explanation">계획 짤래?</div>
                    </div>
                    <div id="side_menu_close_3" onclick="location.href='<%= contextPath %>/list.po?cpage=1'" class="login">
                        <img src="resouces/img/dynamic_feed_24dp_5F6368.png" alt="">
                        <div class="explanation">리뷰 볼래?</div>
                    </div>
                    <div id="side_menu_close_4" onclick="location.href='<%= contextPath %>/GoAdminMain.ad'">
                        <img src="resouces/img/manage_accounts_24dp_5F6368_FILL0_wght400_GRAD0_opsz24.png" alt="">
                        <div class="explanation">관리자 메뉴</div>
                    </div>
                    <div id="open_btn" onclick="side_open()">
                        <img src="resouces/img/chevron_right_24dp_5F6368.png" alt="">
                    </div>
                </div>
    
                <div class="content">
                    <br><br>
                    <table style="width: 70%; color: white; height: auto; margin: auto; text-align: center;">
                        <thead>
                            <tr>
                                <td colspan="7">
                                    <input name="search" id="search" type="text" placeholder="회원 번호 또는 회원 아이디로 검색" style=" width: 40%; padding: 5px; color: white; background-color: black; border: none; border-bottom: 1px solid white; font-size: 22px;">
                                    <script>
                                        $(function() {
                                            $('#search').on('keyup', function() {
                                                $.ajax({
                                                    url: 'SelectMemberPlan.sd',
                                                    method: 'post',
                                                    data: {
                                                        search: $('#search').val(),
                                                    },
                                                    success: function(result) {
                                                        console.log(result);
                                                    	if ($('#search').val() === '') {
                                                            $('tbody').html(
                                                                `<% for (Schedule sd : list) { %>
                                                                    <tr onclick="location.href='<%= contextPath %>/GoAdminDetail.ad?mno=<%= sd.getMno() %>&sno=<%= sd.getsNo() %>&howlong=<%= sd.getHowlong() %>'">
                                                                        <td><%= sd.getsNo() %></td>
                                                                        <td><%= sd.getMno() %></td>
                                                                        <td><%= sd.getmId() %></td>
                                                                        <td><%= sd.getsTitle() %></td>
                                                                        <td><%= sd.getsPlace() %></td>
                                                                        <td><%= sd.getsSdate() %> ~ <%= sd.getsEdate() %></td>
                                                                        <td>
                                                                            <%
                                                                                String status = "";
                                                                                switch (sd.getsStatus()) {
                                                                                    case "D" : status = "삭제"; break;
                                                                                    case "P" : status = "지난 일정"; break;
                                                                                    case "T" : status = "TODAY"; break;
                                                                                    case "N" : status = "예정된 일정"; break;
                                                                                }
                                                                            %>
                                                                            <%= status %>
                                                                        </td>
                                                                    </tr>
                                                                <% } %>`
                                                            );
                                                        } else if (Object.keys(result).length === 0) {
                                                            $('tbody').html(
                                                                `<tr>
                                                                    <td colspan="7">결과 없음</td>
                                                                </tr>`
                                                            );
                                                            console.log($('tbody').html());
                                                        } else if (Object.keys(result).length !== 0) {
                                                            let str = '';

                                                            for (let i = 0; i < Object.keys(result).length; i++) {
                                                                switch (result[i].sStatus) {
                                                                    case "D" : status = "삭제"; break;
                                                                    case "P" : status = "지난 일정"; break;
                                                                    case "T" : status = "TODAY"; break;
                                                                    case "N" : status = "예정된 일정"; break;
                                                                }
                                                                str += `<tr>
                                                                            <td>` + result[i].sNo + `</td>
                                                                            <td>` + result[i].mno + `</td>
                                                                            <td>` + result[i].mId + `</td>
                                                                            <td>` + result[i].sTitle + `</td>
                                                                            <td>` + result[i].sPlace + `</td>
                                                                            <td>` + result[i].sSdateStr.substring(0, 10) + ' ~ ' + result[i].sEdateStr.substring(0, 10) + `</td>
                                                                            <td>` + status+ `</td>
                                                                        </tr>`;
                                                            }

                                                            $('tbody').html(str);
                                                        };
                                                    },
                                                    error: function() {
                                                        console.error('AJAX Error: ', status, error);
                                                    }
                                                });
                                            })
                                        });
                                    </script>
                                </td>
                            </tr>
                            <tr>
                                <th>일정 번호</th>
                                <th>회원 번호</th>
                                <th>회원 아이디</th>
                                <th>일정 제목</th>
                                <th>여행지</th>
                                <th>일정</th>
                                <th>일정 상태</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% for (Schedule sd : list) { %>
                                <tr onclick="location.href='<%= contextPath %>/GoAdminDetail.ad?mno=<%= sd.getMno() %>&sno=<%= sd.getsNo() %>&howlong=<%= sd.getHowlong() %>'">
                                    <td><%= sd.getsNo() %></td>
                                    <td><%= sd.getMno() %></td>
                                    <td><%= sd.getmId() %></td>
                                    <td><%= sd.getsTitle() %></td>
                                    <td><%= sd.getsPlace() %></td>
                                    <td><%= sd.getsSdate() %> ~ <%= sd.getsEdate() %></td>
                                    <td>
                                        <%
                                            String status = "";
                                            switch (sd.getsStatus()) {
                                                case "D" : status = "삭제"; break;
                                                case "P" : status = "지난 일정"; break;
                                                case "T" : status = "TODAY"; break;
                                                case "N" : status = "예정된 일정"; break;
                                            }
                                        %>
                                        <%= status %>
                                    </td>
                                </tr>
                            <% } %>
                        </tbody>
                    </table>
                    <br><br>
                </div>
            </div>
        </div>

       
    </body>
</html>