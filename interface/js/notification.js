let notifications = new Vue({
    el: "#notification_container",

    data: {

    },

    methods: {
        SuccessAlert(data) {
            this.$snotify.success(data.message, data.title, {
                timeout: data.time,
                position: "leftCenter",
                showProgressBar: true,
                closeOnClick: false,
                pauseOnHover: false
            });
        },

        ErrorAlert(data) {
            this.$snotify.error(data.message, data.title, {
                timeout: data.time,
                position: "leftCenter",
                showProgressBar: true,
                closeOnClick: false,
                pauseOnHover: false
            })
        },

        ConfirmAlert() {
            this.$snotify.confirm('An officer has requested to see your ID', 'ID Request', {
                timeout: 10000,
                position: "rightTop",
                showProgressBar: true,
                closeOnClick: false,
                pauseOnHover: true,
                buttons: [
                    {text: "Show", action: (notification) => {this.$snotify.remove(notification.id);}},
                    {text: "Hide", action: (notification) => {this.$snotify.remove(notification.id);}},
                ]
              });
        }
    }
})