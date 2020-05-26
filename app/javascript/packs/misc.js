function initNavBarMenu() {
    const menuToggler = document.getElementsByClassName('js-menu-toggle')[0];
    const navbarMenu = document.getElementById('navbar-menu');

    if (menuToggler && navbarMenu) {
        menuToggler.addEventListener('click', () => {
            navbarMenu.classList.toggle('is_open');
        });

        window.addEventListener('mouseup', function(event) {
            if (
                event.target != navbarMenu &&
                event.target != menuToggler &&
                event.target.parentNode != navbarMenu
            ) {
                navbarMenu.classList.remove('is_open');
            }
        });
    }
}

function initFlashMsgCloseable() {
    const flashMsgCloseBtns = Array.from(document.getElementsByClassName('flash_message-close_btn'));
    const flashMsgCloseBtnClicked = e => {
        e.stopPropagation();
        if (e.target.parentNode.matches('.flash_message')) {
            e.target.parentNode.remove()
        }
    }
    const addClickHandler = elem => elem.addEventListener('click', flashMsgCloseBtnClicked)
    flashMsgCloseBtns && flashMsgCloseBtns.map(addClickHandler)

    if (document.querySelector('.jumbotron') && document.querySelector('.flash_message')) {
        document.querySelector('.flash_message').classList.add('top-0');
        document.querySelector('.flash_message').classList.add('left-0');
        document.querySelector('.flash_message').classList.add('w-screen');
    }
}

document.addEventListener('turbolinks:load', () => {
    initNavBarMenu();
    initFlashMsgCloseable();
});