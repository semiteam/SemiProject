<%@page import="semi.question.model.vo.Reply"%>
<%@page import="semi.question.model.vo.Question"%>
<%@page import="oracle.net.aso.q"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	Question q = (Question)request.getAttribute("q");
	ArrayList<Reply> rlist = (ArrayList<Reply>)request.getAttribute("rlist");
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title></title>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

        <!-- jQuery library -->
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.js"></script>

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
        <link rel="stylesheet" href="resouces/css/questionDetailView.css">
        <link rel="stylesheet" href="resouces/css/common.css">

        <style>
            #replyContent{
                margin-top: 25px;
                width: 100%;
                height: 100px;
                border: none;
                box-sizing: border-box;
                background-color: #e5e5e5;
                resize: none;
            }
            
        </style>
    </head>
    <body>
    <%@ include file="../common/basic.jsp" %>
        <div class="wrap">
            <div class="background"></div>

            <div class="top">
                <div class="logo" onclick="location.href='<%= contextPath %>'">우리 여행가조</div>
                <div class="top_menu">
                    <ul>
                        <% if (loginUser != null || loginAdmin != null) { %>
                               <li id="top_menu_1" onclick="location.href='<%= contextPath %>/myPage.me'">My page</li>
                            <li id="top_menu_2" onclick="location.href='<%= contextPath %>/GoServiceCenter.sc'">고객센터</li>
                            <li id="top_menu_3">로그아웃</li>
                        <% } else { %>
                            <li id="top_menu_4" onclick="location.href='<%= contextPath %>/GoTermsOfUse.me'">회원가입</li>
                            <li id="top_menu_5" onclick="location.href='<%= contextPath %>/GoLogin.me'">로그인</li>
                            <li id="top_menu_6" onclick="location.href='<%= contextPath %>/GoServiceCenter.sc'">고객센터</li>
                        <% } %>
                    </ul>
                </div>
            </div>

            <div class="under">
                <div class="side_menu">
                    <div id="side_menu_open_1" onclick="location.href='<%= contextPath %>'">여행 갈래?</div>
                    <div id="side_menu_open_2" onclick="location.href='../관리자페이지/index2.html' ">계획 짤래?</div>
                    <div id="side_menu_open_3" onclick="location.href='../관리자페이지/index3.html'" style="font-weight: 900;">리뷰 볼래?</div>
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

                <div class="content" align = 'center'> 
                    <form action="<%=contextPath%>/insert.sc" method="post">
                     <%if(loginUser != null) {%> 
                        <input type="hidden" name="mNo" value="<%=loginUser.getmNo()%>">
                       <% }  %>
                        <div class="content-back">
                            <table class="question-table">
                                <tr>
                                    <td class="input-cell"><p name="title" class="input-title"><%=q.getQtitle() %></p></td> 
                                </tr>
                                <tr>
                                    <td class="input-cell"><p name="content" class="input-content"><%=q.getqContent() %></p></td>
                                </tr>    
                            </table>
                        </div>
                        <button type="button" onclick="location.href='<%=request.getContextPath() %>/GoServiceCenter.sc'" class="btn btn-secondary">목록이동</button>
                        <%if(loginUser != null && loginUser.getmNo() == q.getmNo() || loginAdmin != null){ %>
                            <button type="button" onclick ="location.href ='<%=request.getContextPath() %>/delete.sc?qNo=<%=q.getqNo()%>'" class="btn btn-secondary" style="background-color: red;">삭제하기</button>
                        <%}%>
                    </form>    
					<% if(q.getqAnswer().equals("Y") ||loginAdmin != null ){ %>
                        <div class="content-reply" id="reply-area">
                            <table class="reply-table">
                        <% if(loginAdmin != null) {%>
                            <thead>
                                <tr>
                                     <td><p name="aName" class="reply-top">답변자 :<%=loginAdmin.getaId()%></p></td>
                                </tr>
                                <tr>
                                    <td><textarea name="reply" id="replyContent" class="input-reply" required placeholder="문의답변작성"></textarea></td>
                                </tr>
                                    <td><button onclick="insertReply()" class="btn btn-secondary" style="margin-bottom: 20px; margin-top: 0;">답변등록</button></td>
 				             </thead>
                       <% } %>
                     <% } %>
		                       <tbody>
                               </tbody>
                           </table>
                         </div>
                       
                </div>
            </div>    



    <script>
    
		$(function(){
			selectReplyList();
		})
		
		
        function insertReply(){
            $.ajax({
                url:"rinsert.sc",
                data : {
                    content:$("#replyContent").val(),
                    qNo :<%= q.getqNo()%>,
                    
                    
                },
                type:"post",
                success: function(result){
                    if(result>0){
                        selectReplyList();

                        $("#replyContent").val("")

                    }
                },
                error: function(){
                    console.log("댓글작성 ajax통신실패");

                },
            })
        }
		
		
		function selectReplyList() {
			$.ajax({
				url : "rlist.sc",
				data : {qNo : <%= q.getqNo()%>},
				type : "post",
				success : function(list) {
					
					let value = "";
					for(let i = 0; i<list.length; i++){
						value += "<tr>"
								+ "<td>" + list[i].rContent + "</td>"
								+ "<td>" + list[i].adminId + "</td>" 
							  +"</tr>";
					}
					$("#reply-area tbody").html(value);
					
				},
				error : function() {
					console.log("통신실패");
				},
			})
			
		}

         function numberMaxLength(e){
        if(e.value.length > e.maxLength){
            e.value = e.value.slice(0, e.maxLength);
        }
    }


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