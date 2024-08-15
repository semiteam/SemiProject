const side_menu = document.getElementsByClassName('side_menu');
const content = document.getElementsByClassName('content');

const side_menu_open_1 = document.getElementById('side_menu_open_1');
const side_menu_open_2 = document.getElementById('side_menu_open_2');
const side_menu_open_3 = document.getElementById('side_menu_open_3');
const side_menu_open_4 = document.getElementById('side_menu_open_4');
const close_btn = document.getElementById('close_btn');

const side_menu_close_1 = document.getElementById('side_menu_close_1');
const side_menu_close_2 = document.getElementById('side_menu_close_2');
const side_menu_close_3 = document.getElementById('side_menu_close_3');
const side_menu_close_4 = document.getElementById('side_menu_close_4');
const open_btn = document.getElementById('open_btn');

function side_close() {
    side_menu[0].style.width = '2.5%';
    content[0].style.width = '97.5%';
    content[0].style.margin = '0 0 0 2.5%';

    side_menu_open_1.style.display = 'none';
    side_menu_open_2.style.display = 'none';
    side_menu_open_3.style.display = 'none';
    side_menu_open_4.style.display = 'none';
    close_btn.style.display = 'none';

    side_menu_close_1.style.display = 'block';
    side_menu_close_2.style.display = 'block';
    side_menu_close_3.style.display = 'block';
    side_menu_close_4.style.display = 'block';
    open_btn.style.display = 'block';
}

function side_open() {
    side_menu[0].style.width = '15%';
    content[0].style.width = '85%';
    content[0].style.margin = '0 0 0 15%';

    side_menu_open_1.style.display = 'block';
    side_menu_open_2.style.display = 'block';
    side_menu_open_3.style.display = 'block';
    side_menu_open_4.style.display = 'block';
    close_btn.style.display = 'block';

    side_menu_close_1.style.display = 'none';
    side_menu_close_2.style.display = 'none';
    side_menu_close_3.style.display = 'none';
    side_menu_close_4.style.display = 'none';
    open_btn.style.display = 'none';
}