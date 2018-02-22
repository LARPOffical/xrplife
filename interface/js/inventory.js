var resource_name = "xrplife"

let inventory = new Vue({
    el: "#inventory_container",

    data: {
        // Show Booleans
        show_inventory: false,
        show_storage: false,

        // Inventory Data
        character_name: "Xander Cross",
        character_dob: "09-02-1998",
        character_gender: "Male",
        character_phone: "999-999-9999",

        character_hunger: 100.0,
        character_hunger_bar: 0,
        character_thirst: 100.0,
        character_thirst_bar: 0,

        // Player Inventory
        player_inventory_actions: [
            {action: "STORE", show: this.show_storage, func: (item)=> {
                // Trigger Store Function To Open Storage
            }},
            {action: "USE", show: true, func: (item)=> {
                // Trigger Use Function
            }}
        ],

        storage_inventory_actions: [
            {action: "TAKE", func: (item)=> {
                // Trigger Take Function
                console.log("TAKING ITEM ", item)
            }}
        ],

        // Data Arrays
        player_inventory: [
            {item: "Lockpick", amount: 1}
        ],
        storage_inventory: [
            {item: "Hamburger", amount: 10},
            {item: "Water Bottle", amount: 5}
        ],
    },

    methods: {
        // Open Inventory
        OpenInventory() {
            this.show_inventory = true;
        },

        // Open Storage
        OpenStorage() {
            this.storage_inventory = true;
            this.show_storage = true;
        },

        // Close Inventory
        CloseAllInventory() {
            this.show_inventory = false;
            this.show_storage = false;
        },

        // Update Hunger
        UpdateHunger(hunger) {
            this.character_hunger = hunger;
            this.character_hunger_bar = (this.character_hunger / 100) * 410
        },

        // Update Thirst
        UpdateThirst(thirst) {
            this.character_thirst = thirst;
            this.character_thirst_bar = (this.character_thirst / 100) * 410
        },

        // Request Close Menu
        RequestCloseInventory() {

            axios.post("http://"+ resource_name + "/", {}).then(function(response){
                console.log(response);
            }).catch(function(error) {
                console.log(error);
            })

        },
    }
})