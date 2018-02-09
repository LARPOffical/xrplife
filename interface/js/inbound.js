document.onreadystatechange = () => {
    if (document.readyState === "complete") {
        window.addEventListener('message', function(event) {
            // Notifications
            if (event.data.type == "success_notification") {
                notifications.SuccessAlert(event.data.data);
            } else if (event.data.type == "error_notification") {
                notifications.ErrorAlert(event.data.data);
            }

            // Character Menu
            if (event.data.type == "open_character_menu") {
                // Recieve Event To Open Menu
                charactermenu.ToggleCharacterMenu(event.data.chars);
            } else if (event.data.type == "passing_models_list") {
                // Recieve Event To Set Ped Models
                charactermenu.ped_models = event.data.list;
            } else if (event.data.type == "account_created_status") {
                // Recieve Character Created Status (Created or Not Created)
                charactermenu.ValidateCharacterCreator(event.data.results);
            } else if (event.data.type == "pass_updated_characters") {
                // Recieve Updated Characters
                // Set Menu Working After Characters Return
                charactermenu.UpdatePlayerCharacters(event.data.chars);
            } else if (event.data.type == "close_character_menu") {
                // Closes Menu
                charactermenu.CloseMenu();
            }

            // Inventory Menu
            if (event.data.type == "open_inventory") {
                inventory.ToggleInventory();
                inventory.UpdateInventory(event.data.items);
            }

            // Player Interaction Menu
            if (event.data.type == "open_player_interaction") {
                player_interaction.TogglePlayerInteraction(event.data.jobs)
            } else if (event.data.type == "force_close_player_interaction") {
                player_interaction.TogglePlayerInteraction();
            }
        });
    }
}