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
        
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css">
        
        <link rel="preconnect" href="https://fonts.googleapis.com">
        
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Hahmlet:wght@100..900&display=swap" rel="stylesheet">

        <!-- lodash cdn -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.17.21/lodash.min.js" integrity="sha512-WFN04846sdKMIP5LKNphMaWzU7YpMyCU245etK3g/2ARYbPK9Ub18eG+ljU96qKRCWh+quCY7yefSmlkQw1ANQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

        <!-- GSAP cdn -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.5/gsap.min.js" integrity="sha512-7eHRwcbYkK4d9g/6tD/mhkf++eoTHwpNM9woBxtPUBWm67zeAfFC+HrdoE2GanKeocly/VxeLvIqwvCdk7qScg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        
        <!-- GSAP ScrollToPlugin -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.5/ScrollToPlugin.min.js" integrity="sha512-1PKqXBz2ju2JcAerHKL0ldg0PT/1vr3LghYAtc59+9xy8e19QEtaNUyt1gprouyWnpOPqNJjL4gXMRMEpHYyLQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

        <!-- SWIPER -->
        <link rel="stylesheet" href="https://unpkg.com/swiper@6.8.4/swiper-bundle.min.css" />
        <script defer src="https://unpkg.com/swiper@6.8.4/swiper-bundle.min.js"></script>

        <!-- Scroll Magic -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/ScrollMagic/2.0.8/ScrollMagic.min.js" integrity="sha512-8E3KZoPoZCD+1dgfqhPbejQBnQfBXe8FuwL4z/c8sTrgeDMFEnoyTlH3obB4/fV+6Sg0a0XF+L/6xS4Xx1fUEg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

        <!-- Material Icons -->
        <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    
        <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
        <script src="app.js"></script>

        <script defer src="resouces/js/board-Write.js"></script>
        <script defer src="resouces/js/common.js"></script>
        <link rel="stylesheet" href="resouces/css/board-Write.css">
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
                        <li id="top_menu_2" onclick="location.href='<%= contextPath %>/GoServiceCenter.sc'">고객센터</li>
                        <li id="top_menu_3">로그아웃</li>
                    </ul>
                </div>
            </div>
    
            <div class="under">
                <div class="side_menu">
                    <div id="side_menu_open_1" onclick="location.href='<%= contextPath %>'">여행 갈래?</div>
                    <% if (loginAdmin != null) { %>
                        <div id="side_menu_open_2" onclick="location.href='<%= contextPath %>/GoShowPlanMain.ad'" class="login">계획 짤래?</div>
                    <% } else { %>
                        <div id="side_menu_open_2" onclick="location.href='<%= contextPath %>/GoScheduleMain.sd?mno=<%= loginUser.getmNo() %>'" class="login">계획 짤래?</div>
                    <% } %>
                    <div id="side_menu_open_3" onclick="location.href='<%= contextPath %>/GoPostMain.ps'" class="login">리뷰 볼래?</div>
                    <% if (loginAdmin != null) { %>
                        <div id="side_menu_open_4" onclick="location.href='<%= contextPath %>/list.po?cpage=1'">관리자 메뉴</div>
                    <% } %>
                    <div id="close_btn" onclick="side_close()"><img src="resouces/img/chevron_left_24dp_5F6368.png" alt=""></div>
    
                    <div id="side_menu_close_1" onclick="location.href='<%= contextPath %>'" class="login">
                        <img src="resouces/img/airplane_ticket_24dp_5F6368.png" alt="">
                        <div class="explanation">여행 갈래?</div>
                    </div>
                    <% if (loginAdmin != null) { %>
                        <div id="side_menu_close_2" onclick="location.href='<%= contextPath %>/GoShowPlanMain.ad'" class="login">
                            <img src="resouces/img/edit_calendar_24dp_5F6368_FILL0_wght400_GRAD0_opsz24.png" alt="">
                            <div class="explanation">계획 짤래?</div>
                        </div>
                    <% } else { %>
                        <div id="side_menu_close_2" onclick="location.href='<%= contextPath %>/GoScheduleMain.sd?mno=<%= loginUser.getmNo() %>'" class="login">
                            <img src="resouces/img/edit_calendar_24dp_5F6368_FILL0_wght400_GRAD0_opsz24.png" alt="">
                            <div class="explanation">계획 짤래?</div>
                        </div>
                    <% } %>
                    <div id="side_menu_close_3" onclick="location.href='<%= contextPath %>/list.po?cpage=1'" class="login">
                        <img src="resouces/img/dynamic_feed_24dp_5F6368.png" alt="">
                        <div class="explanation">리뷰 볼래?</div>
                    </div>
                    <% if (loginAdmin != null) { %>
                        <div id="side_menu_close_4" onclick="location.href='<%= contextPath %>/GoAdminMain.ad'">
                            <img src="resouces/img/manage_accounts_24dp_5F6368_FILL0_wght400_GRAD0_opsz24.png" alt="">
                            <div class="explanation">관리자 메뉴</div>
                        </div>
                    <% } %>
                    <div id="open_btn" onclick="side_open()">
                        <img src="resouces/img/chevron_right_24dp_5F6368.png" alt="">
                    </div>
                </div>
    
                <div class="content">
                    <section>
                        <div class="headLine">
                            <div class="textLine">하나뿐인 여행기를 만들어 보세요📝</div>
                            <div class="whiteBox"></div>
                        </div>
                        </section>
                        <section>
                        <div class="post">
						<form action="<%=contextPath%>/insert.po" method="post"
							enctype="multipart/form-data">
							<input type="hidden" name="mno" value="<%=loginUser.getmNo()%>">
							<div class="title">
								<input type="text" class="post-title" placeholder="제목을 입력해 주세요."
									name="title">
							</div>
							<hr>
							<div class="content_text">
								<textarea class="post-content" placeholder="내용을 입력해 주세요."
									name="content"></textarea>
							</div>
							<hr>
							<div class="image-upload-wrapper"
								style="display: flex; align-items: center; gap: 20px;">
								<div class="thumbnail"
									style="position: relative; width: 100px; height: 100px; border: 1px solid #ccc;">
									<input type="file" id="imageInput" name="image"
										style="display: none;" accept="image/*">
									<button type="button" id="imageButton"
										style="width: 100%; height: 100%; font-size: 2rem; border: none; background-color: #f0f0f0;">+</button>
									<img id="previewImage" src="" alt="미리보기"
										style="display: none; position: absolute; top: 0; left: 0; width: 100%; height: 100%; object-fit: cover;">
								</div>
								<p>대표이미지 등록</p>
							</div>
							<div class="role">
								<ul>
									<li>이미지 파일만 업로드 가능합니다.</li>
									<li>파일의 크기는 2MB를 넘을 수 없습니다.</li>
									<li>규정에 어긋나는 사진을 올리시는 경우 삭제 및 사이트 이용에 제한이 생길 수 있습니다.</li>
								</ul>
							</div>
							<div class="button-box">
								<button type="reset" id="cancel-btn"
									onclick="location.href='.views/post/postMain.jsp'">취소하기</button>
								<button type="submit" id="submit-btn">글등록</button>
							</div>
						</form>
					</div>
                        </section>
                        <section>
                            <div class="footer"></div>
                        </section>
                </div>
            </div>
        </div>
    
     <script>
    document.getElementById('imageButton').addEventListener('click', function() {
        document.getElementById('imageInput').click();
    });

    document.getElementById('imageInput').addEventListener('change', function(event) {
        const file = event.target.files[0];
        if (file) {
            const reader = new FileReader();

            reader.onload = function(e) {
                const imgElement = document.getElementById('previewImage');
                imgElement.src = e.target.result; // 파일 데이터를 이미지 소스로 설정
                imgElement.style.display = 'block'; // 이미지를 표시
            };

            reader.readAsDataURL(file); // 파일을 읽어서 데이터 URL로 변환
        }
    });

    // 글 등록 후 이미지를 다른 섹션에 표시하는 함수
    document.getElementById('submit-btn').addEventListener('click', function(event) {
        event.preventDefault();  // 폼의 기본 제출 동작을 막음

        // 서버로 폼 데이터 전송
        const formData = new FormData(document.querySelector('form'));

        fetch('<%= contextPath %>/uploadImage', {
            method: 'POST',
            body: formData
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                // 이미지가 성공적으로 업로드되었을 때, 서버에서 반환한 이미지 URL을 표시
                document.querySelector('.thumbnail img').src = data.imageUrl;  // 서버로부터 받은 이미지 URL 사용
            } else {
                alert('이미지 업로드에 실패했습니다.');
            }
        })
        .catch(error => {
            console.error('Error:', error);
            alert('서버와 통신 중 오류가 발생했습니다.');
        });
    });
</script>
       
    </body>
</html>
