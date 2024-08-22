<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
	<title>여행가조</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@4.0.1/reset.min.css" />
	<link rel="stylesheet" href="resouces/css/sign up.css" />
	
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css">
	
	<!-- 우편번호 Script-->
	<!-- <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> -->
	</head>
	<body>
		<%@ include file="../common/basic.jsp" %>
		<div class="container">
			<div class="member-container">
				<div class="header">
					<img style="width: 280px; height: 250px;" src="resouces/img/로고.png" alt="">
				</div>
	
				<form action="<%= contextPath %>/signUp.me" method="post">
					<div class="user-info">
						<div class="user-info-name">
						  <div class="name_text bold">* 이름</div>
						  <input type="text" id="name_input" class="big" name="mName" required/>
						</div>
						
						<div class="user-info-day">
							<div id="birthday_text" class="bold">* 주민등록번호 </div>
							<div id="birthdayGender">
								<input type="text" id="birthday" maxlength="6" name="mBirthday1" required>
		                        <div> _ </div>
		                        <input type="text" id="gender_firstnumber" style="width: 30px;" maxlength="1" name="mBirthday2" required>
								<input type="password" placeholder="* * * * * *" readonly id="gender_number">
							</div>
						</div>
						
						<div class="user-info-phone">
							<div class="bold">* 휴대폰 인증</div>
							<div id="phone">
								<select style="width: 100px;">
									<option>SKT</option>
									<option>KT</option>
									<option>U+</option>
									<option>알뜰폰</option>
								</select>
		                       	<input type="text" placeholder="- 제외 숫자만 입력" id="min_phone" name="mPhone" required>
							    <input type="button" id="phone_in" value="인증">
							</div>
						</div>
	
						<div class="user-info-email">
							<div id="email_text" class="bold">* 이메일</div>
							<input type="text" style="width: 225px;" id="input_email" name="mMail1" required/> @ <select>
								<option name="mMail2" value="gmail.com">gmail.com</option>
								<option name="mMail2" value="naver.com">naver.com</option>
								<option name="mMail2" value="daum.net">daum.net</option>
							</select>
						</div>
	
						<div class="user-info-id">
							<div id="id_text" class="bold">* 아이디</div>
							<div id="id_div">
								<input type="text" style="width: 300px;" placeholder="영어 소문자 및 숫자 조합으로 4~16자리" id="input_id" name="mId" required>
								<input type="button" style="width: 145px; margin: 0 0 5px 5px;" value="중복 확인" id="id_check">
							</div>
						</div>

						<div class="user-info-nn">
							<div id="id_text">닉네임</div>
							<input type="text" placeholder="미입력 시 아이디와 동일하게 설정, 한글은 2~10자리" id="input_nn" class="big" name="mNn">
						</div>
	
						<div class="user-info-pw">
							<div id="pwd_text" class="bold">* 비밀번호</div>
							<input type="password" placeholder="영어 대소문자 및 숫자, 특수문자 조합으로 8~16자리" id="input_pwd" class="big" name="mPwd" required/>
						</div>
	
						<div class="user-info-pw-check">
							<div id="pwd_text2" class="bold">* 비밀번호 확인</div>
							<input type="password" placeholder="위 비밀번호와 일치하게 입력" id="input_pwd2" class="big" required />
						</div>
	
						<form action="" name="form1">
							<div class="user-info-address">
								<div id="address_title" class="bold">* 우편번호</div>
								<div id="address_div">
									<input type="text" style="width: 300px;" name="zipcode" class="zip_code_text" name="mAddress1" required>
					                <input type="button" style="width: 145px; margin: 0 0 5px 5px;" value="우편번호 검색" id="zip_code" class="big">
					                <input type="text" name="addr1" readonly id="add" class="big" name="mAddress2" required>
					                <div id="address_text" style="margin: 5px 0;">상세주소</div>
					                <input type="text" id="address_text2" class="big" name="mAddress3" required>
								</div>
							</div>
						</form>
	
	          			<button type="submit" class="min_user_join" id="min_sign">가입하기</button>
				</form>
	
	            <br><br><br>
			</div>
		</div>
		<!-- 우편번호 api -->
		
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
			
			document.querySelector('form').addEventListener('submit', function(e) {
				if (!validateForm()) {
					e.preventDefault();
				}
			});

			function validateForm() {
				return validateName() && validateId() && validateNickname() &&
					validatePassword() && validatePasswordConfirmation() &&
					validateBirthDateAndGender() && validatePhone() &&
					validateEmail();
			}

			function validateName() {
				const nameInput = document.getElementById('name_input').value.trim();
				const koreanPattern = /^[가-힣]+$/;
				const englishPattern = /^[a-zA-Z\s]+$/;
				
				if (koreanPattern.test(nameInput)) {
					if (nameInput.length > 33) {
						alert('이름은 한글로 최대 33자까지 입력 가능합니다.');
						return false;
					}
				} else if (englishPattern.test(nameInput)) {
					if (nameInput.length > 100) {
						alert('이름은 영어로 최대 100자까지 입력 가능합니다.');
						return false;
					}
				} else {
					alert('이름은 한글 또는 영어로만 입력 가능합니다.');
					return false;
				}
				
				return true;
			}


			function validateId() {
				const idInput = document.getElementById('input_id').value;
				const idPattern = /^(?=.*[a-z])(?=.*\d)[a-z\d]{4,16}$/;

				if (!idPattern.test(idInput) || /^\d+$/.test(idInput)) {
					alert('아이디는 영어 소문자 및 숫자 조합으로 4~16자리, 숫자만으로는 불가합니다.');
					return false;
				}
				return true;
			}

			function validateNickname() {
				const nnInput = document.getElementById('input_nn').value;
				const engNumPattern = /^(?=.*[a-z])(?=.*\d)[a-z\d]{4,16}$/;
				const korPattern = /^[가-힣]{2,10}$/;

				if (nnInput === '') {
					return true;
				}

				if (!engNumPattern.test(nnInput) && !korPattern.test(nnInput)) {
					alert('닉네임은 영어 소문자 및 숫자 조합으로 4~16자리 또는 한글로 2~10자여야 합니다.');
					return false;
				}
				return true;
			}

			function validatePassword() {
				const pwdInput = document.getElementById('input_pwd').value;
				const pwdPattern = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_])[A-Za-z\d\W_]{8,16}$/;

				if (!pwdPattern.test(pwdInput)) {
					alert('비밀번호는 영어 대소문자, 숫자, 특수문자를 포함한 8~16자리여야 합니다.');
					return false;
				}
				return true;
			}

			function validatePasswordConfirmation() {
				const pwdInput = document.getElementById('input_pwd').value;
				const pwdConfirmInput = document.getElementById('input_pwd2').value;

				if (pwdInput !== pwdConfirmInput) {
					alert('비밀번호 확인이 비밀번호와 일치하지 않습니다.');
					return false;
				}
				return true;
			}

			function validateBirthDateAndGender() {
				const birthDate = document.getElementById('birthday').value;
				const genderFirstNumber = document.getElementById('gender_firstnumber').value;
				const birthPattern = /^(0[1-9]|[1-9]\d)(0[1-9]|1[0-2])(0[1-9]|[12]\d|3[01])$/;

				if (!birthPattern.test(birthDate)) {
					alert('생년월일이 올바르지 않습니다.');
					return false;
				}

				const year = parseInt(birthDate.substring(0, 2), 10) + (parseInt(genderFirstNumber, 10) <= 2 ? 1900 : 2000);

				if (!isValidDate(year, parseInt(birthDate.substring(2, 4), 10), parseInt(birthDate.substring(4, 6), 10))) {
					alert('생년월일이 올바르지 않습니다.');
					return false;
				}

				if (!validateGender(year, genderFirstNumber)) {
					alert('성별 코드가 올바르지 않습니다.');
					return false;
				}

				return true;
			}

			function validateGender(year, genderCode) {
				const isBefore2000 = year < 2000;
				const genderPattern = isBefore2000 ? /^[1256]$/ : /^[3478]$/;

				return genderPattern.test(genderCode);
			}

			function isValidDate(year, month, day) {
				const date = new Date(year, month - 1, day);
				return date.getFullYear() === year && date.getMonth() + 1 === month && date.getDate() === day;
			}

			function validatePhone() {
				const phoneInput = document.getElementById('min_phone').value;
				const phonePattern = /^(02|031|032|033|041|042|043|044|051|052|053|054|055|061|062|063|064|010)\d{8,9}$/;

				if (!phonePattern.test(phoneInput)) {
					alert('휴대폰 번호가 올바르지 않습니다.');
					return false;
				}
				return true;
			}

			function validateEmail() {
				const emailUserInput = document.getElementById('input_email').value.trim();
				const domainInput = document.querySelector('[name="mMail2"]').value;
				const email = `${emailUserInput}@${domainInput}`;
				
				if (new TextEncoder().encode(email).length > 300 || domainInput.includes('.com')) {
					alert('이메일은 최대 300바이트까지 입력 가능하며, @gmail.com 등 도메인은 입력 불가합니다.');
					return false;
				}
				return true;
			}
		</script>
	</body>
</html>