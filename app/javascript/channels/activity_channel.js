import consumer from "./consumer"

consumer.subscriptions.create("ActivityChannel", {
    connected() {
        // Called when the subscription is ready for use on the server
        this.perform("appear")
    },

    disconnected() {
        // Called when the subscription has been terminated by the server
    },

    received(data) {
        // Called when there's incoming data on the websocket for this channel
        if (data.status == 'online') {
            console.log(`${data.user_email} has connected to the Activity Channel`);
            const userEl = document.querySelector(`.room-participants__user[data-user-id="${data.user_id}"]`);
            if (userEl) userEl.classList.remove("opacity-50");
        } else {
            console.log(`${data.user_email} has disconnected from the Activity Channel`);
            const userEl = document.querySelector(`.room-participants__user[data-user-id="${data.user_id}"]`);
            if (userEl) userEl.classList.add("opacity-50");
        }
    }
});