$('.detail').children().not('.date_div').css('display', 'none');
$('.map').css('width', '20vw');

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

$('#cancle').on('click', function() {
    $('#add_detail').css('width', '');
    $('#add_detail table').css('display', '');
    $('.map').css({
        height: '',
        width: '20vw',
        margin: '-532px 0 0 750px',
    });
});

$('.circle2').on('click', function() {
    $('#add_detail').css('width', '40%');
    $('#add_detail table').css('display', 'block');
    $('.map').css({
        height: '300px',
        width: '',
        margin: '0 0 0 43px',
    });
});

setTimeout(function(){
    $('.detail').children('div:eq(0)').children('.open_btn').trigger('click');
}, 0);