import flatpickr from "flatpickr";
import 'flatpickr/dist/flatpickr.min.css';

const date_pick = flatpickr(".date-flatpick", {
    altInput: true
}); // flatpickr


const start_pick = flatpickr(".timestart-flatpick", {
    enableTime: true,
    noCalendar: true,
    dateFormat: "H:i",
    time_24hr: true
});

const end_pick = flatpickr(".timeend-flatpick", {
    enableTime: true,
    noCalendar: true,
    dateFormat: "H:i",
    time_24hr: true
});