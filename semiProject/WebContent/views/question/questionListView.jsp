<%@page import="semi.question.model.vo.Question"%> <%@page
import="semi.common.model.vo.PageInfo"%> <%@ page language="java"
contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <% PageInfo pi =
(PageInfo)request.getAttribute("pi"); ArrayList<Question
  >list = (ArrayList<Question
    >)request.getAttribute("list"); int currentPage = pi.getCurrentPage(); int
    startPage = pi.getStartPage(); int endPage = pi.getEndPage(); int maxPage =
    pi.getMaxPage(); %>
    <!DOCTYPE html>
    <html lang="en">
      <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>고객센터메인</title>
        <!-- Latest compiled and minified CSS -->
        <link
          rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
        />

        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
        <!-- Popper JS -->
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

        <link
          rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css"
        />

        <link rel="preconnect" href="https://fonts.googleapis.com" />

        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link
          href="https://fonts.googleapis.com/css2?family=Hahmlet:wght@100..900&display=swap"
          rel="stylesheet"
        />
        <link rel="stylesheet" href="resouces/css/questionListView.css" />
        <link rel="stylesheet" href="resouces/css/common.css" />

        <style></style>
      </head>
      <body>
        <%@ include file="../common/basic.jsp" %>
        <div class="wrap">
          <div class="top">
            <div class="logo" onclick="location.href='<%= contextPath %>'">
              우리 여행가조
            </div>
            <div class="top_menu">
              <ul>
                <li
                  id="top_menu_1"
                  onclick="location.href='<%= contextPath %>/GoMyPage.me'"
                >
                  My page
                </li>
                <li
                  id="top_menu_2"
                  onclick="location.href='<%= contextPath %>/GoServiceCenter.sc'"
                >
                  고객센터
                </li>
                <li id="top_menu_3">로그아웃</li>
              </ul>
            </div>
          </div>

          <div class="under">
            <div class="side_menu">
              <div
                id="side_menu_open_1"
                onclick="location.href='<%= contextPath %>'"
              >
                여행 갈래?
              </div>
              <% if (loginAdmin != null) { %>
              <div
                id="side_menu_open_2"
                onclick="location.href='<%= contextPath %>/GoShowPlanMain.ad'"
                class="login"
              >
                계획 짤래?
              </div>
              <% } else { %>
              <div
                id="side_menu_open_2"
                onclick="location.href='<%= contextPath %>/GoScheduleMain.sd?mno=<%= loginUser.getmNo() %>'"
                class="login"
              >
                계획 짤래?
              </div>
              <% } %>
              <div
                id="side_menu_open_3"
                onclick="location.href='<%= contextPath %>/list.po?cpage=1'"
                class="login"
              >
                리뷰 볼래?
              </div>
              <% if (loginAdmin != null) { %>
              <div
                id="side_menu_open_4"
                onclick="location.href='<%= contextPath %>/GoAdminMain.ad'"
              >
                관리자 메뉴
              </div>
              <% } %>
              <div id="close_btn" onclick="side_close()">
                <img src="resouces/img/chevron_left_24dp_5F6368.png" alt="" />
              </div>

              <div
                id="side_menu_close_1"
                onclick="location.href='<%= contextPath %>'"
                class="login"
              >
                <img
                  src="resouces/img/airplane_ticket_24dp_5F6368.png"
                  alt=""
                />
                <div class="explanation">여행 갈래?</div>
              </div>
              <% if (loginAdmin != null) { %>
              <div
                id="side_menu_close_2"
                onclick="location.href='<%= contextPath %>/GoShowPlanMain.ad'"
                class="login"
              >
                <img
                  src="resouces/img/edit_calendar_24dp_5F6368_FILL0_wght400_GRAD0_opsz24.png"
                  alt=""
                />
                <div class="explanation">계획 짤래?</div>
              </div>
              <% } else { %>
              <div
                id="side_menu_close_2"
                onclick="location.href='<%= contextPath %>/GoScheduleMain.sd?mno=<%= loginUser.getmNo() %>'"
                class="login"
              >
                <img
                  src="resouces/img/edit_calendar_24dp_5F6368_FILL0_wght400_GRAD0_opsz24.png"
                  alt=""
                />
                <div class="explanation">계획 짤래?</div>
              </div>
              <% } %>
              <div
                id="side_menu_close_3"
                onclick="location.href='<%= contextPath %>/list.po?cpage=1'"
                class="login"
              >
                <img src="resouces/img/dynamic_feed_24dp_5F6368.png" alt="" />
                <div class="explanation">리뷰 볼래?</div>
              </div>
              <% if (loginAdmin != null) { %>
              <div
                id="side_menu_close_4"
                onclick="location.href='<%= contextPath %>/GoAdminMain.ad'"
              >
                <img
                  src="resouces/img/manage_accounts_24dp_5F6368_FILL0_wght400_GRAD0_opsz24.png"
                  alt=""
                />
                <div class="explanation">관리자 메뉴</div>
              </div>
              <% } %>
              <div id="open_btn" onclick="side_open()">
                <img src="resouces/img/chevron_right_24dp_5F6368.png" alt="" />
              </div>
            </div>

            <div class="content">
              <div class="title" align="center">
                문의사항 <br />
                <input
                  style="width: 700px; height: 30px; font-size: 16px"
                  type="text"
                  placeholder="글 제목또는 작성자를 입력하세요."
                  class="search-txt"
                  id="place-question"
                  name="place-question"
                />
              </div>
              <br />

              <div id="find_result"></div>

              <script>
                function findQuestion(value){
                    $.ajax({
                        type: "get",
                            url: "<%=contextPath%>/findQuestion.ad",
                            dataType: "json",
                            data: {
                              value: value,
                            },
                            success:function(data){
                                $(".find-result").html("");
                                let str = "";
                                if(data !== null){
                                    $.each(data,function(i){
                                        str +=
                                        '<table style="color: white;" class="table-list" data-qno="' + data[i].qNo + '"data-mno="' + data[i].mNo
                                                     + '" data-qtitle="' + data[i].qTitle + '"data-qcontent="' + data[i].qContent
                                                     + '"data-qdate="' + data[i].qDate + '"data-qstatus="' + data[i].qStatus
                                                     + '"data-qanwer="' + data[i].qAnswer + '"data-pwd="' + data[i].qPwd
                                                     + '"data-mid="' + data[i].mId +'" >' +
                                                     "<tbody>" +
                                                     '<tr data-pwd =' + data[i].qPwd+ '>' + 
                                                     '<th width="120px">' + data[i].qNo +'</th>' +
                                                     "<th>"+ data[i].qTitle +"</th>" +
                                                     '<th width="120px">' + data[i].mId +'</th>' +
                                                     '<th width="120px">' + data[i].qDate +'</th>' +
                                                     '<th width="100px">' + data[i].qAnswer +'</th>'+
                                                     <%if(loginAdmin != null){%>
                                                     '<th width ="120px">' + data[i].qPwd + '</th>' +
                                                     <%}%>
                                                     "</tbody>" +
                                   				 	"</tr>" +

                                    "</table>";
                                    });
                                    $("#find_result").html(str);
                                }
                            },
                            error: function () {
                              console.log("통신 실패");
                            },
                         });
                        }
                        $(function () {
                          $("#place-question").on("keyup", function () {
                            if ($(this).val() === "") {
                              $("#find_result").html("");
                              $(".table-list").show()
                            } else {
                              findQuestion($(this).val());
                              $(".table-list").hide()
                            }
                          });
                        });
              </script>

              <%if(loginUser != null){ %>
              <form method="post" align="right">
                <button
                  type="button"
                  class="btn btn-sm btn-secondary"
                  onclick="location.href='<%= contextPath %>/enrollForm.sc'"
                >
                  작성하기
                </button>
              </form>
              <% }%>

              <div class="question" align="center">
                <%if(list==null || list.isEmpty()) {%>
                <table class="table-list">
                  <tr>
                    <td>조회된 회원정보가 없습니다.</td>
                  </tr>
                </table>
                <% }else{ %>
                <table class="table-list">
                  <thead>
                    <tr>
                      <th width="120px">글번호</th>
                      <th>문의 제목</th>
                      <th width="120px">작성자</th>
                      <th width="120px">작성일</th>
                      <th width="100px">답변여부</th>
                      <%if(loginAdmin != null) { %>
                      <th width="120px">비밀번호</th>
                      <% } %>
                    </tr>
                  </thead>
                  <% for(Question q : list ) { %>
                  <tbody>
                    <tr data-pwd="<%=q.getqPwd()%>">
                      <td><%=q.getqNo()%></td>
                      <td><%=q.getQtitle()%></td>
                      <td><%=q.getmId()%></td>
                      <td><%=q.getqDate()%></td>
                      <td><%=q.getqAnswer()%></td>
                      <%if(loginAdmin != null) { %>
                      <th width="120px"><%=q.getqPwd() %></th>
                      <% } %>
                    </tr>
                  </tbody>
                  <% } %>
                </table>
                <% } %>

                <!--question 페이징바-->
                <div class="paging-area" align="center">
                  <% if (currentPage != 1) { %>
                  <button
                    onclick="location.href='<%= contextPath %>/GoServiceCenter.sc?qCpage=<%= currentPage - 1 %>'"
                  >
                    &lt;
                  </button>
                  <% } %> <% for (int p = startPage; p <= endPage; p++) { %> <%
                  if (p == currentPage) { %>
                  <button disabled><%= p %></button>
                  <% } else { %>
                  <button
                    onclick="location.href='<%=contextPath %>/GoServiceCenter.sc?qCpage=<%=p%>'"
                  >
                    <%= p %>
                  </button>
                  <% } %> <% } %> <% if (currentPage != maxPage) { %>
                  <button
                    onclick="location.href='<%= contextPath %>/GoServiceCenter.sc?qCpage=<%= currentPage + 1%>'"
                  >
                    &gt;
                  </button>
                  <% } %>
                </div>
              </div>
            </div>
          </div>
        </div>

        <script>
          $(function () {
        	  $(document).on('click', '.table-list>tbody>tr', function(){
              var correctpwd = $(this).data("pwd");

              if (correctpwd == null || correctpwd == 0) {
                location.href =
                  "<%=contextPath%>/detail.sc?qNo=" +
                  $(this).children().eq(0).text();
              } else {
                var enteredPwd = prompt(
                  "문의 작성시 설정했던 비밀번호를 입력해주세요 : "
                );
                if (enteredPwd == correctpwd) {
                  location.href =
                    "<%=contextPath%>/detail.sc?qNo=" +
                    $(this).children().eq(0).text();
                } else {
                  alert("잘못된 비밀번호 입니다.");
                }
              }
            });
          });

          const side_menu = document.getElementsByClassName("side_menu");
          const content = document.getElementsByClassName("content");
          const close_btn = document.getElementById("close_btn");
          const open_btn = document.getElementById("open_btn");

          function side_close() {
            side_menu[0].style.width = "2.5%";
            content[0].style.width = "97.5%";
            content[0].style.margin = "0 0 0 2.5%";

            side_menu_open_1.style.display = "none";
            side_menu_open_2.style.display = "none";
            side_menu_open_3.style.display = "none";
            close_btn.style.display = "none";

            side_menu_close_1.style.display = "block";
            side_menu_close_2.style.display = "block";
            side_menu_close_3.style.display = "block";
            open_btn.style.display = "block";
          }

          function side_open() {
            side_menu[0].style.width = "15%";
            content[0].style.width = "85%";
            content[0].style.margin = "0 0 0 15%";

            side_menu_open_1.style.display = "block";
            side_menu_open_2.style.display = "block";
            side_menu_open_3.style.display = "block";
            close_btn.style.display = "block";

            side_menu_close_1.style.display = "none";
            side_menu_close_2.style.display = "none";
            side_menu_close_3.style.display = "none";
            open_btn.style.display = "none";
          }
        </script>
      </body>
    </html></Question
  ></Question
>
