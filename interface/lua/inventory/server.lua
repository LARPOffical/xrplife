RegisterServerEvent("XRPLife:RequestInventoryItems")
AddEventHandler("XRPLife:RequestInventoryItems", function()
    local src = source
    local items = Characters.Functions.GetPlayerInventory(src)
    TriggerClientEvent("XRPLife:OpenInventory", src, items)
end)