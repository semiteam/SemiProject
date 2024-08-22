<%@page import="semi.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

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
           <button id="kakao-login-btn"><img src="resouces/img/kakao_login_medium_wide.png" alt=""></button>
        </div>
    </form>

    <script>
    // 19e91fd74a6cd923699ec6ba05f2e827
    Kakao.init('e72b2fb14cc913f2e1c849b90d6a116c');

    document.getElementById('kakao-login-btn').addEventListener('click', function() {
    	Kakao.Auth.login({
    	    success: function(authObj) {
    	        Kakao.API.request({
    	            url: '/v2/user/me',
    	            success: function(response) {
    	                var kakaoId = response.id; // 이 값이 실제로 존재하는지 확인
    	                var nickname = response.properties.nickname;
    	                var email = response.kakao_account.email;

    	                // 서버로 전송
    	                fetch('/kakaoLogin.ad', {
    	                    method: 'POST',
    	                    headers: {
    	                    	'Content-Type': 'application/json'
    	                    },
    	                    body: JSON.stringify({
    	                        kakaoId: kakaoId,
    	                        nickname: nickname,
    	                        email: email
    	                    })
    	                })
    	                .then(response => response.json())
    	                .then(data => {
    	                    if (data.success) {
    	                        alert('로그인 성공!');
    	                        window.location.href = '/';
    	                    } else {
    	                        alert('로그인 실패: ' + data.message);
    	                    }
    	                })
    	                .catch(error => {
    	                    console.error('Error:', error);
    	                    alert('서버와의 통신 중 오류가 발생했습니다.');
    	                });
    	            },
    	            fail: function(error) {
    	                console.log(error);
    	                alert('사용자 정보 요청 실패');
    	            }
    	        });
    	    },
    	    fail: function(err) {
    	        console.log(err);
    	        alert('로그인 실패');
    	    }
    	});
    }
    </script>
</body>
</html>