<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link rel="stylesheet" href="resouces/css/pwdSearch.css">
    <title>여행가조</title>
    
    <style>
      
      
    </style>
</head>
<body>
    <%@ include file="../common/basic.jsp" %>
    <div class="container">
       <form action="<%= contextPath %>/findPwd.me" method="POST" class="member-container">
            <div class="header">
            <img src="resouces/img/로고.png" alt="">
            </div>
            <!-- <hr> -->
            
            <div class="popupFind2">
            <ul class="find2Tab">
                <li class="id">
                    <a href="<%= contextPath %>/id.me" class="on">아이디 찾기</a>
                </li>
                <li class="password">
                    <a href="" class="pwd" finda2sopt="FindPwd">비밀번호 찾기</a>
                </li>
            </ul>
			</div>
             <div class="searchForm">
                <span id="pwd_text">비밀번호 찾기</span>

                <br><input class="search_Pwd" placeholder="아이디" name="userId">

                <br><input class="search_Pwd" placeholder="이름" name="name">

                <br><input class="search_Pwd" placeholder="생년월일 6자리" name="birth" maxlength="6">
            </div>
            
            
            <% String errorMessage = (String) request.getAttribute("errorMessage"); %>
            <% if (errorMessage != null) { %>
                <div class="error-message" style="color:red; margin-left: 100px; margin-top: 30px"><%= errorMessage %></div>
            <% } %>
            
            
            <button type="submit" id="btn_idSearch">비밀번호 찾기</button>
            
             
            </form>
        </div>
      
        
    
</body>
</html>