-- Open Interaction Menu
RegisterServerEvent("XRPLife:GetInteractionPermissions")
AddEventHandler("XRPLife:GetInteractionPermissions", function()
    local src = source
    local job = CharacterJobs.Functions.GetPlayerJob(src)
    local jobs = JobsConfig.JobsForMenus
    TriggerClientEvent("XRPLife:OpenPlayerInteraction", src, job, jobs)
end)

-- Handcuff Script
RegisterServerEvent("XRPLife:SendHandcuffRequest")
AddEventHandler("XRPLife:SendHandcuffRequest", function(serverid)
    local src = source
    local officername = Characters.Functions.GetPlayerName(src)
    local cuffedname = Characters.Functions.GetPlayerName(serverid)
    TriggerClientEvent("XRPLife:HandcuffTogglePlayer", serverid, officername)
end)

-- Request ID From Player
RegisterServerEvent("XRPLife:RequestCharacterID")
AddEventHandler("XRPLife:RequestCharacterID", function(serverid)
    local src = source
    local officername = Characters.Functions.GetPlayerName(src)
    TriggerClientEvent("XRPLife:SendIDRequest", serverid, officername, src)
end)

RegisterServerEvent("XRPLife:RecieveCharacterID")
AddEventHandler("XRPLife:RecieveCharacterID", function(officerid)
    local src = source
    local char_data = Characters.Functions.GetCurrentCharacter(src)
    print(tostring("SERVER RECIEVE CHARACTER DATA"))
    print(tostring(json.encode(char_data)))
    TriggerClientEvent("XRPLife:OpenLicenseMenu", officerid, {
        name = char_data.name,
        dob = char_data.dob,
        gender = char_data.gender
    })
end)

RegisterServerEvent("XRPLife:RecieveCharacterIDRefused")
AddEventHandler("XRPLife:RecieveCharacterIDRefused", function(officerid)
    local src = source
    TriggerClientEvent("XRPLife:ErrorNotification", officerid, {
        title = "XRPLife",
        message = tostring("ID Request has been denied."),
        time = 5000,
    })
end)