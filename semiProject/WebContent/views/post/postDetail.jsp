<%@page import="semi.post.model.vo.Post"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	Post p = (Post)request.getAttribute("p");
	boolean hasRecommended = (boolean)request.getAttribute("hasRecommended");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>여행가조</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>

<!-- Popper JS -->
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css">

<link rel="preconnect" href="https://fonts.googleapis.com">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Hahmlet:wght@100..900&display=swap"
	rel="stylesheet">

<!-- lodash cdn -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.17.21/lodash.min.js"
	integrity="sha512-WFN04846sdKMIP5LKNphMaWzU7YpMyCU245etK3g/2ARYbPK9Ub18eG+ljU96qKRCWh+quCY7yefSmlkQw1ANQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<!-- GSAP cdn -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.5/gsap.min.js"
	integrity="sha512-7eHRwcbYkK4d9g/6tD/mhkf++eoTHwpNM9woBxtPUBWm67zeAfFC+HrdoE2GanKeocly/VxeLvIqwvCdk7qScg=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<!-- GSAP ScrollToPlugin -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.5/ScrollToPlugin.min.js"
	integrity="sha512-1PKqXBz2ju2JcAerHKL0ldg0PT/1vr3LghYAtc59+9xy8e19QEtaNUyt1gprouyWnpOPqNJjL4gXMRMEpHYyLQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<!-- SWIPER -->
<link rel="stylesheet"
	href="https://unpkg.com/swiper@6.8.4/swiper-bundle.min.css" />
<script defer src="https://unpkg.com/swiper@6.8.4/swiper-bundle.min.js"></script>

<!-- Scroll Magic -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/ScrollMagic/2.0.8/ScrollMagic.min.js"
	integrity="sha512-8E3KZoPoZCD+1dgfqhPbejQBnQfBXe8FuwL4z/c8sTrgeDMFEnoyTlH3obB4/fV+6Sg0a0XF+L/6xS4Xx1fUEg=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

<!-- Material Icons -->
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700&display=swap"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

<script type="module"
	src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule
	src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
<script src="app.js"></script>

<script defer src="resouces/js/board-Detail.js"></script>
<script defer src="resouces/js/common.js"></script>
<link rel="stylesheet" href="resouces/css/board-Detail.css">
<link rel="stylesheet" href="resouces/css/common.css">

<style>
input {
	background-color: rgba(0, 0, 0, 0);
}




</style>

</head>
<body>
	<%@ include file="../common/basic.jsp"%>
	<div class="wrap">
		<div class="top">
			<div class="logo" onclick="location.href='<%= contextPath %>'">우리
				여행가조</div>
			<div class="top_menu">
				<ul>
					<li id="top_menu_1"
						onclick="location.href='<%= contextPath %>/GoMyPage.me'">My
						page</li>
					<li id="top_menu_2"
						onclick="location.href='<%= contextPath %>/GoServiceCenter.sc'">고객센터</li>
					<li id="top_menu_3">로그아웃</li>
				</ul>
			</div>
		</div>

		<div class="under">
			<div class="side_menu">
				<div id="side_menu_open_1"
					onclick="location.href='<%= contextPath %>'">여행 갈래?</div>
				<div id="side_menu_open_2"
					onclick="location.href='<%= contextPath %>/GoScheduleMain.sd'"
					class="login">계획 짤래?</div>
				<div id="side_menu_open_3"
					onclick="location.href='<%= contextPath %>/list.po?cpage=1'"
					class="login">리뷰 볼래?</div>
				<% if (loginAdmin != null) { %>
				<div id="side_menu_open_4"
					onclick="location.href='<%= contextPath %>/GoAdminMain.ad'">관리자
					메뉴</div>
				<% } %>
				<div id="close_btn" onclick="side_close()">
					<img src="resouces/img/chevron_left_24dp_5F6368.png" alt="">
				</div>

				<div id="side_menu_close_1"
					onclick="location.href='<%= contextPath %>'" class="login">
					<img src="resouces/img/airplane_ticket_24dp_5F6368.png" alt="">
					<div class="explanation">여행 갈래?</div>
				</div>
				<div id="side_menu_close_2"
					onclick="location.href='<%= contextPath %>/GoScheduleMain.sd'"
					class="login">
					<img
						src="resouces/img/edit_calendar_24dp_5F6368_FILL0_wght400_GRAD0_opsz24.png"
						alt="">
					<div class="explanation">계획 짤래?</div>
				</div>
				<div id="side_menu_close_3"
					onclick="location.href='<%= contextPath %>/GoPostMain.ps'"
					class="login">
					<img src="resouces/img/dynamic_feed_24dp_5F6368.png" alt="">
					<div class="explanation">리뷰 볼래?</div>
				</div>
				<% if (loginAdmin != null) { %>
				<div id="side_menu_close_4"
					onclick="location.href='<%= contextPath %>/GoAdminMain.ad'">
					<img
						src="resouces/img/manage_accounts_24dp_5F6368_FILL0_wght400_GRAD0_opsz24.png"
						alt="">
					<div class="explanation">관리자 메뉴</div>
				</div>
				<% } %>
				<div id="open_btn" onclick="side_open()">
					<img src="resouces/img/chevron_right_24dp_5F6368.png" alt="">
				</div>
			</div>
			<form id="postForm" action="<%= contextPath %>/update.po" method="post">
				<div class="content">
					<section>
						<div class="board-area">
							<div class="post">

								<input type="hidden" name="pno" value="<%= p.getPostNo() %>">
								<div class="title">
									<% if(loginUser.getmId().equals(loginUser.getmId())) { %>
									<input type="text" class="post-title"
										value="<%= p.getPostTitle() %>" id="post-title" name="title">
									<% }else{ %>
									<div class="post-title"><%= p.getPostTitle() %></div>
									<% } %>
								</div>
								<hr>
								<div class="info">
									작성자
									<%= p.getmId() %>
									조회수
									<%= p.getPostCount() %>
									추천수
									<span class="recommend-count"><%= p.getPostRecommend() %></span>
									작성일
									<%= p.getPostDate() %>
								</div>
								<hr>
								<div class="content">
									<% if(loginUser.getmId().equals(loginUser.getmId())) { %>
									<input type="text" class="post-content"
										value="<%= p.getPostContent() %>" id="post-content"
										name="content">
									<% }else{ %>
									<div class="post-content"><%= p.getPostContent() %></div>
									<% } %>
								</div>
								<hr>
								<div class="recommend">
									<span aligin="center"><%= p.getmNickName() %>님의 여행기가 마음에
										드셨다면?</span>

									<button>추천하기</button>
								</div>
								<div class="button-box" align="center">
									<br>
									<br>
									<button type="reset" id="cancel-btn"
										onclick="location.href='<%= contextPath%>/list.po?cpage=1'">목록가기</button>
									<% if (loginUser != null && loginUser.getmId().equals(p.getmId())) { %>
									        <button type="submit" id="view-btn">수정하기</button>
									        <button type="button" id="submit-btn" onclick="submitDelete()">삭제하기</button>
									    <% } %>
									<!--  onclick="location.href='<%= contextPath %>/delete.po'" -->
								</div>
				
								
								<<div class="comment-section">
    <h4>댓글 작성</h4>
    <textarea id="commentContent" class="comment-input" rows="4" placeholder="댓글을 입력하세요..." required></textarea>
    <button type="button" class="btn-comment" onclick="submitComment()">댓글 작성</button>
</div>
								
							</div>
						</div>
					</section>
				</div>
				</form>
			<br>
			<br>
			<section>
				<div class="footer"></div>
			</section>
		</div>

	</div>
	<script>
	document.addEventListener("DOMContentLoaded", function() {
	    const recommendButton = document.querySelector(".recommend button");

	    // 서버에서 전달된 hasRecommended 값을 가져옵니다.
	    const hasRecommended = '<%= hasRecommended %>' === 'true';

	    if (hasRecommended) {
	        recommendButton.disabled = true;
	        recommendButton.textContent = "추천됨";
	        recommendButton.style.backgroundColor = "#aaa";
	        recommendButton.style.cursor = "not-allowed";
	    }

	    recommendButton.addEventListener("click", function(event) {
	        event.preventDefault(); // 기본 버튼 동작 막기

	        $.ajax({
	            url: '<%= contextPath %>/recommend.po',
	            type: 'POST',
	            data: { pno: '<%= p.getPostNo() %>' },
	            success: function(response) {
	                if (response.trim() === "success") {
	                    alert("추천되었습니다!");
	                    recommendButton.disabled = true;
	                    recommendButton.textContent = "추천됨";
	                    recommendButton.style.backgroundColor = "#aaa";
	                    recommendButton.style.cursor = "not-allowed";
	                    
	                    // 추천 수 증가
	                    const recommendCountElement = document.querySelector(".recommend-count");
	                    let currentRecommendCount = parseInt(recommendCountElement.textContent);
	                    recommendCountElement.textContent = currentRecommendCount + 1;
	                } else if (response.trim() === "already_recommended") {
	                    alert("이미 추천하셨습니다.");
	                } else {
	                    alert("추천에 실패했습니다. 다시 시도해주세요.");
	                }
	            },
	            error: function() {
	                alert("서버 요청 중 오류가 발생했습니다.");
	            }
	        });
	    });
	});
	
	function submitDelete() {
        if (confirm("정말 삭제하시겠습니까?")) {
            // 폼의 action을 삭제 서블릿으로 변경
            document.getElementById('postForm').action = '<%= contextPath %>/delete.po';
            // 폼을 POST 방식으로 제출
            document.getElementById('postForm').method = 'post';
            // 폼 제출
            document.getElementById('postForm').submit();
        }
    }
	
	
	document.getElementById('submitComment').addEventListener('click', function() {
	    const commentContent = document.getElementById('commentContent').value;

	    // 댓글 내용이 비어있는지 확인
	    if (commentContent.trim() === '') {
	        alert('댓글을 입력하세요.');
	        return;
	    }

	    // AJAX 요청
	    const xhr = new XMLHttpRequest();
	    xhr.open('POST', '/submitComment', true); // '/submitComment'는 서버의 댓글 처리 경로입니다.
	    xhr.setRequestHeader('Content-Type', 'application/json');

	    xhr.onreadystatechange = function() {
	        if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
	            // 서버로부터의 응답을 받으면 처리
	            const response = JSON.parse(xhr.responseText);

	            // 댓글이 성공적으로 추가되었을 때
	            if (response.success) {
	                // 새로운 댓글을 화면에 추가
	                addCommentToList(response.comment);

	                // 입력 필드 초기화
	                document.getElementById('commentContent').value = '';
	            } else {
	                alert('댓글 작성에 실패했습니다. 다시 시도해주세요.');
	            }
	        }
	    };

	    // 서버로 보낼 데이터 (JSON 형태로 전송)
	    const data = JSON.stringify({
	        content: commentContent,
	        postId: 123 // 게시물 번호 (동적으로 설정 가능)
	    });

	    xhr.send(data);
	});

	// 댓글을 리스트에 추가하는 함수
	function addCommentToList(comment) {
	    const commentList = document.getElementById('commentList');

	    // 새로운 댓글 HTML 생성
	    const newComment = document.createElement('div');
	    newComment.classList.add('comment-item');
	    newComment.innerHTML = `
	        <div class="comment-author">${comment.author}</div>
	        <div class="comment-date">${comment.date}</div>
	        <div class="comment-content">${comment.content}</div>
	    `;

	    // 댓글 리스트에 새로운 댓글을 추가
	    commentList.appendChild(newComment);
	}
	
	
	
	
	
	
	</script>
</body>
</html>