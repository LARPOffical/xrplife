var resource_name = "xrplife";

let notifications = new Vue({
    el: "#notification_container",

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

        LicenseCheckAlert(officername) {
            var string = officername + " has requested to see your license."
            console.log(string);
            this.$snotify.confirm(string, "ID Request", {
                timeout: 10000,
                position: "rightTop",
                showProgressBar: true,
                closeOnClick: false,
                pauseOnHover: true,
                buttons: [
                    {text: "Accept", action: (notification) => {
                        console.log("Accepted ID Request.");
                        axios.post("http://" + resource_name + "/sendidresults", {accepted: true}).then(function(response) {
                            console.log(response);
                        }).catch(function(error) {
                            console.log(error);
                        })
                        this.$snotify.remove(notification.id);
                    }},
                    {text: "Refuse", action: (notification) => {
                        console.log("Refused ID Request.");
                        axios.post("http://" + resource_name + "/sendidresults", {accepted: false}).then(function(response) {
                            console.log(response);
                        }).catch(function(error) {
                            console.log(error);
                        })
                        this.$snotify.remove(notification.id);
                    }}
                ]
            });
        },
    }
})