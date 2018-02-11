RegisterServerEvent("XRPLife:GetInteractionPermissions")
AddEventHandler("XRPLife:GetInteractionPermissions", function()
    local src = source
    local job = CharacterJobs.Functions.GetPlayerJob(src)
    TriggerClientEvent("XRPLife:OpenPlayerInteraction", src, job)
end)

RegisterServerEvent("XRPLife:SendHandcuffRequest")
AddEventHandler("XRPLife:SendHandcuffRequest", function(serverid)
    local src = source
    local officername = Characters.Functions.GetPlayerName(src)
    local cuffedname = Characters.Functions.GetPlayerName(serverid)
    TriggerClientEvent("XRPLife:ItemHandcuff", serverid, officername)
end)