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
        const userId = Number(document.querySelector('.room__container').dataset.userId);

        consumer.subscriptions.create({ channel: "RoomChannel", room_id: roomId }, {
            connected() {
                // Called when the subscription is ready for use on the server
                console.log(`Connected to room channel: Room No. ${roomId}`);
            },

            disconnected() {
                // Called when the subscription has been terminated by the server
            },

            received(data) {
                // Called when there's incoming data on the websocket for this channel
                const messageContainer = document.querySelector('.room-message__container');

                let html;

                if (userId == data.message.user_id) {
                    html = data.html_user
                } else {
                    html = data.html_other
                }

                console.log('RECEIVED');

                messageContainer.innerHTML += html
                console.log(data);
                const scrollToChatBottom = () => {
                    messageContainer.scrollTop = messageContainer.scrollHeight;
                }

                scrollToChatBottom();
            }
        });
    }
})