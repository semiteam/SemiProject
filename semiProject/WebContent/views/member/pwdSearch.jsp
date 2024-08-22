<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="resouces/css/pwdSearch.css">
    <title>여행가조</title>
</head>
<body>
    <%@ include file="../common/basic.jsp" %>
    <div class="container">
        <form accept="" method="" class="member-container">
            <div class="header">
            <img src="resouces/img/로고.png" alt="">
            </div>
            <!-- <hr> -->
            
            <div class="popupFind2">
            <ul class="find2Tab">
                <li class="id">
                    <a href="views/member/idSearch.jsp" class="on">아이디 찾기</a>
                </li>
                <li class="password">
                    <a href="" class="pwd" finda2sopt="FindPwd">비밀번호 찾기</a>
                </li>
            </ul>

            <div class="searchForm">
                <span id="pwd_text">비밀번호 찾기</span>
                <br><input type="text" id="search_Pwd" placeholder="이메일 또는 아이디">

            </div>
            
            <button id="btn_idSearch">비밀번호 찾기</button>
        </div>
     </ㄹ>
</body>
</html>