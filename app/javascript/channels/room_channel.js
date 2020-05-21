import consumer from "./consumer"

window.addEventListener('turbolinks:load', () => {

    //remove existing room subscriptions
    window.subscriptions = consumer.subscriptions

    consumer.subscriptions.subscriptions.forEach((sub) => {
        if (JSON.parse(sub.identifier).channel == 'RoomChannel')
            consumer.subscriptions.remove(sub)
    })

    //only create room subscription if in room page
    if (document.querySelector('.room__container')) {
        const roomId = document.querySelector('.room__container').dataset.roomId;

        consumer.subscriptions.create({ channel: "RoomChannel", room_id: roomId }, {
            connected() {
                // Called when the subscription is ready for use on the server
                console.log('Connected to room channel...');
            },

            disconnected() {
                // Called when the subscription has been terminated by the server
            },

            received(data) {
                // Called when there's incoming data on the websocket for this channel
                const messageContainer = document.querySelector('.room-message__container');

                messageContainer.innerHTML += data.html
                console.log(data);
            }
        });
    }
})