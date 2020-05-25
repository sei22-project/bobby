document.addEventListener('turbolinks:load', () => {
  const menuToggler = document.getElementsByClassName('js-menu-toggle')[0];
  const navbarMenu = document.getElementById('navbar-menu');
  console.log(menuToggler)

  if (menuToggler && navbarMenu) {
    menuToggler.addEventListener('click', () => {
      navbarMenu.classList.toggle('is_open');
      }
    );

    window.addEventListener('mouseup', function (event) {
      if (
        event.target != navbarMenu &&
        event.target != menuToggler &&
        event.target.parentNode != navbarMenu
      ) {
        navbarMenu.classList.remove('is_open');
      }
    });
  }
});
