<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>고객센터메인</title>
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
        <link rel="stylesheet" href="../../resouces/css/questionListView.css">
        <link rel="stylesheet" href="../../resouces/css/common.css">
      

        <style>
            
        </style>
    </head>
    <body>
     <%@ include file="../common/basic.jsp" %>
        <div class="wrap">
            <div class="background"></div>

            <div class="top">
                <div class="logo" onclick="location.href='../관리자페이지/index.html'">우리 여행가조</div>
                <div class="top_menu">
                    <ul>
                        <li id="top_menu_2" onclick="''">Logout</li>
                    </ul>
                </div>
            </div>

            <div class="under">
                <div class="side_menu">
                    <div id="side_menu_open_1" onclick="location.href='../관리자페이지/index.html'">회원 관리</div>
                    <div id="side_menu_open_2" onclick="location.href='../관리자페이지/index2.html' ">사용자 통계</div>
                    <div id="side_menu_open_3" onclick="location.href='../관리자페이지/index3.html'" style="font-weight: 900;">수익 관리</div>
                    <div id="close_btn" onclick="side_close()"><img src="./resources/img/chevron_left_24dp_5F6368.png" alt="왼쪽화살표"></div>
                    
                    <div id="side_menu_close_1" onclick="location.href='../여행_갈래/여행_갈래.html'">
                        <div class="explanation">여행 갈래?</div>
                    </div>
                    <div id="side_menu_close_2" onclick="location.href='../내_여행/내_여행_일정_O.html'">
                        <div class="explanation">계획 짤래?</div>
                    </div>
                    <div id="side_menu_close_3" onclick="location.href='../리뷰/리뷰_로그인_O.html'">
                        <div class="explanation">리뷰 볼래?</div>
                    </div>
                    <div id="open_btn" onclick="side_open()">
                        <img src="./resources/img/chevron_right_24dp_5F6368.png" alt="오른쪽화살표">
                    </div>
                </div>

                <div class="content" > 
                    <div class="title" align="center">문의사항</div>

                    <form method="post" align="right">
                        <button class="btn btn-sm btn-secondary">작성하기</button>
                    </form>
                    
                    <div class="question" align="center">
                        <table class="table-list">
                            <thead>
                                <tr>
                                    <th width ="80px">글번호</th>
                                    <th>제목</th>
                                    <th width ="170px">작성자</th>
                                    <th width ="80px">조회수</th>
                                    <th width ="80px">작성일</th>
                                    <th width ="80px">답변여부</th>
                                </tr>
                            </thead>
    
                            <tbody>
                                <tr>
                                    <td>예시</td>
                                    <td>예시</td>
                                    <td>예시</td>
                                    <td>예시</td>
                                    <td>예시</td>
                                    <td>예시</td>
                                </tr>
                                <tr>
                                    <td>예시</td>
                                    <td>예시</td>
                                    <td>예시</td>
                                    <td>예시</td>
                                    <td>예시</td>
                                    <td>예시</td>
                                </tr>
                                <tr>
                                    <td>예시</td>
                                    <td>예시</td>
                                    <td>예시</td>
                                    <td>예시</td>
                                    <td>예시</td>
                                    <td>예시</td>
                                </tr>
                                <tr>
                                    <td>예시</td>
                                    <td>예시</td>
                                    <td>예시</td>
                                    <td>예시</td>
                                    <td>예시</td>
                                    <td>예시</td>
                                </tr>
                                <tr>
                                    <td>예시</td>
                                    <td>예시</td>
                                    <td>예시</td>
                                    <td>예시</td>
                                    <td>예시</td>
                                    <td>예시</td>
                                </tr>
                            </tbody>
                        </table>

                        <div class="paging-area" align="center">
                            <button onclick="location.href='<%= contextPath %>/list.bo?cpage=<%=  %>'">&lt;</button>
                            <button disabled><%= p %></button>
                            <button onclick="location.href='<%= contextPath %>/list.bo?cpage=<%=%>'"><%= %></button>
                            <button onclick="location.href='<%= contextPath %>/list.bo?cpage=<%= + 1 %>'">&gt;</button>
                        </div>
                    </div>
                </div>
            </div>      
        </div>

        <script>
            const side_menu = document.getElementsByClassName('side_menu');
            const content = document.getElementsByClassName('content');
            const close_btn = document.getElementById('close_btn');
            const open_btn = document.getElementById('open_btn');

            function side_close() {
                side_menu[0].style.width = '2.5%';
                content[0].style.width ='97.5%'
                content[0].style.margin ='0 0 0 2.5%'

                side_menu_open_1.style.display = 'none';
                side_menu_open_2.style.display = 'none';
                side_menu_open_3.style.display = 'none';
                close_btn.style.display = 'none';

                side_menu_close_1.style.display = 'block';
                side_menu_close_2.style.display = 'block';
                side_menu_close_3.style.display = 'block';
                open_btn.style.display = 'block';
            }

            function side_open() {
                side_menu[0].style.width = '15%';
                content[0].style.width ='85%'
                content[0].style.margin = '0 0 0 15%'

                side_menu_open_1.style.display = 'block';
                side_menu_open_2.style.display = 'block';
                side_menu_open_3.style.display = 'block';
                close_btn.style.display = 'block';

                side_menu_close_1.style.display = 'none';
                side_menu_close_2.style.display = 'none';
                side_menu_close_3.style.display = 'none';
                open_btn.style.display = 'none';
            }

        </script>
    </body>
   
</html>