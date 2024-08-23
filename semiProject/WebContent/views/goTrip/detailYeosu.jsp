<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>여행가조</title>
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

	<!-- jQuery library -->
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>

	<!-- Popper JS -->
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

	<!-- Latest compiled JavaScript -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

	<!-- Swiper -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />

	<!-- Swiper JS -->
	<script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>

	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css">

	<link rel="preconnect" href="https://fonts.googleapis.com">

	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Hahmlet:wght@100..900&display=swap" rel="stylesheet">

	<script defer src="resouces/js/common.js"></script>
	<script defer src="resouces/js/swiper.js"></script>
	<link rel="stylesheet" href="resouces/css/goTripMain.css">
	<link rel="stylesheet" href="resouces/css/common.css">
</head>

<body>
	<%@ include file="../common/basic.jsp" %>
		<div class="wrap">
			<div class="top">
				<div class="logo" onclick="location.href='<%= contextPath %>'">우리 여행가조</div>
				<div class="top_menu">
					<ul>
						<li id="top_menu_1" onclick="location.href='<%= contextPath %>/GoMyPage.me'">My page</li>
						<li id="top_menu_2" onclick="location.href='<%= contextPath %>/GoServiceCenter.sc'">고객센터
						</li>
						<li id="top_menu_3">로그아웃</li>
					</ul>
				</div>
			</div>

			<div class="under">
				<div class="side_menu">
					<div id="side_menu_open_1" onclick="location.href='<%= contextPath %>'">여행 갈래?</div>
					<div id="side_menu_open_2" onclick="location.href='<%= contextPath %>/GoScheduleMain.sd'"
						class="login">계획 짤래?</div>
					<div id="side_menu_open_3" onclick="location.href='<%= contextPath %>/GoPostMain.ps'"
						class="login">리뷰 볼래?</div>
					<% if (loginAdmin !=null) { %>
						<div id="side_menu_open_4" onclick="location.href='<%= contextPath %>/GoAdminMain.ad'">관리자
							메뉴</div>
						<% } %>
							<div id="close_btn" onclick="side_close()"><img
									src="resouces/img/chevron_left_24dp_5F6368.png" alt=""></div>

							<div id="side_menu_close_1" onclick="location.href='<%= contextPath %>'" class="login">
								<img src="resouces/img/airplane_ticket_24dp_5F6368.png" alt="">
								<div class="explanation">여행 갈래?</div>
							</div>
							<div id="side_menu_close_2"
								onclick="location.href='<%= contextPath %>/GoScheduleMain.sd'" class="login">
								<img src="resouces/img/edit_calendar_24dp_5F6368_FILL0_wght400_GRAD0_opsz24.png"
									alt="">
								<div class="explanation">계획 짤래?</div>
							</div>
							<div id="side_menu_close_3" onclick="location.href='<%= contextPath %>/GoPostMain.ps'"
								class="login">
								<img src="resouces/img/dynamic_feed_24dp_5F6368.png" alt="">
								<div class="explanation">리뷰 볼래?</div>
							</div>
							<% if (loginAdmin !=null) { %>
								<div id="side_menu_close_4"
									onclick="location.href='<%= contextPath %>/GoAdminMain.ad'">
									<img src="resouces/img/manage_accounts_24dp_5F6368_FILL0_wght400_GRAD0_opsz24.png"
										alt="">
									<div class="explanation">관리자 메뉴</div>
								</div>
								<% } %>
									<div id="open_btn" onclick="side_open()">
										<img src="resouces/img/chevron_right_24dp_5F6368.png" alt="">
									</div>
				</div>

				<div class="content">
					<div class="content_1">
						집 나가면 고생? 국내 여행은 달라!
					</div>
					<div class="content_2">
						여수 편
					</div>
					<div class="content_3">
						✨ MD 픽 추천 숙소 7선 ✨
					</div>
					<div class="content_4">
						<!-- Swiper -->
						<div class="swiper mySwiper">
							<div class="swiper-wrapper">
								<div class="swiper-slide" type="button">
									<img alt="씨사이드 인 여수 호텔 앤 리조트 사진"
										src="https://yaimg.yanolja.com/v5/2022/10/24/15/1280/6356aac5ee7518.70330553.jpg"
										decoding="async" data-nimg="fill" class="css-sr2c7j"
										style="position: absolute; inset: 0px; box-sizing: border-box; padding: 0px; border: none; margin: auto; display: block; width: 0px; height: 0px; min-width: 100%; max-width: 100%; min-height: 100%; max-height: 100%;">
									<div class="cover">씨사이드 인 여수 호텔 앤 리조트 <br><br>
										151,000원 ~
									</div>
								</div>
								<div class="swiper-slide" type="button">
									<img alt="여수 여수밤바다펜션 사진"
										src="https://yaimg.yanolja.com/v5/2023/04/29/09/1280/644ce2ce47ac39.66967122.jpg"
										decoding="async" data-nimg="fill" class="css-sr2c7j"
										style="position: absolute; inset: 0px; box-sizing: border-box; padding: 0px; border: none; margin: auto; display: block; width: 0px; height: 0px; min-width: 100%; max-width: 100%; min-height: 100%; max-height: 100%;">
									<div class="cover">여수 여수밤바다 펜션 <br><br>
										106,400원 ~
									</div>
								</div>
								<div class="swiper-slide" type="button">
									<img alt="신라스테이 여수 사진"
										src="https://yaimg.yanolja.com/v5/2022/11/11/15/1280/636e65a9212770.26119657.png"
										decoding="async" data-nimg="fill" class="css-sr2c7j"
										style="position: absolute; inset: 0px; box-sizing: border-box; padding: 0px; border: none; margin: auto; display: block; width: 0px; height: 0px; min-width: 100%; max-width: 100%; min-height: 100%; max-height: 100%;">
									<div class="cover">신라스테이 여수 <br><br>
										111,100원 ~
									</div>
								</div>
								<div class="swiper-slide" type="button">
									<img alt="여수 호텔 JCS 사진"
										src="https://yaimg.yanolja.com/v5/2022/09/05/15/1280/63161338e3c7d3.60715254.jpg"
										decoding="async" data-nimg="fill" class="css-sr2c7j"
										style="position: absolute; inset: 0px; box-sizing: border-box; padding: 0px; border: none; margin: auto; display: block; width: 0px; height: 0px; min-width: 100%; max-width: 100%; min-height: 100%; max-height: 100%;">
									<div class="cover">여수 호텔 JCS<br><br>
										169,000원 ~
									</div>
								</div>
								<div class="swiper-slide" type="button">
									<img alt="여수 뮬리아인여수풀빌라 사진"
										src="https://yaimg.yanolja.com/v5/2022/10/14/14/1280/63496b6e981bd0.46597758.jpg"
										decoding="async" data-nimg="fill" class="css-sr2c7j"
										style="position: absolute; inset: 0px; box-sizing: border-box; padding: 0px; border: none; margin: auto; display: block; width: 0px; height: 0px; min-width: 100%; max-width: 100%; min-height: 100%; max-height: 100%;">
									<div class="cover">여수 뮬리아인 여수 풀빌라 <br><br>
										290,000원 ~
									</div>
								</div>
								<div class="swiper-slide" type="button">
									<img alt="여수 르그랑블루리조트 사진"
										src="https://yaimg.yanolja.com/v5/2024/07/04/10/1280/668673bfdf86e2.44872356.jpg"
										decoding="async" data-nimg="fill" class="css-sr2c7j"
										style="position: absolute; inset: 0px; box-sizing: border-box; padding: 0px; border: none; margin: auto; display: block; width: 0px; height: 0px; min-width: 100%; max-width: 100%; min-height: 100%; max-height: 100%;">
									<div class="cover">여수 르그랑 블루 리조트 <br><br>
										205,000원 ~
									</div>
								</div>
								<div class="swiper-slide" type="button">
									<img alt="여수 유니코풀빌라 사진"
										src="https://yaimg.yanolja.com/v5/2024/04/11/10/1280/6617c0607ce371.39452654.jpg"
										decoding="async" data-nimg="fill" class="css-sr2c7j"
										style="position: absolute; inset: 0px; box-sizing: border-box; padding: 0px; border: none; margin: auto; display: block; width: 0px; height: 0px; min-width: 100%; max-width: 100%; min-height: 100%; max-height: 100%;">
									<div class="cover">여수 유니코 풀빌라 <br><br>
										114,900원 ~
									</div>
								</div>
							</div>
						</div>
						<div class="content_5">
							놀면 뭐 타지? ✈️
						</div>
						<div class="content_6">
							<!-- Swiper -->
							<div class="swiper mySwiper">
								<div class="swiper-wrapper">
									<div class="swiper-slide" type="button"
										onclick="location.href='https://carmore.kr/home/rent?v=20240801154352'">
										<img class="w-100 click-no-effect normal-img" data-idx="0"
											src="https://d1y0pslxvt2ep5.cloudfront.net/event/content/content_325_1_20240610054548.png"
											style="width: 50%;">
										<div class="cover">렌트카 조회 하기</div>
									</div>
									<div class="swiper-slide" type="button"
										onclick="location.href='https://flight.naver.com/'">
										<img class="bOaTkZcdqgXxzJCZECTz"
											src="https://media.istockphoto.com/id/1366159026/ko/%EB%B2%A1%ED%84%B0/%EC%83%81%EC%97%85%EC%9A%A9-%ED%95%AD%EA%B3%B5%EC%82%AC-%ED%95%AD%EA%B3%B5%ED%8E%B8-%ED%83%91%EC%8A%B9%EA%B6%8C.jpg?s=612x612&amp;w=0&amp;k=20&amp;c=ZwLd6tZh2K4lR8vRjr7H_XNHkrRssRIR0dhv-AjLY6A="
											alt="상업용 항공사 항공편 탑승권 - 비행기 티켓 stock illustrations">
										<div class="cover">항공편 조회 하기</div>
									</div>
									<div class="swiper-slide" type="button"
										onclick="location.href='<%= contextPath %>/GoMap.gm'">
										<img src="resouces/img/지도.jpg" alt="">
										<div class="cover">내 맘 대로 <br> 소요시간 조회 하기</div>
									</div>
								</div>
							</div>
						</div>
						<div class="content_7">
							포브스 선정 여수에서 가볼만한 곳 TOP 7 👍
						</div>
						<div class="content_8">
							<!-- Swiper -->
							<div class="swiper mySwiper">
								<div class="swiper-wrapper">
									<div class="swiper-slide" type="button">
										<img src="resouces/img/1. 향일암.jpg" alt="">
										<div class="cover">향일암 <br><br> 전남 여수시 돌산읍 향일암로 60 </div>
									</div>
									<div class="swiper-slide" type="button">
										<img src="resouces/img/2. 여수 해상 케이블카.jpg" alt="">
										<div class="cover">여수 해상 케이블카 <br><br> 전남 여수시 돌산읍 돌산로 3600-1 </div>
									</div>
									<div class="swiper-slide" type="button">
										<img src="resouces/img/3. 오동도.jpg" alt="">
										<div class="cover">오동도 <br><br> 전남 여수시 수정동 산1-11</div>
									</div>
									<div class="swiper-slide" type="button">
										<img src="resouces/img/4. 이순신 광장.jpg" alt="">
										<div class="cover">이순신 광장 <br><br> 전남 여수시 선어시장길 6 </div>
									</div>
									<div class="swiper-slide" type="button">
										<img src="resouces/img/5. 아쿠아 플라넷 여수.jpg" alt="">
										<div class="cover">아쿠아 플라넷 여수 <br><br> 전남 여수시 오동도로 61-11 </div>
									</div>
									<div class="swiper-slide" type="button">
										<img src="resouces/img/6. 흥국사.jpg" alt="">
										<div class="cover">흥국사 <br><br> 전남 여수시 흥국사길 160 </div>
									</div>
									<div class="swiper-slide" type="button">
										<img src="resouces/img/7. 낭만 포차로.jpg" alt="">
										<div class="cover">여수 낭만포차길 <br><br> 전남 여수시 하멜로 102 </div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</body>
</html>