<%@ page import = "semi.member.model.vo.Member" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	Member m = (Member)request.getAttribute("m");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>여행가조</title>
    <link rel="stylesheet" href="resouces/css/idSearch.css">
</head>
<body>
    <%@ include file="../common/basic.jsp" %>
    <div class="container">
        <div class="member-container">
            <div class="header">
                <img src="resouces/img/로고.png" alt="">
            </div>
            <!-- <hr> -->
            
           <form action="<%= contextPath %>/findId.me" method="post" class="popupFind2">
    <ul class="find2Tab">
        <li class="id">
            <a href="<%= contextPath %>/id.me" class="on">아이디 찾기</a>
        </li>
        <li class="password">
            <a href="<%= contextPath %>/pwd.me" class="pwd" finda2sopt="FindPwd">비밀번호 찾기</a>
        </li>
    </ul>

    <div class="searchForm">
        <div>이름</div><br>
        <input type="text" class="input_email" name="name" required> <br>

        <div>이메일</div><br>
        <input type="text" class="input_email" name="email" required> <br>
    </div>

    <button type="submit" id="btn_idSearch">아이디 찾기</button>
</form>

<div id="myModal" class="modal" style="display: <%= request.getAttribute("foundId") != null ? "block" : "none" %>;">
    <div class="modal-content">
        <span class="close">&times;</span>
        <p id="modal-text">
            <% if (m != null) { %>
                찾으신 아이디는 <span class="highlight-id"><%= m.getmId() %></span> 입니다.
            <% } else { %>
                아이디를 찾을 수 없습니다.
            <% } %>
        </p>
    </div>
</div>

<script>
    // 모달과 관련된 요소를 가져옴
    var modal = document.getElementById("myModal");
    var span = document.getElementsByClassName("close")[0];

    // 모달 닫기 버튼 클릭 시 모달을 닫는 함수
    span.onclick = function() {
        modal.style.display = "none";
    };

    // 모달 외부 클릭 시 모달을 닫는 함수
    window.onclick = function(event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    };
</script>
    
</body>
</html>