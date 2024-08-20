<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>plan_x</title>
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
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Gothic+A1&display=swap" rel="stylesheet">

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

        <script defer src="resouces/js/plan_X.js"></script>
        <link rel="stylesheet" href="resouces/css/plan_X.css">
    </head>
    <body>       
        <%@ include file="../common/basic.jsp" %>
        <div class="wrap">
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

                        <div id="add_plan" onclick="location.href='<%= contextPath %>/GoAddPlan.sd?no=0'">
                            <div class="text">일정 추가하러 가기</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>