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

$('#search___result').on('click', '.result', function() {
    $('#place_name').val($(this).text().trim());
    $('#place_name').attr('name', 'choice');
    $('#search___result').html('');
});

$('.circle2').on('click', function() {
    $('#adit_date').val($(this).closest('.detail').children('.date_div').children('.date').text());
})

$('.add_detail_plan').on('click', function() {
    $('#adit_date').val($(this).closest('.detail').children('.date_div').children('.date').text());
})

$(document).on('keyup', '.hour', function() {
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

$(document).on('keyup', '.minute', function() {
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

let origin = $('#add_detail').html();

$('#search___result').on('click', '#add_place', function() {
    $('#add_detail').html(`
        <div id="place_add">
            <span id="cancle" class="material-symbols-outlined" style="position: absolute; right: 10px; top: 0px; cursor: pointer;">close</span>
            <table id="place_add_table">
                <tr>
                    <th>&nbsp;&nbsp;* 장소명&nbsp;&nbsp;</th>
                    <td><input type="text" id="landmarkName"></td>
                </tr>

                <tr>
                    <th>&nbsp;&nbsp;* 도시명&nbsp;&nbsp;</th>
                    <td><input type="text" id="landmarkCity"></td>
                </tr>

                <tr>
                    <th>&nbsp;&nbsp;* 주소&nbsp;&nbsp;</th>
                    <td><input type="text" id="landmarkAddress"></td>
                </tr>

                <tr id="clock">
                    <th>&nbsp;&nbsp;운영시간&nbsp;&nbsp;</th>
                    <td id="watch">
                        <input type="number" name="startHour" class="time hour" id="startHour" max="23" min="0" value="11">
                        <div class="bb">:</div>
                        <input type="number" name="startMinute" class="time minute" id="startMinute" max="59" min="0" value="00">
                        <div class="aa">~</div>
                        <input type="number" name="endHour" class="time hour" id="endHour" max="23" min="0" value="13">
                        <div class="bb">:</div>
                        <input type="number" name="endMinute" class="time minute" id="endMinute" max="59" min="0" value="00">
                    </td>
                </tr>

                <tr>
                    <th>&nbsp;&nbsp;장소 설명&nbsp;&nbsp;</th>
                    <td></td>
                </tr>

                <tr>
                    <td id="ex_keyup" colspan="2">
                        <textarea name="explanation_p" id="explanation_p" style="overflow: auto;"></textarea>
                        <div id="count">0/1000</div>
                    </td>
                </tr>
            </table>
            <input type="button" value="장소 추가 완료하기" id="add_done_place">
        </div>
        
        <script>
            $(function() {
                $('#ex_keyup').on('keyup', '#explanation_p', function() {
                    let count = $('#explanation_p').val().length;
    
                    if (count >= 1000) {
                        $('#explanation_p').val($('#explanation_p').val().substring(0,1000));
                        $('#count').css('color', 'red').text('1000/1000');
                    } else {
                        $('#count').css('color', '').text(count + '/1000');
                    }
                });

                $('#place_add').on('click', '#add_done_place', function() {
                    if ($('#landmarkName').val() === '') {
                        alert('장소명을 입력해주세요.');
                    } else if ($('#landmarkCity').val() === '') {
                        alert('도시명을 입력해주세요.');
                    } else if ($('#landmarkAddress').val() === '') {
                        alert('장소의 주소를 입력해주세요.');
                    } else {
                        $.ajax({
                            url: 'InsertLandmark.l',
                            method: 'post',
                            data: {
                                landmarkCity: $('#landmarkCity').val(),
                                landmarkName: $('#landmarkName').val(),
                                landmarkAddress: $('#landmarkAddress').val(),
                            },
                            success: function(result) {
                                if (result > 0) {
                                    alert('장소 추가에 성공하였습니다.');
                                    setTimeout(() => {
                                        $('#cancle').trigger('click');
                                    }, 0)
                                } else {
                                    alert('장소 추가에 실패하였습니다.');
                                }
                            },
                            error: function() {
                                console.error('AJAX Error: ', status, error);
                                alert('장소 추가에 실패하였습니다.');
                            }
                        });
                    }
                })
            })
        </script>
        `
    )
});

$('#else').on('keyup', function() {
    let count = $('#else').val().length;

    if (count >= 1000) {
        $('#else').val($('#else').val().substring(0,1000));
        $('#count_else').css('color', 'red').text('1000/1000');
    } else {
        $('#count_else').css('color', '').text(count + '/1000');
    }
    
});