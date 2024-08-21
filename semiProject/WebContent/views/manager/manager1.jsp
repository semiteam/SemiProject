<%@page import="semi.post.model.vo.Post"%>
<%@page import="semi.common.model.vo.PageInfo"%>
<%@page import="semi.member.model.vo.Member"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	PageInfo postPi = (PageInfo)request.getAttribute("postPi");

	ArrayList<Member> list = (ArrayList<Member>)request.getAttribute("list");
	ArrayList<Post> postList = (ArrayList<Post>)request.getAttribute("postList");

	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
	
	int postCurrentPage = postPi.getCurrentPage();
	int postStartPage = postPi.getStartPage();
	int postEndPage = postPi.getEndPage();
	int postMaxPage = postPi.getMaxPage();
	
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
                    <div id="side_menu_open_1" onclick="location.href='<%=contextPath%>/adminList.ad?cpage=1&pCpage=1'">회원 관리</div>
                    <div id="side_menu_open_2" onclick="location.href='<%=contextPath%>/adminData.ad'">사용자 통계</div>
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
                            
                                <div class="user-info" 
                                			 data-mno="<%=m.getmNo()%>"
										     data-mid="<%=m.getmId()%>"
										     data-mname="<%=m.getmName()%>"
										     data-mphone="<%=m.getmPhone()%>"
										     data-memail="<%=m.getmEmail()%>"
										     data-maddress="<%=m.getmAddress()%>"
										     data-mgrade="<%=m.getmGrade()%>"
										     data-mreport="<%=m.getmReport()%>"
										     data-mstatus="<%=m.getmStatus()%>">
                                    <tr>
                                        <td>PK: <%=m.getmNo()%></td>
                                        <td><%=m.getmId()%></td>
                                        <td><%=m.getmName() %></td>
                                        <td>누적신고횟수 : <%=m.getmReport() %></td>
                                        <td>회원상태 : <%=m.getmStatus()%></td>
									    <td>
									    	 <button class="btn btn-danger block-btn" 
                        						data-mno="<%=m.getmNo()%>">차단</button>
									    </td>
                                        <td>
                                        	<button class="btn btn-wide unblock-btn"
                                                data-mno="<%=m.getmNo()%>">차단해제</button>
                                        </td>                            
                                    </tr>
                                </div>
                             <% } %>
                             </div>
                          <% } %>
                            
                         </div>  
                         
                         
                        </div>
				
						
            <!--Member 페이징바-->
           <div class="paging-area" align="center">
            <% if (currentPage != 1) { %>    
            <button onclick="location.href='<%= contextPath %>/adminList.ad?cpage=<%= currentPage - 1 %>&pCpage=<%=postCurrentPage%>'">&lt;</button>
            <% } %>
            <% for (int p = startPage; p <= endPage; p++) { %>
                <% if (p == currentPage) { %>
                    <button disabled><%= p %></button>
                <% } else { %>
                    <button onclick="location.href='<%= contextPath %>/adminList.ad?cpage=<%= p %>&pCpage=<%=postCurrentPage%>'"><%= p %></button>
                <% } %>
            <% } %>
            
            <% if (currentPage != maxPage) { %>
            <button onclick="location.href='<%= contextPath %>/adminList.ad?cpage=<%= currentPage + 1 %>&pCpage=<%=postCurrentPage%>'">&gt;</button>
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
                                    <% if(postList == null || postList.isEmpty()) {  %>
                                        <div class="post-info" id="post1">
                                            <p>게시글이 없습니다.</p>
                                        </div>
                                     <% } else { %>
                         				  <% for(Post p : postList) { %> 
                                        <div class="post-info"
                                        			data-post-no= "<%=p.getPostNo()%>"
                                        			data-post-title = "<%=p.getPostTitel() %>"
                                        			data-mid = "<%=p.getmId() %>"
                                        			data-mname = "<%=p.getmName() %>"
                                        			data-post-recommend = "<%=p.getPostRecommend() %>"
                                        			data-post-date="<%=p.getPostDate() %>">
                                        			
                                        <tr>
                                        <td><%=p.getPostNo()%></td>
                                        <td><%=p.getPostTitel()%></td>
                                        <td><%=p.getmId()%></td>
                                        <td><%=p.getPostRecommend()%></td>
                                        <td><%=p.getPostDate()%></td>
									    <td>
									    	 <button class="btn btn btn-del" 
                        						data-post-no="<%=p.getPostNo()%>">글삭제</button>
									    </td>                       
                                    </tr>
                                </div>
                                <% } %>
                            </div>
                             <% } %>
                        </div>


                        <!--POST 페이징바-->
                        <div class="paging-area" align="center"> 
                            <% if (postCurrentPage != 1) { %>    
                            <button onclick="location.href='<%= contextPath %>/adminList.ad?cpage=<%= currentPage%>&pCpage=<%= postCurrentPage - 1 %>'">&lt;</button>
                            <% } %>
                            <% for (int p = postStartPage; p <= postEndPage; p++) { %>
                                <% if (p == postCurrentPage) { %>
                                    <button disabled><%= p %></button>
                                <% } else { %>
                                    <button onclick="location.href='<%= contextPath %>/adminList.ad?cpage=<%= currentPage%>&pCpage=<%=p%>'"><%= p %></button>
                                <% } %>
                            <% } %>
                            
                            <% if (postCurrentPage != postMaxPage) { %>
                            <button onclick="location.href='<%= contextPath %>/adminList.ad?cpage=<%= currentPage%>&pCpage=<%= postCurrentPage + 1 %>'">&gt;</button>
                            <% } %>
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
                        <div class="modal-text-contetn" id="user_no"></div>
                        <div class="modal-text-contetn" id="user_name"></div>
                        <div class="modal-text-contetn" id="user_id"></div>
                        <div class="modal-text-contetn" id="user_phone"></div>
                        <div class="modal-text-contetn" id="user_email"></div>
                        <div class="modal-text-contetn" id="user_address"></div>
                        <div class="modal-text-contetn" id="user_grade"></div>
                        <div class="modal-text-contetn" id="user_report"></div>
                        <div class="modal-text-contetn" id="user_status"></div>
                    </div>
                </div>
                </div>
        </div>
     <% } %>
        

        
        
     <script>
        $(function() {
            // Handle user info click to open modal
            $('.user-info').on('click', function() {
                const mNo = $(this).data('mno');
                const mId = $(this).data('mid');
                const mName = $(this).data('mname');
                const mPhone = $(this).data('mphone');
                const mEmail = $(this).data('memail');
                const mAddress = $(this).data('maddress');
                const mGrade = $(this).data('mgrade');
                const mReport = $(this).data('mreport');
                const mStatus = $(this).data('mstatus');
    
                $('#user_no').text(`회원 : ` + mNo);
                $('#user_name').text(`아이디 : ` + mId);
                $('#user_id').text(`이름 : ` + mName);
                $('#user_phone').text(`전화번호 : ` + mPhone);
                $('#user_email').text(`이메일 : ` + mEmail);
                $('#user_address').text(`주소 : ` + mAddress);
                $('#user_grade').text(`등급 : ` + mGrade);
                $('#user_report').text(`신고횟수 : ` + mReport);
                $('#user_status').text(`상태 : ` + mStatus);
    
                $('#myModal').css('display', 'block');
            });
    
          
            $('.close').on('click', function() {
                $('#myModal').css('display', 'none');
            });
    
          
            $(window).on('click', function(event) {
                if ($(event.target).is('#myModal')) {
                    $('#myModal').css('display', 'none');
                }
            });
    
          
			 $('.block-btn').on('click', function() {
                event.stopPropagation(); //  이벤트 전파를 멈추게 해주는 메소드
			    const mNo = $(this).data('mno');  
                
			    if (confirm('정말로 차단하시겠습니까?')) {
			        window.location.href = `<%= contextPath %>/block.ad?mNo=` + mNo;
			    }
			});
    
            
            $('.unblock-btn').on('click', function() {
                event.stopPropagation(); //  이벤트 전파를 멈추게 해주는 메소드
                const mNo = $(this).data("mno");

                if(confirm('차단을 해제하시겠습니까?')){
                    window.location.href = '<%=contextPath %>/unblock.ad?mNo=' + mNo;
                }
              
            });
    
                
            });


            $(function(){

            $('.btn-del').on('click',function(){
            
                const postNo = $(this).data('post-no'); 
                
                if (confirm('정말로 게시글을 지우시겠습니까?')) {
                    window.location.href = `<%= contextPath %>/delete.po?postNo=` + postNo;
                }

            })
            })

        
    </script>
    </body>
</html>