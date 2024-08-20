<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>plan_O</title>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

        <!-- jQuery library -->
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>

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
        
        <!-- Material Icons -->
        <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

        <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
        <script src="app.js"></script>

        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

        <script defer src="resouces/js/review-Main.js"></script>
        <script defer src="resouces/js/common.js"></script>
        <link rel="stylesheet" href="resouces/css/common.css">
        <link rel="stylesheet" href="resouces/css/review-Main.css">
        

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
                    <section>
                        <div class="headLine">
                            <div class="textLine">지금 핫🔥한 타임라인</div>
                            <div class="whiteBox"></div>
                        </div>
                        <div class="recommend-timeline">
                            <div class="recommend-timeline-board">
                                <div class="swiper-container">
                                    <div class="swiper-wrapper">
                                        <div class="swiper-slide">
                                            <div class="post" id="post">
                                                <div class="post-header" id="post-header">
                                                    <img src="resouces/img/1.jpg" alt="User 1">
                                                    <h2>TEST</h2>
                                                </div>
                                                <div class="swiper-container">
                                                    <div class="swiper-wrapper">
                                                        <div class="swiper-slide">
                                                            <img src="resouces/img/5.jpg" alt="Post 1" class="post-image">
                                                        </div>
                                                        <div class="swiper-slide">
                                                            <img src="resouces/img/1.jpg" alt="Post 1" class="post-image">
                                                        </div>
                                                    </div>
                                                </div><br>
                                                <div class="post-actions" id="post-actions">
                                                    <button class="like-button material-icons">❤️</button>
                                                    <button class="comment-button">💬</button>
                                                </div>
                                                <div class="post-content" id="post-content">
                                                    <div class="likes">좋아요 123개</div>
                                                    <div class="description">1번 게시물</div>
                                                    <div class="timestamp">2024-08-01 12:34</div>
                                                </div>
                                            </div>
                                            <div class="post" id="post">
                                                <div class="post-header" id="post-header">
                                                    <img src="resouces/img/2.jpg" alt="User 2">
                                                    <h2>TEST</h2>
                                                </div>
                                                <div class="swiper-container">
                                                    <div class="swiper-wrapper">
                                                        <div class="swiper-slide">
                                                            <img src="resouces/img/2.jpg" alt="Post 1" class="post-image">
                                                            </div>
                                                            </div>
                                                </div><br>
                                                <div class="post-actions" id="post-actions">
                                                    <button class="like-button material-icons">❤️</button>
                                                    <button class="comment-button">💬</button>
                                                </div>
                                                <div class="post-content" id="post-content">
                                                    <div class="likes">좋아요 456개</div>
                                                    <div class="description">2번 게시물</div>
                                                    <div class="timestamp">2024-08-01 14:56</div>
                                                </div>
                                            </div>
                                            <!-- 추가 게시물 -->
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="swiper-prev material-icons">arrow_back</div>
                            <div class="swiper-next material-icons">arrow_forward</div>
                        </div>
                </section>
                <section>
                <div>
                    <form action="">
                        <div class="writer-box">
                            <div class="photo">
                                <div class="material-icons photo-button" onclick="openPopup()">photo_camera</div>
                            </div>
                            <div class="writer-area">
                                <input type="textarea" placeholder="WRITE IT!! CLICK NOW!!">
                            </div>
                            <div class="cover">
                                <div class="material-icons arrow">arrow_forward</div>
                            </div>
                        </div>
                    </form>
                    <div id="popup" class="popup-overlay">
                        <div class="popup-content">
                            <form>
                                <div class="title-image" id="title">대표이미지를 넣어주세요.</div>
                                <div class="content-image" id="content1">+</div>
                                <div class="content-image" id="content2">+</div>
                                <div class="content-image" id="content3">+</div>
                                <div class="text-box">
                                    <div class="content-text">
                                        <input type="textarea" placeholder="-내용을 입력해 주세요.">
                                    </div>
                                    <button class="popup-cover">
                                        <div class="material-icons arrow">arrow_forward</div>
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                </section>
                <section>
                <div class="timeline">
                    <div class="timeline-board">
                        <div class="post" id="post">
                            <div class="post-header" id="post-header">
                                <img src="resouces/img/1.jpg" alt="User 1">
                                <h2>TEST</h2>
                            </div>
                            <div class="swiper-container">
                                <div class="swiper-wrapper">
                                    <div class="swiper-slide">
                                        <img src="resouces/img/5.jpg" alt="Post 1" class="post-image">
                                    </div>
                                    <div class="swiper-slide">
                                        <img src="resouces/img/pigma2.png" />
                                      </div>
                                </div>
                            </div><br>
                            <div class="post-actions" id="post-actions">
                                <button class="like-button material-icons">❤️</button>
                                <button class="comment-button">💬</button>
                            </div>
                            <div class="post-content" id="post-content">
                                <div class="likes">좋아요 123개</div>
                                <div class="description">1번 게시물</div>
                                <div class="timestamp">2024-08-01 12:34</div>
                            </div>
                        </div>
                        <div class="post" id="post">
                            <div class="post-header" id="post-header">
                                <img src="resouces/img/2.jpg" alt="User 2">
                                <h2>TEST</h2>
                            </div>
                            <div class="swiper-container">
                                <div class="swiper-wrapper">
                                    <div class="swiper-slide">
                                        <img src="resouces/img/2.jpg" alt="Post 1" class="post-image">
                                    </div>
                                </div>
                            </div><br>
                            <div class="post-actions" id="post-actions">
                                <button class="like-button material-icons">❤️</button>
                                <button class="comment-button">💬</button>
                            </div>
                            <div class="post-content" id="post-content">
                                <div class="likes">좋아요 456개</div>
                                <div class="description">2번 게시물</div>
                                <div class="timestamp">2024-08-01 14:56</div>
                            </div>
                        </div>
                        <!-- 추가 게시물 -->
                    </div><br><br>
                    <div align="center" class="paging-area">
                        <button>&lt;</button>
                        <button>1</button>
                        <button>2</button>
                        <button>3</button>
                        <button>4</button>
                        <button>5</button>
                        <button>&gt;</button>
                    </div>
                </div> 
                </section>
            
                </div>
            </div>
        </div>

       
    </body>
</html>