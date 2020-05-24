import consumer from "./consumer"

consumer.subscriptions.create("ActivityChannel", {
    connected() {
        // Called when the subscription is ready for use on the server
    },

    disconnected() {
        // Called when the subscription has been terminated by the server
    },

    received(data) {
        // Called when there's incoming data on the websocket for this channel
        if (data.status) {
            if (data.status == 'online') {

                console.log(`${data.user_email} has connected to the Activity Channel`);
                const userEl = document.querySelector(`.room-participants__user[data-user-id="${data.user_id}"]`);
                if (userEl) userEl.classList.remove("opacity-50");

            } else if (data.status == 'offline') {

                console.log(`${data.user_email} has disconnected from the Activity Channel`);
                const userEl = document.querySelector(`.room-participants__user[data-user-id="${data.user_id}"]`);
                if (userEl) userEl.classList.add("opacity-50");

            }
        }

        const userId = document.body.dataset.userId;

        if (data.notification) {
            if (data.notification_user_id == userId) {
                const notificationContainer = document.querySelector('.notification-message__container');
                const notificationContent = document.querySelector('.notification-message__content');
                const notificationsLink = document.querySelector('.notifications__link');

                notificationContent.innerText = `New Notification from ${data.notification_actor_email}: "${data.notification_subject}"`;
                notificationContainer.classList.remove('hidden');

                notificationsLink.innerText = `${data.total_notifications} New Notifications`

                console.log(`You have a notification from ${data.notification_actor_email} about "${data.notification_subject}"`);
            }
        }

    }
});