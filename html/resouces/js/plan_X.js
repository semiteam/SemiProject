const top_menu = document.querySelector('#top_menu');

window.addEventListener('scroll', _.throttle(function() {
    if (window.scrollY > 500) {
        gsap.to(top_menu, 0, {
            backgroundColor: "black",
        });
    } else {
        gsap.to(top_menu, 0, {
            backgroundColor: "",
        });
    }
}, 0));

new Swiper(".swiper-container", {
    pagination: {
      el: ".swiper-pagination",
      type: "fraction",
    },
    navigation: {
      nextEl: ".swiper-button-next",
      prevEl: ".swiper-button-prev",
    },
});

$(document).click(function(e) {
    if ($(e.target).closest('#korea, #korea_de').length) {
        $('#korea_de').css('zIndex', '10');
    } else {
        $('#korea_de').css('zIndex', '1');
    }

    if ($(e.target).closest('#japan, #japan_de').length) {
        $('#japan_de').css('zIndex', '10');
    } else {
        $('#japan_de').css('zIndex', '1');
    }

    if ($(e.target).closest('#paris, #paris_de').length) {
        $('#paris_de').css('zIndex', '10');
    } else {
        $('#paris_de').css('zIndex', '1');
    }

    if ($(e.target).closest('#austraila, #austraila_de').length) {
        $('#austraila_de').css('zIndex', '10');
    } else {
        $('#austraila_de').css('zIndex', '1');
    }

    if ($(e.target).closest('#usa, #usa_de').length) {
        $('#usa_de').css('zIndex', '10');
    } else {
        $('#usa_de').css('zIndex', '1');
    }

    if ($(e.target).closest('#korea, #korea_de, #japan, #japan_de, #paris, #paris_de, #austraila, #austraila_de, #usa, #usa_de').length) {
        $('#full_cover').css({
            zIndex: '8',
            backgroundColor: '#00000090',
        });
        $('body').css('overflow', 'hidden');
    } else {
        $('#full_cover').css({
            zIndex: '',
            backgroundColor: '',
        });
        $('body').css('overflow', '');
    }
});