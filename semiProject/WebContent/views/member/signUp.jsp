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
						  <input type="text" id="name_input" class="big" name="mName"/>
						</div>
						
						<div class="user-info-day">
							<div id="birthday_text" class="bold">* 생년월일/성별</div>
							<div id="birthdayGender">
								<input type="text" placeholder="생년월일 6자리" id="birthday" maxlength="6" name="mBirthday1">
		                        <div> _ </div>
		                        <input type="text" id="gender_firstnumber" style="width: 30px;" maxlength="1" name="mBirthday2">
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
		                       	<input type="text" placeholder="-제외 숫자만 입력" id="min_phone" name="mPhone">
							    <button id="phone_in">인증확인</button>
							</div>
						</div>
	
						<div class="user-info-email">
							<div id="email_text" class="bold">* 이메일</div>
							<input type="text" style="width: 225px;" id="input_email" name="mMail1"/> @ <select>
								<option name="mMail2" value="gmail.com">gmail.com</option>
								<option name="mMail2" value="naver.com">naver.com</option>
								<option name="mMail2" value="daum.net">daum.net</option>
							</select>
						</div>
	
						<div class="user-info-id">
							<div id="id_text" class="bold">* 아이디</div>
							<input type="text" placeholder="영어 소문자 및 숫자로만 4~16" id="input_id" class="big" name="mId">
						</div>

						<div class="user-info-nn">
							<div id="id_text">닉네임</div>
							<input type="text" placeholder="미입력 시 아이디와 동일하게 설정, 한글 최대 10자" id="input_nn" class="big" name="mNn">
						</div>
	
						<div class="user-info-pw">
							<div id="pwd_text" class="bold">* 비밀번호</div>
							<input type="password" placeholder="영어,숫자,특수문자 조합 8~16자리" id="input_pwd" class="big" name="mPwd" />
						</div>
	
						<div class="user-info-pw-check">
							<div id="pwd_text2" class="bold">* 비밀번호 확인</div>
							<input type="password" placeholder="영어,숫자,특수문자 조합 8~16자리" id="input_pwd2" class="big" />
						</div>
	
						<form action="" name="form1">
							<div class="user-info-address">
								<div id="address_title" class="bold">* 우편번호</div>
								<div id="address_div">
									<input type="text" style="width: 300px;" name="zipcode" class="zip_code_text" name="mAddress1">
					                <input type="button" style="width: 145px; margin: 0 0 5px 5px;" value="우편번호 검색" id="zip_code" class="big">
					                <input type="text" name="addr1" readonly id="add" class="big" name="mAddress2">
					                <div id="address_text" style="margin: 5px 0;">상세주소</div>
					                <input type="text" id="address_text2" class="big" name="mAddress3">
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
	      
		</script>
	
		<!--
		<script>
	        const regPhone = /^010([0-9]{3,4})([0-9]{4})$/;
	        const regIdPw = /^[a-zA-Z0-9]{4,12}$/;
	        const regName = /^[가-힣a-zA-Z]{2,15}$/;
	        const regBirth = /^([0-9]{2}(0[1-9]|1[0-2])(0[1-9]|[1,2][0-9]|3[0,1]))$/;
	
	        $('#input_id').on('keyup', function() {
	            if (uid.value === "") {
	                alert("아이디를 입력하세요.");
	                uid.focus();
	                return false;
	            } else if (!regIdPw.test(uid.value)) {
	                alert("4~12자 영문 대소문자, 숫자만 입력하세요.");
	                uid.focus();
	                return false;
	            }
	        });
	
	        $('#input_pwd').on('keyup', function() {
	            if (pw.value === "") {
	                alert("비밀번호를 입력하세요.");
	                pw.focus();
	                return false;
	            } else if (!regIdPw.test(pw.value)) {
	                alert("4~12자 영문 대소문자, 숫자만 입력하세요.");
	                pw.focus();
	                return false;
	            } else if (pw.value === uid.value) {
	                alert("아이디와 동일한 비밀번호를 사용할 수 없습니다.");
	                pw.focus();
	                return false;
	            }
	        });
	
	        $('#input_pwd2').on('keyup', function() {
	            if (cpw.value !== pw.value) {
	                alert("비밀번호가 일치하지 않습니다.");
	                cpw.focus();
	                return false;
	            }
	        });
	
	        $('#name_input').on('keyup', function() {
	            if (name.value === "") {
	                alert("이름을 입력하세요.");
	                name.focus();
	                return false;
	            } else if (!regName.test(name.value)) {
	                alert("최소 2글자 이상, 한글과 영어만 입력하세요.");
	                name.focus();
	                return false;
	            }
	        });
	
	        $('#min_phone').on('keyup', function() {
	            if (!regPhone.test(phone.value)) {
	                alert('정확한 핸드폰번호를 입력해주세요: - 제외');
	                phone.focus();
	                return false;
	            }
	        });
	
	        
	        $('#birthday').on('keyup', function() {
	            if (!regBirth.test($(this).value)) {
	                birth.focus();
	                return false;
	            }
	        });
	
	        $('#gender_firstnumber').on('keyup', function() {
	
	        });
	
	        function selectAll(selectAll)  {
	            const checkboxes 
	                = document.querySelectorAll('input[type="checkbox"]');
	            
	            checkboxes.forEach((checkbox) => {
	                checkbox.checked = selectAll.checked
	            })
	        }
	    
	    </script>
	    -->
	</body>
</html>