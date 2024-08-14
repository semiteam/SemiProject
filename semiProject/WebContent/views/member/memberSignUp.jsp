<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>회원가입</title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@4.0.1/reset.min.css" />
<link rel="stylesheet" href="resouces/css/sign up.css" />
<!-- <script src="sign.js"></script> -->
<!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css"> -->

<!-- 우편번호 Script-->
<!-- <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> -->
</head>
<body>
	<div class="container">
		<div class="member-container">
			<div class="header">
				<img src="resouces/imgs/KakaoTalk_20240709_164155122.png"
					alt="">
			</div>
			<form action="" id="">
				<div class="user-info">
					<div class="user-info-name">
						<div class="name_text">* 이름</div>
						<input type="text" id="name_input" />
					</div>

					<div class="user-info-day">
						<div id="birthday_text">*생년월일/성별</div>
						<div id="birthdayGender">
							<input type="text" placeholder="생년월일 6자리" id="birthday"
								maxlength="6"> - <input type="text"
								id="gender_firstnumber" style="width: 30px;" maxlength="1">
							<input type="password" id="gender_number" placeholder="******" readonly>
						</div>
					</div>
					<div class="user-info-phone">
						<div>*휴대폰 인증</div>
						<div id="phone">
							<select style="width: 100px;">
								<option value="">SKT</option>
								<option value="">KT</option>
								<option value="">LG</option>
							</select>
						</div>
					</div>

					<div class="user-info-phone_1">
						<input type="text" style="width: 200px;" placeholder="-제외 숫자만 입력"
							id="min_phone">
						<button id="phone_in">인증확인</button>
					</div>
					<div class="user-info-email">
						<div id="email_text">* 이메일</div>

						<input type="text" style="width: 200px;" id="input_email" /> @ <select>
							<option value="">naver.com</option>
							<option value="">gmail.com</option>
						</select>
					</div>
					<div class="user-info-id">
						<div id="id_text">* 아이디</div>

						<input type="text" placeholder="영어 소문자 및 숫자로만 4~16" id="input_id">


					</div>

					<div class="user-info-pw">
						<div id="pwd_text">* 비밀번호</div>
						<input type="password" placeholder="영어,숫자,특수문자 조합 8~16자리" id="input_pwd" />
					</div>
					<div class="user-info-pw-check">
						<div id="pwd_text2">* 비밀번호 확인</div>
						<input type="password" placeholder="영어,숫자,특수문자 조합 8~16자리" id="input_pwd2" />
					</div>

					<form action="" name="form1">
						<div class="user-info-address">
							<div id="address_title">우편번호</div>
							<div id="address_div">
								<input type="text" style="width: 100px;" name="zipcode" class="zip_code_text">
                                <input type="button" value="우편번호 검색" id="zip_code">
							</div>
							<input type="text" name="addr1" readonly id="add">
							<div id="address_text">상세주소</div>
							<input type="text" id="address_text2">
						</div>
					</form>
                </div>
			</form>
		</div>
		<button type="submit" class="min_user_join" id="min_sign" onclick="Validation()">가입하기</button>
	</div>
	<!-- 우편번호 api -->
	<!--
	<script>
      const btn = document.querySelector("#zip_code");
      btn.addEventListener("click",() => {
          new daum.Postcode({
              oncomplete: function(data) {
                  let fullAddr = '';
                  let extraAddr = '';

                  if(data.userSelectedType === 'R'){
                    fullAddr = data.roadAddress;
                  }else{
                    fullAddr = data.jibunAddress;
                  }
                  document.form1.addr1.value = fullAddr;
                  document.form1.zipcode.value = data.zonecode;
              }
          }).open();
      })
      
	</script> -->


	</div>
	</form>

	<script>

        function Validation() {
            //변수에 저장
            var uid = document.getElementById("input_id")
            var pw = document.getElementById("input_pwd")
            var cpw = document.getElementById("input_pwd2")
            var name = document.getElementById("name_input")

            const phone = document.getElementById('min_phone')
            const regPhone = /^01([0|1|6|7|8|9])([0-9]{3,4})([0-9]{4})$/;

            // 정규식
            // id, pw
            var regIdPw = /^[a-zA-Z0-9]{4,12}$/;
            // 이름
            var regName = /^[가-힣a-zA-Z]{2,15}$/;


            const birth = document.getElementById('birthday')
            const regBirth = /^([0-9]{2}(0[1-9]|1[0-2])(0[1-9]|[1,2][0-9]|3[0,1]))$/;

            if(!regBirth.test(birth)) {
                alert('정확한 생년월일 6자리를 입력해주세요');
                return;
            }


            if(!regPhone.test(phone)) {
                alert('정확한 핸드폰번호를 입력해주세요: - 제외');
                return;
            }


            //아이디 확인
            if(uid.value == ""){
                alert("아이디를 입력하세요.")
                uid.focus();
                return false;
            }
            
            //아이디 영어 대소문자 확인
            else if(!regIdPw.test(uid.value)){
                alert("4~12자 영문 대소문자, 숫자만 입력하세요.")
                uid.focus();
                return false;
            }

            //비밀번호 확인
            if(pw.value == ""){
                alert("비밀번호를 입력하세요.")
                pw.focus();
                return false;
            }

            //비밀번호 영어 대소문자 확인
            else if(!regIdPw.test(pw.value)){
                alert("4~12자 영문 대소문자, 숫자만 입력하세요.")
                pw.focus();
                return false;
            }

            //비밀번호와 아이디 비교
            else if(pw.value == uid.value){
                alert("아이디와 동일한 비밀번호를 사용할 수 없습니다.")
                pw.focus();
                return false;
            }


            //비밀번호 확인
            if(cpw.value !== pw.value){
                alert("비밀번호와 동일하지 않습니다.")
                cpw.focus();
                return false;
            }


            //이름 확인 = 한글과 영어만 가능하도록
            if(uname.value == ""){
                alert("이름을 입력하세요.")
                uname.focus();
                return false;
            }

            else if(!regName.test(uname.value)){
                alert("최소 2글자 이상, 한글과 영어만 입력하세요.")
                uname.focus();
                return false;
            }

            // 유효성 문제 없을 시 폼에 submit
            document.joinForm.submit();
        }

        function selectAll(selectAll)  {
        const checkboxes 
            = document.querySelectorAll('input[type="checkbox"]');
        
        checkboxes.forEach((checkbox) => {
            checkbox.checked = selectAll.checked
        })
        }
    
    </script>
</body>
</html>