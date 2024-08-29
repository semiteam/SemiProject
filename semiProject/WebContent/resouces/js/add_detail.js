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
    $(this).closest('.date_div').find('.open_btn').css('display', 'block');
    $(this).closest('.date_div').find('.close_btn').css('display', 'none');
    $(this).closest('.date_div').css('width', '175px');
    $(this).closest('.detail').css('margin-bottom', '20px');
});

setTimeout(function(){
    $('.detail').children('div').children('.open_btn').trigger('click');
}, 0);

setTimeout(function() {
    $('.detail').children('div').not('div:eq(0)').children('.close_btn').trigger('click');
}, 1)

$('.result').on('click', function() {
    $('#place_name').val($(this).text().trim());
    $('#place_name').attr('name', 'choice');
});

$('.circle2').on('click', function() {
    $('#adit_date').val($(this).closest('.detail').children('.date_div').children('.date').text());
})

$('.add_detail_plan').on('click', function() {
    $('#adit_date').val($(this).closest('.detail').children('.date_div').children('.date').text());
})

$('.hour').on('keyup', function() {
    let $this = $(this);
    let value = $this.val();
    
    if (value > 23) {
        $this.val(23);
    } else if (value < 0) {
        $this.val('00');
    } else if (value >= 0 && value <= 23) {
        $this.val(value);
    } else {
        $this.val('');
    }
});


$('.minute').on('keyup', function() {
    let $this = $(this);
    let value = $this.val();
    
    if (value > 59) {
        $this.val(59);
    } else if (value < 0) {
        $this.val('00');
    } else if (value >= 0 && value <= 59) {
        $this.val(value);
    } else {
        $this.val('');
    }
});

$('.edit').one('click', function() {
    let dTime = $(this).closest('.plan_content').children('.dTime').text();
    let dPlace = $(this).closest('.plan_content').children('.dPlace').text();
    let dElse = $(this).closest('.plan_content').children('.dElse').text();

    let dTimeInput = '<input type="text" name="editTime" id="editTime" class="editInput" value="' + dTime + '">';
    let dPlaceInput = '<input type="text" name="editPlace" id="editPlace" class="editInput" value="' + dPlace + '">';
    let dElseInput = '<textarea name="editElse" id="editElse" class="editInput" style="resize: none; width: 615px; height: 300px; padding: 10px;">' + dElse + '</textarea>';

    $(this).closest('.plan_content').children('.dTime').html(dTimeInput);
    $(this).closest('.plan_content').children('.dPlace').html(dPlaceInput);
    $(this).closest('.plan_content').children('.dElse').html(dElseInput);

    $(this).closest('.mini_bar').children('.done').css('display', 'block');
    $(this).css('display', 'none');
});