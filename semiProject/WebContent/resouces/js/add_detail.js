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

$('.edit').on('click', function() {
    let dTime = $(this).closest('.plan_content').children('.dTime').text();
    let dPlace = $(this).closest('.plan_content').children('.dPlace').text();
    let dElse = $(this).closest('.plan_content').children('.dElse').text();

    let dTimeInput = '<input type="text" name="editTime" class="editInput" value="' + dTime + '">';
    let dPlaceInput = '<input type="text" name="editPlace" class="editInput" value="' + dPlace + '">';
    let dElseInput = '<textarea name="editElse" class="editInput" style="resize: none; width: 600px; height: 30px; padding: 10px;">' + dElse + '</textarea>';

    $(this).closest('.plan_content').children('.dTime').html(dTimeInput);
    $(this).closest('.plan_content').children('.dPlace').html(dPlaceInput);
    $(this).closest('.plan_content').children('.dElse').html(dElseInput);

    console.log(dTime);
    console.log(dPlace);
    console.log(dElse);
    console.log(dTimeInput);
    console.log(dPlaceInput);
    console.log(dElseInput);
    console.log($(this).text());
});