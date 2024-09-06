<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
	<title>여행가조</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@4.0.1/reset.min.css" />
	<link rel="stylesheet" href="resouces/css/sign up.css" />
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	
	
	<!-- 우편번호 Script-->
	<!-- <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> -->
	
	<style>
        .error-message {
            color: red;
            font-size: 0.9em;
            margin-top: 5px;
        }
        .input-error {
            border-color: red;
        }
    </style>
	
	
	
	</head>
	<body>
		<%@ include file="../common/basic.jsp" %>
		<div class="container">
			<div class="member-container">
				<div class="header">
					<img style="width: 280px; height: 250px;" src="resouces/img/로고.png" alt="">
				</div>
	
				<form action="<%= contextPath %>/signUp.me" method="post" id="signup-form" onsubmit="return validateForm()">
					<div class="user-info">
						<div class="user-info-name">
						  <div class="bold">* 이름</div>
						  <input type="text" id="name" class="big" name="mName" required/>
						  <div id="name-error" class="error-message"></div>
						  
						</div>
						
						<div class="user-info-day">
							<div id="birthday_text" class="bold">* 주민등록번호 </div>
							<div id="birthdayGender">
								<input type="text" id="birthday" maxlength="6" name="mBirthday1" required>
		                        <div> _ </div>
		                        <input type="text" id="gender_firstnumber" style="width: 30px;" maxlength="1" name="mBirthday2" required>
								<input type="password" placeholder="* * * * * *" readonly id="gender_number">
							</div>
							 <div id="birthday-error" class="error-message"></div>
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
								<div id="phone-error" class="error-message"></div>
							</div>
						</div>

					<div class="user-info-email">
						<div id="email_text" class="bold">* 이메일</div>
						<input type="text" style="width: 225px;" id="input_email"
							name="mMail1" required /> @ <select name="mMail2">
							<option value="gmail.com">gmail.com</option>
							<option value="naver.com">naver.com</option>
							<option value="daum.net">daum.net</option>
						</select>
						<div id="email-error" class="error-message"></div>
						<!-- 오류 메시지 표시용 -->
					</div>

					<div class="user-info-id">
							<div id="id_text" class="bold">* 아이디</div>
							<div id="id_div">
								<input type="text" style="width: 300px;" placeholder="영어 소문자 및 숫자 조합으로 4~16자리" id="input_id" name="mId" required>
								<div id="id-error" class="error-message"></div>
								<input type="button" style="width: 145px; margin: 0 0 5px 5px;" value="중복 확인" id="id_check">
							</div>
						</div>

						<div class="user-info-nn">
							<div id="id_text">닉네임</div>
							<input type="text" placeholder="미입력 시 아이디와 동일하게 설정, 한글은 2~10자리" id="input_nn" class="big" name="mNn">
							<div id="nickname-error" class="error-message"></div>
						</div>
	
						<div class="user-info-pw">
							<div id="pwd_text" class="bold">* 비밀번호</div>
							<input type="password" placeholder="영어 대소문자 및 숫자, 특수문자 조합으로 8~16자리" id="input_pwd" class="big" name="mPwd" required/>
							<div id="password-error" class="error-message"></div>
						</div>
	
						<div class="user-info-pw-check">
							<div id="pwd_text2" class="bold">* 비밀번호 확인</div>
							<input type="password" placeholder="위 비밀번호와 일치하게 입력" id="input_pwd2" class="big" required />
							 <div id="password-confirm-error" class="error-message"></div>
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
					</div>
				</form>
	
	            <br><br><br>
			</div>
		</div>
		<!-- 우편번호 api -->
		
		 <script>
		 <!--
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
			-->
				document.addEventListener("DOMContentLoaded", function() {
				    // 각 입력 필드에 실시간 유효성 검사 추가
				    document.getElementById('name').addEventListener('input', validateName);
				    document.getElementById('input_id').addEventListener('input', validateId);
				    document.getElementById('input_nn').addEventListener('input', validateNickname);
				    document.getElementById('input_pwd').addEventListener('input', validatePassword);
				    document.getElementById('input_pwd2').addEventListener('input', validatePasswordConfirmation);
				    document.getElementById('birthday').addEventListener('input', validateBirthDateAndGender);
				    document.getElementById('gender_firstnumber').addEventListener('input', validateBirthDateAndGender);
				    document.getElementById('min_phone').addEventListener('input', validatePhone);
				    document.getElementById('input_email').addEventListener('input', validateEmail);	
		


				    function validateName() {
				        const nameInput = document.getElementById('name').value.trim();
				        const nameError = document.getElementById('name-error');
				        const koreanPattern = /^[가-힣]+$/;
				        const englishPattern = /^[a-zA-Z\s]+$/;

				        nameError.textContent = ''; // 기존 오류 메시지 초기화

				        // 길이 제한 (한글: 최대 33자, 영어: 최대 100자)
				        if (koreanPattern.test(nameInput)) {
				            if (nameInput.length > 33) {
				                nameError.textContent = '이름은 한글로 최대 33자까지 입력 가능합니다.';
				                return false;
				            }
				        } else if (englishPattern.test(nameInput)) {
				            if (nameInput.length > 100) {
				                nameError.textContent = '이름은 영어로 최대 100자까지 입력 가능합니다.';
				                return false;
				            }
				        } else {
				            nameError.textContent = '이름은 한글 또는 영어로만 입력 가능합니다.';
				            return false;
				        }

				        return true;
				    }


			 function validateId() {
			        const idInput = document.getElementById('input_id').value;
			        const idError = document.getElementById('id-error');
			        const idPattern = /^(?=.*[a-z])(?=.*\d)[a-z\d]{4,16}$/;

			        idError.textContent = ''; // 기존 오류 메시지 초기화

			        if (!idPattern.test(idInput) || /^\d+$/.test(idInput)) {
			            idError.textContent = '아이디는 영어 소문자 및 숫자 조합으로 4~16자리, 숫자만으로는 불가합니다.';
			        }

			        return idError.textContent === '';
			    }

			 function validateNickname() {
			        const nnInput = document.getElementById('input_nn').value;
			        const nnError = document.getElementById('nickname-error');
			        const engNumPattern = /^(?=.*[a-z])(?=.*\d)[a-z\d]{4,16}$/;
			        const korPattern = /^[가-힣]{2,10}$/;

			        nnError.textContent = ''; // 기존 오류 메시지 초기화

			        if (nnInput !== '' && !engNumPattern.test(nnInput) && !korPattern.test(nnInput)) {
			            nnError.textContent = '닉네임은 영어 소문자 및 숫자 조합으로 4~16자리 또는 한글로 2~10자여야 합니다.';
			        }

			        return nnError.textContent === '';
			    }

			 function validatePassword() {
			        const pwdInput = document.getElementById('input_pwd').value;
			        const pwdError = document.getElementById('password-error');
			        const pwdPattern = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_])[A-Za-z\d\W_]{8,16}$/;

			        pwdError.textContent = ''; // 기존 오류 메시지 초기화

			        if (!pwdPattern.test(pwdInput)) {
			            pwdError.textContent = '비밀번호는 영어 대소문자, 숫자, 특수문자를 포함한 8~16자리여야 합니다.';
			        }

			        return pwdError.textContent === '';
			    }

			 function validatePasswordConfirmation() {
			        const pwdInput = document.getElementById('input_pwd').value;
			        const pwdConfirmInput = document.getElementById('input_pwd2').value;
			        const pwdConfirmError = document.getElementById('password-confirm-error');

			        pwdConfirmError.textContent = ''; // 기존 오류 메시지 초기화

			        if (pwdInput !== pwdConfirmInput) {
			            pwdConfirmError.textContent = '비밀번호 확인이 비밀번호와 일치하지 않습니다.';
			        }

			        return pwdConfirmError.textContent === '';
			    }

			 function validateBirthDateAndGender() {
			        const birthDate = document.getElementById('birthday').value;
			        const genderFirstNumber = document.getElementById('gender_firstnumber').value;
			        const birthError = document.getElementById('birthday-error');
			        const birthPattern = /^(0[1-9]|[1-9]\d)(0[1-9]|1[0-2])(0[1-9]|[12]\d|3[01])$/;

			        birthError.textContent = ''; // 기존 오류 메시지 초기화

			        if (!birthPattern.test(birthDate)) {
			            birthError.textContent = '생년월일이 올바르지 않습니다.';
			            return false;
			        }

			        const year = parseInt(birthDate.substring(0, 2), 10) + (parseInt(genderFirstNumber, 10) <= 2 ? 1900 : 2000);

			        if (!isValidDate(year, parseInt(birthDate.substring(2, 4), 10), parseInt(birthDate.substring(4, 6), 10))) {
			            birthError.textContent = '생년월일이 올바르지 않습니다.';
			            return false;
			        }

			        if (!validateGender(year, genderFirstNumber)) {
			            birthError.textContent = '성별 코드가 올바르지 않습니다.';
			            return false;
			        }

			        return true;
			    }



			 function validatePhone() {
			        const phoneInput = document.getElementById('min_phone').value;
			        const phoneError = document.getElementById('phone-error');
			        const phonePattern = /^(010)\d{8}$/;

			        phoneError.textContent = ''; // 기존 오류 메시지 초기화

			        if (!phonePattern.test(phoneInput)) {
			            phoneError.textContent = '휴대폰 번호가 올바르지 않습니다.';
			        }

			        return phoneError.textContent === '';
			    }
			 
			 function isValidDate(year, month, day) {
			        const date = new Date(year, month - 1, day);
			        return date.getFullYear() === year && date.getMonth() + 1 === month && date.getDate() === day;
			    }
			 
			 function validateGender(year, genderCode) {
			        const isBefore2000 = year < 2000;
			        const genderPattern = isBefore2000 ? /^[1256]$/ : /^[3478]$/;

			        return genderPattern.test(genderCode);
			    }
			 
			 function validateForm() {
			        return validateName() && validateId() && validateNickname() &&
			            validatePassword() && validatePasswordConfirmation() &&
			            validateBirthDateAndGender() && validatePhone();
			    }
			});
				function validateEmail() {
			        const emailUserInput = document.getElementById('input_email').value.trim();
			        const emailError = document.getElementById('email-error');
			        const domainInput = document.querySelector('[name="mMail2"]').value;
			        const email = `${emailUserInput}@${domainInput}`;
			        const koreanPattern = /[가-힣]/; // 한글이 포함되어 있는지 확인하는 정규식

			        emailError.textContent = ''; // 기존 오류 메시지 초기화

			        // 이메일에 한글이 포함되어 있는지 확인
			        if (koreanPattern.test(emailUserInput)) {
			            emailError.textContent = '이메일에 한글을 포함할 수 없습니다.';
			            return false;
			        }

			        // 이메일 주소의 유효성 검사
			        const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/; // 기본 이메일 패턴
			        if (!emailPattern.test(email)) {
			            emailError.textContent = '유효한 이메일 주소를 입력하세요.';
			            return false;
			        }

			        // 이메일 주소의 길이 검사
			        if (new TextEncoder().encode(email).length > 300) {
			            emailError.textContent = '이메일은 최대 300바이트까지 입력 가능합니다.';
			            return false;
			        }

			        return true;
			    }
				
				document.addEventListener("DOMContentLoaded", function() {
				    const idCheckButton = document.getElementById('id_check');
				    const idInput = document.getElementById('input_id');
				    const idError = document.getElementById('id-error');

				    idCheckButton.addEventListener('click', function() {
				        const mId = idInput.value.trim();

				        if (mId === "") {
				            idError.textContent = "아이디를 입력하세요.";
				            return;
				        }

				        $.ajax({
				            url: '<%=contextPath%>/checkId.me', // 서블릿 경로
				            type: 'GET',
				            data: { mId: mId },
				            success: function(response) {
				                if (response === "NNNNN") {
				                    idError.textContent = "이미 존재하는 아이디입니다.";
				                    idError.style.color = "red";
				                } else if (response === "NNNNY") {
				                    idError.textContent = "사용 가능한 아이디입니다.";
				                    idError.style.color = "green";
				                }
				            },
				            error: function() {
				                idError.textContent = "서버 요청 중 오류가 발생했습니다.";
				                idError.style.color = "red";
				            }
				        });
				    });
				});
				
		</script> 
		
		
	</body>
</html>