local vehicle_storage_opened = true
local vehicle_storage_id = 0

RegisterNetEvent("XRPLife:OpenInventory")
AddEventHandler("XRPLife:OpenInventory", function(player_inventory)
    SetNuiFocus(true, true)
    SendNUIMessage({
        type = "",
        player = player_inventory
    })
end)

RegisterNetEvent("XRPLife:OpenVehicleStorage")
AddEventHandler("XRPLife:OpenVehicleStorage", function(vehicle, storage_inventory, player_inventory)
    vehicle_storage_opened = true
    vehicle_storage_id = vehicle
    SetNuiFocus(true, true)
    SendNUIMessage({
        type = "",
        storage = storage_inventory,
        player = player_inventory
    })
end)

RegisterNUICallback("closeinventory", function()
    SetNuiFocus(false, false)
    SendNUIMessage({
        type = ""
    })
end)