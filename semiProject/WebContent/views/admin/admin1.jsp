<%@page import="semi.question.model.vo.Question"%>
<%@page import="semi.member.model.vo.Commentery"%>
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
	ArrayList<Commentery>cList = (ArrayList<Commentery>)request.getAttribute("cList"); 
	ArrayList<Question>qList = (ArrayList<Question>)request.getAttribute("qList");
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
        <title>여행가조</title>
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
                    <div id="side_menu_open_1" onclick="location.href='<%=contextPath%>/adminList.ad?cpage=1&pCpage=1'">회원 관리</div>
                    <div id="side_menu_open_2" onclick="location.href='<%=contextPath%>/adminData.ad'">사용자 통계</div>
                   
                    <div id="side_menu_open_4" onclick="location.href='<%= contextPath %>'">메인 메뉴</div>
                    <div id="close_btn" onclick="side_close()"><img src="resouces/img/chevron_left_24dp_5F6368.png" alt=""></div>
    
                    <div id="side_menu_close_1" onclick="location.href='<%= contextPath %>/GoAdminMain.ad'">
                        <img src="resouces/img/airplane_ticket_24dp_5F6368.png" alt="">
                        <div class="explanation">회원 관리</div>
                    </div>
                    <div id="side_menu_close_2" onclick="location.href='<%= contextPath %>/GoAdmin2.ad'">
                        <img src="resouces/img/edit_calendar_24dp_5F6368_FILL0_wght400_GRAD0_opsz24.png" alt="">
                        <div class="explanation">사용자 통계</div>
                    </div>
                    <div id="side_menu_close_3" onclick="location.href='<%= contextPath %>/GoAdmin3.ad'">
                        <img src="resouces/img/dynamic_feed_24dp_5F6368.png" alt="">
                        <div class="explanation">수익 관리</div>
                    </div>
                    <div id="side_menu_close_4" onclick="location.href='<%= contextPath %>'">
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
                             <div class="left-inner-left" style="width: 850px;">
                         <% if(list == null || list.isEmpty()) {  %>
                                <div class="user-info">
                           			<p>조회된 회원정보가 없습니다</p>
                                </div>
                                 </div>
                                 
                           <% } else { %>
                           <% for(Member m : list) { %>
                            
                                <div class="user-info" style="width: 800px;"
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
                                       <td>
										    <button class="btn btn-secondary comment-btn"
										        data-mno="<%= m.getmNo() %>">댓글내역</button>
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
                            
                                    <!-- Check and display posts -->
                                    <% if(postList == null || postList.isEmpty()) {  %>
                                        <div class="post-info" id="post1">
                                            <p>게시글이 없습니다.</p>
                                        </div>
                                    <% } else { %>
                                        <%                           
                                            for(Post p : postList) {      
                                        %>
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
                                                        <button class="btn btn-del" data-pno="<%=p.getPostNo()%>">글삭제</button>
                                                    </td>                       
                                                </tr>
                                            </div>
                                        <% } %>
                                    <% } %>
                                    
                                  
                            
                                    <!-- Check and display questions -->
                                    <% if(qList == null || qList.isEmpty()) {  %>
                                        <div class="question-info" id="question1">
                                            <p>문의글이 없습니다.</p>
                                        </div>
                                    <% } else { %>
                                        <% 
                                            for(Question q : qList) {  
                                        %>
                                            <div class="post-info"
                                                data-question-no="<%=q.getqNo()%>"
                                                data-question-title="<%=q.getQtitle()%>"
                                                data-mno="<%=q.getmNo() %>"
                                                data-mname="<%=q.getmName() %>"
                                                data-question-date="<%=q.getqDate()%>">
                                                <tr>
                                                    <td><%=q.getqNo()%></td>
                                                    <td><%=q.getQtitle()%></td>
                                                    <td><%=q.getmNo()%></td>
                                                    <td><%=q.getqDate()%></td>
                                                    <td>
                                                        <button onclick="location.href='<%=contextPath%>/detail.sc?qNo=<%=q.getqNo()%>'" class="btn btn-del-question" data-qno="<%=q.getqNo()%>">문의답변</button>
                                                    </td>                       
                                                </tr>
                                            </div>
                                        <% } %>
                                    <% } %>
                                </div>
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
                        <div class="modal-text-content" id="user_no"></div>
                        <div class="modal-text-content" id="user_name"></div>
                        <div class="modal-text-content" id="user_id"></div>
                        <div class="modal-text-content" id="user_phone"></div>
                        <div class="modal-text-content" id="user_email"></div>
                        <div class="modal-text-content" id="user_address"></div>
                        <div class="modal-text-content" id="user_grade"></div>
                        <div class="modal-text-content" id="user_report"></div>
                        <div class="modal-text-content" id="user_status"></div>
                    </div>
                </div>
                </div>
            </div>
        </div>
     <% } %>


     <div id="commentModal" class="modal">
    <div class="modal-content">
        <span class="close">&times;</span>
        <div class="modal-info">
            <div class="comments-list">
               

                
            </div>
        </div>
    </div>
</div>
     <script>
     $(document).ready(function() {
        
        $(document).on('click', '.post-info', function(event) {
            event.stopPropagation(); 
            
            const postNo = $(this).data('post-no');
            const questionNo = $(this).data('question-no');

            let contentHtml = '';

            <% if (postList != null && !postList.isEmpty()) { %>
                <% for (Post p : postList) { %>
                    if ('<%=p.getPostNo()%>' == postNo) {
                        contentHtml += `
                            <div class='comment'>
                                <p>글 내용: <%= p.getPostContent() %></p>
                            </div>
                            <hr>
                        `;
                    }
                <% } %>
            <% } %>

            <% if (qList != null && !qList.isEmpty()) { %>
                <% for (Question q : qList) { %>
                    if ('<%=q.getqNo()%>' == questionNo) {
                        contentHtml += `
                            <div class='comment'>
                                <p>문의내용: <%= q.getqContent() %></p>
                            </div>
                            <hr>
                        `;
                    }
                <% } %>
            <% } %>

            if (contentHtml === '') {
                contentHtml = '<p>이 사용자가 작성한 글이 없습니다.</p>';
            }

            $('#commentModal .comments-list').html(contentHtml);
            $('#commentModal').css('display', 'block');
        });

        $('#commentModal .close').on('click', function() {
            $('#commentModal').css('display', 'none');
        });

        $(window).on('click', function(event) {
            if ($(event.target).is('#commentModal')) {
                $('#commentModal').css('display', 'none');
            }
        });

    });
     
     
     

     $(()=>{
    	    $('.comment-btn').on('click', function(event) {
    	        event.stopPropagation();  

    	        const mNo = $(this).data('mno'); 
    	        let commentsHtml = ''; 

    	     
    	        <% if (cList != null && !cList.isEmpty()) { %>
    	            <% for (Commentery c : cList) { %>
    	                if ('<%= c.getmNo() %>' == mNo) {
    	                    commentsHtml += `
    	                        <div class="comment">
    	                            <p>댓글번호: <%= c.getcNo() %></p>
    	                            <p>내용: <%= c.getcContent() %></p>
    	                            <p>작성일: <%= c.getcDate() %></p>
    	                        </div>
    	                        <hr>
    	                    `;
    	                }
    	            <% } %>
    	        <% } %>

    	        if(commentsHtml === '') {
    	            commentsHtml = '<p>이 사용자가 작성한 댓글이 없습니다.</p>';
    	        }

    	       
    	        $('#commentModal .comments-list').html(commentsHtml);
    	        $('#commentModal').css('display', 'block');
    	    });

    	  
    	    $('#commentModal .close').on('click', function() {
    	        $('#commentModal').css('display', 'none');
    	    });

    	 
    	    $(window).on('click', function(event) {
    	        if ($(event.target).is('#commentModal')) {
    	            $('#commentModal').css('display', 'none');
    	        }
    	    });
    	});

     
       
     
     
        $(function() {
        
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
                event.stopPropagation(); //  이벤트 전파를 멈추게 해주는 메소드
                const postNo = $(this).data('post-no'); 
                
                if (confirm('정말로 게시글을 지우시겠습니까?')) {
                    window.location.href = `<%=contextPath %>/delete.po?postNo=` + postNo;
                }

            })
            })

        
    </script>
    </body>
</html>