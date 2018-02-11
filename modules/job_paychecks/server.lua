RegisterServerEvent("XRPLife:RequestPaycheckTimer")
AddEventHandler("XRPLife:RequestPaycheckTimer", function()
    local src = source
    local time = JobsConfig.PaycheckTimer
    TriggerClientEvent("XRPLife:StartCharacterPaycheck", src, time)
end)

RegisterServerEvent("XRPLife:PayCharacter")
AddEventHandler("XRPLife:PayCharacter", function()
    local src = source
    local job = CharacterJobs.Functions.GetPlayerJob(src)
    local check = JobsConfig.Jobs[job].paycheck

    local character = Characters.Functions.GetCurrentCharacter(src)
    if character ~= nil then
        CharacterDB.AddMoneyCharacterBank(src, character.name, character.dob, check)
        TriggerClientEvent("XRPLife:SuccessNotification", src, {
            title = "XRPLife",
            message = tostring("You have recieved a paycheck of $" .. check),
            time = 5000
        })
    end
    TriggerClientEvent("XRPLife:RequestCharacterPaycheck", src)
end)