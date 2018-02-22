var resource_name = "xrplife";

let leoloadouts = new Vue({
    el: "#leo_loadouts",

    data: {
        show_leo_loadouts: false,

        department: "",
        loadouts: [],
    },

    methods: {
        ToggleLoadoutsMenu(loadouts) {
            this.show_leo_loadouts = !this.show_leo_loadouts;
            if (this.show_leo_loadouts == true) {
                this.loadouts = loadouts;
            } else if (this.show_leo_loadouts == false) {
                this.department = "";
                this.loadouts = [];
            }
        },

        RequestLoadout(loadoutname) {
            // Post Request
            axios.post("http://" + resource_name + "/requestleoloadout", {chosen_loadout: loadoutname}).then(function(response) {
                console.log(response);
            }).catch(function(error) {
                console.log(error);
            })
            this.CloseMenu();
        },

        CloseMenu() {
            axios.post("http://" + resource_name + "/closeleoloadoutmenu", {}).then(function(response) {
                console.log(response);
            }).catch(function(error) {
                console.log(error);
            })
        }
    }
})