<%@page import="semi.schedule.model.vo.Schedule"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	ArrayList<Schedule> list = (ArrayList<Schedule>)request.getAttribute("list");
	int no = (int)request.getAttribute("no");
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

        <% if (no == 0) { %>
            <script defer src="resouces/js/plan_X.js"></script>
            <link rel="stylesheet" href="resouces/css/plan_X.css">
        <% } else { %>
            <script defer src="resouces/js/common.js"></script>
            <link rel="stylesheet" href="resouces/css/plan_O.css">
            <link rel="stylesheet" href="resouces/css/common.css">
        <% } %>
    </head>
    <body>
        <%@ include file="../common/basic.jsp" %>
        <div class="wrap">
            <% if (no == 0) { %>
                <div class="top">
                    <video id="main_video" src="resouces/img/산타_댄스.mp4" muted autoplay loop preload="auto"></video>
                    <div id="top_menu">
                        <div id="logo" onclick="location.href='<%= contextPath %>'">우리 여행가조</div>
                        <div id="small_menu">
                            <ul>
                                <li id="top_menu_1" onclick="location.href='<%= contextPath %>/GoMyPage.me'">My page</li>
                                <li id="top_menu_2" onclick="location.href='<%= contextPath %>/GoServiceCenter.sc'">고객센터</li>
                                <li id="top_menu_3">로그아웃</li>
                            </ul>
                        </div>
                    </div>
                </div>
    
                <div class="under">
                    <div id="title">WHERE U WANNA GO?</div>
                    <div id="content">
                        <div id="description">
                            <div id="korea_de">
                                <div class="swiper-container">
                                    <div class="swiper-wrapper">
                                        <div class="swiper-slide">
                                            a
                                        </div>
                                        <div class="swiper-slide">
                                            1
                                        </div>
                                        <div class="swiper-slide">
                                            2
                                        </div>
                                        <div class="swiper-slide">
                                            3
                                        </div>
                                        <div class="swiper-slide">
                                            4
                                        </div>
                                    </div>
                                    <div class="swiper-button-next"></div>
                                    <div class="swiper-button-prev"></div>
                                    <div class="swiper-pagination"></div>
                                </div>
                            </div>
    
                            <div id="japan_de">
                                <div class="swiper-container">
                                    <div class="swiper-wrapper">
                                        <div class="swiper-slide">
                                            1
                                        </div>
                                        <div class="swiper-slide">
                                            2
                                        </div>
                                        <div class="swiper-slide">
                                            3
                                        </div>
                                        <div class="swiper-slide">
                                            4
                                        </div>
                                        <div class="swiper-slide">
                                            5
                                        </div>
                                    </div>
                                    <div class="swiper-button-next"></div>
                                    <div class="swiper-button-prev"></div>
                                    <div class="swiper-pagination"></div>
                                </div>
                            </div>
    
                            <div id="paris_de">
                                <div class="swiper-container">
                                    <div class="swiper-wrapper">
                                        <div class="swiper-slide">
                                            1
                                        </div>
                                        <div class="swiper-slide">
                                            2
                                        </div>
                                        <div class="swiper-slide">
                                            3
                                        </div>
                                        <div class="swiper-slide">
                                            4
                                        </div>
                                        <div class="swiper-slide">
                                            5
                                        </div>
                                    </div>
                                    <div class="swiper-button-next"></div>
                                    <div class="swiper-button-prev"></div>
                                    <div class="swiper-pagination"></div>
                                </div>
                            </div>
    
                            <div id="austraila_de">
                                <div class="swiper-container">
                                    <div class="swiper-wrapper">
                                        <div class="swiper-slide">
                                            1
                                        </div>
                                        <div class="swiper-slide">
                                            2
                                        </div>
                                        <div class="swiper-slide">
                                            3
                                        </div>
                                        <div class="swiper-slide">
                                            4
                                        </div>
                                        <div class="swiper-slide">
                                            5
                                        </div>
                                    </div>
                                    <div class="swiper-button-next"></div>
                                    <div class="swiper-button-prev"></div>
                                    <div class="swiper-pagination"></div>
                                </div>
                            </div>
    
                            <div id="usa_de">
                                <div class="swiper-container">
                                    <div class="swiper-wrapper">
                                        <div class="swiper-slide">
                                            1
                                        </div>
                                        <div class="swiper-slide">
                                            2
                                        </div>
                                        <div class="swiper-slide">
                                            3
                                        </div>
                                        <div class="swiper-slide">
                                            4
                                        </div>
                                        <div class="swiper-slide">
                                            5
                                        </div>
                                    </div>
                                    <div class="swiper-button-next"></div>
                                    <div class="swiper-button-prev"></div>
                                    <div class="swiper-pagination"></div>
                                </div>
                            </div>
                        </div>
                        
                        <div id="full_cover"></div>
    
                        <div id="img">
                            <div id="korea">
                                <img src="resouces/img/korea.jpg" alt="">
                                <div class="cover" id="cover_1">
                                    <div class="text">KOREA</div>
                                </div>
                            </div>
                            
                            <div id="japan">
                                <img src="resouces/img/japan.png" alt="">
                                <div class="cover" id="cover_2">
                                    <div class="text">JAPAN</div>
                                </div>
                            </div>
    
                            <div id="paris">
                                <img src="resouces/img/paris.jpg" alt="">
                                <div class="cover" id="cover_3">
                                    <div class="text">PARIS</div>
                                </div>
                            </div>
    
                            <div id="austraila">
                                <img src="resouces/img/austraila.jpg" alt="">
                                <div class="cover" id="cover_4">
                                    <div class="text">AUSTRAILA</div>
                                </div>
                            </div>
     
                            <div id="usa">
                                <img src="resouces/img/usa.jpg" alt="">
                                <div class="cover" id="cover_5">
                                    <div class="text">USA</div>
                                </div>
                            </div>
    
                            <div id="add_plan" onclick="location.href='<%= contextPath %>/GoAddPlan.sd'">
                                <div class="text">일정 추가하러 가기</div>
                            </div>
                        </div>
                    </div>
                </div>
            <% } else { %>
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
                        <% for (Schedule sd : list) { %>
                            <div class="plan">
                                <div class="cover" id="cover<%= sd.getsNo() %>" onclick="location.href='<%= contextPath %>/GoAddDetail.d?mno=<%= sd.getMno() %>&sno=<%= sd.getsNo() %>&howlong=<%= sd.getHowlong() %>'" data-url='<%= contextPath %>/GoAddDetail.d?mno=<%= sd.getMno() %>&sno=<%= sd.getsNo() %>&howlong=<%= sd.getHowlong() %>'>
                                    <div class="plan_title"><%= sd.getsTitle() %></div>
                                    <div class="date">
                                        <%= sd.getsSdate() %> ~ <%= sd.getsEdate() %>
                                        <div class="mini_bar material-symbols-outlined">
                                            <div class="material-symbols-outlined">edit</div>
                                            <div class="material-symbols-outlined share" onclick="sharePlan(event)">share</div>
                                            <div class="material-symbols-outlined" id="delete<%= sd.getsNo() %>" onclick="deletePlan(event)">delete</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <script>
                            	$(function() {
                                    // background-image: url('../img/random/1.jpg');
                            		if (<%= sd.getBbgiPath() == null %>) {
                                    	$('#cover<%= sd.getsNo() %>').css('background-image', "url('<%= sd.getUbgiPath() %>')");
                            		} else {                            			
                                    	$('#cover<%= sd.getsNo() %>').css('background-image', "url('<%= sd.getBbgiPath() %>')");
                            		}
                                });
                            </script>
                        <% } %>
    
                        <div class="add_plan" onclick="location.href='<%= contextPath %>/GoAddPlan.sd'">
                            <div class="material-symbols-outlined">add_circle</div>
                        </div>

                        <div id="share">
                            <div id="share_title" style="">공&nbsp;유</div>
                            <div id="circles">
                                <div class="circle" id="member">회원</div>
                                <div class="circle" id="twitter">트위터</div>
                                <div class="circle" id="facebook">페이스북</div>
                                <div class="circle" id="instagram">인스타</div>
                                <div class="circle" id="whatsapp">왓츠앱</div>
                                <div class="circle" id="kakaotalk">카카오톡</div>
                                <div class="circle" id="email">이메일</div>
                            </div>
                            <div id="link"></div>
                        </div>
                        
                        <script>
						    function deletePlan(event) {
						        event.stopPropagation();
					            
						        if (confirm("일정을 삭제하시겠습니까?")) {
						            $.ajax({
						                url: '<%= contextPath %>/DeleteSchedule.sd',
						                method: 'post',
						                data: {
						                    mno: <%= loginUser.getmNo() %>,
						                    sno: $(event.target).attr('id').replace('delete', '').trim(),
						                },
						                success: function(result) {
						                	if (result > 0) {
                                                alert('일정 삭제에 성공하였습니다.');
                                            } else {
                                                alert('일정 삭제에 실패하였습니다.');
                                            }
						                    location.reload();
						                },
						                error: function() {
						                    alert('일정 삭제에 실패하였습니다.');
						                    location.reload();
						                }
						            });
						        }
						    }

                            function sharePlan(event) {
                                event.stopPropagation();

                                $('#share').css('display', 'block');
                                $('#full_cover').css('display', 'block');

                                // Attach a single event listener to the document to handle clicks outside #share
                                $(document).on('click', function(event) {
                                    if (!$(event.target).closest('#share').length && !$(event.target).is('#share')) {
                                        $('#share').css('display', 'none');
                                        $('#full_cover').css('display', 'none');
                                    }
                                });

                                // Update #link content
                                $('#link').html(event.target.closest('.cover').getAttribute('data-url')
                                                + `&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                <button type="button" id="data-copy" style="background-color: black; border: none; color: white; height: 20px; border-radius: 10px;">복사</button>
                                                <input type="hidden" id="data-area" value="` + event.target.closest('.cover').getAttribute('data-url') + `">`);
                            }

                            // Ensure the click handler for copy remains functional
                            $('#link').on('click', '#data-copy', function() {
                                const $dataArea = $('#data-area');

                                $dataArea.attr('type', 'text').select();

                                try {
                                    const copySuccessful = document.execCommand('copy');
                                    $dataArea.attr('type', 'hidden');

                                    if (copySuccessful) {
                                        alert("클립보드에 URL이 복사되었습니다.");
                                    } else {
                                        alert("URL 복사에 실패하였습니다.");
                                    }
                                } catch (err) {
                                    console.error("Error:", err);
                                    alert("URL 복사에 실패하였습니다.");
                                }
                            });

						</script>



                        <br><br>
                    </div>
                </div>
            <% } %>
        </div>

       
    </body>
</html>