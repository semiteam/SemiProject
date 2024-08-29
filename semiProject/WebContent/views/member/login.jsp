<%@page import="semi.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    
    <script type="text/javascript" src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    <script>
		Kakao.init('07971e9ec052320c8e179d9629e8ede2'); // 사용하려는 앱의 JavaScript 키 입력
	</script>

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
            <a href="<%= contextPath %>/id.me" id="IdPwdSearch">아이디/비밀번호 찾기</a>
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
           <a href="javascript:kakaoLogin()" id="kakao-login-btn"><img src="resouces/img/kakao_login_medium_wide.png" alt=""></a>
        </div>
    </form>

    <script>
   

    function kakaoLogin() {
        Kakao.Auth.login({
            success: function (response) {
                Kakao.API.request({
                    url: '/v2/user/me',
                    success: function (response) {
						$.ajax({
							url: 'idCheck.me',
							data: {checkId: response.id},
							success: function(result) {
								if(result == "NNNNN") {
									// 카카오로그인
									loginKakaoUser(response.id);
									console.log("카카오 로그인/회원가입용 ajax 통신 실패");
								} else {
									// 카카오 회원가입
									insertKakaoUser(response.id, response.kakao_account.email, response.kakao_account.name, response.properties.nickname, response.kakao_account.birthday);
									console.log("카카오 로그인/회원가입용 ajax 통신 실패");
								}
							},
							error: function() {
								console.log("카카오 로그인/회원가입용 ajax 통신 실패");
							}
						});

                    },
                    fail: function (error) {
                        alert(JSON.stringify(error));
                    },
                })
            },
            fail: function (error) {
                alert(JSON.stringify(error));
            },
        })
    }

	function loginKakaoUser(id) {
		$.ajax({
			url: "kakaoLogin.me",
			type: "post",
			data: {userId: id},
			success: function() {
				location.href="<%= contextPath %>";
				console.log("카카오 로그인/회원가입용 ajax 통신 실패");
			},
			error: function() {
				console.log("kakao user login ajax 실패");
			}
		});
	}

	function insertKakaoUser(id, email, name, nickname) {
		$.ajax({
			url: "kakaoInsert.me",
			type: "post",
			data: {
				userId: id,
				email: email,
				userName: name,
				nickname: nickname
			},
			success: function() {
				alert(nickname + "님, 회원가입이 완료되었습니다.");
				location.href="<%= contextPath %>";
			},
			error: function() {
				console.log("kakao user insert ajax 호출 실패");
			}
		});
	}

    </script>
</body>
</html>