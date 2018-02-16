RegisterServerEvent("XRPLife:SendJobMarkers")
AddEventHandler("XRPLife:SendJobMarkers", function()
    local src = source
    TriggerClientEvent("XRPLife:RecieveJobMarkers", src, JobsConfig.Markers)
end)

RegisterServerEvent("XRPLife:ChangeJobs")
AddEventHandler("XRPLife:ChangeJobs", function(requested_job)
    local src = source
    local current_job = CharacterJobs.Functions.GetPlayerJob(src)
    local requested_job_data = JobsConfig.Jobs[requested_job]

    if current_job ~= requested_job then
        if requested_job_data.whitelisted then
            local character = Characters.Functions.GetCurrentCharacter(src)

            if requested_job == JobsConfig.PoliceJobName then
                local police_data = CharacterDB.CharacterPoliceData(src, character.name, character.dob)
                if police_data.hasPermission then
                    CharacterJobs.Functions.SetPlayerJob(src, requested_job)
                    TriggerClientEvent("XRPLife:SuccessNotification", src, {
                        title = "XRPLife",
                        message = tostring("You have changed your job to " .. requested_job),
                        time = 5000
                    })
                else
                    TriggerClientEvent("XRPLife:ErrorNotification", src, {
                        title = "XRPLife",
                        message = tostring("You do not have permission to be a " .. requested_job),
                        time = 5000
                    })
                end

            elseif requested_job == JobsConfig.SheriffJobName then
                local sheriff_data = CharacterDB.CharacterSheriffData(src, character.name, character.dob)
                if sheriff_data.hasPermission then
                    CharacterJobs.Functions.SetPlayerJob(src, requested_job)
                    TriggerClientEvent("XRPLife:SuccessNotification", src, {
                        title = "XRPLife",
                        message = tostring("You have changed your job to " .. requested_job),
                        time = 5000
                    })
                else
                    TriggerClientEvent("XRPLife:ErrorNotification", src, {
                        title = "XRPLife",
                        message = tostring("You do not have permission to be a " .. requested_job),
                        time = 5000
                    })
                end
            elseif requested_job == JobsConfig.StateJobName then
                local state_data = CharacterDB.CharacterStateData(src, character.name, character.dob)
                if state_data.hasPermission then
                    CharacterJobs.Functions.SetPlayerJob(src, requested_job)
                    TriggerClientEvent("XRPLife:SuccessNotification", src, {
                        title = "XRPLife",
                        message = tostring("You have changed your job to " .. requested_job),
                        time = 5000
                    })
                else
                    TriggerClientEvent("XRPLife:ErrorNotification", src, {
                        title = "XRPLife",
                        message = tostring("You do not have permission to be a " .. requested_job),
                        time = 5000
                    })
                end
            end  -- HERE <--------------------------------------------------------------------------------------------------------------------------------- Add More RESTRICTED Jobs Here
        else
            CharacterJobs.Functions.SetPlayerJob(src, requested_job)
        end
    else
        CharacterJobs.Functions.SetPlayerJob(src, JobsConfig.StarterJob) -- Starter Job
        TriggerClientEvent("XRPLife:SuccessNotification", src, {
            title = "XRPLife",
            message = tostring("You have changed your job to " .. JobsConfig.StarterJob),
            time = 5000
        })
    end
end)