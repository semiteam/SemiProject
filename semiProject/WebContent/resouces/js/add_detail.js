$('.detail').children().not('.date_div').css('display', 'none');
$('.map').css('width', '20vw');
$('.map img').css('width', '100%');

$('.open_btn').on('click', function() {
    $(this).closest('.detail').children().not('.date_div').css('display', '');
    $(this).closest('.date_div').find('.open_btn').css('display', 'none');
    $(this).closest('.date_div').find('.close_btn').css('display', 'block');
    $(this).closest('.date_div').css('width', '695px');
    $(this).closest('.detail').css('margin-bottom', '40px');
});

$('.close_btn').on('click', function() {
    $(this).closest('.detail').children().not('.date_div').css('display', 'none');
    $(this).closest('.date_div').find('.open_btn').css('display', '');
    $(this).closest('.date_div').find('.close_btn').css('display', '');
    $(this).closest('.date_div').css('width', '');
    $(this).closest('.detail').css('margin-bottom', '');
});

setTimeout(function(){
    $('.detail').children('div:eq(0)').children('.open_btn').trigger('click');
}, 0);

$('.result').on('click', function() {
    $('#place_name').val($(this).text().trim());
    $('#place_name').attr('name', 'choice');
});

$('.circle2').on('click', function() {
    $('#adit_date').val($(this).closest('.detail').children('.date_div').children('.date').text());
})

var swiper = new Swiper(".mySwiper", {
    direction: "vertical",
    slidesPerView: 3, // Adjust as needed
    centeredSlides: true,
    spaceBetween: 10, // Adjust as needed
    mousewheel: true,
    freeMode: true // This allows for smooth scrolling
});