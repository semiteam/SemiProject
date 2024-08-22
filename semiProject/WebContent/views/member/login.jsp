<%@page import="semi.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>여행가조</title>
    <link rel="stylesheet" href="resouces/css/login.css">
</head>
<body>
	<%@ include file="../common/basic.jsp" %>
    <form action="<%=contextPath %>/login.ad" class="container" method="post">
        <div class="member-container">
            <div class="header">
                <img src="resouces/img/로고.png" alt="">
            </div>
            <hr>
        </div>

        <div class="user-input-id">
            <div  class="text_id" style="font-size: 20px;">ID</div>
            <input type="text" style="height: 25px; border-radius: 5px;" name="mId">
        </div>

        <div class="user-input-pwd">
            <div class="text_pwd" style="font-size: 20px;">PWD</div>
            <input type="password" style="height: 25px; border-radius: 5px;" name="mPwd">
        </div>

        <div class="abcd">
            <a href="views/member/termsOfUse.jsp" id="newId">회원가입</a>
            <a href="views/member/idSearch.jsp" id="IdPwdSearch">아이디/비밀번호 찾기</a>
        </div>

        <button id="login-btn" type="submit">로그인</button>

        <div class="line">
            <div class="line_1">
                <hr>
            </div>
            <div class="line_2">
                <div id="text-line">간편 로그인</div>
            </div>
            <div class="line_3">
                <hr>
            </div>
        </div>
        <br>
        <div>
            <img src="resouces/img/kakao_login_medium_wide.png" alt="">
        </div>
    </form>
</body>
</html>