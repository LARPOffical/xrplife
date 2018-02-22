RegisterServerEvent("XRPLife:RequestLEOLoadoutMarkers")
AddEventHandler("XRPLife:RequestLEOLoadoutMarkers", function()
    local src = source
    TriggerClientEvent("XRPLife:RecieveLoadoutMarkers", src, JobsConfig.LeoLoadoutMarkers)
end)

RegisterServerEvent("XRPLife:RequestDepartmentLoadouts")
AddEventHandler("XRPLife:RequestDepartmentLoadouts", function()
    print("Requesting Department Loadouts")
    local src = source
    local job = CharacterJobs.Functions.GetPlayerJob(src)

    for a = 1, #JobsConfig.AllowedUseLoadoutMarkers do
        if job == JobsConfig.AllowedUseLoadoutMarkers[a] then
            local loadout_names = JobsConfig.Jobs[job].loadouts
            TriggerClientEvent("XRPLife:OpenLEOLoadoutMenu", src, loadout_names)
            return
        end
    end
    print("You are not allowed to use the LEO Loadout Markers")
end)

RegisterServerEvent("XRPLife:RequestLoadout")
AddEventHandler("XRPLife:RequestLoadout", function(loadout)
    local src = source
    local job = CharacterJobs.Functions.GetPlayerJob(src)
    local character_data = Characters.Functions.GetCurrentCharacter(src)
    local loadout_table = JobsConfig.Jobs[job].loadout_data[loadout] -- loadout_table.required_division
    local character_has_division = false

    if job == JobsConfig.PoliceJobName then
        local police_data = CharacterDB.CharacterPoliceData(src, character_data.name, character_data.dob)

        for a = 1, #police_data.divisions do
            if police_data.divisions[a] == loadout_table.required_division then
                character_has_division = true
            end
        end
    elseif job == JobsConfig.SheriffJobName then
        local sheriff_data = CharacterDB.CharacterSheriffData(src, character_data.name, character_data.dob)

        for b = 1, #sheriff_data.divisions do
            if sheriff_data.divisions[b] == loadout_table.required_division then
                character_has_division = true
            end
        end
    elseif job == JobsConfig.StateJobName then
        local state_data = CharacterDB.CharacterStateData(src, character_data.name, character_data.dob)

        for c = 1, #state_data.divisions do
            if state_data.divisions[c] == loadout_table.required_division then
                character_has_division = true
            end
        end
    end

    if character_has_division then
        TriggerClientEvent("XRPLife:SetPlayerLoadout", src, loadout_table)
        TriggerClientEvent("XRPLife:SuccessNotification", src, {
            title = "XRPLife", 
            message = "You have changed your loadout.", 
            time = 5000
        })
    else
        TriggerClientEvent("XRPLife:ErrorNotification", src, {
            title = "XRPLife", 
            message = "You are not in the right division to use this loadout.", 
            time = 5000
        })
    end
end)