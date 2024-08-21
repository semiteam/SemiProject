<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
							서울 편
						</div>
						<div class="content_3">
							✨ MD 픽 추천 숙소 7선 ✨
						</div>
						<div class="content_4">
							<!-- Swiper -->
							<div class="swiper mySwiper">
								<div class="swiper-wrapper">
									<div class="swiper-slide" type="button">
										<img alt="그랜드 하얏트 서울 사진"
											src="https://yaimg.yanolja.com/v5/2023/07/27/10/1280/64c2449a007c23.39324427.jpg"
											decoding="async" data-nimg="fill" class="css-sr2c7j"
											style="position: absolute; inset: 0px; box-sizing: border-box; padding: 0px; border: none; margin: auto; display: block; width: 0px; height: 0px; min-width: 100%; max-width: 100%; min-height: 100%; max-height: 100%;">
										<div class="cover">그랜드 하얏트 서울 <br><br>
											540,500원 ~
										</div>
									</div>
									<div class="swiper-slide" type="button">
										<img alt="글래드 강남 코엑스센터 사진"
											src="https://yaimg.yanolja.com/v5/2022/10/26/14/1280/6359424d363cb1.59078840.jpg"
											decoding="async" data-nimg="fill" class="css-sr2c7j"
											style="position: absolute; inset: 0px; box-sizing: border-box; padding: 0px; border: none; margin: auto; display: block; width: 0px; height: 0px; min-width: 100%; max-width: 100%; min-height: 100%; max-height: 100%;">
										<div class="cover">글래드 강남 코엑스 센터 <br><br>
											220,000원 ~
										</div>
									</div>
									<div class="swiper-slide" type="button">
										<img alt="노보텔 앰배서더 서울 용산 사진"
											src="https://yaimg.yanolja.com/v5/2022/08/12/09/1280/62f61a69ce4423.63495204.jpg"
											decoding="async" data-nimg="fill" class="css-sr2c7j"
											style="position: absolute; inset: 0px; box-sizing: border-box; padding: 0px; border: none; margin: auto; display: block; width: 0px; height: 0px; min-width: 100%; max-width: 100%; min-height: 100%; max-height: 100%;">
										<div class="cover">노보텔 앰배서더 서울 용산 <br><br>
											256,400원 ~
										</div>
									</div>
									<div class="swiper-slide" type="button">
										<img alt="몬드리안 서울 이태원(Mondrian Seoul Itaewon) 사진"
											src="https://yaimg.yanolja.com/v5/2022/10/14/14/1280/63496dbcbcff57.11446453.jpg"
											decoding="async" data-nimg="fill" class="css-sr2c7j"
											style="position: absolute; inset: 0px; box-sizing: border-box; padding: 0px; border: none; margin: auto; display: block; width: 0px; height: 0px; min-width: 100%; max-width: 100%; min-height: 100%; max-height: 100%;">
										<div class="cover">몬드리안 서울 이태원<br><br>
											253,000원 ~
										</div>
									</div>
									<div class="swiper-slide" type="button">
										<img alt="그랜드 워커힐 서울 사진"
											src="https://yaimg.yanolja.com/v5/2022/08/29/14/1280/630ccbe093cf17.70416499.jpg"
											decoding="async" data-nimg="fill" class="css-sr2c7j"
											style="position: absolute; inset: 0px; box-sizing: border-box; padding: 0px; border: none; margin: auto; display: block; width: 0px; height: 0px; min-width: 100%; max-width: 100%; min-height: 100%; max-height: 100%;">
										<div class="cover">그랜드 워커힐 서울 <br><br>
											274,670원 ~
										</div>
									</div>
									<div class="swiper-slide" type="button">
										<img alt="시그니엘 서울 사진"
											src="https://yaimg.yanolja.com/v5/2022/09/20/16/1280/6329e9bf0337b1.36525432.jpg"
											decoding="async" data-nimg="fill" class="css-sr2c7j"
											style="position: absolute; inset: 0px; box-sizing: border-box; padding: 0px; border: none; margin: auto; display: block; width: 0px; height: 0px; min-width: 100%; max-width: 100%; min-height: 100%; max-height: 100%;">
										<div class="cover">시그니엘 서울 <br><br>
											665,500원 ~
										</div>
									</div>
									<div class="swiper-slide" type="button">
										<img alt="파라스파라 서울 사진"
											src="https://yaimg.yanolja.com/v5/2024/05/02/15/1280/6633b4c91bce86.81167565.jpg"
											decoding="async" data-nimg="fill" class="css-sr2c7j"
											style="position: absolute; inset: 0px; box-sizing: border-box; padding: 0px; border: none; margin: auto; display: block; width: 0px; height: 0px; min-width: 100%; max-width: 100%; min-height: 100%; max-height: 100%;">
										<div class="cover">파라스파라 서울 <br><br>
											390,000원 ~
										</div>
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
										onclick="location.href='https://www.google.com/maps/?hl=ko'">
										<img src="resouces/img/지도.jpg" alt="">
										<div class="cover">내 맘 대로 <br> 소요시간 조회 하기</div>
									</div>
								</div>
							</div>
						</div>
						<div class="content_7">
							포브스 선정 서울에서 가볼만한 곳 TOP 7 👍
						</div>
						<div class="content_8">
							<!-- Swiper -->
							<div class="swiper mySwiper">
								<div class="swiper-wrapper">
									<div class="swiper-slide" type="button">
										<img src="resouces/img/1. 경복궁.jpg" alt="">
										<div class="cover">경복궁</div>
									</div>
									<div class="swiper-slide" type="button">
										<img src="resouces/img/2. 한국 전쟁 기념관.jpg" alt="">
										<div class="cover">한국 전쟁 기념관</div>
									</div>
									<div class="swiper-slide" type="button">
										<img src="resouces/img/3. 남산 타워.jpg" alt="">
										<div class="cover">남산 타워</div>
									</div>
									<div class="swiper-slide" type="button">
										<img src="resouces/img/4. 국립 중앙 박물관.jpg" alt="">
										<div class="cover">국립 중앙 박물관</div>
									</div>
									<div class="swiper-slide" type="button">
										<img src="resouces/img/5. 롯데타워몰.jpg" alt="">
										<div class="cover">롯데타워 몰</div>
									</div>
									<div class="swiper-slide" type="button">
										<img src="resouces/img/6. DDP.jpg" alt="">
										<div class="cover">동대문 디자인 플라자(DDP)</div>
									</div>
									<div class="swiper-slide" type="button">
										<img src="resouces/img/7. 광화문.jpg" alt="">
										<div class="cover">광화문</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
	</body>

	</html>