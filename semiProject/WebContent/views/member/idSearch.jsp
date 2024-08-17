<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="resouces/css/idSearch.css">
</head>
<body>
    <div class="container">
        <div class="member-container">
            <div class="header">
                <img src="resouces/img/로고.png" alt="">
            </div>
            <!-- <hr> -->
            
            <form action=""  method="" class="popupFind2">
                <ul class="find2Tab">
                    <li class="id">
                        <a href="views/member/idSearch.jsp" class="on">아이디 찾기</a>
                    </li>
                    <li class="password">
                        <a href="views/member/pwdSearch.jsp" class="pwd" finda2sopt="FindPwd">비밀번호 찾기</a>
                    </li>
                </ul>

                <div class="searchForm">
                    <input type="checkbox" class="check_email" id="check_email"  style='zoom:2.0;' > <span id="check_email_text" >가입한 이메일로 찾기</span>  <br>

                    <input type="email" class="input_email" placeholder="E-mail">  <br>

                    <input type="checkbox" class="check_phone" style='zoom:2.0;'> <span id="check_phone_text">가입한 휴대폰으로 찾기 </span>

                </div>
            
                <button id="btn_idSearch">아이디 찾기</button>
            </form>
        </div>
    </div>
</body>
</html>