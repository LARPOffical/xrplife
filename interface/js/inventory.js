var resource_name = "xrplife";

let inventory = new Vue({
    el: "#inventory_menu_container",

    data: {
        show_inventory: false,
        inventory_headers: [
            {text: "Item", align: "center", sortable: false, value: "name"},
            {text: "Amount", align: "center", sortable: false, value: "name"},
            {text: "Actions", align: "center", sortable: false, value: "name"},
        ],
        inventory: []
    },

    methods: {

        ToggleInventory() {
            this.show_inventory = !this.show_inventory;
            if (this.show_inventory == false) {
                //this.inventory = [];
                axios.post("http://" + resource_name + "/closeinventory", {}).then(function(response) {
                    console.log(response);
                }).catch(function(error) {
                    console.log(error);
                })
            }
        },

        UpdateInventory(items) {
            this.inventory = items;
        },
    }
})