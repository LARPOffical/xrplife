-- Toggle Menu --
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if IsControlJustPressed(1, 213) then
            TriggerServerEvent("XRPLife:RequestInventoryItems")
        end
    end
end)


RegisterNetEvent("XRPLife:OpenInventory")
AddEventHandler("XRPLife:OpenInventory", function(inventory)
    SetNuiFocus(true, true)
    SendNUIMessage({
        type = "open_inventory",
        items = inventory
    })
end)

RegisterNUICallback("closeinventory", function(data)
    SetNuiFocus(false, false)
end)