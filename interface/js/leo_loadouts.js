var resource_name = "xrplife";

let leoloadouts = new Vue({
    el: "#leo_loadouts",

    data: {
        show_leo_loadouts: false,

        department: "",

        loadouts: []
    },

    methods: {
        ToggleLoadoutsMenu() {
            this.show_leo_loadouts = !this.show_leo_loadouts;

            if (this.show_leo_loadouts == false) {

            }
        },

        RequestLoadout(loadoutname) {

            

        },
    }
})