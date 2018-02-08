// Variables
var resource_name = "xrplife";

let charactermenu = new Vue({
    el: "#character_menu_container",

    data: {
        // Character Main \\
        show_menu: false,
        show_inventory: false,
        menu_currently_working: false,

        // Display Characters
        character_headers: [
            {text: "ID", align: "center", sortable: false, value: "name"},
            {text: "Name", align: "center", sortable: false, value: "name"},
            {text: "DOB", align: "center", sortable: false, value: "name"},
            {text: "Gender", align: "center", sortable: false, value: "name"},
            {text: "Model", align: "center", sortable: false, value: "name"},
            {text: "Bank", align: "center", sortable: false, value: "name"},
            {text: "Inventory", align: "center", sortable: false, value: "name"},
            {text: "Actions", align: "center", sortable: false, value: "name"}
        ],
        characters: [],

        selected_inventory_headers: [
            {text: "Item", align: "center", sortable: false, value: "name"},
            {text: "Amount", align: "center", sortable: false, value: "name"}
        ],
        selected_inventory: [],

        // Character Creator
        show_character_creator: false,
        character_creator_valid: false,
        show_character_creator_error: false,
        show_character_creator_error_message: "",

        // First Name
        input_first_name: "",
        input_first_name_rules: [
            (v) => v.length >= 4 || "Name must be greater than 5 characters",
            (v) => v.length <= 20 || "Name must be less than 20 characters",
            (v) => /^[A-Za-z]+$/.test(v) || "You can only use letters in the name"
        ],

        // Last Name
        input_last_name: "",
        input_last_name_rules: [
            (v) => v && v.length >= 4 || "Name must be greater than 4 characters",
            (v) => v && v.length <= 20 || "Name must be less than 20 characters",
            (v) => /^[A-Za-z]+$/.test(v) || "You can only use letters in the name"
        ],

        // Gender
        input_gender_list: ["Male", "Female"],
        input_gender_rules: [
            (v) = v => !!v || 'Gender is required'
        ],
        input_gender_value: "",

        // DOB
        show_character_dob_menu: false,
        input_date_value: "1993-02-13",

        // Age
        input_age_value: "",
        input_age_rules: [
            (v) =>  v > 17 || "You can not be below the age of 18",
            (v) =>  v < 70 || "You can not be over the age of 70"
        ],

        // Models
        loading: false,
        search: null,
        select: [],
        input_character_ped_rules: [
            (v) => v.length > 0 || 'You must choose at least one'
        ],
        ped_models: [],
    },

    methods: {

        // Turns menu on and off and resets character menu
        ToggleCharacterMenu(characters) {
            this.show_menu = !this.show_menu;
            if (this.show_menu == false) {
                this.characters = [];
                this.selected_inventory = [];
                this.ped_models = [];
            } else {
                this.characters = characters;
            }
        },

        // Displays the inventory of each character displayed
        ShowInventory(items) {
            this.show_inventory = !this.show_inventory;
            if (this.show_inventory == false) {
                setTimeout(() => {
                    this.selected_inventory = [];
                }, 250);
            } else {
                this.selected_inventory = items;
            }
        },

        // Shows dialog for the character creator menu
        ShowCharacterCreator() {
            this.show_character_creator = !this.show_character_creator;
            if (this.show_character_creator == false) {
                this.input_first_name = "";
                this.input_last_name = "";
                this.input_gender_value = "";
                this.input_date_value = "1993-02-13";
                this.select = [];
                this.ped_models = [];
                this.show_character_creator_error = false;
                this.show_character_creator_error_message = "";
            }
        },

        // Validates character results (created or not created)
        ValidateCharacterCreator(results) {
            if (results.status) {
                this.ShowCharacterCreator();
            } else {
                this.input_first_name = "";
                this.input_last_name = "";
                this.show_character_creator_error = true;
                this.show_character_creator_error_message = results.reason;
            }
        },

        // Gets character age by usng the date selected in the form input
        GetAge() {
            var birthday = Date.parse(this.input_date_value);
            var age = ~~((Date.now() - birthday) / 31557600000);
            this.input_age_value = age;
        },

        // If form is valid request to create the character
        ValidateCharacterForm() {
            if (this.character_creator_valid && !this.menu_currently_working) {
                this.RequestCharacterCreation();
            };
        },

        UpdatePlayerCharacters(characters) {
            this.characters = characters;
            this.menu_currently_working = false;
        },

        /* HTTP REQUESTS */

        // Close menu function to remove cursor / focus
        CloseMenu() {
            this.ToggleCharacterMenu();
            axios.post("http://" + resource_name + "/closecharactermenu", {}).then(function(response) {
                console.log(response);
            }).catch(function(error) {
                console.log(error);
            })
        },

        // Requesting ped models determined by gender
        UpdateCreatorModels() {
            this.select = [];
            this.ped_models = [];
            axios.post("http://" + resource_name + "/requestpedmodels", {gender: this.input_gender_value}).then(function(response) {
                console.log(response);
            }).catch(function(error) {
                console.log(error);
            })
        },

        // Requesting to create character
        RequestCharacterCreation() {
            var char_name = this.input_first_name + " " + this.input_last_name;
            var char_dob = this.input_date_value;
            var char_gender = this.input_gender_value;
            var char_model = this.select;
            axios.post("http://"+ resource_name + "/requestcreatecharacter", {name: char_name, dob: char_dob, gender: char_gender, model: char_model}).then(function(response){
                console.log(response);
            }).catch(function(error) {
                console.log(error);
            })
        },

        RequestCharacterDeletion(name, dob) {
            if (!this.menu_currently_working) {
                axios.post("http://" + resource_name + "/deletecharacter", {name: name, dob: dob}).then(function(response) {
                    console.log(response);
                }).catch(function(error) {
                    console.log(error);
                })
            };
        },

        RequestCharacterSelection(name, dob) {
            if (!this.menu_currently_working) {
                axios.post("http://" + resource_name + "/selectcharacter", {name: name, dob: dob}).then(function(response) {
                    console.log(response);
                }).catch(function(error) {
                    console.log(error);
                });
            }
        },
    }
})