<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="resouces/css/newPwd.css">
    
</head>
<body>
    <div class="container">
        <form action="" method="" class="member-container">
            <div class="header">
                <img src="resouces/img/로고.png" alt="">
            </div>
            <hr>
            </form>

            <div class="newPwd">
                <div id="newPwd_text">새 비밀번호</div> 
                <input type="password" placeholder="영어,숫자,특수문자 조합 8~16자리" maxlength="16" id="newPwd_input"> <br>
                <div id="newPwd_text2">새 비밀번호 확인</div>
                <input type="password" placeholder="영어,숫자,특수문자 조합 8~16자리" maxlength="16" id="newPwd_input2">
            </div>

            <button id="btn_Pwd">비밀번호 변경하기</button>
        </div>
    </div>
</body>
</html>