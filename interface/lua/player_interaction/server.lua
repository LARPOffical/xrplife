RegisterServerEvent("XRPLife:GetInteractionPermissions")
AddEventHandler("XRPLife:GetInteractionPermissions", function()
    local src = source
    TriggerClientEvent("XRPLife:OpenPlayerInteraction", src, {police = true, ems = false, fire = false})
end)