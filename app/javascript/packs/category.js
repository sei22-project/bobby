import flatpickr from "flatpickr";
import 'flatpickr/dist/flatpickr.min.css';

const date_pick = flatpickr(".sortdate-flatpick", {
    altInput: true
}); // flatpickr

import Rails from '@rails/ujs';

const sortGames = () => {
    // Get value of date
    const dateSort = document.querySelector(".sortdate-flatpick").value;

    // Get value of category
    const categorySort = document.querySelector(".categorySelect").value;

    // Start AJAX request
    var data = { "date": dateSort, "category": categorySort};

    console.log(data)

    Rails.ajax({
        url: "/categories/sort",
        type: "GET",
        data: JSON.stringify(data),
        success: function(response) {
            console.log('completed')
            // console.log(JSON.parse(response))
            console.log(response)
        },
        error: function(response) {}
    })
}

const sortBtn = document.querySelector(".sort-games-btn");
sortBtn.addEventListener('click', sortGames);