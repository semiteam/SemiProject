$('#search_place_add').on('click', function(event) {
    event.stopPropagation();
    $('#place_add').css('width', '817px');
    $('#cover').css('display', 'block');
    $('.content').css('overflow', 'hidden');
})

$(document).on('click', function(event) {
    if (!$(event.target).closest('#place_add').length) {
        $('#place_add').css('width', '0');
        $('#cover').css('display', 'none');
        $('.content').css('overflow', '');
    }
});

$('#cancle').on('click', function(event) {
    event.stopPropagation();
    $('#place_add').css('width', '0');
    $('#cover').css('display', 'none');
    $('.content').css('overflow', '');
});

$('#explanation_p').on('keyup', function() {
    let count = $('#explanation_p').val().length;

    if (count >= 1000) {
        $('#explanation_p').val($('#explanation_p').val().substring(0,1000));
        $('#count').css('color', 'red').text('1000/1000');
    } else {
        $('#count').text(count + '/1000');
    }
    
});

$('.img').on('click', function() {
    $('.img').attr('class', 'img');
    $(this).addClass('clicked');
    $('.img').not(this).addClass('notClicked');

    $('img').attr('id', '');
    $('.clicked img').attr('id', 'clicked');
})

$('#basic').on('click', function() {
    $('.img').css('display', '');
    $('#computer').css('border-bottom', '');
    $('#basic').css('border-bottom', '');
    $('#img_content1').css('display', '');
    $('#img_content2').css('display', '');
})

$('#computer').on('click', function() {
    $('.img').css('display', 'none').removeClass('notClicked clicked');
    $('.img img').removeAttr('id', 'clicked');
    $('#computer').css('border-bottom', '1.5px solid #000');
    $('#basic').css('border-bottom', 'none');
    $('#img_content1').css('display', 'none');
    $('#img_content2').css('display', 'block');
})

$('#random').on('click', function() {
    if ($('#random').is(':checked')) {
        $('#img_choice_tr').css('display', '');
    }
})

$('#choice').on('click', function() {
    if ($('#choice').is(':checked')) {
        $('#img_choice_tr').css('display', 'contents');
    }
})

$('#search___').on('click', '.search_result', function() {
    $('#place_name').val($(this).text().trim());
    $('#place_name').attr('name', 'choice');
});

$('#computer').on('click', function() {
    $('#random').val('');
    $('#choice').val('');
})