<%@page import="semi.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- <%

	Member m = (Member)request.getAttribute("updateMem");
%>     -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

  <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>내 정보 수정</title>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
        <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/reset-css@4.0.1/reset.min.css"
    />

        <!-- jQuery library -->
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>

        <!-- Popper JS -->
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

        <!-- 우편번호 Script-->
        <!-- <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> -->
        
        
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css">
        
        <link rel="preconnect" href="https://fonts.googleapis.com">
        
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Hahmlet:wght@100..900&display=swap" rel="stylesheet">
        
        <link rel="stylesheet" href="resouces/css/myPageModify.css">
</head>
<body>

	<!-- <%@ include file="../goTrip/goTripLogin_O.jsp" %> -->
	 <div class="wrap">
            <div class="top">
                <div class="logo" onclick="location.href='../main/main_로그인_O.html'">우리 여행가조</div>
                <div class="top_menu">
                    <ul>
                        <li id="top_menu_1" onclick="location.href=''">My page</li>
                        <li id="top_menu_2" onclick="location.href=''">고객센터</li>
                    </ul>
                </div>
            </div>

            <div class="under">
                <div class="side_menu">
                    <div id="side_menu_open_1" onclick="location.href='../여행_갈래/여행_갈래.html'">내 정보 수정</div>
                    <div id="side_menu_open_2" onclick="location.href='../내_여행/내_여행_일정_O.html'">내가 쓴 글</div>
                    <div id="side_menu_open_3" onclick="location.href='../리뷰/리뷰_로그인_O.html'">내 찜 목록</div>
                    <div id="close_btn" onclick="side_close()"><img src="../resouces/img/chevron_left_24dp_5F6368.png" alt=""></div>
                    
                    <div id="side_menu_close_1" onclick="location.href='../여행_갈래/여행_갈래.html'">
                        <img src="../resouces/img/airplane_ticket_24dp_5F6368.png" alt="">
                        <div class="explanation">여행 갈래?</div>
                    </div>
                    <div id="side_menu_close_2" onclick="location.href='../내_여행/내_여행_일정_O.html'">
                        <img src="../resouces/img/edit_calendar_24dp_5F6368_FILL0_wght400_GRAD0_opsz24.png" alt="">
                        <div class="explanation">계획 짤래?</div>
                    </div>
                    <div id="side_menu_close_3" onclick="location.href='../리뷰/리뷰_로그인_O.html'">
                        <img src="../resouces/img/dynamic_feed_24dp_5F6368.png" alt="">
                        <div class="explanation">리뷰 볼래?</div>
                    </div>
                    <div id="open_btn" onclick="side_open()">
                        <img src="../resouces/img/chevron_right_24dp_5F6368.png" alt="">
                    </div>
                </div>
    
                <div class="content">
                    <div class="min_content" align="center">
                        <!-- <form id="myPage-form" action="<%= contextPath %>/update.me" method="post"> -->
                            <!-- <input type="hidden" name="userId" value="<%= m.getmId() %>"> -->
                            <table>
                                <tr>
                                    <!-- <th colspan="2" class="text">내 정보 수정</th> -->
                                </tr>

                                <tr>
                                    <td rowspan="4" width="250">
                                        <div class="min_profile-pic-img">
                                            <label for="imageInput">
                                        <img src="default_profile.png" class="min_profile-pic"></label>
                                        <input type="file" name="profileImage" id="imageInput" accept="image/*">
                                        
                                    </div>
                                    </td>
                                    <td class="text height">새 비밀번호</td>
                                </tr>

                                <tr>
                                    <!-- <td><input type="password" id="newPassword" class="height" name="newPwd" value="<%= m.getmPwd()%>"></td> -->
                                </tr>

                                <tr>
                                    <td class="text height" width="500">새 비밀번호 확인</td>
                                </tr>

                                <tr>
                                    <td><input type="password" id="confirmPassword" class="height"></td>
                                </tr>

                                <tr>
                                    <div class="profile-btn-area">
                                    <th rowspan="2" class="text">
                                       
                                    </th>
                                   
                                    
                                </div>
                                    <td class="text height">우편번호</td>
                                </tr>

                                <tr>

                                    <td class="height">
                                        <input type="text">
                                        <button id="zip_code">우편번호 찾기</button>
                                    </td>
                                </tr>
                                
                                <tr>
                                    <td class="text height">닉네임</td>
                                    <td class="text">주소</td>
                                </tr>

                                <tr>
                                    <td class="height">
                                        <input type="text" id="min_username" value="user01" name="newNickName">
                                        <button type="button" class="min_check-btn">중복확인</button>
                                    </td>
                                    <td><input type="text" id="address"></td>
                                </tr>

                                <tr>
                                    <td class="height"></td>
                                    <td class="text">전화번호</td>
                                </tr>

                                <tr>
                                    <td class="height"></td>
                                    <td>
                                       <input type="text" class="phone" name="newPhone" style="width: 300px;">
                                    </td>
                                </tr>

                                <tr>
                                    <td class="height"></td>
                                    <td class="text">이메일</td>
                                </tr>

                                <tr>
                                    <td class="height"></td>
                                    <td id="email">
                                        <!-- <input type="text" class="email" name="newEamil" value="<%= m.getmEmail() %>"><div class="text" id="email_t">@</div> -->
                                        <select>
                                            <option value="">직접입력</option>
                                            <option value="">naver.com</option>
                                            <option value="">gmail.com</option>
                                          </select>
                                    </td>
                                </tr>
                            </table>
                            
                            <br><br><br>

                            <button type="submit">변경하기</button>
                            <button type="reset">취소</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!-- 우편번호 Script-->

        <!-- <script>
            const btn = document.querySelector("#zip_code");
            btn.addEventListener("click",() => {

                new daum.Postcode({
                    oncomplete: function(data) {
                        // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
                        // 예제를 참고하여 다양한 활용법을 확인해 보세요.
                    }
                }).open();
            })

        </script> -->

        <script>
            const side_menu = document.getElementsByClassName('side_menu');
            const content = document.getElementsByClassName('content');

            const side_menu_open_1 = document.getElementById('side_menu_open_1');
            const side_menu_open_2 = document.getElementById('side_menu_open_2');
            const side_menu_open_3 = document.getElementById('side_menu_open_3');
            const close_btn = document.getElementById('close_btn');

            const side_menu_close_1 = document.getElementById('side_menu_close_1');
            const side_menu_close_2 = document.getElementById('side_menu_close_2');
            const side_menu_close_3 = document.getElementById('side_menu_close_3');
            const open_btn = document.getElementById('open_btn');

            function side_close() {
                side_menu[0].style.width = '2.5%';

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