<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>	
<%
	int random = (int)(Math.random()*20 + 1);
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
         
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

        <script defer src="resouces/js/common.js"></script>
        <script defer src="resouces/js/calendar.js"></script>
        <script defer src="resouces/js/add_plan.js"></script>
        <link rel="stylesheet" href="resouces/css/add_plan.css">
        <link rel="stylesheet" href="resouces/css/calendar.css">
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
                    <form action="<%= contextPath %>/addPlan.sd" method="post" class="inner" enctype="multipart/form-data">
                    	<input type="hidden" name="mno" value="<%= loginUser.getmNo() %>">
                        <table>
                            <tr>
                                <td id="plan_name_t" class="white"><div>여행명</div></td>
                                <td colspan="2"><input type="text" name="plan_title" id="plan_title"></td>
                            </tr>

                            <tr>
                                <td id="search___" colspan="3">
                                    <div id="search_place_t" class="white">도시 검색</div>
                                    <div id="search_place_b">
                                        <input type="text" name="place_name" id="place_name" placeholder="도시 또는 나라 검색">
                                        <button type="button" class="material-symbols-outlined" id="search_btn">search</button>
                                    </div>
                                    <div id="search___result"></div>
                                    <script>
                                        function getResult(value) {
                                            $.ajax({
                                                type: "get",
                                                url: "<%= contextPath%>/SelectCity.c",
                                                dataType: 'json',
                                                data: {
                                                    value: value,
                                                },
                                                success: function(data) {
                                                    $('#search___result').html('');

                                                    let str = '';

                                                    if (data === null) {
                                                        str += '<div id="search_place_add" class="white">도시 추가하기</div>';
                                                    } else {
                                                        $.each(data, function(i) {
                                                            str += '<div class="search_result">' + data[i].cityName + ' / ' + data[i].cityCountry + '</div>'
                                                        });
                                                        str += '<div id="search_place_add" class="white">도시 추가하기</div>';
                                                    }

                                                    $('#search___result').append(str);
                                                },
                                                error: function() {
                                                    console.log("통신 실패");
                                                }
                                            })
                                        };

                                        $(function() {
                                            $('#place_name').on('keyup', function() {
                                                if ($(this).val() === '') {
                                                    $('#search___result').html('');
                                                } else {
                                                    getResult($(this).val());
                                                }
                                            });
                                        })
                                    </script>
                                </td>
                            </tr>

                            <tr>
                                <td colspan="3">
                                    <div id="trip_date_t" class="white">여행 일정</div>
                                    <div id="making_plan">
                                        <div id="calendar-container">
                                            <div id="calendar">
                                                <div id="calendar-left"></div>
                                                <div id="calendar-right"></div>
                                            </div>
                                            <div id="selected-range">총 <span id="range-info">0일</span></div>
                                            <div id="btn">
                                                <button id="prev" aria-label="Previous month" type="button" class="material-symbols-outlined">arrow_back_ios</button>
                                                <button id="today" aria-label="Go to current month" type="button">Today</button>
                                                <button id="next" aria-label="Next month" type="button" class="material-symbols-outlined">arrow_forward_ios</button>
                                            </div>
                                        </div>

										<input type="hidden" id="howlong" name="howlong">
                                        <input type="hidden" id="sDate" name="sDate">
                                        <input type="hidden" id="eDate" name="eDate">
                                    </div>
                                </td>
                            </tr>

                            <tr>
                                <td colspan="3">
                                    <div id="explanation_t" class="white">설명</div>
                                    <textarea name="explanation_e" id="explanation_e" style="overflow-y: auto;"></textarea>
                                    <div id="count_else" style="color: white;">0/1000</div>
                                </td>
                            </tr>

                            <tr class="white">
                                <td colspan="2">공개 범위 설정</td>
                                <td>
                                    <input type="radio" name="range" id="all" value="1"checked>
                                    <label for="all">전체 공개</label>

                                    <input type="radio" name="range" id="friend" value="2">
                                    <label for="friend">친구 공개</label>

                                    <input type="radio" name="range" id="me" value="3">
                                    <label for="me">나만 보기</label>
                                </td>
                            </tr>

                            <tr class="white">
                                <td colspan="2">배경 이미지</td>
                                <td>
                                    <input type="radio" name="img" id="random" value="<%= random %>" checked>
                                    <label for="random">랜덤</label>

                                    <input type="radio" name="img" id="choice" value="">
                                    <label for="choice">선택</label>
                                </td>
                            </tr>

                            <tr id="img_choice_tr">
                                <td colspan="3">
                                    <div id="img_choice_cover">
                                        <div id="img_header">
                                            <div id="basic">기본 이미지</div>
                                            <div id="computer">컴퓨터에서 가져오기</div>
                                        </div>

                                        <div id="img_content1">
                                            <div class="img">
                                                <img src="resouces/img/random/1.jpg" alt="">
                                            </div>
                                            <div class="img">
                                                <img src="resouces/img/random/2.jpg" alt="">
                                            </div>
                                            <div class="img">
                                                <img src="resouces/img/random/3.jpg" alt="">
                                            </div>
                                            <div class="img">
                                                <img src="resouces/img/random/4.jpg" alt="">
                                            </div>
                                            <div class="img">
                                                <img src="resouces/img/random/5.jpg" alt="">
                                            </div>
                                            <div class="img">
                                                <img src="resouces/img/random/6.jpg" alt="">
                                            </div>
                                            <div class="img">
                                                <img src="resouces/img/random/7.jpg" alt="">
                                            </div>
                                            <div class="img">
                                                <img src="resouces/img/random/8.jpg" alt="">
                                            </div>
                                            <div class="img">
                                                <img src="resouces/img/random/9.jpg" alt="">
                                            </div>
                                            <div class="img">
                                                <img src="resouces/img/random/10.jpg" alt="">
                                            </div>
                                            <div class="img">
                                                <img src="resouces/img/random/11.jpg" alt="">
                                            </div>
                                            <div class="img">
                                                <img src="resouces/img/random/12.jpg" alt="">
                                            </div>
                                            <div class="img">
                                                <img src="resouces/img/random/13.jpg" alt="">
                                            </div>
                                            <div class="img">
                                                <img src="resouces/img/random/14.jpg" alt="">
                                            </div>
                                            <div class="img">
                                                <img src="resouces/img/random/15.jpg" alt="">
                                            </div>
                                            <div class="img">
                                                <img src="resouces/img/random/16.jpg" alt="">
                                            </div>
                                            <div class="img">
                                                <img src="resouces/img/random/17.jpg" alt="">
                                            </div>
                                            <div class="img">
                                                <img src="resouces/img/random/18.jpg" alt="">
                                            </div>
                                            <div class="img">
                                                <img src="resouces/img/random/19.jpg" alt="">
                                            </div>
                                            <div class="img">
                                                <img src="resouces/img/random/20.jpg" alt="">
                                            </div>
                                        </div>

                                        <div id="img_content2">
                                            <div id="image_section_div">
                                                여기로 사진 드래그<br><br>
                                                - 또는 -<br><br>
                                            </div>
                                            <input type="file" name="userImg" id="userImg" onchange="loadFile(this)">
                                            <label for="userImg" id="userImgBtn">컴퓨터에서 가져오기</label>
                                        </div>

                                        <script>
                                            $(function() {
                                                $('.img').on('click', function() {
                                                    $('#choice').attr('value', $('#clicked').attr('src').substring(20).replace('.jpg', ''));
                                                })
                                            })

                                            function readURL(input) {
                                                if (input.files && input.files[0]) {
                                                    var reader = new FileReader();
                                                    
                                                    reader.onload = function (e) {
                                                        $('#image_section_div').html('<img id="image_section" src="" alt="your image">');
                                                        $('#image_section').attr('src', e.target.result);  
                                                    }
                                                
                                                    reader.readAsDataURL(input.files[0]);

                                                    $('#img_content2').css({
                                                        height: 'auto',
                                                        padding: '10px 0' 
                                                    });
                                                }
                                            }
                                                
                                            $("#userImg").change(function(){
                                                readURL(this);
                                            });

                                            $('#random').on('click', function() {
                                                if ($('#random').is(':checked')) {
                                                    $('#random').val(<%= random %>);
                                                }
                                            })
                                        </script>
                                    </div>
                                </td>
                            </tr>
                        </table>

                        <br><br>

                        <input type="submit" value="일정 추가 완료하기" id="add_done_plan" class="white">
                    </form>

                    <br><br>

                    <div id="cover"></div>
                </div>
            </div>
            
            <div id="place_add">
                <span id="cancle" class="material-symbols-outlined">close</span>
                <table id="place_add_table">
                    <tr>
                        <th>* 도시명</th>
                        <td><input type="text" id="cityName"></td>
                    </tr>

                    <tr>
                        <th>* 나라명</th>
                        <td><input type="text" id="countryName"></td>
                    </tr>

                    <tr>
                        <th>도시 설명</th>
                        <td></td>
                    </tr>

                    <tr>
                        <td colspan="2">
                            <textarea name="explanation_p" id="explanation_p" style="overflow: auto;"></textarea>
                            <div id="count">0/1000</div>
                        </td>
                    </tr>
                    
                    <input type="button" value="도시 추가 완료하기" id="add_done_place">

                    <script>
                        $(function() {
                            $('#add_done_place').on('click', function() {
                                if ($('#countryName').val() === '' || $('#cityName').val() === '') {
                                    if ($('#cityName').val() === '') {
                                        alert('도시명을 입력해주십시오.');
                                    } else {
                                        alert('나라명을 입력해주십시오.');
                                    }
                                } else {
                                    $.ajax({
                                        url: '<%= contextPath %>/InsertCity.c',
                                        method: 'post',
                                        data: {
                                            cityName: $('#cityName').val(),
                                            countryName: $('#countryName').val(),
                                        },
                                        success: function(result) {
                                            if (result > 0) {
                                                alert('도시 추가에 성공하였습니다.');
                                                setTimeout(() => {
                                                    $('#cancle').trigger('click');
                                                }, 0)
                                            } else {
                                                alert('도시 추가에 실패하였습니다.');
                                            }
                                        },
                                        error: function() {
                                            alert('도시 추가에 실패하였습니다.');
                                        }
                                    });
                                }
                            })
                        })
                    </script>
                </table>
            </div>
        </div>
    </body>
</html>