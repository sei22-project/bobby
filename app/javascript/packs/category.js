// Datepickr
import flatpickr from "flatpickr";

document.addEventListener('turbolinks:load', function (e) {
  const date_pick = flatpickr(".sortdate-flatpick", {
    altInput: true
  }); // flatpickr

})