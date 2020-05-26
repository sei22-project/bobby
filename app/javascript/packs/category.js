// Datepickr
import flatpickr from "flatpickr";

document.addEventListener('turbolinks:load', function (e) {
  flatpickr(".sortdate-flatpick", {
    altInput: true
  }); // flatpickr
})