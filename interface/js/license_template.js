var resource_name = "xrplife";

let idcard = new Vue({
    el: "#license_template",

    data: {
        show_license: false,

        // License Information
        name: "None",
        dob: "None",
        gender: "None"
    },
    
    methods: {
        ToggleLicense(data) {
            console.log(data);
            this.show_license = !this.show_license
            if (this.show_license == false) {
                this.name = "None";
                this.dob = "None";
                this.gender = "None";
            } else {
                this.name = data.name;
                this.dob = data.dob;
                this.gender = data.gender;
            }
        },
    }
})