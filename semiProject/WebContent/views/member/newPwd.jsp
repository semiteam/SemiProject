<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>여행가조</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link rel="stylesheet" href="resouces/css/newPwd.css">
    
    
</head>
<body>
    <%@ include file="../common/basic.jsp" %>
   <div class="container">
       <form action="<%= contextPath %>/updatePwd.me" method="post" class="member-container" onsubmit="return validatePassword()">
            <div class="header">
                <img src="resouces/img/로고.png" alt="">
            </div>
            <hr>
		  <input type="hidden" name="userId" value="<%= request.getAttribute("userId") %>">
	            <div class="newPwd" style="margin-left: 150px;">
				    <div id="newPwd_text">새 비밀번호</div>
				    <input type="password" placeholder="영어,숫자,특수문자 조합 8~16자리" maxlength="16" id="newPwd_input" name="newPwd" style="width: 70%;"> 
				    <div id="caps-lock-warning" style="color:orange; display:none;">Caps Lock이 켜져 있습니다.</div> <!-- Caps Lock 경고 -->
				    <br>
				    <div id="newPwd_text2">새 비밀번호 확인</div>
				    <input type="password" placeholder="영어,숫자,특수문자 조합 8~16자리" maxlength="16" id="newPwd_input2" name="newPwdConfirm" style="width: 70%;">
				    <div id="password-match-warning" style="color:red; display:none;">비밀번호가 일치하지 않습니다.</div> <!-- 비밀번호 불일치 경고 -->
				</div>
				
				<button id="btn_Pwd" type="submit" style="margin-left: 150px;">비밀번호 변경하기</button>
        </form>
    </div>

    <script>
        // Caps Lock 경고 표시
        document.getElementById('newPwd_input').addEventListener('keydown', function (event) {
            if (event.getModifierState('CapsLock')) {
                document.getElementById('caps-lock-warning').style.display = 'block';
            } else {
                document.getElementById('caps-lock-warning').style.display = 'none';
            }
        });

        // 비밀번호 유효성 검사 및 일치 여부 확인
        function validatePassword() {
            const password = document.getElementById('newPwd_input').value;
            const confirmPassword = document.getElementById('newPwd_input2').value;
            const passwordMatchWarning = document.getElementById('password-match-warning');

            // 비밀번호 유효성 검사 (영어, 숫자, 특수문자 포함 8~16자)
            const passwordPattern = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[!@#$%^&*])[A-Za-z\d!@#$%^&*]{8,16}$/;
            
            if (!passwordPattern.test(password)) {
                alert("비밀번호는 영어, 숫자, 특수문자를 포함한 8~16자리여야 합니다.");
                return false;
            }

            // 비밀번호 일치 여부 검사
            if (password !== confirmPassword) {
                passwordMatchWarning.style.display = 'block';
                return false;
            } else {
                passwordMatchWarning.style.display = 'none';
            }

            return true; // 유효성 검사를 통과하면 제출
        }
    </script>
</body>
</html>