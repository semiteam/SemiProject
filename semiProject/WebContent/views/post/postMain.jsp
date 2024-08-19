<%@page import="semi.post.model.vo.Post"%>
<%@page import="java.util.ArrayList"%>
<%@page import="semi.common.model.vo.PageInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<Post> list = (ArrayList<Post>)request.getAttribute("list");
	
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
%>	
	
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
        
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

        <!-- Material Icons -->
        <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

        <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
        <script src="app.js"></script>

        <script defer src="resouces/js/board-Main.js"></script>
        <script defer src="resouces/js/common.js"></script>
        <link rel="stylesheet" href="resouces/css/board-Main.css">
        <link rel="stylesheet" href="resouces/css/common.css">
    </head>
    <body>
<<<<<<< HEAD
    
    	

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
                <div id="side_menu_open_1" onclick="location.href='views/goTrip/goTripLogin_O.jsp'">여행 갈래?</div>
                <div id="side_menu_open_2" onclick="location.href='views/schedule/plan_X.jsp'">계획 짤래?</div>
                <div id="side_menu_open_3" onclick="location.href='views/post/postMain.jsp'">리뷰 볼래?</div>
                <div id="side_menu_open_4" onclick="location.href='views/manager/manager1.jsp'">관리자 메뉴</div>
                <div id="close_btn" onclick="side_close()"><img src="resouces/img/chevron_left_24dp_5F6368.png" alt=""></div>

                <div id="side_menu_close_1" onclick="location.href='views/goTrip/goTripLogin_O'">
                    <img src="resouces/img/airplane_ticket_24dp_5F6368.png" alt="">
                    <div class="explanation">여행 갈래?</div>
                </div>
                <div id="side_menu_close_2" onclick="location.href='views/schedule/plan_X.jsp'">
                    <img src="resouces/img/edit_calendar_24dp_5F6368_FILL0_wght400_GRAD0_opsz24.png" alt="">
                    <div class="explanation">계획 짤래?</div>
                </div>
                <div id="side_menu_close_3" onclick="location.href='views/post/postMain.jsp'">
                    <img src="resouces/img/dynamic_feed_24dp_5F6368.png" alt="">
                    <div class="explanation">리뷰 볼래?</div>
                </div>
                <div id="side_menu_close_4" onclick="location.href='views/manager/manager1.jsp'">
                    <img src="resouces/img/manage_accounts_24dp_5F6368_FILL0_wght400_GRAD0_opsz24.png" alt="">
                    <div class="explanation">관리자 메뉴</div>
                </div>
                <div id="open_btn" onclick="side_open()">
                    <img src="resouces/img/chevron_right_24dp_5F6368.png" alt="">
                </div>
            </div>
    
                <div class="content">
                    <section>
                        <div class="headLine">
                          <div class="textLine">보기만 해도😆❕ 인기 여행기</div>
                          <div class="whiteBox"></div>
                        </div>
                        <div class="best-travel">
                            <div class="swiper-container">
                              <div class="swiper-wrapper">
                                <div class="swiper-slide">
                                  <img src="resouces/img/pigma1.jpg" />
                                </div>
                                <div class="swiper-slide">
                                  <img src="resouces/img/pigma2.png" />
                                </div>
                                <div class="swiper-slide">
                                  <img src="resouces/img/pigma3.jpg" />
                                </div>
                                <div class="swiper-slide">
                                  <img src="resouces/img/4.jpg" />
                                </div>
                                <div class="swiper-slide">
                                  <img src="resouces/img/5.jpg" />
                                </div>
                                <div class="swiper-slide">
                                    <img src="resouces/img/2.jpg" />
                                  </div>
                              </div>
                            </div>
                        </section>
                
                        <!-- 게시물 -->
                        <section>
                            <div class="headLine">
                              <div class="textLine">추억을 공유하세요❤️</div>
                              <div class="whiteBox"></div>
                            </div>
                            <div class="board">
                              <div class="search">
                                <input type="text" name="search-bar">
                                <div class="material-icons search">search</div>
                                <button onclick="location.href='views/post/postWrite.jsp'"><div class="material-icons edit">edit</div></button>
                              </div>
                              <div class="container" id="post-container">
                              <% for(Post p : list) { %>
                                <div class="board-list">
                                  <div class="board">
                                    <div class="thumbnail"><img src="resouces/img/2.jpg" alt=""></div>
                                    <div class="title"><%= p.getPostTitle() %></div>
                                    <div class="info">작성자 : <%= p.getmNO() %> | 조회수 : <%= p.getPostCount() %> | 추천수 : <%= p.getPostRecommend() %> | 작성일 :<%= p.getPostDate() %></div>
                                    <div class="cover">
                                      <div class="material-icons arrow">arrow_forward</div>
                                      <div class="preview" onclick="location.href='views/post/postDetail.jsp'"><%= p.getPostContent() %>
                                        
                                      </div>
                                    </div>
                                  </div>
                                </div>
                                <% } %>
                                <div class="board-list">
                                  <div class="board">
                                    <div class="thumbnail"><img src="resouces/img/1.jpg" alt=""></div>
                                    <div class="title"></div>
                                    <div class="info">작성자 : 김삿갓 | 조회수 : 73 | 추천수 : 14 | 작성일 : 2024-08-02</div>
                                    <div class="cover">
                                      <div class="material-icons arrow">arrow_forward</div>
                                      <div class="preview" onclick="location.href='views/post/postDetail.jsp'">
                                      </div>
                                    </div>
                                  </div>
                                </div>
                                <div class="board-list">
                                  <div class="board">
                                    <div class="thumbnail"><img src="resouces/img/2.jpg" alt=""></div>
                                    <div class="title"></div>
                                    <div class="info">작성자 : 김삿갓 | 조회수 : 73 | 추천수 : 14 | 작성일 : 2024-08-02</div>
                                    <div class="cover">
                                      <div class="material-icons arrow">arrow_forward</div>
                                      <div class="preview" onclick="location.href='views/post/postDetail.jsp'">
                                      </div>
                                    </div>
                                  </div>
                                </div>
                                <div class="board-list">
                                  <div class="board">
                                    <div class="thumbnail"><img src="resouces/img/2.jpg" alt=""></div>
                                    <div class="title"></div>
                                    <div class="info">작성자 : 김삿갓 | 조회수 : 73 | 추천수 : 14 | 작성일 : 2024-08-02</div>
                                    <div class="cover">
                                      <div class="material-icons arrow">arrow_forward</div>
                                      <div class="preview" onclick="location.href='views/post/postDetail.jsp'">
                                      </div>
                                    </div>
                                  </div>
                                </div>
                                <div class="board-list">
                                  <div class="board">
                                    <div class="thumbnail"><img src="resouces/img/2.jpg" alt=""></div>
                                    <div class="title"></div>
                                    <div class="info">작성자 : 김삿갓 | 조회수 : 73 | 추천수 : 14 | 작성일 : 2024-08-02</div>
                                    <div class="cover">
                                      <div class="material-icons arrow">arrow_forward</div>
                                      <div class="preview" onclick="location.href='views/post/postDetail.jsp'">
                                      </div>
                                    </div>
                                  </div>
                                </div>
                              </div>
                             
                          
                        </section>
                        <div align="center" class="paging-area">
                       
                  	  
                       <br><br><br><br><br>
                  </div> 
              
              
              
                </div>
            </div>
        </div>

       
    </body>
</html>