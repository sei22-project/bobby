import Glide from '@glidejs/glide';
import Rails from '@rails/ujs';
// Required Core Stylesheet


const breakPoints = {
  1200: {
    perView: 3,
  },

  1080: {
    perView: 2,
  },

  500: {
    perView: 1,
  },
};

const glideOptions = {
  type: 'carousel',
  autoplay: 3000,
  gap: 20,
  perView: 3,
  breakpoints: breakPoints,
};

const getDataAndInitCarousel = () => {
  Rails.ajax({
    type: 'get',
    url: '/featured_games',
    success: () => new Glide('.glide', glideOptions).mount(),
    error: (err) => console.log(err),
  });
};

const startCarousel = () => {
  if (document.getElementById('featured_games')) {
    getDataAndInitCarousel();
  }
};

document.addEventListener('turbolinks:load', startCarousel);
