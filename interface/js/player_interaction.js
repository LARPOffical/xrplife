// Variables
var resource_name = "xrplife";

let player_interaction = new Vue({
    el: "#player_interaction_container",

    data: {
        show_player_interaction: false,

        show_main_interaction_buttons: true,

        has_police_actions: false,
        has_ems_actions: false,
        has_fire_actions: false,

        show_civilian_actions: false,
        show_police_actions: false,
        show_ems_actions: false,
        show_fire_actions: false,

        menu_jobs: [],
    },

    methods: {
        TogglePlayerInteraction(job, jobs) {
            this.show_player_interaction = !this.show_player_interaction;
            if (this.show_player_interaction == true) {
                // Passes Jobs To Menu That Can Be Used For Comparison
                this.menu_jobs = jobs;

                for (index1 in this.menu_jobs) {
                    if (this.menu_jobs[index1].name == job) {
                        for (index2 in this.menu_jobs[index1].actions) {
                            if (this.menu_jobs[index1].actions[index2] == "LEO") {
                                this.has_police_actions = true;
                            }
                        }
                    }
                }

            } else {
                this.show_main_interaction_buttons = true;
                this.has_police_actions = false;
                this.has_ems_actions = false;
                this.has_fire_actions = false;
                this.show_civilian_actions = false;
                this.show_police_actions = false;
                this.show_ems_actions = false;
                this.show_fire_actions = false;
                axios.post("http://" + resource_name + "/closeinteractionmenu", {}).then(function(response) {
                    console.log(response);
                }).catch(function(error) {
                    console.log(error);
                })
            }
        },

        ToggleCivilianActions() {
            this.show_civilian_actions = !this.show_civilian_actions;
            if (this.show_civilian_actions == false) {
                this.show_main_interaction_buttons = true;
            } else {
                this.show_main_interaction_buttons = false;
            }
        },

        TogglePoliceActions() {
            this.show_police_actions = !this.show_police_actions;

            if (this.show_police_actions == false) {
                this.show_main_interaction_buttons = true;
            } else {
                this.show_main_interaction_buttons = false;
            }
        },

        ToggleEMSActions() {
            this.show_ems_actions = !this.show_ems_actions;

            if (this.show_ems_actions == false) {
                this.show_main_interaction_buttons = true;
            } else {
                this.show_main_interaction_buttons = false;
            }
        },

        ToggleFireActions() {
            this.show_fire_actions = !this.show_fire_actions;

            if (this.show_fire_actions == false) {
                this.show_main_interaction_buttons = true;
            } else {
                this.show_main_interaction_buttons = false;
            }
        },

        // Police Functions
        HandcuffPlayer() {
            axios.post("http://" + resource_name + "/handcuffcallback", {}).then(function(response) {
                console.log(response);
            }).catch(function(error) {
                console.log(error);
            })
        },

        RequestPlayerLicense() {
            console.log("Requesting Players License")
            axios.post("http://" + resource_name + "/requestlicense", {}).then(function(response) {
                console.log(response);
            }).catch(function(error) {
                console.log(error);
            })
        }
    }
})