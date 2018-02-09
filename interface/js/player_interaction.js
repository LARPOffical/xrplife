// Variables
var resource_name = "xrplife";

let player_interaction = new Vue({
    el: "#player_interaction_container",

    data: {
        show_player_interaction: false,

        show_main_interaction_buttons: true,

        has_police_actions: true,
        has_ems_actions: false,
        has_fire_actions: false,

        show_civilian_actions: false,
        show_police_actions: false,
        show_ems_actions: false,
        show_fire_actions: false,
    },

    methods: {
        TogglePlayerInteraction(jobs) {
            this.show_player_interaction = !this.show_player_interaction;
            if (this.show_player_interaction == true) {
                // turn off vehicle interaction if its on while this is being toggled
                this.has_police_actions = jobs.police;
                this.has_ems_actions = jobs.ems;
                this.has_fire_actions = jobs.fire;
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
    }
})