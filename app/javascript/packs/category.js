// Datepickr
import flatpickr from "flatpickr";

document.addEventListener('turbolinks:load', function (e) {
  flatpickr(".sortdate-flatpick", {
    altInput: true
  }); // flatpickr
})

document.addEventListener('turbolinks:before-cache', function (e) {

  flatpickr(".sortdate-flatpick", {
    altInput: true
  }); // flatpickr

})