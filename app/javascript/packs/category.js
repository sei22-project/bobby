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

    // var request = new XMLHttpRequest();   // new HttpRequest instance

    // request.addEventListener("load", function(){

    //   console.log("DONE");
    //   console.log( this.responseText );
    // });

    // request.open("GET", '/categories/sort');
    // request.setRequestHeader("Content-Type", "application/json;charset=UTF-8");

    // request.send(JSON.stringify(data));

    Rails.ajax({
        url: "/categories/sort",
        type: "GET",
        data: JSON.stringify(data),
        success: function(data) {
            console.log('completed')
        },
        error: function(data) {}
    })
}

const sortBtn = document.querySelector(".sort-games-btn");
sortBtn.addEventListener('click', sortGames);