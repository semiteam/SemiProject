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

        if (!startDate || (startDate && endDate)) {
            startDate = date;
            endDate = null;
            // 첫 번째 날짜 선택 시 배경색 변경
            $('.calendar-date').removeClass('selected range');
            $(element).addClass('selected');
        } else if (startDate && !endDate) {
            if (date >= startDate) {
                endDate = date;
            } else {
                endDate = startDate;
                startDate = date;
            }
            // 두 번째 날짜 선택 시 범위 강조
            highlightRange();
        }
        updateRangeInfo();
        
        $('#sDate').val(startDate);
        $('#eDate').val(endDate);
    }

    function highlightRange() {
        $('.calendar-date').removeClass('range selected');
        if (!startDate || !endDate) {
            return;
        }

        let start = startDate ? new Date(startDate) : null;
        let end = endDate ? new Date(endDate) : null;

        let containers = ['#calendar-left', '#calendar-right'];
        containers.forEach(containerId => {
            let container = $(containerId);
            let monthOffset = containerId === '#calendar-right' ? 1 : 0;
            let month = new Date(currentMonth.getFullYear(), currentMonth.getMonth() + monthOffset, 1);
            let current = new Date(month.getFullYear(), month.getMonth(), 1);
            let calendarDates = $(`${containerId} .calendar-date`);

            while (current.getMonth() === month.getMonth()) {
                let currentDate = current.getDate();
                let currentDateElement = calendarDates.filter(function() {
                    return $(this).text() == currentDate;
                });

                if (current >= start && current <= end) {
                    currentDateElement.addClass('range');
                    if (current.getTime() === start.getTime() || current.getTime() === end.getTime()) {
                        currentDateElement.addClass('selected');
                    }
                }
                current.setDate(current.getDate() + 1);
            }
        });
    }

    function updateRangeInfo() {
        if (startDate && endDate) {
            let days = (endDate - startDate) / (1000 * 60 * 60 * 24) + 1;
            $('#range-info').text(`${days}일`);
        } else {
            $('#range-info').text('0일');
        }
    }

    function render() {
        renderCalendar('#calendar-left', currentMonth);
        renderCalendar('#calendar-right', new Date(currentMonth.getFullYear(), currentMonth.getMonth() + 1, 1));
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
