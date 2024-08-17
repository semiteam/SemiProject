const side_menu = document.getElementsByClassName('side_menu');
const content = document.getElementsByClassName('content');

const side_menu_open_1 = document.getElementById('side_menu_open_1');
const side_menu_open_2 = document.getElementById('side_menu_open_2');
const side_menu_open_3 = document.getElementById('side_menu_open_3');
const close_btn = document.getElementById('close_btn');

const side_menu_close_1 = document.getElementById('side_menu_close_1');
const side_menu_close_2 = document.getElementById('side_menu_close_2');
const side_menu_close_3 = document.getElementById('side_menu_close_3');
const open_btn = document.getElementById('open_btn');

function side_close() {
    side_menu[0].style.width = '2.5%';
    content[0].style.width = '97.5%';
    content[0].style.margin = '0 0 0 2.5%';

    side_menu_open_1.style.display = 'none';
    side_menu_open_2.style.display = 'none';
    side_menu_open_3.style.display = 'none';
    close_btn.style.display = 'none';

    side_menu_close_1.style.display = 'block';
    side_menu_close_2.style.display = 'block';
    side_menu_close_3.style.display = 'block';
    open_btn.style.display = 'block';
}

function side_open() {
    side_menu[0].style.width = '15%';
    content[0].style.width = '85%';
    content[0].style.margin = '0 0 0 15%';

    side_menu_open_1.style.display = 'block';
    side_menu_open_2.style.display = 'block';
    side_menu_open_3.style.display = 'block';
    close_btn.style.display = 'block';

    side_menu_close_1.style.display = 'none';
    side_menu_close_2.style.display = 'none';
    side_menu_close_3.style.display = 'none';
    open_btn.style.display = 'none';
}

new Swiper('.recommend-timeline-board .swiper-container', {
    slidesPerView: 1, // 한번에 보여줄 슬라이드 개수
    loop: true,
    allowTouchMove : true,
    autoplay: {
        delay: 10000,
    },
    
    pagination: {
        el: '.recommend-timeline .swiper-pagination', // 페이지 번호 요소 선택자
        clickable: true, // 사용자의 페이지 번호 요소 제어 가능 여부
    },
    navigation: {
        prevEl: '.recommend-timeline .swiper-prev',
        nextEl: '.recommend-timeline .swiper-next',
    },
});

new Swiper('#post .swiper-container', {
    slidesPerView: 1, // 한번에 보여줄 슬라이드 개수
    loop: true,
    pagination: {
        mode: 'horizontal',
        el: '.swiper-pagination',
        clickable: true,
    },
    navigation: {
        prevEl: '#post .swiper-prev',
        nextEl: '#post .swiper-next',
    },
});

const promotionEl = document.querySelector('.recommend-timeline-board'); // 숨기고자 하는 요소
const promotionToggleBtn = document.querySelector('.toggle-promotion');
let isHidePromotion = false;

promotionToggleBtn.addEventListener('click', function() {
    isHidePromotion = !isHidePromotion;

    if (isHidePromotion) {
        // 숨김처리
        promotionEl.classList.add('hide');
    } else {
        // 보임처리
        promotionEl.classList.remove('hide');
    }
});

function openPopup() {
    var popup = document.getElementById("popup");
    popup.style.visibility = "visible";
    popup.style.opacity = "1";
}

function closePopup() {
    var popup = document.getElementById("popup");
    popup.style.visibility = "hidden";
    popup.style.opacity = "0";
}