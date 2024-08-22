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