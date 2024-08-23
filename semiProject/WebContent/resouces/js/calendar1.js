$(document).ready(function() {
    let today = new Date(); // 현재 날짜
    today.setHours(0, 0, 0, 0); // 시간은 0으로 설정
    let currentMonth = new Date(today.getFullYear(), today.getMonth(), 1); // 현재 월의 첫번째 날
    let startDate = null; // 사용자가 선택한 첫번째 날짜
    let endDate = null; // 사용자가 선택한 두번째 날짜

    function renderCalendar(container, date) {
        $(container).empty();
        let month = date.getMonth();
        let year = date.getFullYear();
        
        let firstDay = new Date(year, month, 1).getDay(); // 해당 월의 첫 번째 날의 요일
        let lastDate = new Date(year, month + 1, 0).getDate(); // 해당 월의 마지막 날짜
        
        let calendar = $('<div>').addClass('calendar');
        
        // 달력 머리(월, 년도)
        calendar.append($('<div>').addClass('calendar-header').text(date.toLocaleString('en-us', { month: 'long' }) + ' ' + year));
        
        // 요일
        const daysOfWeek = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
        for (let day of daysOfWeek) {
            let dayDiv = $('<div>').addClass('calendar-day').text(day);
            if (day === 'Sun') {
                dayDiv.addClass('sunday');
            }
            calendar.append(dayDiv);
        }

        // 날짜
        for (let i = 0; i < firstDay; i++) {
            calendar.append($('<div>').addClass('calendar-date'));
        }
        
        for (let date = 1; date <= lastDate; date++) {
            let calendarDate = $('<div>').addClass('calendar-date').text(date);
            let fullDate = new Date(year, month, date);

            if (fullDate < today) {
                calendarDate.addClass('disabled');
            } else {
                calendarDate.click(function() {
                    selectDate(fullDate, calendarDate);
                });
            }

            // 일요일
            if (fullDate.getDay() === 0) { // 0 -> 일요일
                calendarDate.addClass('sunday');
            }

            calendar.append(calendarDate);
        }
        
        $(container).append(calendar);
        highlightRange();
    }

    function selectDate(date, element) {
        if (date < today) return; // 지나간 날짜 -> 무시

        $('.calendar-date').removeClass('selected range');
            $(element).addClass('selected');
    }

    function render() {
        renderCalendar('#calendar-left', currentMonth);
        checkButtons();
    }

    function checkButtons() {
        $('#prev').prop('disabled', currentMonth.getMonth() === today.getMonth() && currentMonth.getFullYear() === today.getFullYear());
    }

    $('#next').click(function() {
        currentMonth = new Date(currentMonth.getFullYear(), currentMonth.getMonth() + 1, 1);
        render();
    });

    $('#prev').click(function() {
        if (!(currentMonth.getMonth() === today.getMonth() && currentMonth.getFullYear() === today.getFullYear())) {
            currentMonth = new Date(currentMonth.getFullYear(), currentMonth.getMonth() - 1, 1);
            render();
        }
    });

    $('#today').click(function() {
        currentMonth = new Date(today.getFullYear(), today.getMonth(), 1);
        render();
    });

    render();
});
