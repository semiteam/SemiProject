<%@page import="semi.common.model.vo.PageInfo"%>
<%@page import="semi.member.model.vo.Member"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");

	ArrayList<Member> list = (ArrayList<Member>)request.getAttribute("list");

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
        <title>관리자페이지 메인(회원관리)</title>
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
        
        <script defer src="resouces/js/common.js"></script>
        <link rel="stylesheet" href="resouces/css/manager1.css">
        <link rel="stylesheet" href="resouces/css/common.css">
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
                    <div id="side_menu_open_1" onclick="location.href='views/manager/manager1.jsp'">회원 관리</div>
                    <div id="side_menu_open_2" onclick="location.href='views/manager/manager2.jsp'">사용자 통계</div>
                    <div id="side_menu_open_3" onclick="location.href='views/manager/manager3.jsp'">수익 관리</div>
                    <div id="side_menu_open_4" onclick="location.href='views/goTrip/goTripLogin_O.jsp'">메인 메뉴</div>
                    <div id="close_btn" onclick="side_close()"><img src="resouces/img/chevron_left_24dp_5F6368.png" alt=""></div>
    
                    <div id="side_menu_close_1" onclick="location.href='views/manager/manager1.jsp'">
                        <img src="resouces/img/airplane_ticket_24dp_5F6368.png" alt="">
                        <div class="explanation">회원 관리</div>
                    </div>
                    <div id="side_menu_close_2" onclick="location.href='views/manager/manager2.jsp'">
                        <img src="resouces/img/edit_calendar_24dp_5F6368_FILL0_wght400_GRAD0_opsz24.png" alt="">
                        <div class="explanation">사용자 통계</div>
                    </div>
                    <div id="side_menu_close_3" onclick="location.href='views/manager/manager3.jsp'">
                        <img src="resouces/img/dynamic_feed_24dp_5F6368.png" alt="">
                        <div class="explanation">수익 관리</div>
                    </div>
                    <div id="side_menu_close_4" onclick="location.href='views/goTrip/goTripLogin_O.jsp'">
                        <img src="resouces/img/dynamic_feed_24dp_5F6368.png" alt="">
                        <div class="explanation">메인 메뉴</div>
                    </div>
                    <div id="open_btn" onclick="side_open()">
                        <img src="resouces/img/chevron_right_24dp_5F6368.png" alt="">
                    </div>
                </div>
    
                <div class="content">
                    
                    <div class="main left-main">
                        <div class="inner">
                            <p>회원정보 관리</p>
                            <form action="" class="search-box" method="get">
                                <input type="text" placeholder="회원정보를 입력하세요." class="search-txt">
                                <button class="btn search-btn" type="submit">검색</button>
                            </form>
                         
                            
                        <div class="left-inner">
                             <div class="left-inner-left">
                         <% if(list == null || list.isEmpty()) {  %>
                                <div class="user-info">
                           			<p>조회된 회원정보가 없습니다</p>
                                </div>
                                 </div>
                                 
                           <% } else { %>
                           <% for(Member m : list) { %>
                            
                                <div class="user-info">
                                    <tr>
                                        <td>PK: <%=m.getmNo()%></td>
                                       <td><%=m.getmId()%></td>
                                        <td><%=m.getmName() %></td>
                                        <td>누적신고횟수 : <%=m.getmReport() %></td>
                                        <td>회원상태 : <%=m.getmStatus() %></td>
                                    </tr>
                                </div>
                             <% } %>
                             </div>
                          <% } %>
                            
                         </div>    
                        </div>
				 <script>
				 $(function() {
			            $(".user-info>tbody>tr").click(function() { // 수정할것
			                location.href = '<%= contextPath %>/detail.bo?bno=' + $(this).children().eq(0).text();
			            });
			        });
	             </script>
						

           <div class="paging-area" align="center">
            <% if (currentPage != 1) { %>    
            <button onclick="location.href='<%= contextPath %>/adminList.ad?cpage=<%= currentPage - 1 %>'">&lt;</button>
            <% } %>
            <% for (int p = startPage; p <= endPage; p++) { %>
                <% if (p == currentPage) { %>
                    <button disabled><%= p %></button>
                <% } else { %>
                    <button onclick="location.href='<%= contextPath %>/adminList.ad?cpage=<%= p %>'"><%= p %></button>
                <% } %>
            <% } %>
            
            <% if (currentPage != maxPage) { %>
            <button onclick="location.href='<%= contextPath %>/adminList.ad?cpage=<%= currentPage + 1 %>'">&gt;</button>
            <% } %>
       	 </div>
                    </div>
    
                    <div class="main right-main">
                        <div class="inner">
                            <p>최신글 확인</p>
                            <form action="" class="search-box" method="get">
                                <input type="text" placeholder="찾고싶은 글을 검색하세요." class="search-txt">
                                <button class="btn search-btn" type="submit">검색</button>
                            </form>

                            <div class="right-inner">
                                    <div class="right-inner-left">
                                        <div class="post-info" id="post1">
                                            <p>글번호(pk) 제목/ 작성자/ 클릭시 그 게시글로 가게끔</p>
                                        </div>
    
                                        <div class="post-info" id="post2">
                                            <p>글번호(pk) 제목/ 작성자/ </p>
                                        </div>
    
                                        <div class="post-info" id="post3">
                                            <p>글번호(pk) 제목/ 작성자/</p>
                                        </div>
    
                                        <div class="post-info" id="post4">
                                            <p>글번호(pk) 제목/ 작성자/ </p>
                                        </div>
    
                                        <div class="post-info" id="post5">
                                            <p>글번호(pk) 제목/ 작성자/ </p>
                                        </div>

                                        <div class="post-info" id="post6">
                                            <p>글번호(pk) 제목/ 작성자/ </p>
                                        </div>
                                    </div>
                                <div class="right-inner-right">
                                    <div class="report">
                                        <button class="btn btn-del" id="del1">글삭제</button>
                                    </div>

                                    <div class="report">
                                        <button class="btn btn-del" id="del2">글삭제</button>
                                    </div>

                                    <div class="report">
                                        <button class="btn btn-del" id="del3">글삭제</button>
                                    </div>

                                    <div class="report">
                                        <button class="btn btn-del" id="del4">글삭제</button>
                                    </div>

                                    <div class="report">
                                        <button class="btn btn-del" id="del5">글삭제</button>
                                    </div>

                                    <div class="report">
                                        <button class="btn btn-del" id="del6">글삭제</button>
                                    </div>
                                </div>
                            </div>
                        </div>

                 <ul class="pagination justify-content-center">
                            <li class="page-item disabled">
                                <a class="page-link" href="#" tabindex="-1" aria-disabled="true">이전</a>
                            </li>
                            <li class="page-item"><a class="page-link" href="#">1</a></li>
                            <li class="page-item"><a class="page-link" href="#">2</a></li>
                            <li class="page-item"><a class="page-link" href="#">3</a></li>
                            <li class="page-item"><a class="page-link" href="#">4</a></li>
                            <li class="page-item"><a class="page-link" href="#">5</a></li>


                            <li class="page-item">
                                <a class="page-link" href="#">다음</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>     
        </div>
        <% if(list == null || list.isEmpty()) { %>
        	<% }else { %>
        <div id="myModal" class="modal">
            <div class="modal-content">
                <span class="close">&times;</span>
                <div class="modal-info">
              
                    <div class="modal-profile">
                        <div class="profile-photo" id="user-profile-photo">프로필사진</div>
                    </div>
                    <div class="modal-text" align="left" >
                        <div class="modal-text-contetn" id="user_no">회원번호 : <%=list.get(0).getmNo()%></div>
                        <div class="modal-text-contetn" id="user_name">아이디 : <%=list.get(0).getmName()%></div>
                        <div class="modal-text-contetn" id="user_id">이름 : <%=list.get(0).getmId()%></div>
                        <div class="modal-text-contetn" id="user_phone">전화번호 : <%=list.get(0).getmPhone()%></div>
                        <div class="modal-text-contetn" id="user_email">이메일 : <%=list.get(0).getmEmail()%></div>
                        <div class="modal-text-contetn" id="user_address">주소 : <%=list.get(0).getmAddress()%></div>
                        <div class="modal-text-contetn" id="user_grade">등급 : <%=list.get(0).getmGrade()%></div>
                        <div class="modal-text-contetn" id="user_report">신고횟수 : <%=list.get(0).getmReport()%></div>
                        <div class="modal-text-contetn" id="user_status">상태 : <%=list.get(0).getmStatus()%></div>
                    </div>
                </div>
 
     <% } %>
                <div class="modal-bottom">
                <button id="edit-btn" class="btn btn-wide btn-danger">차단</button>
                <button id="cancel-btn" class="btn btn-wide">차단해제</button></div>

            </div>
        </div>
        

        
        
        <script>
        
        
            document.addEventListener('DOMContentLoaded', function () {
                const modal = document.getElementById("myModal");
                const span = document.getElementsByClassName("close")[0];
                const cancelBtn = document.getElementById("cancel-btn");

                document.querySelectorAll('.user-info').forEach(function(item){
                    item.addEventListener('click', function () {
                        modal.style.display = "block";
                    });
                });

                span.onclick = function() {
                    modal.style.display = "none";
                }
                cancelBtn.onclick = function(){
                    modal.style.display= "none";
                }

                window.onclick = function(event) {
                    if (event.target == modal) {
                        modal.style.display = "none";
                    }
                }
            });



            document.querySelectorAll('.btn-danger').forEach(function(btn) {
                btn.addEventListener('click', function () {
                    if (btn.textContent === '차단') {
                        alert('차단되었습니다.');
                    } else if (btn.textContent === '차단해제') {
                        alert('차단이 해제되었습니다.');
                    }
                });
            });


            document.querySelectorAll('.btn-del').forEach(function(btn){
                btn.addEventListener('click',function(){
                    alert('글이 삭제되었습니다.');
                })
            })
        </script>
    </body>
</html>